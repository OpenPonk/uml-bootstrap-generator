generating
createClassFrom: anElement in: aTagName
	| className cls |
	className := (anElement elementNamed: 'name') value.
	cls := self
		ensureCreateClass: className
		in: aTagName.
	^ cls