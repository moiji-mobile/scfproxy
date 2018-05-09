as yet unclassified
invoke: operationName parameters: params original: sourceInvocation 
	| invocation |
	invocation := self newInvocationForName: operationName parameters: params.
	invocation onReturnLast: [:res |
		self rewriteReturnLast: sourceInvocation result: res].
	self invoke: invocation withTimeout: nil.