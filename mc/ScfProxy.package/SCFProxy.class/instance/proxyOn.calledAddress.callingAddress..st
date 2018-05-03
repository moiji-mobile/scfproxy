as yet unclassified
proxyOn: aSourceEndPoint calledAddress: aCalledAddress callingAddress: aCallingAddress

	sourceEndPoint := aSourceEndPoint.
	sourceEndPoint
		addHandler: notificationHandler;
		factory: SCFProxyObjectFactory new.

	callingAddress := aCallingAddress.
	calledAddress := aCalledAddress.