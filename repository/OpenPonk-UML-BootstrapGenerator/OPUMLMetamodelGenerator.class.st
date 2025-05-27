"
I generate the UML metamodel from the bootstrap metamodel representation.

See class-side for usage.
"
Class {
	#name : 'OPUMLMetamodelGenerator',
	#superclass : 'Object',
	#instVars : [
		'classPrefix',
		'packageName',
		'rootClassName',
		'sourceModel',
		'classes',
		'defaultValues'
	],
	#category : 'OpenPonk-UML-BootstrapGenerator-Metamodel-Generator',
	#package : 'OpenPonk-UML-BootstrapGenerator',
	#tag : 'Metamodel-Generator'
}

{ #category : 'translating' }
OPUMLMetamodelGenerator class >> generate [

	<script>
	(CBChangesBrowser changes: self newDefault generateAll) open
]

{ #category : 'translating' }
OPUMLMetamodelGenerator class >> newDefault [

	<script: 'self newDefault inspect'>
	| generator model |
	model := OPUMLMetamodelGeneratorTest umlBootstrapModel.
	generator := self new.
	generator sourceModel: model.
	generator classPrefix: 'OPUML'.
	generator packageName: 'OP-UML-Metamodel'.
	^ generator
]

{ #category : 'generating - methods' }
OPUMLMetamodelGenerator >> addAccessingDelegationMethodsFrom: aClassModel to: aClass [
	| redefinedNames |
	redefinedNames := Set new.
	aClassModel ownedAttribute
		ifNotNil: [ :attrs | 
			attrs
				select: [ :attr | attr redefinedProperty isNotNil ]
				thenDo: [ :attr | 
					redefinedNames
						addAll: (attr redefinedProperty collect: [ :prop | self attributeNameFor: prop ]) ] ].
	(self allSuperclassesOf: aClassModel)
		do: [ :superClassModel | 
			| superClass methods |
			superClass := classes at: superClassModel name.
			methods := (superClass methods select: [ :method | method protocolName = 'accessing' ])
				reject: [ :method | 
					(redefinedNames includes: method selector)
						or: [ redefinedNames includes: (method selector withoutSuffix: ':') asSymbol ] ].
			methods
				do: [ :method | 
					| delegateMethod node |
					node := OCParser parseMethod: method source lines first.
					delegateMethod := node numArgs = 0
						ifTrue: [ CBMethod new
								getter: node selector
									delegateFrom: '(sharedGeneralizations at: #' , (superClass name withoutPrefix: self classPrefix) , ')';
								protocolName: 'accessing - ' , (superClass name withoutPrefix: self classPrefix) ]
						ifFalse: [ CBMethod new
								setter: (node selector withoutSuffix: ':')
									argument: ((node argumentNames first withoutPrefix: 'a') withoutPrefix: 'n')
									delegateTo: '(sharedGeneralizations at: #' , (superClass name withoutPrefix: self classPrefix) , ')';
								protocolName: 'accessing - ' , (superClass name withoutPrefix: self classPrefix) ].
					aClass addMethod: delegateMethod ] ]
]

{ #category : 'generating - attributes' }
OPUMLMetamodelGenerator >> addAttribute: anAttributeModel to: aClass [
	| name comment getterBuilder oppositeEnd |
	name := self attributeNameFor: anAttributeModel.
	oppositeEnd := nil.
	anAttributeModel association
		ifNotNil: [ :assoc | 
			assoc first memberEnd \ (assoc first ownedEnd ifNil: [ #() ])
				detect: [ :each | (each = anAttributeModel) not ]
				ifFound: [ :each | oppositeEnd := each ] ].
	comment := self commentIn: anAttributeModel.
	aClass addInstVarNamed: name.
	(getterBuilder := OPUMLBootstrapGetterMethodBuilder new)
		selector: name;
		comment: comment.
	anAttributeModel isMultivalued & oppositeEnd isNil
		ifTrue: [ getterBuilder defaultValue: 'OrderedCollection new' ].
	anAttributeModel isMultivalued & oppositeEnd isNotNil
		ifTrue: [ oppositeEnd isMultivalued
				ifTrue: [ getterBuilder
						defaultValue: 'OPUMLManyToManyLinks on: self identity opposite: #' , (self attributeNameFor: oppositeEnd) ]
				ifFalse: [ getterBuilder
						defaultValue: 'OPUMLToManyLinks on: self identity opposite: #' , (self attributeNameFor: oppositeEnd) , ':' ] ].
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
			setter protocolName: 'accessing'.
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
]

{ #category : 'generating - classes' }
OPUMLMetamodelGenerator >> addCommentFrom: aClassModel to: aClass [
	aClassModel ownedComment ifNil: [ ^ self ].
	aClass comment: aClassModel ownedComment first body
]

{ #category : 'generating - methods' }
OPUMLMetamodelGenerator >> addDelegationMethodsFrom: aClassModel to: aClass [
	self addAccessingDelegationMethodsFrom: aClassModel to: aClass.
	self addOperationsDelegationMethodsFrom: aClassModel to: aClass
]

{ #category : 'generating - enums' }
OPUMLMetamodelGenerator >> addEnumLiteral: anEnumLiteral to: aClass [
	| builder prohibitedClassSideSelectors |
	builder := CBMethodBuilder new.
	builder selector: anEnumLiteral name.
	anEnumLiteral ownedComment
		ifNotNil:
			[ :comments | builder addLine: '"' , (comments first body copyReplaceAll: '"' with: '""') , '"' ].
	builder addLine: '^ #' , anEnumLiteral name.
	aClass
		addMethod:
			(CBMethod new
				protocolName: 'accessing';
				source: builder source).
	prohibitedClassSideSelectors := #(package).
	(prohibitedClassSideSelectors includes: anEnumLiteral name)
		ifFalse: [ aClass
				addMetaMethod:
					(CBMethod new
						protocolName: 'accessing - enum';
						source: builder source) ]
]

{ #category : 'generating - methods' }
OPUMLMetamodelGenerator >> addGeneralizationsFrom: aClassModel to: cls [
	| sharedMethod directMethod |
	sharedMethod := CBMethodBuilder new.
	sharedMethod selector: 'initializeSharedGeneralizations'.
	(self allSuperclassesOf: aClassModel)
		do: [ :each | 
			sharedMethod
				addLine:
					('sharedGeneralizations at: #<1s> put: (<2s> newOnShared: sharedGeneralizations).'
						expandMacrosWith: each name
						with: (self classNameFor: each name)) ].
	sharedMethod addLine: 'sharedGeneralizations at: #', aClassModel name, ' put: self.'.
	directMethod := CBMethodBuilder new.
	directMethod selector: 'initializeDirectGeneralizations'.
	directMethod addLine: 'directGeneralizations := {'.
	directMethod addIndent.
	aClassModel generalization
		ifNotNil: [ :gen | 
			gen
				reject: [ :each | each general name = 'Element' ]
				thenDo: [ :each | directMethod addLine: 'sharedGeneralizations at: #' , each general name , '.' ] ].
	directMethod removeIndent.
	directMethod addLine: '}'.
	cls compile: sharedMethod source trimmed classified: 'initialization'.
	cls compile: directMethod source trimmed classified: 'initialization'
]

{ #category : 'generating - operations' }
OPUMLMetamodelGenerator >> addOperation: anOperationModel to: aClass [
	self addStubOperation: anOperationModel to: aClass.
	(anOperationModel method isNotNil and: [ anOperationModel method isNotEmpty ])
		ifTrue: [ self addRealOperation: anOperationModel to: aClass ]
]

{ #category : 'generating - methods' }
OPUMLMetamodelGenerator >> addOperationsDelegationMethodsFrom: aClassModel to: aClass [

	| redefinedNames |
	redefinedNames := Set new.
	aClassModel ownedOperation ifNotNil: [ :ops |
		ops
			select: [ :op | op method isNotNil ]
			thenDo: [ :op | redefinedNames add: op name ] ].
	(self allSuperclassesOf: aClassModel) do: [ :superClassModel |
		| superClass methods |
		superClass := classes at: superClassModel name.
		methods := (superClass methods select: [ :method |
			            method protocolName = 'operations' ]) reject: [ :method |
			           (redefinedNames includes: method selector) or: [
				           redefinedNames includes:
					           (method selector withoutSuffix: ':') asSymbol ] ].
		methods do: [ :method |
			| delegateMethod node |
			node := OCParser parseMethod: method source lines first.
			delegateMethod := CBMethod new
				                  getter: node selector
				                  delegateFrom: '(sharedGeneralizations at: #'
					                  ,
						                  (superClass name withoutPrefix:
								                   self classPrefix) , ')';
				                  protocolName:
					                  'operations - '
					                  ,
						                  (superClass name withoutPrefix:
								                   self classPrefix).
			aClass addMethod: delegateMethod ] ]
]

{ #category : 'generating - operations' }
OPUMLMetamodelGenerator >> addRealOperation: anOperationModel to: aClass [
	| name comment methodBuilder |
	name := self operationNameFor: anOperationModel.
	comment := self commentIn: anOperationModel.
	methodBuilder := CBMethodBuilder new selector: name.
	methodBuilder addComment: comment.
	methodBuilder addLine: ''.
	anOperationModel precondition
		ifNotNil: [ anOperationModel precondition
				do: [ :pre | 
					methodBuilder
						addComment: pre name , ': {' , pre specification language first , '} ' , pre specification body first ] ].
	anOperationModel bodyCondition
		ifNotNil: [ :bodyCond | 
			| spec |
			spec := bodyCond specification.
			spec body
				withIndexDo: [ :each :i | methodBuilder addComment: '{' , (spec language at: i) , '} ' , each ] ].
	methodBuilder addLine: ''.
	methodBuilder
		addLine: (self prefixClassNamesInText: anOperationModel method first body first).
	aClass compile: methodBuilder source classified: 'operations'
]

{ #category : 'generating - operations' }
OPUMLMetamodelGenerator >> addStubOperation: anOperationModel to: aClass [

	| name comment methodBuilder |
	name := self stubOperationNameFor: anOperationModel.
	comment := self commentIn: anOperationModel.
	methodBuilder := CBMethodBuilder new selector: name.
	methodBuilder addComment: comment.
	methodBuilder addLine: ''.
	anOperationModel precondition ifNotNil: [ 
		anOperationModel precondition do: [ :pre | 
			methodBuilder addComment:
				pre name , ': {' , pre specification language first , '} '
				, pre specification body first ] ].
	anOperationModel bodyCondition ifNotNil: [ :bodyCond | 
		| spec |
		spec := bodyCond specification.
		spec body withIndexDo: [ :each :i | 
			methodBuilder addComment: '{' , (spec language at: i) , '} ' , each ] ].
	methodBuilder addLine: ''.
	methodBuilder addLine: 'self notYetImplemented'.
	aClass
		compile: methodBuilder source withInternalLineEndings
		classified: 'operations - stubs'
]

{ #category : 'retrieving' }
OPUMLMetamodelGenerator >> allClassesInModel [
	^ self sourceModel packagedElement
		flatCollect: [ :pkg | pkg packagedElement select: [ :each | each isKindOf: BootUMLClass ] ]
]

{ #category : 'retrieving' }
OPUMLMetamodelGenerator >> allSuperclassesOf: aClassModel [
	| generalizations |
	generalizations := OrderedCollection new.
	(self superclassLayersOf: aClassModel)
		do: [ :layer | layer do: [ :each | generalizations addIfNotPresent: each ] ].
	generalizations removeAllSuchThat: [ :each | each name = 'Element' ].
	^ generalizations asArray
]

{ #category : 'utility' }
OPUMLMetamodelGenerator >> asPlural: aString [
	(aString endsWith: 's')
		ifTrue: [ ^ aString , 'es' ].
	(aString endsWith: 'y')
		ifTrue: [ ^ (aString withoutSuffix: 'y') , 'ies' ].
	^ aString , 's'
]

{ #category : 'retrieving' }
OPUMLMetamodelGenerator >> attributeNameFor: anAttributeModel [
	| name |
	name := anAttributeModel name.
	"class is a prohibited method name (it accesses the class-side)"
	name = 'class'
		ifTrue: [ name := 'owningClass' ].
	anAttributeModel isMultivalued
		ifTrue: [ ^ (self asPlural: name) ].
	^ name
]

{ #category : 'generating - meta' }
OPUMLMetamodelGenerator >> cbMethodFrom: aMethod [

	| generatePrefix sourceCode |
	generatePrefix := 'generate'.
	sourceCode := aMethod sourceCode.
	(sourceCode beginsWith: generatePrefix) ifTrue: [
		sourceCode := sourceCode allButFirst: generatePrefix size ].

	^ CBMethod new
		  source: sourceCode;
		  protocolName: aMethod protocolName
]

{ #category : 'changes' }
OPUMLMetamodelGenerator >> changes [
	| changeSet |
	changeSet := CBChangeSet new.
	classes do: [ :each | changeSet addClass: each ].
	^ changeSet refactoringChanges
]

{ #category : 'retrieving' }
OPUMLMetamodelGenerator >> classNameFor: aString [
	^ (self classPrefix , aString) asSymbol
]

{ #category : 'accessing' }
OPUMLMetamodelGenerator >> classPrefix [
	^ classPrefix
]

{ #category : 'accessing' }
OPUMLMetamodelGenerator >> classPrefix: anObject [
	classPrefix := anObject
]

{ #category : 'accessing' }
OPUMLMetamodelGenerator >> classes [
	^ classes
]

{ #category : 'accessing' }
OPUMLMetamodelGenerator >> classes: anObject [
	classes := anObject
]

{ #category : 'retrieving' }
OPUMLMetamodelGenerator >> commentIn: anElement [
	^ (anElement ownedComment isNil or: [ anElement ownedComment isEmpty ])
		ifTrue: [ '' ]
		ifFalse: [ anElement ownedComment first body ]
]

{ #category : 'generating - classes' }
OPUMLMetamodelGenerator >> createClassFrom: aClassModel in: aCategoryName [
	| cls |
	cls := self ensureCreateClass: aClassModel name in: aCategoryName.
	aClassModel ownedAttribute
		ifNotNil: [ :attrib | attrib do: [ :each | self addAttribute: each to: cls ] ].
	aClassModel ownedOperation
		ifNotNil: [ :ops | ops do: [ :each | self addOperation: each to: cls ] ].
	"	aClassModel ownedRule do: [ :each | self addRule: each to: cls ]."
	self addGeneralizationsFrom: aClassModel to: cls.
	self addCommentFrom: aClassModel to: cls.
	^ cls
]

{ #category : 'generating - meta' }
OPUMLMetamodelGenerator >> createElementMeta [

	| cls sourceClass |
	cls := self ensureCreateClass: self metaElementName in: self metaTag.
	cls comment:
		'I am a metaclass for UML classes implementing some behavior for managing the classes and other stuff (like an announcer).'.
	sourceClass := OPUMLMetamodelElementTemplate.
	sourceClass instVarNames do: [ :each | cls addInstVarNamed: each ].
	sourceClass class instVarNames do: [ :each |
		cls addMetaInstVarNamed: each ].
	sourceClass methods do: [ :each |
		cls addMethod: (self cbMethodFrom: each) ].
	sourceClass class methods do: [ :each |
		cls addMetaMethod: (self cbMethodFrom: each) ].
	^ cls
]

{ #category : 'generating - enums' }
OPUMLMetamodelGenerator >> createEnumFrom: anEnumModel in: aCategoryName [
	| cls |
	cls := self ensureCreateClass: anEnumModel name in: aCategoryName.
	cls parent: (self classNameFor: 'Enumeration').
	self addCommentFrom: anEnumModel to: cls.
	anEnumModel ownedLiteral ifNotNil: [ :lits | lits do: [ :each | self addEnumLiteral: each to: cls ] ].
	^ cls
]

{ #category : 'generating - packages' }
OPUMLMetamodelGenerator >> createTargetPackage [

	(self packageOrganizer hasPackage: self packageName) ifFalse: [
		self packageOrganizer addPackage: self packageName ]
]

{ #category : 'retrieving' }
OPUMLMetamodelGenerator >> defaultValueFrom: aDefaultValue [
	(self isEnumValue: aDefaultValue)
		ifTrue: [ ^ (self classNameFor: aDefaultValue type name) , ' new ' , aDefaultValue instance name ].
	aDefaultValue value ifNotNil: [ ^ aDefaultValue value ].
	^ self defaultValues
		detect: [ :pair | aDefaultValue className endsWith: pair key ]
		ifFound: [ :pair | pair value ]
		ifNone: [ nil ]
]

{ #category : 'retrieving' }
OPUMLMetamodelGenerator >> defaultValues [
	| literals |
	"	defaultValues ifNotNil: [ ^ defaultValues ]."
	literals := (sourceModel packagedElement detect: [ :each | each name = 'Values' ])
		packagedElement select: [ :each | each name beginsWith: 'Literal' ].
	defaultValues := literals
		collect: [ :each | 
			| key value |
			key := each name.
			value := each ownedAttribute
				ifNil: [ nil ]
				ifNotNil: [ (each ownedAttribute detect: [ :attr | attr name = 'value' ]) defaultValue value ].
			key -> value ].
	^ defaultValues
]

{ #category : 'generating - classes' }
OPUMLMetamodelGenerator >> ensureCreateClass: aName in: aTagName [
	^ classes
		at: aName
		ifAbsentPut: [ CBClass
				name: (self classNameFor: aName)
				parent: (self parentFor: aName)
				package: self packageName , '-' , aTagName ]
]

{ #category : 'generating' }
OPUMLMetamodelGenerator >> generateAll [
	classes := Dictionary new.
	self loadTemplateMethods.
	self createTargetPackage.
	self createElementMeta.
	self generateAllEnums.
	self generateAllClasses.
	self generateAllDelegationMethods.
	^ self changes
]

{ #category : 'generating' }
OPUMLMetamodelGenerator >> generateAllClasses [
	self sourceModel packagedElement
		do: [ :pkg | 
			pkg packagedElement
				select: [ :each | each isKindOf: BootUMLClass ]
				thenDo: [ :each | self createClassFrom: each in: pkg name ] ]
]

{ #category : 'generating' }
OPUMLMetamodelGenerator >> generateAllDelegationMethods [
	self allClassesInModel
		do: [ :each | self addDelegationMethodsFrom: each to: (classes at: each name) ]
]

{ #category : 'generating' }
OPUMLMetamodelGenerator >> generateAllEnums [
	self sourceModel packagedElement
		do: [ :pkg | 
			pkg packagedElement
				select: [ :each | each isKindOf: BootUMLEnumeration  ]
				thenDo: [ :each | self createEnumFrom: each in: pkg name ] ]
]

{ #category : 'initialization' }
OPUMLMetamodelGenerator >> initialize [
	super initialize.
	classes := Dictionary new
]

{ #category : 'testing' }
OPUMLMetamodelGenerator >> isEnumValue: anElement [
	^ (anElement className endsWith: 'InstanceValue') and: [ anElement type className endsWith: 'Enumeration' ]
]

{ #category : 'testing' }
OPUMLMetamodelGenerator >> isLiteralSpecification: anElement [
	^ anElement isNotNil and: [ (anElement instVarNamed: #sharedGeneralizations) includesKey: #LiteralSpecification ]
]

{ #category : 'generating' }
OPUMLMetamodelGenerator >> loadTemplateMethods [
	| templateClasses allClasses |
	templateClasses := OPUMLMetamodelGeneratorTemplates allSubclasses
		copyWithout: OPUMLMetaGenTemplate.
	allClasses := (sourceModel packagedElement
		flatCollect: #packagedElement)
		select: [ :each | each isKindOf: BootUMLClass ].
	templateClasses
		do: [ :cls | 
			| supported template |
			template := cls new.
			supported := template supportedClasses.
			supported
				do: [ :name | 
					| classModel |
					classModel := allClasses detect: [ :each | each name = name ].
					classModel ownedOperation
						do: [ :op | op method: (template methodsFor: op inClassNamed: name) ] ] ]
]

{ #category : 'generating - meta' }
OPUMLMetamodelGenerator >> metaElementName [

	^ 'MetaElement'
]

{ #category : 'generating - meta' }
OPUMLMetamodelGenerator >> metaTag [

	^ 'Meta'
]

{ #category : 'retrieving' }
OPUMLMetamodelGenerator >> operationNameFor: anOperationName [
	| name |
	name := anOperationName name.
	"class is a prohibited method name (it accesses the class-side)"
	name = 'class'
		ifTrue: [ name := 'owningClass' ].
	^ name
]

{ #category : 'accessing' }
OPUMLMetamodelGenerator >> packageName [
	^ packageName
]

{ #category : 'accessing' }
OPUMLMetamodelGenerator >> packageName: anObject [
	packageName := anObject
]

{ #category : 'retrieving' }
OPUMLMetamodelGenerator >> parentFor: aClassName [
	aClassName = 'MetaElement'
		ifTrue: [ ^ 'Object' ].
	aClassName = 'Element'
		ifTrue: [ ^ self classPrefix , 'MetaElement' ].
	^ self classPrefix , 'Element'
]

{ #category : 'generating - operations' }
OPUMLMetamodelGenerator >> prefixClassNamesInText: aString [
	^ aString
		copyWithRegex: '''%\w+%'''
		matchesTranslatedUsing: [ :each | self classPrefix , (each copyFrom: 3 to: each size - 2) ]
]

{ #category : 'accessing' }
OPUMLMetamodelGenerator >> sourceModel [
	^ sourceModel
]

{ #category : 'accessing' }
OPUMLMetamodelGenerator >> sourceModel: anObject [
	sourceModel := anObject
]

{ #category : 'retrieving' }
OPUMLMetamodelGenerator >> stubOperationNameFor: anOperationName [
	^ (self operationNameFor: anOperationName) , 'Stub'
]

{ #category : 'retrieving' }
OPUMLMetamodelGenerator >> superclassLayersOf: aClassModel [
	| subclasses layers layer parents |
	layers := OrderedCollection new.
	subclasses := OrderedCollection with: aClassModel.
	[ subclasses isNotEmpty ]
		whileTrue: [ 
			layer := (subclasses select: [ :each | each generalization isNotNil ])
				flatCollect: [ :each | each generalization collect: #general ].
			layers add: layer asArray.
			subclasses := layer ].
	^ layers reversed asArray
]
