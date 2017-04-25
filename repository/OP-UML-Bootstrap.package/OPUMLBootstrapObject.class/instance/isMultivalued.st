testing
isMultivalued
	((sharedGeneralizations includesKey: 'MultiplicityElement')
		and: [ self class selectors includes: #lowerValue ])
		ifFalse: [ ^ false ].
	self upperValue ifNil: [ ^ false ].
	^ (self upperValue value = '1') not