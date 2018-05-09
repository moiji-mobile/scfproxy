script
onTcEnd: aDialogue original: aNotification
	"aNotification message holds the TC-end and it should be forwarded
	to aDialogue."
	aDialogue requestTcEnd: false