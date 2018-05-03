proxying-replay
replayInvocation: aDialogue source: sourceInvocation
	| invocation |
	invocation := aDialogue newInvocationForName: sourceInvocation operationName parameters: sourceInvocation argument.
	invocation onReturnLast: [:res |
		sourceInvocation invocation returnResultLast: res result ].

	aDialogue invoke: invocation withTimeout: nil.
