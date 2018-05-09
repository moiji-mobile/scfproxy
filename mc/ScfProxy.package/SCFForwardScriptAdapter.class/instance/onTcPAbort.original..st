script
onTcPAbort: aDialogue original: aNotification
	onTcPAbort
		ifNil: [ super onTcPAbort: aDialogue original: aNotification ]
		ifNotNil: [:cb | cb cull: aDialogue cull: aNotification ].