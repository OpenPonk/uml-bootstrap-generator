testing
supportsClass: aClassName
	^ (self class selectorsInProtocol: 'templates') includes: aClassName uncapitalized