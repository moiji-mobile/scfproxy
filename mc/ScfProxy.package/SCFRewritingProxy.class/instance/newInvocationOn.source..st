forwarding
newInvocationOn: aDialogue source: sourceInvocation
	| operationName argument |
	operationName := sourceInvocation operationName.
	argument := sourceInvocation argument.

	operationName = 'initialDPV1' ifTrue: [
		operationName := 'initialDPV2'.
		argument := (aDialogue rosOperationNamed: 'initialDPV2') newArgumentValue
							serviceKey: sourceInvocation argument serviceKey;
							yourself.
	].

	^aDialogue newInvocationForName: operationName parameters: argument.