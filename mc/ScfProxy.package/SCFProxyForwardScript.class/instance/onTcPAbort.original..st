script
onTcPAbort: aDialogue original: aNotification
	"aNotification message holds the pAbort and it should be forwarded
	to aDialogue."
	aDialogue requestTcPAbort: aNotification message pAbortCause.