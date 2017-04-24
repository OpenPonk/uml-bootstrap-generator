generating - attributes
addAttribute: anAttributeModel to: aClass
	| name comment |
	name := anAttributeModel name.
	"class is a prohibited method name (it accesses the class-side)"
	name = 'class'
		ifTrue: [ name := 'owningClass' ].
	comment := anAttributeModel ownedComment ifNil: [ '' ] ifNotNil: [ :c | c first body ].
	aClass addInstVarNamed: name.
	(self isLiteralSpecification: anAttributeModel defaultValue)
		ifTrue: [ aClass
				addMethod:
					(CBMethod new
						getter: name
						comment: comment
						defaultValue: anAttributeModel defaultValue value) ]
		ifFalse: [ aClass addMethod: (CBMethod new getter: name comment: comment) ].
	aClass
		addMethod: (CBMethod new setter: name argument: anAttributeModel type name comment: comment)