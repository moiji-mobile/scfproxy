| localAddr remoteAddr onNewDialogue onTcBegin onRosInvocation |

localAddr := (SCCPAddress createWith: 7) 
		pointCode: 11;
		routedOnSSN: true;
		yourself.

remoteAddr := (SCCPAddress createWith: 6) 
		pointCode: 2000;
		routedOnSSN: true; 
		yourself.

"Called when there is a new dialogue."
self handleNewDialogue: [:state |
	"Is this a v1 dialogue? If not ask it to be aborted"
	state originalDialogue applicationContextName = '0.4.0.0.1.0.50.0' asAsn1Oid ifFalse: [
		^script abortDialogue: source dialogue].

	^super newDialogue: state
].

"Forward the TC-begin but with a V2 ACN"
self handleTcBegin: [:dialogue :source |
	dialogue
		requestTcBeginDestinationAddress: remoteAddr
		originatingAddress: localAddr
		applicationContextName: '0.4.0.0.1.0.50.1' asAsn1Oid
		userInformation: nil.
].

self handleRosInvocation: [:dialogue :source |
	source operationName = 'initialDPV1' ifTrue: [
		| operationName argument invocation |
		operationName := 'initialDPV2'.
		argument := (aDialogue rosOperationNamed: 'initialDPV2') newArgumentValue: [:arg |
			arg serviceKey: 23].
		"Create an invocation, invoke it, there should be no result"
		invocation := dialogue newInvocationFromName: operationName parameters: argument.
		^dialogue invoke: invocation withTimeout: nil.
	].

	"Just forward it"
	super onRosInvocation: dialogue source: source.
].
