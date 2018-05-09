running
testUserKeys
	self assert: (state userAt: 'customKey') equals: nil.
	state userAt: 'customKey' put: 23.
	self assert: (state userAt: 'customKey') equals: 23.