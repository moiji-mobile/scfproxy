proxying-replay
replayTcBegin: aDialogue source: aNotification
	| destAddress sourceAddress acn userInformation |
	sourceAddress := destAddress := SCCPAddress createForSSN: 'hlr'.
	acn := aNotification dialogue applicationContextName.
	userInformation := aNotification dialogue userInformation.

	aDialogue
		requestTcBeginDestinationAddress: destAddress
		originatingAddress: sourceAddress
		applicationContextName: acn
		userInformation: userInformation.