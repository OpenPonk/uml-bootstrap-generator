Class {
	#name : #OPUMLBootstrapObject,
	#superclass : #Object,
	#instVars : [
		'sharedGeneralizations',
		'generalizations'
	],
	#category : 'OP-UML-Bootstrap-Super'
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

{ #category : #'GTInspector - extensions' }
OPUMLBootstrapObject >> gtInspectorAllPropertiesIn: aComposite [
	<gtInspectorPresentationOrder: 6>
	aComposite fastTable
		title: 'Properties (All)';
		display: [ ((self class methods sorted: [ :a :b | a selector < b selector ])
				select: [ :each | each protocol beginsWith: 'accessing' ])
				select: [ :each | each numArgs = 0 ]
				thenCollect: [ :each | each selector -> (self perform: each selector) ] ];
		column: 'name' evaluated: [ :each | each key ];
		column: 'value' evaluated: [ :each | each value ];
		send: [ :selection | 
			selection isNil
				ifTrue: [ nil ]
				ifFalse: [ selection value ] ]
]

{ #category : #'GTInspector - extensions' }
OPUMLBootstrapObject >> gtInspectorPropertiesIn: aComposite [
	<gtInspectorPresentationOrder: 5>
	aComposite fastTable
		title: 'Properties';
		display: [ (((self class methods sorted: [ :a :b | a selector < b selector ])
				select: [ :each | each protocol beginsWith: 'accessing' ])
				select: [ :each | each numArgs = 0 ]
				thenCollect: [ :each | each selector -> (self perform: each selector) ])
				select: [ :pair | pair value isNotNil ] ];
		column: 'name' evaluated: [ :each | each key ];
		column: 'value' evaluated: [ :each | each value ];
		send: [ :selection | 
			selection isNil
				ifTrue: [ nil ]
				ifFalse: [ selection value ] ]
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
