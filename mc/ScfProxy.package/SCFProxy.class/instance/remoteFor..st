as yet unclassified
remoteFor: aDialogue
	^aDialogue remoteDialogue
		ifNil: [ SCFProxyRemote new
						endPoint: sourceEndPoint;
						yourself ]
		ifNotNil: [:remote |
					SCFProxyRemote new
						endPoint: remote container container;
						dialogue: remote;
						yourself  ]