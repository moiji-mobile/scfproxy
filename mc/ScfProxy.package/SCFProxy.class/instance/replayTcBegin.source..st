proxying-replay
replayTcBegin: aDialogue source: aNotification
	| acn userInformation |
	acn := self rewriteApplicationContextName: aNotification dialogue.
	userInformation := self rewriteUserInformation: aNotification dialogue.

	aDialogue
		requestTcBeginDestinationAddress: calledAddress
		originatingAddress: callingAddress
		applicationContextName: acn
		userInformation: userInformation.