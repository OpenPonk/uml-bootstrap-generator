"
I serve as a template defining the core behaviors and properties (such as UUIDs, stereotypes, and OCL-like type querying via `oclIsKindOf:`) that will be injected into every generated UML metamodel element.
"
Class {
	#name : 'OPUMLMetamodelElementTemplate',
	#superclass : 'Object',
	#instVars : [
		'sharedGeneralizations',
		'directGeneralizations',
		'uuid',
		'tags'
	],
	#category : 'OpenPonk-UML-BootstrapGenerator-Metamodel-Generator',
	#package : 'OpenPonk-UML-BootstrapGenerator',
	#tag : 'Metamodel-Generator'
}

{ #category : 'instance creation' }
OPUMLMetamodelElementTemplate class >> newOnShared: aDictionary [
	^ self basicNew
		initializeWithShared: aDictionary;
		yourself
]

{ #category : 'accessing - stereotypes' }
OPUMLMetamodelElementTemplate >> appliedStereotypes [
	^ self tags at: #appliedStereotypes ifAbsentPut: [ OrderedCollection new ]
]

{ #category : 'accessing - stereotypes' }
OPUMLMetamodelElementTemplate >> applyStereotype: aStereotype [

	(self appliedStereotypes anySatisfy: [ :any | any oclIsTypeOf: aStereotype umlClassName ]) ifTrue: [ ^ self ].
	self appliedStereotypes add: aStereotype.
	self setExtensionFor: aStereotype to: aStereotype
]

{ #category : 'printing' }
OPUMLMetamodelElementTemplate >> generateprintAsClassifierNameOn: aStream [

	aStream << (self oclClassifierNameFrom: self class).
	(self respondsTo: #name) ifTrue: [
			aStream
				<< '(';
				<< self name printString;
				<< ')' ]
]

{ #category : 'printing' }
OPUMLMetamodelElementTemplate >> generateprintOn: aStream [

	super printOn: aStream.
	(self respondsTo: #name) ifTrue: [
			aStream
				<< '(';
				<< self name printString;
				<< ')' ]
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

{ #category : 'inspecting' }
OPUMLMetamodelElementTemplate >> inspectionAllProperties: aBuilder [

	<inspectorPresentationOrder: 6 title: 'Properties (All)'>
	^ aBuilder newTable
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

{ #category : 'inspecting' }
OPUMLMetamodelElementTemplate >> inspectionGeneralizations: aBuilder [

	<inspectorPresentationOrder: 8 title: 'Generalizations'>
	^ aBuilder newTable
		  beResizable;
		  items: (sharedGeneralizations associations sorted collect: [ :e |
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

{ #category : 'inspecting' }
OPUMLMetamodelElementTemplate >> inspectionProperties: aBuilder [

	<inspectorPresentationOrder: 5 title: 'Properties'>
	^ aBuilder newTable
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

{ #category : 'inspecting' }
OPUMLMetamodelElementTemplate >> inspectionStereotypeProperties: aBuilder [

	<inspectorPresentationOrder: 7 title: 'Tagged Values'>
	^ aBuilder newTable
		  beResizable;
		  items:
			  (self stereotypeProperties sorted: [ :a :b | a first < b first ]);
		  addColumn: (SpStringTableColumn new
				   title: 'Name';
				   evaluated: #first;
				   yourself);
		  addColumn: (SpStringTableColumn new
				   title: 'Stereotype';
				   evaluated: #second;
				   yourself);
		  addColumn: (SpStringTableColumn new
				   title: 'Value';
				   evaluated: #third;
				   yourself);
		  yourself
]

{ #category : 'inspecting' }
OPUMLMetamodelElementTemplate >> inspectionStereotypes: aBuilder [

	<inspectorPresentationOrder: 7 title: 'Stereotypes'>
	^ aBuilder newList
		  items: (self appliedStereotypes sorted: [ :a :b | 
					   a umlClassName < b umlClassName ]);
		  yourself
]

{ #category : 'inspecting' }
OPUMLMetamodelElementTemplate >> inspectionTags: aBuilder [

	<inspectorPresentationOrder: 7 title: 'Tags'>
	^ aBuilder newTable
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

{ #category : 'inspecting' }
OPUMLMetamodelElementTemplate >> inspectorProperties [
	^ self inspectorPropertiesSelectors collect: [ :each | each -> (self perform: each) ]
]

{ #category : 'inspecting' }
OPUMLMetamodelElementTemplate >> inspectorPropertiesSelectors [

	| classes class |
	classes := Set new.
	class := self class.
	[ class superclass name = 'Object' ] whileFalse: [
			classes add: class.
			class := class superclass ].
	^ ((((classes flatCollect: #methods) select: [ :each |
		     each numArgs = 0 ]) select: [ :each |
		    each protocolName beginsWith: 'accessing' ]) collect: #selector)
		  sorted
]

{ #category : 'accessing' }
OPUMLMetamodelElementTemplate >> metaElementClass [

	^ OPUMLMetamodelElementTemplate
]

{ #category : 'inspecting' }
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

	(anObject isKindOf: self metaElementClass class) ifTrue: [ ^ anObject name withoutPrefix: self umlClassPrefix ].
	(anObject isKindOf: self metaElementClass) ifTrue: [ ^ anObject name ].
	anObject isString ifTrue: [ ^ anObject ].
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

{ #category : 'copying' }
OPUMLMetamodelElementTemplate >> postCopy [

	| originalShared copiedShared |
	super postCopy.
	uuid := nil.
	tags ifNotNil: [
			| originalTags |
			originalTags := tags.
			tags := OrderedDictionary new.
			originalTags keysAndValuesDo: [ :key :value |
				(key = #appliedStereotypes or: [ key asString beginsWith: 'extension_' ]) ifFalse: [ tags at: key put: value ] ] ].
	sharedGeneralizations ifNil: [
			self postCopyResetSliceSlots.
			^ self ].
	originalShared := sharedGeneralizations.
	copiedShared := OrderedDictionary new: originalShared size.
	originalShared keysAndValuesDo: [ :key :slice |
			copiedShared at: key put: (slice class == self class
					 ifTrue: [ self ]
					 ifFalse: [ slice shallowCopy ]) ].
	copiedShared valuesDo: [ :eachSlice | eachSlice postCopySliceWithShared: copiedShared ]
]

{ #category : 'copying' }
OPUMLMetamodelElementTemplate >> postCopyResetSliceSlots [

	| metaSlotNames |
	metaSlotNames := self metaElementClass instVarNames.
	self class allInstVarNames do: [ :slotName |
			(metaSlotNames includes: slotName) ifFalse: [
					| currentValue |
					currentValue := self instVarNamed: slotName.
					currentValue ifNotNil: [ self instVarNamed: slotName put: (self postCopySlotValue: currentValue forSlotNamed: slotName) ] ] ]
]

{ #category : 'copying' }
OPUMLMetamodelElementTemplate >> postCopySliceWithShared: aDictionary [

	sharedGeneralizations := aDictionary.
	self initializeDirectGeneralizations.
	self postCopyResetSliceSlots
]

{ #category : 'copying' }
OPUMLMetamodelElementTemplate >> postCopySlotValue: aValue forSlotNamed: aSlotName [

	aValue class == OrderedCollection ifTrue: [ ^ aValue copy ].
	^ aValue
]

{ #category : 'accessing - tags' }
OPUMLMetamodelElementTemplate >> removeTagAt: aKey [
	tags removeKey: aKey
]

{ #category : 'accessing - stereotypes' }
OPUMLMetamodelElementTemplate >> setExtensionFor: aStereotype to: aValue [

	| meta attribute |
	meta := aStereotype umlMetaClass.
	attribute := (meta allAttributes select: [ :each | each name beginsWith: 'base_' ]) detect: [ :each |
		             self oclIsKindOf: each type name ].
	self perform: (attribute opposite name , ':') asSymbol with: aValue
]

{ #category : 'inspecting' }
OPUMLMetamodelElementTemplate >> stereotypeProperties [
	^ self appliedStereotypes flatCollect: [ :stereo |
		| meta |
		meta := stereo umlMetaClass.
		(meta allAttributes reject: [ :each |
			each name beginsWith: 'base_' ]) collect: [ :each |
				{
					each name.
					meta name.
					(stereo perform: each name asSymbol) } ] ]
]

{ #category : 'accessing - tags' }
OPUMLMetamodelElementTemplate >> tagAt: aKey [
	^ tags at: aKey
]

{ #category : 'accessing - tags' }
OPUMLMetamodelElementTemplate >> tagAt: aKey ifAbsent: anAbsentBlock [

	^ tags at: aKey ifAbsent: anAbsentBlock
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

	^ self className withoutPrefix: self umlClassPrefix
]

{ #category : 'accessing' }
OPUMLMetamodelElementTemplate >> umlClassPrefix [

	^ 'OPUML'
]

{ #category : 'accessing' }
OPUMLMetamodelElementTemplate >> umlMetaClass [
	^ OPUMLXMISpecsStorage metaClassFor: self
]

{ #category : 'accessing - stereotypes' }
OPUMLMetamodelElementTemplate >> unapplyStereotype: aStereotype [

	self appliedStereotypes remove: aStereotype ifAbsent: [ ].
	self setExtensionFor: aStereotype to: nil
]

{ #category : 'accessing' }
OPUMLMetamodelElementTemplate >> uuid [
	^ uuid ifNil: [ uuid := UUID new ]
]

{ #category : 'accessing' }
OPUMLMetamodelElementTemplate >> uuid: aUUID [
	uuid := aUUID
]
