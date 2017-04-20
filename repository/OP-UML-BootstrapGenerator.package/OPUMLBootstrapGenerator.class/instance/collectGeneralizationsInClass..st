selecting
collectGeneralizationsInClass: aClassElement
	^ (self generalizationsIn: aClassElement)
		collect:
			[ :each | aClassElement nameValue -> (each elementNamed: 'general') referencedElement nameValue ]