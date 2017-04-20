tests - initialization
testDefaultConfiguration
	self assert: generator classPrefix equals: 'BUT'.
	self assert: generator packageName equals: 'Generated-UMLBootstrapTest'.
	self assert: generator rootClassName equals: 'OPUMLBootstrapObject'.
	self assert: generator sourceXmi isNotNil