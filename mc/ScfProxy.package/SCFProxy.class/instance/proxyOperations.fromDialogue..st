as yet unclassified
proxyOperations: pendingOperations fromDialogue: aDialogue
	| remote remoteDialogue rosOps dialogueOps |
	"Find the remote endpoint an dialogue"
	remote := self remoteFor: aDialogue.
	remoteDialogue := remote dialogue.

	"Create a new dialogue..."
	remoteDialogue ifNil: [
		remoteDialogue := remote endPoint newDialogue.
		remoteDialogue addHandler: notificationHandler.
		remoteDialogue remoteDialogue: aDialogue.
		aDialogue remoteDialogue: remoteDialogue].

	"Split the list by ROS and TCAP. We will be notified about invocations after"
	rosOps := pendingOperations select: [:each | each isScfProxyRosNotification ].
	dialogueOps := pendingOperations reject: [:each | each isScfProxyRosNotification ].

	rosOps do: [:each | each scfProxyRosDispatchOn: remoteDialogue for: self ].
	dialogueOps do: [:each | each scfProxyDialogueDispatchOn: remoteDialogue for: self ].