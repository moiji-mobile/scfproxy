script
onTcContinue: aDialogue original: aNotification
	onTcContinue
		ifNil: [ super onTcContinue: aDialogue original: aNotification ]
		ifNotNil: [:cb | cb cull: aDialogue cull: aNotification ].