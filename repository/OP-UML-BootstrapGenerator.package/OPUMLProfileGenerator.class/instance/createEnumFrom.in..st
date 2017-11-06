generating - enums
createEnumFrom: anEnumModel in: aCategoryName
	| cls |
	cls := self ensureCreateClass: anEnumModel name in: aCategoryName.
	cls parent: (self classNameFor: 'Enumeration').
	self addCommentFrom: anEnumModel to: cls.
	anEnumModel ownedLiteral ifNotNil: [ :lits | lits do: [ :each | self addEnumLiteral: each to: cls ] ].
	^ cls