generating
createClassFrom: anElement in: aTagName
	| className cls |
	className := (anElement elementNamed: 'name') value.
	cls := self
		ensureCreateClass: (self classNameFor: className)
		in: self packageName , '-' , aTagName.
	^ cls