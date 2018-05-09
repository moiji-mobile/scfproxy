script
onNewDialogue: aState
	onNewDialogue
		ifNil: [ super onNewDialogue: aState ]
		ifNotNil: [:cb | cb cull: aState ].