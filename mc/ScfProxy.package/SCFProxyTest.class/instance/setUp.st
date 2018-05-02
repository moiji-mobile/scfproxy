running
setUp
	testEndPoint := TCAPTestServiceEndPoint newForTesting
		asn1Model: self asn1Model;
		endPointName: 'Initial Leg'.
	proxyEndPoint := TCAPTestServiceEndPoint newForTesting
		asn1Model: self asn1Model;
		endPointName: 'SCF Proxy'.
	proxyEndPoint transactionCoordinator: TCAPTestTransactionCoordinator new.

	scfProxy := SCFProxy new
						proxyFrom: proxyEndPoint to: testEndPoint.

	testEndPoint connectTo: proxyEndPoint.
	proxyEndPoint connectTo: testEndPoint.