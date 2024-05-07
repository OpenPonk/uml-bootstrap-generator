Class {
	#name : 'OPUMLMetaGenMultiplicityElementTemplate',
	#superclass : 'OPUMLMetaGenTemplate',
	#instVars : [
		'value',
		'lowerValue',
		'upperValue'
	],
	#category : 'OP-UML-BootstrapGenerator-Templates',
	#package : 'OP-UML-BootstrapGenerator',
	#tag : 'Templates'
}

{ #category : 'implementation' }
OPUMLMetaGenMultiplicityElementTemplate >> isMultivalued [
	^ self upperBound = '*' or: [ self upperBound > 1 ]
]

{ #category : 'implementation' }
OPUMLMetaGenMultiplicityElementTemplate >> lower [
	^ self lowerBound
]

{ #category : 'implementation' }
OPUMLMetaGenMultiplicityElementTemplate >> lowerBound [
	^ (lowerValue isNil or: [ lowerValue integerValue isNil ])
		ifTrue: [ 1 ]
		ifFalse: [ lowerValue integerValue ]
]

{ #category : 'implementation' }
OPUMLMetaGenMultiplicityElementTemplate >> upper [
	^ self upperBound
]

{ #category : 'implementation' }
OPUMLMetaGenMultiplicityElementTemplate >> upperBound [
	^ (upperValue isNil or: [ upperValue unlimitedValue isNil ])
		ifTrue: [ 1 ]
		ifFalse: [ upperValue unlimitedValue ]
]
