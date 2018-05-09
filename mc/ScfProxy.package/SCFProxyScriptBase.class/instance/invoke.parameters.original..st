as yet unclassified
invoke: operationName parameters: params original: sourceInvocation 
	| invocation dialogue |
	dialogue := sourceInvocation dialogue remoteDialogue.
	invocation := dialogue newInvocationForName: operationName parameters: params.
	invocation onReturnLast: [:res |
		self onRosReturnResultLast: sourceInvocation result: res].
	dialogue invoke: invocation withTimeout: nil.