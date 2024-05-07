"
I am a template implementation for UML Element handling things like multiple inheritance and whatnot.
"
Class {
	#name : 'OPUMLMetamodelElementTemplate',
	#superclass : 'Object',
	#instVars : [
		'sharedGeneralizations',
		'directGeneralizations',
		'announcer',
		'uuid',
		'tags'
	],
	#category : 'OP-UML-BootstrapGenerator-Metamodel-Generator',
	#package : 'OP-UML-BootstrapGenerator',
	#tag : 'Metamodel-Generator'
}

{ #category : 'instance creation' }
OPUMLMetamodelElementTemplate class >> newOnShared: aDictionary [
	^ self basicNew
		initializeWithShared: aDictionary;
		yourself
]

{ #category : 'accessing' }
OPUMLMetamodelElementTemplate >> announcer [
	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : 'accessing' }
OPUMLMetamodelElementTemplate >> announcer: anAnnouncer [
	announcer := anAnnouncer
]

{ #category : 'accessing - stereotypes' }
OPUMLMetamodelElementTemplate >> appliedStereotypes [
	^ self tags at: #appliedStereotypes ifAbsentPut: [ OrderedCollection new ]
]

{ #category : 'accessing - stereotypes' }
OPUMLMetamodelElementTemplate >> applyStereotype: aStereotype [

	(self appliedStereotypes anySatisfy: [ :any | 
		 any oclIsTypeOf: aStereotype umlClassName ]) ifTrue: [ ^ self ].
	self appliedStereotypes add: aStereotype.
	self
		perform: ('extension_' , aStereotype umlClassName , ':') asSymbol
		with: aStereotype
]

{ #category : 'accessing - tags' }
OPUMLMetamodelElementTemplate >> hasTagAt: aKey [
	^ tags includesKey: aKey
]

{ #category : 'accessing' }
OPUMLMetamodelElementTemplate >> identity [
	^ sharedGeneralizations values last
]

{ #category : 'initialization' }
OPUMLMetamodelElementTemplate >> initialize [
	super initialize.
	sharedGeneralizations := OrderedDictionary new.
	tags := OrderedDictionary new.
	self initializeSharedGeneralizations.
	self initializeDirectGeneralizations
]

{ #category : 'initialization' }
OPUMLMetamodelElementTemplate >> initializeDirectGeneralizations [
	^ self subclassResponsibility
]

{ #category : 'initialization' }
OPUMLMetamodelElementTemplate >> initializeSharedGeneralizations [
	^ self subclassResponsibility
]

{ #category : 'initialization' }
OPUMLMetamodelElementTemplate >> initializeWithShared: aDictionary [
	super initialize.
	sharedGeneralizations := aDictionary.
	self initializeDirectGeneralizations
]

{ #category : 'GTInspector - extensions' }
OPUMLMetamodelElementTemplate >> inspectionAllProperties [

	<inspectorPresentationOrder: 6 title: 'Properties (All)'>
	^ SpTablePresenter new
		  beResizable;
		  items: (self inspectorProperties sorted collect: [ :e |
					   StInspectorAssociationNode hostObject: e ]);
		  addColumn: (SpStringTableColumn new
				   title: 'Name';
				   evaluated: #key;
				   yourself);
		  addColumn: (SpStringTableColumn new
				   title: 'Value';
				   evaluated: #value;
				   yourself);
		  yourself
]

{ #category : 'GTInspector - extensions' }
OPUMLMetamodelElementTemplate >> inspectionProperties [

	<inspectorPresentationOrder: 5 title: 'Properties'>
	^ SpTablePresenter new
		  beResizable;
		  items: (self nonEmptyinspectorProperties sorted collect: [ :e |
					   StInspectorAssociationNode hostObject: e ]);
		  addColumn: (SpStringTableColumn new
				   title: 'Name';
				   evaluated: #key;
				   yourself);
		  addColumn: (SpStringTableColumn new
				   title: 'Value';
				   evaluated: #value;
				   yourself);
		  yourself
]

{ #category : 'GTInspector - extensions' }
OPUMLMetamodelElementTemplate >> inspectionStereotypes [

	<inspectorPresentationOrder: 7 title: 'Stereotypes'>
	^ SpListPresenter new
		  items: (self appliedStereotypes sorted: [ :a :b |
					   a umlClassName < b umlClassName ]);
		  yourself
]

{ #category : 'GTInspector - extensions' }
OPUMLMetamodelElementTemplate >> inspectionTags [

	<inspectorPresentationOrder: 7 title: 'Tags'>
	^ SpTablePresenter new
		  beResizable;
		  items: (self tags associations sorted collect: [ :e |
					   StInspectorAssociationNode hostObject: e ]);
		  addColumn: (SpStringTableColumn new
				   title: 'Name';
				   evaluated: #key;
				   yourself);
		  addColumn: (SpStringTableColumn new
				   title: 'Value';
				   evaluated: #value;
				   yourself);
		  yourself
]

{ #category : 'GTInspector - extensions' }
OPUMLMetamodelElementTemplate >> inspectorProperties [
	^ self inspectorPropertiesSelectors collect: [ :each | each -> (self perform: each) ]
]

{ #category : 'GTInspector - extensions' }
OPUMLMetamodelElementTemplate >> inspectorPropertiesSelectors [
	| classes class |
	classes := Set new.
	class := self class.
	[ class superclass name = 'Object' ]
		whileFalse: [ classes add: class.
			class := class superclass ].
	^ ((((classes flatCollect: #methods) select: [ :each | each numArgs = 0 ])
		select: [ :each | each protocolName beginsWith: 'accessing' ]) collect: #selector) sorted
]

{ #category : 'GTInspector - extensions' }
OPUMLMetamodelElementTemplate >> nonEmptyinspectorProperties [
	^ self inspectorProperties
		reject: [ :pair | pair value isNil or: [ pair value isCollection and: [ pair value isEmpty ] ] ]
]

{ #category : 'ocl-experimental' }
OPUMLMetamodelElementTemplate >> oclAsType: aClassifier [
	^ sharedGeneralizations at: (self oclClassifierNameFrom: aClassifier)
]

{ #category : 'ocl-experimental' }
OPUMLMetamodelElementTemplate >> oclClassifierNameFrom: anObject [
	(anObject isKindOf: OPUMLMetaElement class)
		ifTrue: [ ^ anObject name withoutPrefix: 'OPUML' ].
	(anObject isKindOf: OPUMLMetaElement)
		ifTrue: [ ^ anObject name ].
	anObject isString
		ifTrue: [ ^ anObject ].
	self error: 'Unknown classifier ' , anObject asString
]

{ #category : 'ocl-experimental' }
OPUMLMetamodelElementTemplate >> oclIsKindOf: aClassifier [
	"Element is not part of the shared generalization, so extra check is needed."
	aClassifier = #Element
		ifTrue: [ ^ true ].
	^ sharedGeneralizations includesKey: (self oclClassifierNameFrom: aClassifier)
]

{ #category : 'ocl-experimental' }
OPUMLMetamodelElementTemplate >> oclIsTypeOf: aClassifier [

	^ sharedGeneralizations keys last = (self oclClassifierNameFrom: aClassifier)
]

{ #category : 'printing' }
OPUMLMetamodelElementTemplate >> printOn: aStream [
	super printOn: aStream.
	(self class selectors includes: #name)
		ifTrue: [ aStream
				<< '(';
				<< self name printString;
				<< ')' ]
]

{ #category : 'accessing - tags' }
OPUMLMetamodelElementTemplate >> removeTagAt: aKey [
	tags removeKey: aKey
]

{ #category : 'accessing - tags' }
OPUMLMetamodelElementTemplate >> tagAt: aKey [
	^ tags at: aKey
]

{ #category : 'accessing - tags' }
OPUMLMetamodelElementTemplate >> tagAt: aKey put: aValue [
	tags at: aKey put: aValue
]

{ #category : 'accessing - tags' }
OPUMLMetamodelElementTemplate >> tags [
	^ tags
]

{ #category : 'accessing' }
OPUMLMetamodelElementTemplate >> umlClassName [
	^ self className withoutPrefix: 'OPUML'
]

{ #category : 'accessing' }
OPUMLMetamodelElementTemplate >> umlMetaClass [
	^ OPUMLXMISpecsStorage metaClassFor: self
]

{ #category : 'accessing - stereotypes' }
OPUMLMetamodelElementTemplate >> unapplyStereotype: aStereotype [
	self appliedStereotypes remove: aStereotype ifAbsent: [  ].
	self perform: ('extension_' , aStereotype umlClassName , ':') asSymbol with: nil
]

{ #category : 'accessing' }
OPUMLMetamodelElementTemplate >> uuid [
	^ uuid ifNil: [ uuid := UUID new ]
]

{ #category : 'accessing' }
OPUMLMetamodelElementTemplate >> uuid: aUUID [
	uuid := aUUID
]
