as yet unclassified
proxyOperations: pendingOperations fromDialogue: aDialogue
	| remoteDialogue rosOps dialogueOps |

	remoteDialogue := self remoteDialogueFor: aDialogue.

	"Split the list by ROS and TCAP as we need to make invocations/results before
	we can send TC-begin/TC-continue."
	rosOps := pendingOperations select: [:each | each isScfProxyRosNotification ].
	dialogueOps := pendingOperations reject: [:each | each isScfProxyRosNotification ].

	rosOps do: [:each | each scfProxyRosDispatchOn: remoteDialogue for: self ].
	dialogueOps do: [:each | each scfProxyDialogueDispatchOn: remoteDialogue for: self ].