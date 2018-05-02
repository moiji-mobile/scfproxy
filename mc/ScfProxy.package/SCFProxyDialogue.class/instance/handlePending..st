as yet unclassified
handlePending: aProxy
	pendingOperations ifNotEmpty: [
		aProxy proxyOperations: pendingOperations fromDialogue: self.
		pendingOperations := OrderedCollection new.]