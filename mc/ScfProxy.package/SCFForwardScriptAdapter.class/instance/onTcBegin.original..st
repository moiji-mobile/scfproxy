script
onTcBegin: aDialogue original: aNotification
	onTcBegin
		ifNil: [ super onTcBegin: aDialogue original: aNotification ]
		ifNotNil: [:cb | cb cull: aDialogue cull: aNotification ].