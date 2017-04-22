tests
testCreateNewInstance
	self assert: (reader createNewInstanceFor: 'uml:Class') className equals: #BootUMLClass