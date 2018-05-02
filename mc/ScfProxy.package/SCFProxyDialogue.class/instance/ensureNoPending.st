as yet unclassified
ensureNoPending
	pendingOperations ifNotEmpty: [ ^self error: 'Should not have pending operations' ].