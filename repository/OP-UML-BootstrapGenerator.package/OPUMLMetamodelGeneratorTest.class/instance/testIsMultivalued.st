tests - testing
testIsMultivalued
	self
		deny: (self attribute: 'owner' inClass: 'Element') isMultivalued
		description: '0..1'.
	self
		deny: (self attribute: 'template' inClass: 'TemplateSignature') isMultivalued
		description: '1'.
	self
		assert: (self attribute: 'ownedComment' inClass: 'Element') isMultivalued
		description: '*'.
	self
		assert: (self attribute: 'relatedElement' inClass: 'Relationship') isMultivalued
		description: '1..*'.
	self
		assert: (self attribute: 'event' inClass: 'DurationObservation') isMultivalued
		description: '1..2'