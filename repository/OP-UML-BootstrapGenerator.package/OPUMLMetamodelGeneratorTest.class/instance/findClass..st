accessing
findClass: aName
	^ (self model packagedElement flatCollect: #packagedElement)
		detect: [ :each | each name = aName ]