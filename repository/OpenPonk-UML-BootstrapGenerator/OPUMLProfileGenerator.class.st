Class {
	#name : 'OPUMLProfileGenerator',
	#superclass : 'Object',
	#instVars : [
		'classPrefix',
		'packageName',
		'rootClassName',
		'sourceModel',
		'classes',
		'defaultValues'
	],
	#category : 'OpenPonk-UML-BootstrapGenerator-Profile-Generator',
	#package : 'OpenPonk-UML-BootstrapGenerator',
	#tag : 'Profile-Generator'
}

{ #category : 'translating' }
OPUMLProfileGenerator class >> generate [
	<script>
	| generator model |
	Smalltalk globals
		at: #OntoUMLProfileFactory
		ifPresent: [ :factory | 
			model := factory profile.
			generator := self new.
			generator sourceModel: model.
			generator classPrefix: model implementationPrefix.
			generator packageName: model implementationPackage.
			(CBChangesBrowser changes: generator generateAll) open ]
]

{ #category : 'generating - methods' }
OPUMLProfileGenerator >> addAccessingDelegationMethodsFrom: aClassModel to: aClass [
	| redefinedNames |
	redefinedNames := Set new.
	aClassModel ownedAttributes
		ifNotNil: [ :attrs | 
			attrs
				select: [ :attr | attr redefinedProperties isNotNil ]
				thenDo: [ :attr | 
					redefinedNames
						addAll: (attr redefinedProperties collect: [ :prop | self attributeNameFor: prop ]) ] ].
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
OPUMLProfileGenerator >> addAttribute: anAttributeModel to: aClass [

	| name comment getterBuilder oppositeEnd |
	name := self attributeNameFor: anAttributeModel.
	oppositeEnd := anAttributeModel opposite.
	comment := self commentIn: anAttributeModel.
	aClass addInstVarNamed: name.
	(getterBuilder := OPUMLBootstrapGetterMethodBuilder new)
		selector: name;
		comment: comment.
	anAttributeModel isMultivalued & oppositeEnd isNotNil ifTrue: [
		oppositeEnd isMultivalued
			ifTrue: [
				getterBuilder defaultValue:
					'OPUMLManyToManyLinks on: self identity opposite: #'
					, (self attributeNameFor: oppositeEnd) ]
			ifFalse: [
				getterBuilder defaultValue:
					'OPUMLToManyLinks on: self identity opposite: #'
					, (self attributeNameFor: oppositeEnd) , ':' ] ].
	(self isLiteralSpecification: anAttributeModel defaultValue) ifTrue: [
		getterBuilder defaultValue:
			(self defaultValueFrom: anAttributeModel defaultValue) ].
	(self isEnumValue: anAttributeModel defaultValue) ifTrue: [
		getterBuilder defaultValue:
			(self defaultValueFrom: anAttributeModel defaultValue) ].
	aClass addMethod: getterBuilder build.
	oppositeEnd
		ifNil: [
			aClass addMethod: (CBMethod new
					 setter: name
					 argument: anAttributeModel type name
					 comment: comment) ]
		ifNotNil: [ :assoc |
			| setter |
			setter := CBMethod new.
			setter protocolName: 'accessing'.
			anAttributeModel isMultivalued
				ifTrue: [
					setter source: ('<1s>: <2s>
	"<3s>"
	self <1s>
		removeAll;
		addAll: <2s>'
							 expandMacrosWith: name
							 with: (setter asArgumentName: anAttributeModel type name)
							 with: (setter asComment: comment)) ]
				ifFalse: [
					oppositeEnd isMultivalued
						ifTrue: [
							setter source: ('{attribute}: {argument}
	"{comment}"
	{attribute} := OPUMLToOneLink
		on: self identity
		update: #{otherSelector}
		from: {attribute}
		to: {argument}' format: {
										 (#attribute -> name).
										 (#argument
										  -> (setter asArgumentName: anAttributeModel type name)).
										 (#comment -> (setter asComment: comment)).
										 (#otherSelector -> (self attributeNameFor: oppositeEnd)) }
										 asDictionary) ]
						ifFalse: [
							setter source: ('{attribute}: {argument}
	"{comment}"
	|anOld{attributeCap}|
	anOld{attributeCap} := {attribute}.
	{attribute} := {argument}.
	OPUMLToOneLink
		on: self identity
		thisSelector: #{attribute}
		otherSelector: #{otherAttribute}
		from: anOld{attributeCap}
		to: {attribute}' format: {
										 (#attribute -> name).
										 (#attributeCap -> name capitalized).
										 (#argument
										  -> (setter asArgumentName: anAttributeModel type name)).
										 (#comment -> (setter asComment: comment)).
										 (#otherAttribute -> (self attributeNameFor: oppositeEnd)) }
										 asDictionary) ] ].
			aClass addMethod: setter ]
]

{ #category : 'generating - classes' }
OPUMLProfileGenerator >> addCommentFrom: aClassModel to: aClass [
	aClassModel ownedComments ifEmpty: [ ^ self ].
	aClass comment: aClassModel ownedComments first body
]

{ #category : 'generating - methods' }
OPUMLProfileGenerator >> addDelegationMethodsFrom: aClassModel to: aClass [
	self addAccessingDelegationMethodsFrom: aClassModel to: aClass.
	self addOperationsDelegationMethodsFrom: aClassModel to: aClass
]

{ #category : 'generating - enums' }
OPUMLProfileGenerator >> addEnumLiteral: anEnumLiteral to: aClass [
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
				protocol: 'accessing';
				source: builder source).
	prohibitedClassSideSelectors := #(package).
	(prohibitedClassSideSelectors includes: anEnumLiteral name)
		ifFalse: [ aClass
				addMetaMethod:
					(CBMethod new
						protocol: 'accessing - enum';
						source: builder source) ]
]

{ #category : 'generating - methods' }
OPUMLProfileGenerator >> addGeneralizationsFrom: aClassModel to: cls [
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
	aClassModel generalizations
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
OPUMLProfileGenerator >> addOperation: anOperationModel to: aClass [
	self addStubOperation: anOperationModel to: aClass.
	(anOperationModel method isNotNil and: [ anOperationModel method isNotEmpty ])
		ifTrue: [ self addRealOperation: anOperationModel to: aClass ]
]

{ #category : 'generating - methods' }
OPUMLProfileGenerator >> addOperationsDelegationMethodsFrom: aClassModel to: aClass [

	| redefinedNames |
	redefinedNames := Set new.
	aClassModel ownedOperations ifNotNil: [ :ops |
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
				                  protocol:
					                  'operations - '
					                  ,
						                  (superClass name withoutPrefix:
								                   self classPrefix).
			aClass addMethod: delegateMethod ] ]
]

{ #category : 'generating - operations' }
OPUMLProfileGenerator >> addRealOperation: anOperationModel to: aClass [
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
OPUMLProfileGenerator >> addStubOperation: anOperationModel to: aClass [
	| name comment methodBuilder |
	name := self stubOperationNameFor: anOperationModel.
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
	methodBuilder addLine: 'self notYetImplemented'.
	aClass compile: methodBuilder source withSqueakLineEndings classified: 'operations - stubs'
]

{ #category : 'retrieving' }
OPUMLProfileGenerator >> allClassesInModel [
	^ self sourceModel packagedElements select: [ :each | each oclIsKindOf: #Stereotype ]
]

{ #category : 'retrieving' }
OPUMLProfileGenerator >> allSuperclassesOf: aClassModel [
	| generalizations |
	generalizations := OrderedCollection new.
	(self superclassLayersOf: aClassModel)
		do: [ :layer | layer do: [ :each | generalizations addIfNotPresent: each ] ].
	generalizations removeAllSuchThat: [ :each | each name = 'Element' ].
	^ generalizations asArray
]

{ #category : 'utility' }
OPUMLProfileGenerator >> asPlural: aString [
	(aString endsWith: 's')
		ifTrue: [ ^ aString , 'es' ].
	(aString endsWith: 'y')
		ifTrue: [ ^ (aString withoutSuffix: 'y') , 'ies' ].
	^ aString , 's'
]

{ #category : 'retrieving' }
OPUMLProfileGenerator >> attributeNameFor: anAttributeModel [
	| name |
	name := anAttributeModel name.
	"class is a prohibited method name (it accesses the class-side)"
	name = 'class'
		ifTrue: [ name := 'owningClass' ].
	anAttributeModel isMultivalued
		ifTrue: [ ^ (self asPlural: name) ].
	^ name
]

{ #category : 'changes' }
OPUMLProfileGenerator >> changes [
	| changeSet |
	changeSet := CBChangeSet new.
	classes do: [ :each | changeSet addClass: each ].
	^ changeSet refactoringChanges
]

{ #category : 'retrieving' }
OPUMLProfileGenerator >> classNameFor: aString [
	^ (self classPrefix , aString) asSymbol
]

{ #category : 'accessing' }
OPUMLProfileGenerator >> classPrefix [
	^ classPrefix
]

{ #category : 'accessing' }
OPUMLProfileGenerator >> classPrefix: anObject [
	classPrefix := anObject
]

{ #category : 'accessing' }
OPUMLProfileGenerator >> classes [
	^ classes
]

{ #category : 'accessing' }
OPUMLProfileGenerator >> classes: anObject [
	classes := anObject
]

{ #category : 'retrieving' }
OPUMLProfileGenerator >> commentIn: anElement [
	^ (anElement ownedComments isNil or: [ anElement ownedComments isEmpty ])
		ifTrue: [ '' ]
		ifFalse: [ anElement ownedComments first body ]
]

{ #category : 'generating - classes' }
OPUMLProfileGenerator >> createClassFrom: aClassModel in: aCategoryName [
	| cls |
	cls := self ensureCreateClass: aClassModel name in: aCategoryName.
	aClassModel ownedAttributes
		ifNotNil: [ :attrib | attrib do: [ :each | self addAttribute: each to: cls ] ].
	aClassModel ownedOperations
		ifNotNil: [ :ops | ops do: [ :each | self addOperation: each to: cls ] ].
	"	aClassModel ownedRule do: [ :each | self addRule: each to: cls ]."
	self addGeneralizationsFrom: aClassModel to: cls.
	self addCommentFrom: aClassModel to: cls.
	^ cls
]

{ #category : 'generating - meta' }
OPUMLProfileGenerator >> createElementMeta [

	| cls |
	cls := self
		       ensureCreateClass: 'Element'
		       in: self sourceModel implementationPackage.
	cls comment: 'I am an abstract class for ' , classPrefix
		,
		' implementing some behavior for managing the classes and other stuff.'.
	cls
		addMethod: (CBMethod new
				 source: 'umlClassName
	^ self className withoutPrefix: ''' , classPrefix , '''';
				 protocolName: 'accessing');
		addMethod: (CBMethod new
				 source: 'umlMetaClass
	^ ' , classPrefix , 'ProfileFactory metaClassFor: self';
				 protocolName: 'accessing').
	^ cls
]

{ #category : 'generating - enums' }
OPUMLProfileGenerator >> createEnumFrom: anEnumModel in: aCategoryName [
	| cls |
	cls := self ensureCreateClass: anEnumModel name in: aCategoryName.
	cls parent: (self classNameFor: 'Enumeration').
	self addCommentFrom: anEnumModel to: cls.
	anEnumModel ownedLiteral ifNotNil: [ :lits | lits do: [ :each | self addEnumLiteral: each to: cls ] ].
	^ cls
]

{ #category : 'generating-classes' }
OPUMLProfileGenerator >> createProfileFactory [

	| cls |
	Smalltalk
		at: (self classNameFor: 'ProfileFactory')
		ifPresent: [ :existingCls | existingCls reset ].
	cls := self ensureCreateClass: 'ProfileFactory' in: 'Model'.
	cls comment:
		'I am a class representing the ' , classPrefix , ' profile itself.'.
	cls addInstVarNamed: 'profile'.
	cls
		addMethod: (CBMethod new
				 source: 'createProfile
	profile ifNotNil: [ ^ profile ].
	profile := OPUMLXMIReader readFrom: self xmi readStream.
	profile implementationPackage: ''' , self packageName , ''';
		implementationPrefix: ''' , classPrefix , '''.	
	profile ownedStereotype do: [ :each | each profile: profile ].
	^ profile';
				 protocolName: 'accessing');
		addMethod: (CBMethod new
				 source: 'xmi
	^ 
''' , (OPUMLXMIWriter toString: self sourceModel) , '''';
				 protocolName: 'accessing').
	^ cls
]

{ #category : 'retrieving' }
OPUMLProfileGenerator >> defaultValueFrom: aDefaultValue [
	(self isEnumValue: aDefaultValue)
		ifTrue: [ ^ (self classNameFor: aDefaultValue type name) , ' new ' , aDefaultValue instance name ].
	aDefaultValue value ifNotNil: [ ^ aDefaultValue value ].
	^ self defaultValues
		detect: [ :pair | aDefaultValue className endsWith: pair key ]
		ifFound: [ :pair | pair value ]
		ifNone: [ nil ]
]

{ #category : 'retrieving' }
OPUMLProfileGenerator >> defaultValues [
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
OPUMLProfileGenerator >> ensureCreateClass: aName in: aTagName [
	^ classes
		at: aName
		ifAbsentPut: [ CBClass
				name: (self classNameFor: aName)
				parent: (self parentFor: aName)
				package:
					(aTagName = 'Unclassified'
						ifTrue: [ self packageName ]
						ifFalse: [ self packageName , '-' , aTagName ]) ]
]

{ #category : 'generating' }
OPUMLProfileGenerator >> generate [
	<script: 'self generate'>
	
]

{ #category : 'generating' }
OPUMLProfileGenerator >> generateAll [
	classes := OrderedDictionary new.
"	self loadTemplateMethods."
"	self createTargetPackage."
	self createElementMeta.
	self generateAllEnums.
	self generateAllClasses.
	self generateAllDelegationMethods.
	self generateExtensionMethods.
	self createProfileFactory.
	^ self changes
]

{ #category : 'generating' }
OPUMLProfileGenerator >> generateAllClasses [
	self sourceModel packagedElements
		select: [ :each | each oclIsKindOf: #Stereotype ]
		thenDo:
			[ :each | self createClassFrom: each in: self sourceModel implementationPackage ]
]

{ #category : 'generating' }
OPUMLProfileGenerator >> generateAllDelegationMethods [
	self allClassesInModel
		do: [ :each | self addDelegationMethodsFrom: each to: (classes at: each name) ]
]

{ #category : 'generating' }
OPUMLProfileGenerator >> generateAllEnums [
	self sourceModel packagedElements
		select: [ :each | each isKindOf: BootUMLEnumeration ]
		thenDo: [ :each | self createEnumFrom: each in: self sourceModel implementationPackage ]
]

{ #category : 'generating' }
OPUMLProfileGenerator >> generateExtensionMethods [

	| extensions metaClass cls extensionGetter extensionSetter |
	extensions := self sourceModel packagedElements select: [ :each |
		              each oclIsKindOf: #Extension ].
	extensions do: [ :ext |
		metaClass := self class environment at:
			             ('OPUML' , ext ownedEnd opposite type name) asSymbol.
		cls := CBClass fromClass: metaClass.
		classes at: cls name put: cls.
		extensionGetter := CBMethod new
			                   source: ('<1s>
		^ self tagAt: #<1s> ifAbsent: [ nil ]' expandMacrosWith:
						                    ext ownedEnd name);
			                   protocolName:
				                   '*' , self sourceModel implementationPackage.
		extensionSetter := CBMethod new
			                   source: ('<1s>: a<2s>
	| old<2s> |
	old<2s> := self <1s>.
	self tagAt: #<1s> put: a<2s>.
	OPUMLToOneLink
		on: self
		thisSelector: #<1s>
		otherSelector: #<3s>
		updateFrom: old<2s>
		to: a<2s>'
					                    expandMacrosWith: ext ownedEnd name
					                    with: ext ownedEnd type name
					                    with: ext ownedEnd opposite name);
			                   protocolName:
				                   '*' , self sourceModel implementationPackage.
		cls addMethod: extensionGetter.
		cls addMethod: extensionSetter ]
]

{ #category : 'initialization' }
OPUMLProfileGenerator >> initialize [
	super initialize.
	classes := OrderedDictionary new
]

{ #category : 'testing' }
OPUMLProfileGenerator >> isEnumValue: anElement [
	^ (anElement className endsWith: 'InstanceValue') and: [ anElement type className endsWith: 'Enumeration' ]
]

{ #category : 'testing' }
OPUMLProfileGenerator >> isLiteralSpecification: anElement [
	^ anElement isNotNil and: [ (anElement instVarNamed: #sharedGeneralizations) includesKey: #LiteralSpecification ]
]

{ #category : 'generating' }
OPUMLProfileGenerator >> loadTemplateMethods [
	| templateClasses allClasses |
	templateClasses := OPUMLMetamodelGeneratorTemplates allSubclasses
		copyWithout: OPUMLMetaGenTemplate.
	allClasses := sourceModel packagedElements
		select: [ :each | each oclIsKindOf: #Stereotype ].
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

{ #category : 'retrieving' }
OPUMLProfileGenerator >> operationNameFor: anOperationName [
	| name |
	name := anOperationName name.
	"class is a prohibited method name (it accesses the class-side)"
	name = 'class'
		ifTrue: [ name := 'owningClass' ].
	^ name
]

{ #category : 'accessing' }
OPUMLProfileGenerator >> packageName [
	^ packageName
]

{ #category : 'accessing' }
OPUMLProfileGenerator >> packageName: anObject [
	packageName := anObject
]

{ #category : 'retrieving' }
OPUMLProfileGenerator >> parentFor: aClassName [
	aClassName = 'Element'
		ifTrue: [ ^ 'OPUMLMetaElement' ].
	aClassName = 'ProfileFactory'
		ifTrue: [ ^ 'OPUmlCustomProfile' ].
	^ self classNameFor: 'Element'
]

{ #category : 'generating - operations' }
OPUMLProfileGenerator >> prefixClassNamesInText: aString [
	^ aString
		copyWithRegex: '''%\w+%'''
		matchesTranslatedUsing: [ :each | self classPrefix , (each copyFrom: 3 to: each size - 2) ]
]

{ #category : 'accessing' }
OPUMLProfileGenerator >> sourceModel [
	^ sourceModel
]

{ #category : 'accessing' }
OPUMLProfileGenerator >> sourceModel: anObject [
	sourceModel := anObject
]

{ #category : 'retrieving' }
OPUMLProfileGenerator >> stubOperationNameFor: anOperationName [
	^ (self operationNameFor: anOperationName) , 'Stub'
]

{ #category : 'retrieving' }
OPUMLProfileGenerator >> superclassLayersOf: aClassModel [
	| subclasses layers layer parents |
	layers := OrderedCollection new.
	subclasses := OrderedCollection with: aClassModel.
	[ subclasses isNotEmpty ]
		whileTrue: [ 
			layer := (subclasses select: [ :each | each generalizations isNotNil ])
				flatCollect: [ :each | each generalizations collect: #general ].
			layers add: layer asArray.
			subclasses := layer ].
	^ layers reversed asArray
]
