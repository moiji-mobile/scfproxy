| scriptFile adapter stpHost stpPort stpToken conn numberTasks workManager proxy endp scfProxy |

"Start script for the SCF Proxy. To be used with image-launch"


"Enable syslog if it has been specified"
self optionAt: 'syslog' ifPresent: [:name |
    | syslog |
    syslog := LogTargetSyslog openlog: name option: 0 facility: LogTargetSyslog LOG_USER.
    syslog prefix: ''.
    LogManager default target: syslog.
].

"STP connection"
stpPort := 5003.
self optionAt: 'stp-port' ifPresent: [:stpPortString |
    stpPort := stpPortString asNumber].
stpHost := 'localhost'.
self optionAt: 'stp-host' ifPresent: [:string |
    stpHost := string].
stpToken := ''.
self optionAt: 'stp-token' ifPresent: [:string |
    stpToken := string].

"The file to use for the script"
self optionAt: 'script-file' ifPresent: [:file |
    scriptFile := file].

numberTasks := 2.
self optionAt: 'number-tasks' ifPresent: [:number |
    | workers |
    workers := number asInteger.
    workers < 2 ifTrue: [^self error: 'At least two worker tasks are needed.'].
    numberTasks := workers].

"Now create the proxy and go"
conn := SCCPNetworkServiceOsmoDirect new
    hostname: stpHost port: stpPort;
    token: stpToken;
    yourself.
workManager := NetworkServiceWorkManager new
                networkService: conn;
                yourself.
endp := TCAPServiceEndPoint new
            asn1Model: CamelTestModel instance asTcapModelRoot;
            yourself.

"Create the adapter and parse it"
adapter := SCFForwardScriptAdapter new.
scfProxy := SCFScriptableProxy new
                proxyOn: proxyEndPoint;
                script: adapter;
                yourself.
Smalltalk compiler evaluate: scriptFile asFileReference contents for: adapter logged: true.

"Now go ahead and start serving..."
workManager start: numberTasks.
