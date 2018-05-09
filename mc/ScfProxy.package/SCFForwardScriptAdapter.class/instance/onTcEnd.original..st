script
onTcEnd: aDialogue original: aNotification
	onTcEnd
		ifNil: [ super onTcEnd: aDialogue original: aNotification ]
		ifNotNil: [:cb | cb cull: aDialogue cull: aNotification ].