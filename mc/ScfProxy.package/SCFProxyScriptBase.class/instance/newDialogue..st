Implementation
newDialogue: aScriptableState
	aScriptableState proxyDialogue: (sourceEndPoint newDialogue
													addHandler: notificationHandler;
													proxyPeer: aScriptableState originalDialogue;
													scriptState: aScriptableState;
													yourself).
	^aScriptableState proxyDialogue.
		