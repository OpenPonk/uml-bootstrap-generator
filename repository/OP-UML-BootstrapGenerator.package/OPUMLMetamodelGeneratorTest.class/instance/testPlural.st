tests - utility
testPlural
	self assert: (generator asPlural: 'owner') equals: 'owners'.
	self assert: (generator asPlural: 'superClass') equals: 'superClasses'.
	self assert: (generator asPlural: 'subsettedProperty') equals: 'subsettedProperties'