generating
createAccessorsFrom: anAttributeElement in: aClass
	| name comment typeName |
	name := (anAttributeElement elementNamed: 'name') value.
	"class is a prohibited method name (it accesses the class-side)"
	name = 'class'
		ifTrue: [ name := 'owningClass' ].
	typeName := self typeOf: (anAttributeElement elementNamed: 'type').
	aClass addInstVarNamed: name.
	aClass addMethod: (CBMethod new getter: name).
	aClass addMethod: (CBMethod new setter: name argument: typeName)