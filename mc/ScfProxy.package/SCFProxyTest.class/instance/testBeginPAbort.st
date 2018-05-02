tests
testBeginPAbort
	| dialogue invoke params operation wasAborted |

	wasAborted := false.

	"The incoming request..."
	testEndPoint onDialogue: [:diag |
		diag onBegin: [
			diag requestTcPAbort: TCAPDialoguePAbort resourceLimitation]].

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
		onReturnLast: [self assert: false].

	dialogue onPAbort: [:abort | wasAborted := true ].

	dialogue
		requestTcBeginDestinationAddress: self imsiAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: 'initialDPV1').

	self assert: wasAborted.
	self deny: proxyEndPoint hasTransactions.
	self deny: testEndPoint hasTransactions.