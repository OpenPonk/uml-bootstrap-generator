"
I provide custom Pharo template methods (handling navigability checks, opposite end resolution, and composite constraints) that are injected into generated UML Property instances.
"
Class {
	#name : 'OPUMLMetaGenPropertyTemplate',
	#superclass : 'OPUMLMetaGenTemplate',
	#instVars : [
		'owningClass',
		'association'
	],
	#category : 'OpenPonk-UML-BootstrapGenerator-Templates',
	#package : 'OpenPonk-UML-BootstrapGenerator',
	#tag : 'Templates'
}

{ #category : 'implementation' }
OPUMLMetaGenPropertyTemplate >> isComposite [
	^ self aggregation = '%AggregationKind%' composite
]

{ #category : 'implementation' }
OPUMLMetaGenPropertyTemplate >> isNavigable [
	^ owningClass isNotNil or: [ association navigableOwnedEnds includes: self ]
]

{ #category : 'implementation' }
OPUMLMetaGenPropertyTemplate >> opposite [

	^ (association isNotNil and: [ association memberEnds size = 2 ])
		  ifTrue: [ association memberEnds detect: [ :each | each ~= self ] ]
]
