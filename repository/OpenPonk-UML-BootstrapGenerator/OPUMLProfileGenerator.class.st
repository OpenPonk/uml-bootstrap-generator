"
I am a specialized generator that consumes a UML Profile model (represented in XMI or bootstrap format) and generates the corresponding Pharo classes and extension methods necessary to apply and utilize the profile dynamically within OpenPonk.
"
Class {
	#name : 'OPUMLProfileGenerator',
	#superclass : 'Object',
	#instVars : [
		'classPrefix',
		'packageName',
		'sourceModel',
		'classes'
	],
	#category : 'OpenPonk-UML-BootstrapGenerator-Profile-Generator',
	#package : 'OpenPonk-UML-BootstrapGenerator',
	#tag : 'Profile-Generator'
}

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

	| name comment |
	name := self attributeNameFor: anAttributeModel.
	comment := self commentIn: anAttributeModel.
	aClass addInstVarNamed: name.
	aClass addMethod: (self getterMethodFor: anAttributeModel named: name comment: comment).
	aClass addMethod: (self setterMethodFor: anAttributeModel named: name comment: comment)
]

{ #category : 'generating - operations' }
OPUMLProfileGenerator >> addBodyConditionFrom: anOperationModel to: aMethodBuilder [

	| spec |
	anOperationModel bodyCondition ifNil: [ ^ self ].
	spec := anOperationModel bodyCondition specification.
	spec ifNil: [ ^ self ].
	spec bodies withIndexDo: [ :each :i | aMethodBuilder addComment: '{' , (self languageAt: i in: spec) , '} ' , each ]
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
	anEnumLiteral ownedComments ifNotNil: [ :comments |
		comments ifNotEmpty: [ builder addLine: '"' , (comments first body copyReplaceAll: '"' with: '""') , '"' ] ].
	builder addLine: '^ #' , anEnumLiteral name.
	aClass addMethod: (CBMethod new
			 protocolName: 'accessing';
			 source: builder source).
	prohibitedClassSideSelectors := #( #package ).
	(prohibitedClassSideSelectors includes: anEnumLiteral name) ifFalse: [
			aClass addMetaMethod: (CBMethod new
					 protocolName: 'accessing - enum';
					 source: builder source) ]
]

{ #category : 'generating - methods' }
OPUMLProfileGenerator >> addGeneralizationsFrom: aClassModel to: cls [

	| sharedMethod directMethod |
	sharedMethod := CBMethodBuilder new.
	sharedMethod selector: 'initializeSharedGeneralizations'.
	(self allSuperclassesOf: aClassModel) do: [ :each |
			sharedMethod addLine: ('sharedGeneralizations at: #<1s> put: (<2s> newOnShared: sharedGeneralizations).'
					 expandMacrosWith: each name
					 with: (self classNameFor: each name)) ].
	sharedMethod addLine: 'sharedGeneralizations at: #' , aClassModel name , ' put: self.'.
	directMethod := CBMethodBuilder new.
	directMethod selector: 'initializeDirectGeneralizations'.
	directMethod addLine: 'directGeneralizations := {'.
	directMethod addIndent.
	aClassModel generalizations ifNotNil: [ :gen |
			gen
				reject: [ :each | each general name = 'Element' ]
				thenDo: [ :each | directMethod addLine: 'sharedGeneralizations at: #' , each general name , '.' ] ].
	directMethod removeIndent.
	directMethod addLine: '}'.
	cls compile: sharedMethod source trimBoth classified: 'initialization'.
	cls compile: directMethod source trimBoth classified: 'initialization'
]

{ #category : 'generating - operations' }
OPUMLProfileGenerator >> addOperation: anOperationModel to: aClass [

	self addStubOperation: anOperationModel to: aClass.
	(anOperationModel methods isNotNil and: [
		 anOperationModel methods isNotEmpty and: [ anOperationModel methods first bodies isNotEmpty ] ]) ifTrue: [
		self addRealOperation: anOperationModel to: aClass ]
]

{ #category : 'generating - methods' }
OPUMLProfileGenerator >> addOperationsDelegationMethodsFrom: aClassModel to: aClass [

	| redefinedNames |
	redefinedNames := Set new.
	aClassModel ownedOperations ifNotNil: [ :ops |
			ops
				select: [ :op | op methods isNotNil and: [ op methods isNotEmpty and: [ op methods first bodies isNotEmpty ] ] ]
				thenDo: [ :op | redefinedNames add: (self operationNameFor: op) ] ].
	(self allSuperclassesOf: aClassModel) do: [ :superClassModel |
			| superClass methods |
			superClass := classes at: superClassModel name.
			methods := (superClass methods select: [ :method | method protocolName = 'operations' ]) reject: [ :method |
				           (redefinedNames includes: method selector) or: [
					           redefinedNames includes: (method selector withoutSuffix: ':') asSymbol ] ].
			methods do: [ :method |
					| delegateMethod node |
					node := OCParser parseMethod: method source lines first.
					delegateMethod := CBMethod new
						                  getter: node selector
						                  delegateFrom: '(sharedGeneralizations at: #' , (superClass name withoutPrefix: self classPrefix) , ')';
						                  protocolName: 'operations - ' , (superClass name withoutPrefix: self classPrefix).
					aClass addMethod: delegateMethod ] ]
]

{ #category : 'generating - operations' }
OPUMLProfileGenerator >> addPreconditionsFrom: anOperationModel to: aMethodBuilder [

	anOperationModel preconditions ifNil: [ ^ self ].
	anOperationModel preconditions do: [ :pre |
			| spec |
			spec := pre specification.
			(spec isNotNil and: [ spec bodies isNotEmpty ]) ifTrue: [
				aMethodBuilder addComment: pre name , ': {' , (self languageAt: 1 in: spec) , '} ' , spec bodies first ] ]
]

{ #category : 'generating - operations' }
OPUMLProfileGenerator >> addRealOperation: anOperationModel to: aClass [

	| methodBuilder |
	methodBuilder := self operationMethodBuilderFor: anOperationModel named: (self operationNameFor: anOperationModel).
	methodBuilder addLine: (self prefixClassNamesInText: anOperationModel methods first bodies first).
	aClass compile: methodBuilder source withInternalLineEndings classified: 'operations'
]

{ #category : 'generating - operations' }
OPUMLProfileGenerator >> addStubOperation: anOperationModel to: aClass [

	| methodBuilder |
	methodBuilder := self operationMethodBuilderFor: anOperationModel named: (self stubOperationNameFor: anOperationModel).
	methodBuilder addLine: 'self notYetImplemented'.
	aClass compile: methodBuilder source withInternalLineEndings classified: 'operations - stubs'
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

{ #category : 'utilities' }
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
	cls := self ensureCreateClass: 'Element' in: self targetTagName.
	cls comment:
		'I am an abstract class for ' , classPrefix , ' implementing some behavior for managing the classes and other stuff.'.
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
	anEnumModel ownedLiterals ifNotNil: [ :literals | literals do: [ :each | self addEnumLiteral: each to: cls ] ].
	^ cls
]

{ #category : 'generating - classes' }
OPUMLProfileGenerator >> createProfileFactory [

	| cls |
	cls := self ensureCreateClass: 'ProfileFactory' in: 'Model'.
	cls comment: 'I am a class representing the ' , classPrefix , ' profile itself.'.
	cls addInstVarNamed: 'profile'.
	cls
		addMethod: (CBMethod new
				 source: 'createProfile
	profile ifNotNil: [ ^ profile ].
	profile := OPUMLXMIReader readFrom: self xmi readStream.
	profile implementationPackage: ' , self packageName printString , ';
		implementationPrefix: ' , classPrefix printString , '.
	profile ownedStereotype do: [ :each | each profile: profile ].
	^ profile';
				 protocolName: 'accessing');
		addMethod: (CBMethod new
				 source: 'xmi
	^ ' , self xmiString printString;
				 protocolName: 'accessing').
	^ cls
]

{ #category : 'retrieving' }
OPUMLProfileGenerator >> defaultValueFrom: aDefaultValue [

	| rawValue |
	(self isEnumValue: aDefaultValue) ifTrue: [
		^ (self classNameFor: aDefaultValue type name) , ' new ' , aDefaultValue instance name ].
	rawValue := aDefaultValue value.
	rawValue ifNil: [ ^ nil ].
	^ rawValue isString
		  ifTrue: [ rawValue printString ]
		  ifFalse: [ rawValue ]
]

{ #category : 'generating - classes' }
OPUMLProfileGenerator >> ensureCreateClass: aName in: aTagName [

	^ classes at: aName ifAbsentPut: [
			  CBClass
				  name: (self classNameFor: aName)
				  parent: (self parentFor: aName)
				  package: self packageName
				  tag: (aTagName = 'Unclassified'
						   ifTrue: [ '' ]
						   ifFalse: [ aTagName ]) ]
]

{ #category : 'generating' }
OPUMLProfileGenerator >> generateAll [

	classes := OrderedDictionary new.
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

	self allClassesInModel do: [ :each | self createClassFrom: each in: self targetTagName ]
]

{ #category : 'generating' }
OPUMLProfileGenerator >> generateAllDelegationMethods [
	self allClassesInModel
		do: [ :each | self addDelegationMethodsFrom: each to: (classes at: each name) ]
]

{ #category : 'generating' }
OPUMLProfileGenerator >> generateAllEnums [

	self sourceModel packagedElements
		select: [ :each | each oclIsKindOf: #Enumeration ]
		thenDo: [ :each | self createEnumFrom: each in: self targetTagName ]
]

{ #category : 'generating' }
OPUMLProfileGenerator >> generateExtensionMethods [

	| extensions metaClass cls extensionGetter extensionSetter |
	extensions := self sourceModel packagedElements select: [ :each | each oclIsKindOf: #Extension ].
	extensions do: [ :ext |
			metaClass := self class environment at: ('OPUML' , ext ownedEnd opposite type name) asSymbol.
			cls := classes at: metaClass name ifAbsentPut: [ CBClass fromClass: metaClass ].
			extensionGetter := CBMethod new
				                   source: ('<1s>
		^ self tagAt: #<1s> ifAbsent: [ nil ]' expandMacrosWith: ext ownedEnd name);
				                   protocolName: '*' , self sourceModel implementationPackage.
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
		to: a<2s>' expandMacrosWith: ext ownedEnd name with: ext ownedEnd type name with: ext ownedEnd opposite name);
				                   protocolName: '*' , self sourceModel implementationPackage.
			cls addMethod: extensionGetter.
			cls addMethod: extensionSetter ]
]

{ #category : 'generating - attributes' }
OPUMLProfileGenerator >> getterMethodFor: anAttributeModel named: aName comment: aComment [

	| oppositeEnd getterBuilder |
	oppositeEnd := anAttributeModel opposite.
	(getterBuilder := OPUMLBootstrapGetterMethodBuilder new)
		selector: aName;
		comment: aComment.
	anAttributeModel isMultivalued & oppositeEnd isNil ifTrue: [ getterBuilder defaultValue: 'OrderedCollection new' ].
	anAttributeModel isMultivalued & oppositeEnd isNotNil ifTrue: [
			getterBuilder defaultValue: (oppositeEnd isMultivalued
					 ifTrue: [ 'OPUMLManyToManyLinks on: self identity opposite: #' , (self attributeNameFor: oppositeEnd) ]
					 ifFalse: [ 'OPUMLToManyLinks on: self identity opposite: #' , (self attributeNameFor: oppositeEnd) , ':' ]) ].
	((self isLiteralSpecification: anAttributeModel defaultValue) or: [ self isEnumValue: anAttributeModel defaultValue ]) ifTrue: [
		getterBuilder defaultValue: (self defaultValueFrom: anAttributeModel defaultValue) ].
	^ getterBuilder build
]

{ #category : 'initialization' }
OPUMLProfileGenerator >> initialize [
	super initialize.
	classes := OrderedDictionary new
]

{ #category : 'testing' }
OPUMLProfileGenerator >> isEnumValue: anElement [

	^ anElement isNotNil and: [
		  (anElement oclIsKindOf: #InstanceValue) and: [ anElement type isNotNil and: [ anElement type oclIsKindOf: #Enumeration ] ] ]
]

{ #category : 'testing' }
OPUMLProfileGenerator >> isLiteralSpecification: anElement [

	^ anElement isNotNil and: [ anElement oclIsKindOf: #LiteralSpecification ]
]

{ #category : 'generating - operations' }
OPUMLProfileGenerator >> languageAt: anIndex in: aSpecification [

	^ anIndex <= aSpecification languages size
		  ifTrue: [ aSpecification languages at: anIndex ]
		  ifFalse: [ '' ]
]

{ #category : 'generating - attributes' }
OPUMLProfileGenerator >> linkSetterSourceFor: aName argument: anArgument comment: aComment opposite: anOppositeEnd [

	anOppositeEnd isMultivalued ifTrue: [
			^ '{attribute}: {argument}
	"{comment}"
	{attribute} := OPUMLToOneLink
		on: self identity
		update: #{otherSelector}
		from: {attribute}
		to: {argument}' format: {
					  (#attribute -> aName).
					  (#argument -> anArgument).
					  (#comment -> aComment).
					  (#otherSelector -> (self attributeNameFor: anOppositeEnd)) } asDictionary ].
	^ '{attribute}: {argument}
	"{comment}"
	|anOld{attributeCap}|
	anOld{attributeCap} := {attribute}.
	{attribute} := {argument}.
	OPUMLToOneLink
		on: self identity
		thisSelector: #{attribute}
		otherSelector: #{otherAttribute}
		updateFrom: anOld{attributeCap}
		to: {attribute}' format: {
			  (#attribute -> aName).
			  (#attributeCap -> aName capitalized).
			  (#argument -> anArgument).
			  (#comment -> aComment).
			  (#otherAttribute -> (self attributeNameFor: anOppositeEnd)) } asDictionary
]

{ #category : 'generating - operations' }
OPUMLProfileGenerator >> operationMethodBuilderFor: anOperationModel named: aSelector [

	| methodBuilder |
	methodBuilder := CBMethodBuilder new selector: aSelector.
	methodBuilder addComment: (self commentIn: anOperationModel).
	methodBuilder addLine: ''.
	self addPreconditionsFrom: anOperationModel to: methodBuilder.
	self addBodyConditionFrom: anOperationModel to: methodBuilder.
	methodBuilder addLine: ''.
	^ methodBuilder
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

{ #category : 'generating - attributes' }
OPUMLProfileGenerator >> setterMethodFor: anAttributeModel named: aName comment: aComment [

	| oppositeEnd typeName setter |
	oppositeEnd := anAttributeModel opposite.
	typeName := anAttributeModel type ifNil: [ 'Object' ] ifNotNil: [ :type | type name ].
	oppositeEnd ifNil: [ ^ CBMethod new setter: aName argument: typeName comment: aComment ].
	setter := CBMethod new.
	setter protocolName: 'accessing'.
	setter source: (anAttributeModel isMultivalued
			 ifTrue: [
					 '<1s>: <2s>
	"<3s>"
	self <1s>
		removeAll;
		addAll: <2s>' expandMacrosWith: aName with: (setter asArgumentName: typeName) with: (setter asComment: aComment) ]
			 ifFalse: [
					 self
						 linkSetterSourceFor: aName
						 argument: (setter asArgumentName: typeName)
						 comment: (setter asComment: aComment)
						 opposite: oppositeEnd ]).
	^ setter
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

	| subclasses layers layer |
	layers := OrderedCollection new.
	subclasses := OrderedCollection with: aClassModel.
	[ subclasses isNotEmpty ] whileTrue: [
			layer := (subclasses select: [ :each | each generalizations isNotNil ]) flatCollect: [ :each |
				         each generalizations collect: #general ].
			layers add: layer asArray.
			subclasses := layer ].
	^ layers reversed asArray
]

{ #category : 'retrieving' }
OPUMLProfileGenerator >> targetTagName [

	| targetTag |
	targetTag := self sourceModel implementationPackage.
	^ targetTag = self packageName
		  ifTrue: [ 'Model' ]
		  ifFalse: [ targetTag ]
]

{ #category : 'generating' }
OPUMLProfileGenerator >> xmiString [

	^ OPUMLXMIWriter toString: self sourceModel
]
