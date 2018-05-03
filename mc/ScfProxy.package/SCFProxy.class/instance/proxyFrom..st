as yet unclassified
proxyFrom: aSourceEndPoint
	self flag: #todo. "Need to get SCCP addresses too.. dest endpoint is ignored.."

	sourceEndPoint := aSourceEndPoint.
	sourceEndPoint
		addHandler: notificationHandler;
		factory: SCFProxyObjectFactory new.