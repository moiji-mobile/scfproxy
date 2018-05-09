as yet unclassified
proxyOn: aSourceEndPoint

	sourceEndPoint := aSourceEndPoint.
	sourceEndPoint
		addHandler: notificationHandler;
		factory: (SCFProxyObjectFactory new
						dialogueClass: SCFScriptableProxyDialogue;
						yourself).