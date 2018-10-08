Class {
	#name : #BootUMLComment,
	#superclass : #OPUMLBootstrapObject,
	#instVars : [
		'owningElement',
		'body',
		'annotatedElement'
	],
	#category : 'OP-UML-Bootstrap-CommonStructure'
}

{ #category : #accessing }
BootUMLComment >> annotatedElement [
	^ annotatedElement
]

{ #category : #accessing }
BootUMLComment >> annotatedElement: anElement [
	annotatedElement := anElement
]

{ #category : #accessing }
BootUMLComment >> body [
	^ body
]

{ #category : #accessing }
BootUMLComment >> body: aString [
	body := aString
]

{ #category : #'accessing - Element' }
BootUMLComment >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : #'accessing - Element' }
BootUMLComment >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : #'accessing - Element' }
BootUMLComment >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : #'accessing - Element' }
BootUMLComment >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : #'accessing - Element' }
BootUMLComment >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : #'accessing - Element' }
BootUMLComment >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : #initialization }
BootUMLComment >> initialize [
	super initialize.
	sharedGeneralizations at: #Element put: (BootUMLElement newOnShared: sharedGeneralizations).
	self initializeGeneralizations.

]

{ #category : #initialization }
BootUMLComment >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #Element.
	}

]

{ #category : #'accessing - Element' }
BootUMLComment >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : #'accessing - Element' }
BootUMLComment >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : #'accessing - Element' }
BootUMLComment >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : #'accessing - Element' }
BootUMLComment >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : #'accessing - Element' }
BootUMLComment >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : #'accessing - Element' }
BootUMLComment >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : #accessing }
BootUMLComment >> owningElement [
	^ owningElement
]

{ #category : #accessing }
BootUMLComment >> owningElement: anElement [
	owningElement := anElement
]

{ #category : #'accessing - Element' }
BootUMLComment >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : #'accessing - Element' }
BootUMLComment >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]
