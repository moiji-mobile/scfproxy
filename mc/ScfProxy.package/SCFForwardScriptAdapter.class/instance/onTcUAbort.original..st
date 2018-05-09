script
onTcUAbort: aDialogue original: aNotification
	onTcUAbort
		ifNil: [ super onTcUAbort: aDialogue original: aNotification ]
		ifNotNil: [:cb | cb cull: aDialogue cull: aNotification ].