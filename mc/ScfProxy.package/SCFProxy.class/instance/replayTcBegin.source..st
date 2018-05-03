proxying-replay
replayTcBegin: aDialogue source: aNotification
	| acn userInformation |
	acn := aNotification dialogue applicationContextName.
	userInformation := aNotification dialogue userInformation.

	aDialogue
		requestTcBeginDestinationAddress: calledAddress
		originatingAddress: callingAddress
		applicationContextName: acn
		userInformation: userInformation.