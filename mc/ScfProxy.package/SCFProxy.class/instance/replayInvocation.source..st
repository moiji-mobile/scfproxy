proxying-replay
replayInvocation: aDialogue source: sourceInvocation
	| invocation |
	invocation := self newInvocationOn: aDialogue source: sourceInvocation.
	invocation onReturnLast: [:res |
		self rewriteReturnLast: sourceInvocation result: res].

	aDialogue invoke: invocation withTimeout: nil.
