as yet unclassified
proxyOperations: pendingOperations fromDialogue: aDialogue
	| remoteDialogue scriptState rosOps dialogueOps |

	scriptState := aDialogue scriptState.
	scriptState ifNil: [
		scriptState := SCFScriptableState new
								originalDialogue: aDialogue;
								yourself.
		aDialogue scriptState: scriptState.
		scriptState proxyDialogue: (script newDialogue: scriptState)].
	remoteDialogue := aDialogue remoteDialogue.

	"Split the list by ROS and TCAP as we need to make invocations/results before
	we can send TC-begin/TC-continue."
	rosOps := pendingOperations select: [:each | each isScfProxyRosNotification ].
	dialogueOps := pendingOperations reject: [:each | each isScfProxyRosNotification ].

	rosOps do: [:each | each scfProxyRosDispatchOn: remoteDialogue for: script ].
	dialogueOps do: [:each | each scfProxyDialogueDispatchOn: remoteDialogue for: script ].