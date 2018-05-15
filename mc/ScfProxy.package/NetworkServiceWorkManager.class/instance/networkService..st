registration
networkService: aService
	networkService := aService.
	networkService onUnitData: [:receiver :sender :data |
		self newWork: { receiver. sender. data }
	].