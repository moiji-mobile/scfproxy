script
onTcBegin: aDialogue original: aNotification
	"aNotification message holds the TC-begin and it should be forwarded
	to aDialogue. This means selecting the Application Context name, the
	User Information and the SCCP addresses. Any invocation was dispatched
	before calling TC-continue."
	| acn userInformation |
	acn := aNotification dialogue applicationContextName.
	userInformation := aNotification dialogue userInformation.

	aDialogue
		requestTcBeginDestinationAddress: calledAddress
		originatingAddress: callingAddress
		applicationContextName: acn
		userInformation: userInformation.