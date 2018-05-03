as yet unclassified
proxyPeer: aDialogue
	"Link both dialogues together"
	aDialogue remoteDialogue: self.
	remoteDialogue := aDialogue.