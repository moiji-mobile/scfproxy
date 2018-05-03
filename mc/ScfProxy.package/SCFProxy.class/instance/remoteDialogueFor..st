as yet unclassified
remoteDialogueFor: aDialogue
	^aDialogue remoteDialogue
		ifNil: [ sourceEndPoint newDialogue
						addHandler: notificationHandler;
						proxyPeer: aDialogue;
						yourself ]
		ifNotNil: [:remote | remote ]