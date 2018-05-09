script
onRosInvocation: aDialogue invocation: anInvocation
	onRosInvocation
		ifNil: [ super onRosInvocation: aDialogue invocation: anInvocation ]
		ifNotNil: [:cb | cb cull: aDialogue cull: anInvocation ].