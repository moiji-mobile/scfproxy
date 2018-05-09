tests
testInitialDPv1ToV2
	| dialogue invoke params invokeResult operation |

	scfScript handleTcBegin: [:aDialogue :source |
        aDialogue
                requestTcBeginDestinationAddress: self localAddr
                originatingAddress: self scfAddr
                applicationContextName: '0.4.0.0.1.0.50.1' asAsn1Oid
                userInformation: nil.
	].

	"The incoming request..."
	testEndPoint onDialogue: [:diag |
		diag onInvoke: [:in |
			invokeResult := in.
			in returnResultLast: nil.
			diag requestTcContinue.
			diag requestTcEnd: false ]].

	dialogue := testEndPoint newDialogue.
	operation := dialogue rosOperationNamed: 'initialDPV1'.
	params := operation newArgumentValue
		at: 'serviceKey' put: 23;
		yourself.

	invoke := dialogue requestTcInvoke: operation parameters: params class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false];
		onError: [self assert: false];
		onReject: [self assert: false];
		onReturnLast: [].

	dialogue
		requestTcBeginDestinationAddress: self imsiAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: 'initialDPV1').

	self deny: invokeResult isNil.
	self assert: invokeResult invocation operationName equals: 'initialDPV2'.