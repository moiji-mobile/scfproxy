script
onTcUbort: aDialogue original: aNotification
	"aNotification message holds the uAbort and it should be forwarded
	to aDialogue."
	"TODO: Send the right abort information..."
	aDialogue requestTcUAbort: nil.