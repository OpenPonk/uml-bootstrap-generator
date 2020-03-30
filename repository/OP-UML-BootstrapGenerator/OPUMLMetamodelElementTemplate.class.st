"
I am a template implementation for UML Element handling things like multiple inheritance and whatnot.
"
Class {
	#name : #OPUMLMetamodelElementTemplate,
	#superclass : #Object,
	#instVars : [
		'sharedGeneralizations',
		'directGeneralizations',
		'announcer',
		'uuid',
		'tags'
	],
	#category : 'OP-UML-BootstrapGenerator-Metamodel-Generator'
}

{ #category : #'instance creation' }
OPUMLMetamodelElementTemplate class >> newOnShared: aDictionary [
	^ self basicNew
		initializeWithShared: aDictionary;
		yourself
]

{ #category : #accessing }
OPUMLMetamodelElementTemplate >> announcer [
	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #accessing }
OPUMLMetamodelElementTemplate >> announcer: anAnnouncer [
	announcer := anAnnouncer
]

{ #category : #'accessing - stereotypes' }
OPUMLMetamodelElementTemplate >> appliedStereotypes [
	^ self tags at: #appliedStereotypes ifAbsentPut: [ OrderedCollection new ]
]

{ #category : #'accessing - stereotypes' }
OPUMLMetamodelElementTemplate >> applyStereotype: aStereotype [
	self appliedStereotypes addIfNotPresent: aStereotype.
	self perform: ('extension_' , aStereotype umlClassName , ':') asSymbol with: aStereotype
]

{ #category : #'GTInspector - extensions' }
OPUMLMetamodelElementTemplate >> gtInspectorAllPropertiesIn: aComposite [
	<gtInspectorPresentationOrder: 6>
	aComposite fastTable
		title: 'Properties (All)';
		display: [ self inspectorProperties ];
		column: 'name' evaluated: [ :each | each key ];
		column: 'value' evaluated: [ :each | each value ];
		send: [ :selection | 
			selection isNil
				ifTrue: [ nil ]
				ifFalse: [ selection value ] ]
]

{ #category : #'GTInspector - extensions' }
OPUMLMetamodelElementTemplate >> gtInspectorPropertiesIn: aComposite [
	<gtInspectorPresentationOrder: 5>
	aComposite fastTable
		title: 'Properties';
		display: [ self nonEmptyinspectorProperties ];
		column: 'name' evaluated: [ :each | each key ];
		column: 'value' evaluated: [ :each | each value ];
		send: [ :selection | 
			selection isNil
				ifTrue: [ nil ]
				ifFalse: [ selection value ] ]
]

{ #category : #'GTInspector - extensions' }
OPUMLMetamodelElementTemplate >> gtInspectorStereotypePropertiesIn: aComposite [
	<gtInspectorPresentationOrder: 7>
	aComposite fastTable
		title: 'Tagged Values';
		display: [ self stereotypeProperties ];
		column: 'name' evaluated: [ :each | each first ] width: 120;
		column: 'stereotype' evaluated: [ :each | each second ] width: 120;
		column: 'value' evaluated: [ :each | each third ];
		send: [ :selection | 
			selection isNil
				ifTrue: [ nil ]
				ifFalse: [ selection value ] ]
]

{ #category : #'GTInspector - extensions' }
OPUMLMetamodelElementTemplate >> gtInspectorStereotypesIn: aComposite [
	<gtInspectorPresentationOrder: 6>
	^ aComposite fastList
		title: 'Stereotypes';
		display: [ self appliedStereotypes ]
]

{ #category : #'GTInspector - extensions' }
OPUMLMetamodelElementTemplate >> gtInspectorTagsIn: aComposite [
	<gtInspectorPresentationOrder: 7>
	aComposite fastTable
		title: 'Tags';
		display: [ self tags ]
]

{ #category : #'accessing - tags' }
OPUMLMetamodelElementTemplate >> hasTagAt: aKey [
	^ tags includesKey: aKey
]

{ #category : #accessing }
OPUMLMetamodelElementTemplate >> identity [
	^ sharedGeneralizations values last
]

{ #category : #initialization }
OPUMLMetamodelElementTemplate >> initialize [
	super initialize.
	sharedGeneralizations := OrderedDictionary new.
	tags := OrderedDictionary new.
	self initializeSharedGeneralizations.
	self initializeDirectGeneralizations
]

{ #category : #initialization }
OPUMLMetamodelElementTemplate >> initializeDirectGeneralizations [
	^ self subclassResponsibility
]

{ #category : #initialization }
OPUMLMetamodelElementTemplate >> initializeSharedGeneralizations [
	^ self subclassResponsibility
]

{ #category : #initialization }
OPUMLMetamodelElementTemplate >> initializeWithShared: aDictionary [
	super initialize.
	sharedGeneralizations := aDictionary.
	self initializeDirectGeneralizations
]

{ #category : #'GTInspector - extensions' }
OPUMLMetamodelElementTemplate >> inspectorProperties [
	^ self inspectorPropertiesSelectors collect: [ :each | each -> (self perform: each) ]
]

{ #category : #'GTInspector - extensions' }
OPUMLMetamodelElementTemplate >> inspectorPropertiesSelectors [
	| classes class |
	classes := Set new.
	class := self class.
	[ class superclass name = 'Object' ]
		whileFalse: [ classes add: class.
			class := class superclass ].
	^ ((((classes flatCollect: #methods) select: [ :each | each numArgs = 0 ])
		select: [ :each | each protocol beginsWith: 'accessing' ]) collect: #selector) sorted
]

{ #category : #'GTInspector - extensions' }
OPUMLMetamodelElementTemplate >> nonEmptyinspectorProperties [
	^ self inspectorProperties
		reject: [ :pair | pair value isNil or: [ pair value isCollection and: [ pair value isEmpty ] ] ]
]

{ #category : #'ocl-experimental' }
OPUMLMetamodelElementTemplate >> oclAsType: aClassifier [
	^ sharedGeneralizations at: (self oclClassifierNameFrom: aClassifier)
]

{ #category : #'ocl-experimental' }
OPUMLMetamodelElementTemplate >> oclClassifierNameFrom: anObject [
	(anObject isKindOf: OPUMLMetaElement class)
		ifTrue: [ ^ anObject name withoutPrefix: 'OPUML' ].
	(anObject isKindOf: OPUMLMetaElement)
		ifTrue: [ ^ anObject name ].
	anObject isString
		ifTrue: [ ^ anObject ].
	self error: 'Unknown classifier ' , anObject asString
]

{ #category : #'ocl-experimental' }
OPUMLMetamodelElementTemplate >> oclIsKindOf: aClassifier [
	"Element is not part of the shared generalization, so extra check is needed."
	aClassifier = #Element
		ifTrue: [ ^ true ].
	^ sharedGeneralizations includesKey: (self oclClassifierNameFrom: aClassifier)
]

{ #category : #'ocl-experimental' }
OPUMLMetamodelElementTemplate >> oclIsTypeOf: aClassifier [
	"Element is not part of the shared generalization, so extra check is needed."
	aClassifier = #Element
		ifTrue: [ ^ true ].
	^ sharedGeneralizations keys last = (self oclClassifierNameFrom: aClassifier)
]

{ #category : #printing }
OPUMLMetamodelElementTemplate >> printOn: aStream [
	super printOn: aStream.
	(self class selectors includes: #name)
		ifTrue: [ aStream
				<< '(';
				<< self name printString;
				<< ')' ]
]

{ #category : #'accessing - tags' }
OPUMLMetamodelElementTemplate >> removeTagAt: aKey [
	tags removeKey: aKey
]

{ #category : #'accessing - tags' }
OPUMLMetamodelElementTemplate >> tagAt: aKey [
	^ tags at: aKey
]

{ #category : #'accessing - tags' }
OPUMLMetamodelElementTemplate >> tagAt: aKey put: aValue [
	tags at: aKey put: aValue
]

{ #category : #'accessing - tags' }
OPUMLMetamodelElementTemplate >> tags [
	^ tags
]

{ #category : #accessing }
OPUMLMetamodelElementTemplate >> umlClassName [
	^ self className withoutPrefix: 'OPUML'
]

{ #category : #accessing }
OPUMLMetamodelElementTemplate >> umlMetaClass [
	^ OPUMLXMISpecsStorage metaClassFor: self
]

{ #category : #'accessing - stereotypes' }
OPUMLMetamodelElementTemplate >> unapplyStereotype: aStereotype [
	self appliedStereotypes remove: aStereotype ifAbsent: [  ].
	self perform: ('extension_' , aStereotype umlClassName , ':') asSymbol with: nil
]

{ #category : #accessing }
OPUMLMetamodelElementTemplate >> uuid [
	^ uuid ifNil: [ uuid := UUID new ]
]

{ #category : #accessing }
OPUMLMetamodelElementTemplate >> uuid: aUUID [
	uuid := aUUID
]
