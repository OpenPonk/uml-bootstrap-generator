generating
createClassFrom: aClassModel in: aCategoryName
	| cls |
	cls := self ensureCreateClass: aClassModel name in: aCategoryName.
	^ cls