Class {
	#name : 'BootUMLGeneralization',
	#superclass : 'OPUMLBootstrapObject',
	#instVars : [
		'general',
		'isSubstitutable',
		'generalizationSet',
		'specific'
	],
	#category : 'OP-UML-Bootstrap-Classification',
	#package : 'OP-UML-Bootstrap',
	#tag : 'Classification'
}

{ #category : 'accessing - Element' }
BootUMLGeneralization >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : 'accessing - Element' }
BootUMLGeneralization >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : 'accessing - Element' }
BootUMLGeneralization >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : 'accessing - Element' }
BootUMLGeneralization >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : 'accessing - Element' }
BootUMLGeneralization >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : 'accessing - Element' }
BootUMLGeneralization >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : 'accessing' }
BootUMLGeneralization >> general [
	^ general
]

{ #category : 'accessing' }
BootUMLGeneralization >> general: aClassifier [
	general := aClassifier
]

{ #category : 'accessing' }
BootUMLGeneralization >> generalizationSet [
	^ generalizationSet
]

{ #category : 'accessing' }
BootUMLGeneralization >> generalizationSet: aGeneralizationSet [
	generalizationSet := aGeneralizationSet
]

{ #category : 'initialization' }
BootUMLGeneralization >> initialize [
	super initialize.
	sharedGeneralizations at: #Element put: (BootUMLElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Relationship put: (BootUMLRelationship newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #DirectedRelationship put: (BootUMLDirectedRelationship newOnShared: sharedGeneralizations).
	self initializeGeneralizations.

]

{ #category : 'initialization' }
BootUMLGeneralization >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #DirectedRelationship.
	}

]

{ #category : 'accessing' }
BootUMLGeneralization >> isSubstitutable [
	^ isSubstitutable
]

{ #category : 'accessing' }
BootUMLGeneralization >> isSubstitutable: aBoolean [
	isSubstitutable := aBoolean
]

{ #category : 'accessing - Element' }
BootUMLGeneralization >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : 'accessing - Element' }
BootUMLGeneralization >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : 'accessing - Element' }
BootUMLGeneralization >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : 'accessing - Element' }
BootUMLGeneralization >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : 'accessing - Element' }
BootUMLGeneralization >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : 'accessing - Element' }
BootUMLGeneralization >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : 'accessing - Relationship' }
BootUMLGeneralization >> relatedElement [
	^ (sharedGeneralizations at: #Relationship) relatedElement
]

{ #category : 'accessing - Relationship' }
BootUMLGeneralization >> relatedElement: anElement [
	(sharedGeneralizations at: #Relationship) relatedElement: anElement
]

{ #category : 'accessing - Element' }
BootUMLGeneralization >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : 'accessing - Element' }
BootUMLGeneralization >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]

{ #category : 'accessing - DirectedRelationship' }
BootUMLGeneralization >> source [
	^ (sharedGeneralizations at: #DirectedRelationship) source
]

{ #category : 'accessing - DirectedRelationship' }
BootUMLGeneralization >> source: anElement [
	(sharedGeneralizations at: #DirectedRelationship) source: anElement
]

{ #category : 'accessing' }
BootUMLGeneralization >> specific [
	^ specific
]

{ #category : 'accessing' }
BootUMLGeneralization >> specific: aClassifier [
	specific := aClassifier
]

{ #category : 'accessing - DirectedRelationship' }
BootUMLGeneralization >> target [
	^ (sharedGeneralizations at: #DirectedRelationship) target
]

{ #category : 'accessing - DirectedRelationship' }
BootUMLGeneralization >> target: anElement [
	(sharedGeneralizations at: #DirectedRelationship) target: anElement
]
