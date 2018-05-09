as yet unclassified
onRosReturnResultLast: aSourceInvocation result: aResult
	onRosReturnResultLast
		ifNil: [ super onRosReturnResultLast: aSourceInvocation result: aResult ]
		ifNotNil: [:cb | cb cull: aSourceInvocation cull: aResult ].