generating - attributes
addAttribute: anAttributeModel to: aClass
	| name comment getterBuilder |
	name := self attributeNameFor: anAttributeModel.
	comment := anAttributeModel ownedComment ifNil: [ '' ] ifNotNil: [ :c | c first body ].
	aClass addInstVarNamed: name.
	(getterBuilder := OPUMLBootstrapGetterMethodBuilder new)
		selector: name;
		comment: comment.
	anAttributeModel isMultivalued
		ifTrue: [ getterBuilder defaultValue: 'OrderedCollection new' ].
	(self isLiteralSpecification: anAttributeModel defaultValue)
		ifTrue: [ getterBuilder defaultValue: (self defaultValueFrom: anAttributeModel defaultValue) ].
	(self isEnumValue: anAttributeModel defaultValue)
		ifTrue: [ getterBuilder defaultValue: (self defaultValueFrom: anAttributeModel defaultValue) ].
	aClass addMethod: getterBuilder build.
	aClass
		addMethod: (CBMethod new setter: name argument: anAttributeModel type name comment: comment)