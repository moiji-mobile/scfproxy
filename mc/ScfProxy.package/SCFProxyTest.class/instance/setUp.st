running
setUp
	testEndPoint := TCAPTestServiceEndPoint newForTesting
		asn1Model: self asn1Model;
		endPointName: 'Initial Leg'.
	proxyEndPoint := TCAPTestServiceEndPoint newForTesting
		asn1Model: self asn1Model;
		endPointName: 'SCF Proxy'.

	scfProxy := SCFProxy new proxyOn: proxyEndPoint calledAddress: self imsiAddr callingAddress: self localAddr.
	testEndPoint connectTo: proxyEndPoint.
	proxyEndPoint connectTo: testEndPoint