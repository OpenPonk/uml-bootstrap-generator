accessing
supportedClasses
	^ (self class selectorsInProtocol: 'templates') collect: #capitalized