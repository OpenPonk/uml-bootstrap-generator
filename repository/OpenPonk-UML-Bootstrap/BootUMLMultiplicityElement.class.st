Class {
	#name : 'BootUMLMultiplicityElement',
	#superclass : 'OPUMLBootstrapObject',
	#instVars : [
		'upper',
		'isOrdered',
		'upperValue',
		'isUnique',
		'lowerValue',
		'lower'
	],
	#category : 'OpenPonk-UML-Bootstrap-CommonStructure',
	#package : 'OpenPonk-UML-Bootstrap',
	#tag : 'CommonStructure'
}

{ #category : 'accessing - Element' }
BootUMLMultiplicityElement >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : 'accessing - Element' }
BootUMLMultiplicityElement >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : 'accessing - Element' }
BootUMLMultiplicityElement >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : 'accessing - Element' }
BootUMLMultiplicityElement >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : 'accessing - Element' }
BootUMLMultiplicityElement >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : 'accessing - Element' }
BootUMLMultiplicityElement >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : 'initialization' }
BootUMLMultiplicityElement >> initialize [
	super initialize.
	sharedGeneralizations at: #Element put: (BootUMLElement newOnShared: sharedGeneralizations).
	self initializeGeneralizations.

]

{ #category : 'initialization' }
BootUMLMultiplicityElement >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #Element.
	}

]

{ #category : 'accessing' }
BootUMLMultiplicityElement >> isOrdered [
	^ isOrdered
]

{ #category : 'accessing' }
BootUMLMultiplicityElement >> isOrdered: aBoolean [
	isOrdered := aBoolean
]

{ #category : 'accessing' }
BootUMLMultiplicityElement >> isUnique [
	^ isUnique
]

{ #category : 'accessing' }
BootUMLMultiplicityElement >> isUnique: aBoolean [
	isUnique := aBoolean
]

{ #category : 'accessing' }
BootUMLMultiplicityElement >> lower [
	^ lower
]

{ #category : 'accessing' }
BootUMLMultiplicityElement >> lower: anInteger [
	lower := anInteger
]

{ #category : 'accessing' }
BootUMLMultiplicityElement >> lowerValue [
	^ lowerValue
]

{ #category : 'accessing' }
BootUMLMultiplicityElement >> lowerValue: aValueSpecification [
	lowerValue := aValueSpecification
]

{ #category : 'accessing - Element' }
BootUMLMultiplicityElement >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : 'accessing - Element' }
BootUMLMultiplicityElement >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : 'accessing - Element' }
BootUMLMultiplicityElement >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : 'accessing - Element' }
BootUMLMultiplicityElement >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : 'accessing - Element' }
BootUMLMultiplicityElement >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : 'accessing - Element' }
BootUMLMultiplicityElement >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : 'accessing - Element' }
BootUMLMultiplicityElement >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : 'accessing - Element' }
BootUMLMultiplicityElement >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]

{ #category : 'accessing' }
BootUMLMultiplicityElement >> upper [
	^ upper
]

{ #category : 'accessing' }
BootUMLMultiplicityElement >> upper: anUnlimitedNatural [
	upper := anUnlimitedNatural
]

{ #category : 'accessing' }
BootUMLMultiplicityElement >> upperValue [
	^ upperValue
]

{ #category : 'accessing' }
BootUMLMultiplicityElement >> upperValue: aValueSpecification [
	upperValue := aValueSpecification
]
