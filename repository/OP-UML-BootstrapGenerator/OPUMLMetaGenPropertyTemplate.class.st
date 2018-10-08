Class {
	#name : #OPUMLMetaGenPropertyTemplate,
	#superclass : #OPUMLMetaGenTemplate,
	#instVars : [
		'owningClass',
		'association'
	],
	#category : 'OP-UML-BootstrapGenerator-Templates'
}

{ #category : #implementation }
OPUMLMetaGenPropertyTemplate >> isComposite [
	^ self aggregation = '%AggregationKind%' composite
]

{ #category : #implementation }
OPUMLMetaGenPropertyTemplate >> isNavigable [
	^ owningClass isNotNil or: [ association navigableOwnedEnds includes: self ]
]

{ #category : #implementation }
OPUMLMetaGenPropertyTemplate >> opposite [
	^ (association isNotNil and: [ association memberEnds size = 2 ])
		ifTrue: [ association memberEnds detect: [ :each | (each = self) not ] ]
]
