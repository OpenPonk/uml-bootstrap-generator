Class {
	#name : #OPUMLBootstrapObject,
	#superclass : #Object,
	#instVars : [
		'sharedGeneralizations',
		'generalizations'
	],
	#category : #'OP-UML-Bootstrap-Super'
}

{ #category : #'instance creation' }
OPUMLBootstrapObject class >> newOnShared: aDictionary [
	^ self basicNew
		initializeWithShared: aDictionary;
		yourself
]

{ #category : #accessing }
OPUMLBootstrapObject >> generalizations [
	^ generalizations
]

{ #category : #accessing }
OPUMLBootstrapObject >> generalizations: anObject [
	generalizations := anObject
]

{ #category : #initialization }
OPUMLBootstrapObject >> initialize [
	super initialize.
	sharedGeneralizations := Dictionary new
]

{ #category : #initialization }
OPUMLBootstrapObject >> initializeGeneralizations [
	generalizations := {}
]

{ #category : #initialization }
OPUMLBootstrapObject >> initializeWithShared: aDictionary [
	super initialize.
	sharedGeneralizations := aDictionary.
	self initializeGeneralizations
]

{ #category : #'GTInspector - extensions' }
OPUMLBootstrapObject >> inspectionAllProperties [

	<inspectorPresentationOrder: 6 title: 'Properties (All)'>
	^ SpTablePresenter new
		  beResizable;
		  items:
			  ((self class methods sorted: [ :a :b | a selector < b selector ])
				   select: [ :each | 
					   (each protocol beginsWith: 'accessing') and: [ 
							   each numArgs = 0 ] ]
				   thenCollect: [ :each | 
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

{ #category : #'GTInspector - extensions' }
OPUMLBootstrapObject >> inspectionProperties [

	<inspectorPresentationOrder: 5 title: 'Properties'>
	^ SpTablePresenter new
		  beResizable;
		  items:
			  (((self class methods sorted: [ :a :b | a selector < b selector ])
				    select: [ :each | 
					    (each protocol beginsWith: 'accessing') and: [ 
							    each numArgs = 0 ] ]
				    thenCollect: [ :each | 
					    each selector -> (self perform: each selector) ]) select: [ 
					   :pair | pair value isNotNil ]);
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

{ #category : #testing }
OPUMLBootstrapObject >> isMultivalued [
	((sharedGeneralizations includesKey: 'MultiplicityElement')
		and: [ self class selectors includes: #lowerValue ])
		ifFalse: [ ^ false ].
	self upperValue ifNil: [ ^ false ].
	^ (self upperValue value = '1') not
]

{ #category : #printing }
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
