as yet unclassified
setUp
	| testNetworkService proxyNetworkService |

	testNetworkService := SCCPMockNetworkService new.
	testWorkManager := NetworkServiceWorkManager new
								networkService: testNetworkService.
	testEndPoint := TCAPTestServiceEndPoint newForTesting
		asn1Model: self asn1Model;
		networkService: testWorkManager;
		endPointName: 'Initial Leg'.
	proxyNetworkService := SCCPMockNetworkService new.
	proxyWorkManager := NetworkServiceWorkManager new
								networkService: proxyNetworkService.
	proxyEndPoint := TCAPTestServiceEndPoint newForTesting
		asn1Model: self asn1Model;
		networkService: proxyWorkManager;
		endPointName: 'SCF Proxy'.

	scfProxy := SCFProxy new
						proxyOn: proxyEndPoint calledAddress: self imsiAddr callingAddress: self localAddr.

	testNetworkService connectTo: proxyNetworkService.
	proxyNetworkService connectTo: testNetworkService.

	"Start at least two workers as one might receive the message and will try
	to send out the message with no free worker (and causing a deadlock...)"
	testWorkManager start: 2.
	proxyWorkManager start: 2.