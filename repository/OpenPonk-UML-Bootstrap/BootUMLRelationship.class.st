Class {
	#name : 'BootUMLRelationship',
	#superclass : 'OPUMLBootstrapObject',
	#instVars : [
		'relatedElement'
	],
	#category : 'OpenPonk-UML-Bootstrap-CommonStructure',
	#package : 'OpenPonk-UML-Bootstrap',
	#tag : 'CommonStructure'
}

{ #category : 'accessing - Element' }
BootUMLRelationship >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : 'accessing - Element' }
BootUMLRelationship >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : 'accessing - Element' }
BootUMLRelationship >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : 'accessing - Element' }
BootUMLRelationship >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : 'accessing - Element' }
BootUMLRelationship >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : 'accessing - Element' }
BootUMLRelationship >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : 'initialization' }
BootUMLRelationship >> initialize [
	super initialize.
	sharedGeneralizations at: #Element put: (BootUMLElement newOnShared: sharedGeneralizations).
	self initializeGeneralizations.

]

{ #category : 'initialization' }
BootUMLRelationship >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #Element.
	}

]

{ #category : 'accessing - Element' }
BootUMLRelationship >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : 'accessing - Element' }
BootUMLRelationship >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : 'accessing - Element' }
BootUMLRelationship >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : 'accessing - Element' }
BootUMLRelationship >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : 'accessing - Element' }
BootUMLRelationship >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : 'accessing - Element' }
BootUMLRelationship >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : 'accessing' }
BootUMLRelationship >> relatedElement [
	^ relatedElement
]

{ #category : 'accessing' }
BootUMLRelationship >> relatedElement: anElement [
	relatedElement := anElement
]

{ #category : 'accessing - Element' }
BootUMLRelationship >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : 'accessing - Element' }
BootUMLRelationship >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]
