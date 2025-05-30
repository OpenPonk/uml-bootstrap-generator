Class {
	#name : 'OPUMLBootstrapObject',
	#superclass : 'Object',
	#instVars : [
		'sharedGeneralizations',
		'generalizations'
	],
	#category : 'OpenPonk-UML-Bootstrap-Super',
	#package : 'OpenPonk-UML-Bootstrap',
	#tag : 'Super'
}

{ #category : 'instance creation' }
OPUMLBootstrapObject class >> newOnShared: aDictionary [
	^ self basicNew
		initializeWithShared: aDictionary;
		yourself
]

{ #category : 'accessing' }
OPUMLBootstrapObject >> generalizations [
	^ generalizations
]

{ #category : 'accessing' }
OPUMLBootstrapObject >> generalizations: anObject [
	generalizations := anObject
]

{ #category : 'initialization' }
OPUMLBootstrapObject >> initialize [
	super initialize.
	sharedGeneralizations := Dictionary new
]

{ #category : 'initialization' }
OPUMLBootstrapObject >> initializeGeneralizations [
	generalizations := {}
]

{ #category : 'initialization' }
OPUMLBootstrapObject >> initializeWithShared: aDictionary [
	super initialize.
	sharedGeneralizations := aDictionary.
	self initializeGeneralizations
]

{ #category : 'inspecting' }
OPUMLBootstrapObject >> inspectionAllProperties: aBuilder [

	<inspectorPresentationOrder: 6 title: 'Properties (All)'>
	^ aBuilder newTable
		  beResizable;
		  items:
			  ((self class methods sorted: [ :a :b | a selector < b selector ])
				   select: [ :each |
					   (each protocolName beginsWith: 'accessing') and: [
							   each numArgs = 0 ] ]
				   thenCollect: [ :each |
						   StInspectorAssociationNode hostObject:
								   each selector -> (self perform: each selector) ]);
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
OPUMLBootstrapObject >> inspectionProperties: aBuilder [

	<inspectorPresentationOrder: 5 title: 'Properties'>
	^ aBuilder newTable
		  beResizable;
		  items:
			  (((self class methods sorted: [ :a :b | a selector < b selector ])
				    select: [ :each |
					    (each protocolName beginsWith: 'accessing') and: [
							    each numArgs = 0 ] ]
				    thenCollect: [ :each |
					    each selector -> (self perform: each selector) ])
				   select: [ :pair | pair value isNotNil ]
				   thenCollect: [ :e | StInspectorAssociationNode hostObject: e ]);
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

{ #category : 'testing' }
OPUMLBootstrapObject >> isMultivalued [
	((sharedGeneralizations includesKey: 'MultiplicityElement')
		and: [ self class selectors includes: #lowerValue ])
		ifFalse: [ ^ false ].
	self upperValue ifNil: [ ^ false ].
	^ (self upperValue value = '1') not
]

{ #category : 'printing' }
OPUMLBootstrapObject >> printOn: aStream [
	super printOn: aStream.
	(sharedGeneralizations includesKey: 'LiteralSpecification')
		ifTrue: [ aStream
				<< '(';
				<< self value printString;
				<< ')'.
			^ self ].
	(self class selectors includes: #name)
		ifTrue: [ aStream
				<< '(';
				<< self name printString;
				<< ')' ]
]
