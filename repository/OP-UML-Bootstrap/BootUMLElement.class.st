Class {
	#name : #BootUMLElement,
	#superclass : #OPUMLBootstrapObject,
	#instVars : [
		'relationship',
		'comment',
		'constraint',
		'owner',
		'ownedComment',
		'ownedElement',
		'directedRelationship'
	],
	#category : 'OP-UML-Bootstrap-CommonStructure'
}

{ #category : #accessing }
BootUMLElement >> comment [
	^ comment
]

{ #category : #accessing }
BootUMLElement >> comment: aComment [
	comment := aComment
]

{ #category : #accessing }
BootUMLElement >> constraint [
	^ constraint
]

{ #category : #accessing }
BootUMLElement >> constraint: aConstraint [
	constraint := aConstraint
]

{ #category : #accessing }
BootUMLElement >> directedRelationship [
	^ directedRelationship
]

{ #category : #accessing }
BootUMLElement >> directedRelationship: aDirectedRelationship [
	directedRelationship := aDirectedRelationship
]

{ #category : #initialization }
BootUMLElement >> initialize [
	super initialize.
	self initializeGeneralizations.

]

{ #category : #initialization }
BootUMLElement >> initializeGeneralizations [
	generalizations := {
	}

]

{ #category : #accessing }
BootUMLElement >> ownedComment [
	^ ownedComment
]

{ #category : #accessing }
BootUMLElement >> ownedComment: aComment [
	ownedComment := aComment
]

{ #category : #accessing }
BootUMLElement >> ownedElement [
	^ ownedElement
]

{ #category : #accessing }
BootUMLElement >> ownedElement: anElement [
	ownedElement := anElement
]

{ #category : #accessing }
BootUMLElement >> owner [
	^ owner
]

{ #category : #accessing }
BootUMLElement >> owner: anElement [
	owner := anElement
]

{ #category : #accessing }
BootUMLElement >> relationship [
	^ relationship
]

{ #category : #accessing }
BootUMLElement >> relationship: aRelationship [
	relationship := aRelationship
]
