generating - attributes
addAttribute: anAttributeModel to: aClass
	| name comment getterBuilder oppositeEnd |
	name := self attributeNameFor: anAttributeModel.
	oppositeEnd := anAttributeModel opposite.
	comment := self commentIn: anAttributeModel.
	aClass addInstVarNamed: name.
	(getterBuilder := OPUMLBootstrapGetterMethodBuilder new)
		selector: name;
		comment: comment.
	anAttributeModel isMultivalued & oppositeEnd isNotNil
		ifTrue: [ oppositeEnd isMultivalued
				ifTrue: [ getterBuilder
						defaultValue:
							'OPUMLManyToManyLinks on: self identity opposite: #'
								, (self attributeNameFor: oppositeEnd) ]
				ifFalse: [ getterBuilder
						defaultValue:
							'OPUMLToManyLinks on: self identity opposite: #' , (self attributeNameFor: oppositeEnd)
								, ':' ] ].
	(self isLiteralSpecification: anAttributeModel defaultValue)
		ifTrue: [ getterBuilder defaultValue: (self defaultValueFrom: anAttributeModel defaultValue) ].
	(self isEnumValue: anAttributeModel defaultValue)
		ifTrue: [ getterBuilder defaultValue: (self defaultValueFrom: anAttributeModel defaultValue) ].
	aClass addMethod: getterBuilder build.
	oppositeEnd
		ifNil: [ aClass
				addMethod: (CBMethod new setter: name argument: anAttributeModel type name comment: comment) ]
		ifNotNil: [ :assoc | 
			| setter |
			setter := CBMethod new.
			setter protocol: 'accessing'.
			anAttributeModel isMultivalued
				ifTrue: [ setter
						source:
							('<1s>: <2s>
	"<3s>"
	self <1s>
		removeAll;
		addAll: <2s>'
								expandMacrosWith: name
								with: (setter asArgumentName: anAttributeModel type name)
								with: (setter asComment: comment)) ]
				ifFalse: [ oppositeEnd isMultivalued
						ifTrue: [ setter
								source:
									('{attribute}: {argument}
	"{comment}"
	{attribute} := OPUMLToOneLink
		on: self identity
		update: #{otherSelector}
		from: {attribute}
		to: {argument}'
										format:
											{#attribute -> name.
											#argument -> (setter asArgumentName: anAttributeModel type name).
											#comment -> (setter asComment: comment).
											#otherSelector -> (self attributeNameFor: oppositeEnd)} asDictionary) ]
						ifFalse: [ setter
								source:
									('{attribute}: {argument}
	"{comment}"
	|anOld{attributeCap}|
	anOld{attributeCap} := {attribute}.
	{attribute} := {argument}.
	OPUMLToOneLink
		on: self identity
		thisSelector: #{attribute}
		otherSelector: #{otherAttribute}
		from: anOld{attributeCap}
		to: {attribute}'
										format:
											{#attribute -> name.
											#attributeCap -> name capitalized.
											#argument -> (setter asArgumentName: anAttributeModel type name).
											#comment -> (setter asComment: comment).
											#otherAttribute -> (self attributeNameFor: oppositeEnd)} asDictionary) ] ].
			aClass addMethod: setter ]