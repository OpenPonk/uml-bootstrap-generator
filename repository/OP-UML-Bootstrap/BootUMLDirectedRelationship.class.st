Class {
	#name : 'BootUMLDirectedRelationship',
	#superclass : 'OPUMLBootstrapObject',
	#instVars : [
		'source',
		'target'
	],
	#category : 'OP-UML-Bootstrap-CommonStructure',
	#package : 'OP-UML-Bootstrap',
	#tag : 'CommonStructure'
}

{ #category : 'accessing - Element' }
BootUMLDirectedRelationship >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : 'accessing - Element' }
BootUMLDirectedRelationship >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : 'accessing - Element' }
BootUMLDirectedRelationship >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : 'accessing - Element' }
BootUMLDirectedRelationship >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : 'accessing - Element' }
BootUMLDirectedRelationship >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : 'accessing - Element' }
BootUMLDirectedRelationship >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : 'initialization' }
BootUMLDirectedRelationship >> initialize [
	super initialize.
	sharedGeneralizations at: #Element put: (BootUMLElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Relationship put: (BootUMLRelationship newOnShared: sharedGeneralizations).
	self initializeGeneralizations.

]

{ #category : 'initialization' }
BootUMLDirectedRelationship >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #Relationship.
	}

]

{ #category : 'accessing - Element' }
BootUMLDirectedRelationship >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : 'accessing - Element' }
BootUMLDirectedRelationship >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : 'accessing - Element' }
BootUMLDirectedRelationship >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : 'accessing - Element' }
BootUMLDirectedRelationship >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : 'accessing - Element' }
BootUMLDirectedRelationship >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : 'accessing - Element' }
BootUMLDirectedRelationship >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : 'accessing - Relationship' }
BootUMLDirectedRelationship >> relatedElement [
	^ (sharedGeneralizations at: #Relationship) relatedElement
]

{ #category : 'accessing - Relationship' }
BootUMLDirectedRelationship >> relatedElement: anElement [
	(sharedGeneralizations at: #Relationship) relatedElement: anElement
]

{ #category : 'accessing - Element' }
BootUMLDirectedRelationship >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : 'accessing - Element' }
BootUMLDirectedRelationship >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]

{ #category : 'accessing' }
BootUMLDirectedRelationship >> source [
	^ source
]

{ #category : 'accessing' }
BootUMLDirectedRelationship >> source: anElement [
	source := anElement
]

{ #category : 'accessing' }
BootUMLDirectedRelationship >> target [
	^ target
]

{ #category : 'accessing' }
BootUMLDirectedRelationship >> target: anElement [
	target := anElement
]
