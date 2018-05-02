running
setUp
	testEndPoint := TCAPTestServiceEndPoint newForTesting
		asn1Model: self asn1Model.
	scfEndPoint := TCAPTestServiceEndPoint newForTesting
		factory: SCFProxyObjectFactory new;
		asn1Model: self asn1Model.
	scfEndPoint transactionCoordinator: TCAPTestTransactionCoordinator new.

	testEndPoint connectTo: scfEndPoint.
	scfEndPoint connectTo: testEndPoint.