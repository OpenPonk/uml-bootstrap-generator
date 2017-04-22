accessing
attribute: anAttributeName inClass: aClassName
	^ (self findClass: aClassName) ownedAttribute
		detect: [ :each | each name = anAttributeName ]