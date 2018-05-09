running
setUp
	testEndPoint := TCAPTestServiceEndPoint newForTesting
		asn1Model: self asn1Model;
		endPointName: 'Initial Leg'.
	proxyEndPoint := TCAPTestServiceEndPoint newForTesting
		asn1Model: self asn1Model;
		endPointName: 'SCF Proxy'.

	scfScript := SCFProxyForwardScript new
						calledAddress: self imsiAddr;
						callingAddress: self localAddr.
	scfProxy := SCFScriptableProxy new
						proxyOn: proxyEndPoint;
						script: scfScript.
	testEndPoint connectTo: proxyEndPoint.
	proxyEndPoint connectTo: testEndPoint