script
onNewDialogue: aState
	"aState originalDialogue is a new dialogue. Decide if a remote dialogue
	should be created. Additional information can be stored in aState to be
	retrieved later. Call self newDialogue: aState to have the default."
	^self newDialogue: aState.