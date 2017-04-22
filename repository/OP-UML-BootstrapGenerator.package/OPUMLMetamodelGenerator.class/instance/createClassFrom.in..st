generating - classes
createClassFrom: aClassModel in: aCategoryName
	| cls |
	cls := self ensureCreateClass: aClassModel name in: aCategoryName.
	aClassModel ownedAttribute ifNotNil: [ :attrib | attrib do: [ :each | self addAttribute: each to: cls ] ].
	"	aClassModel ownedOperation do: [ :each | self addOperation: each to: cls ]."
	"	aClassModel ownedRule do: [ :each | self addRule: each to: cls ]."
	self addGeneralizationsFrom: aClassModel to: cls.
	self addCommentFrom: aClassModel to: cls.
	^ cls