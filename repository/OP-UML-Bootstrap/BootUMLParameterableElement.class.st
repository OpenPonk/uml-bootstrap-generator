Class {
	#name : #BootUMLParameterableElement,
	#superclass : #OPUMLBootstrapObject,
	#instVars : [
		'owningTemplateParameter',
		'templateParameter'
	],
	#category : 'OP-UML-Bootstrap-CommonStructure'
}

{ #category : #'accessing - Element' }
BootUMLParameterableElement >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : #'accessing - Element' }
BootUMLParameterableElement >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : #'accessing - Element' }
BootUMLParameterableElement >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : #'accessing - Element' }
BootUMLParameterableElement >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : #'accessing - Element' }
BootUMLParameterableElement >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : #'accessing - Element' }
BootUMLParameterableElement >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : #initialization }
BootUMLParameterableElement >> initialize [
	super initialize.
	sharedGeneralizations at: #Element put: (BootUMLElement newOnShared: sharedGeneralizations).
	self initializeGeneralizations.

]

{ #category : #initialization }
BootUMLParameterableElement >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #Element.
	}

]

{ #category : #'accessing - Element' }
BootUMLParameterableElement >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : #'accessing - Element' }
BootUMLParameterableElement >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : #'accessing - Element' }
BootUMLParameterableElement >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : #'accessing - Element' }
BootUMLParameterableElement >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : #'accessing - Element' }
BootUMLParameterableElement >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : #'accessing - Element' }
BootUMLParameterableElement >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : #accessing }
BootUMLParameterableElement >> owningTemplateParameter [
	^ owningTemplateParameter
]

{ #category : #accessing }
BootUMLParameterableElement >> owningTemplateParameter: aTemplateParameter [
	owningTemplateParameter := aTemplateParameter
]

{ #category : #'accessing - Element' }
BootUMLParameterableElement >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : #'accessing - Element' }
BootUMLParameterableElement >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]

{ #category : #accessing }
BootUMLParameterableElement >> templateParameter [
	^ templateParameter
]

{ #category : #accessing }
BootUMLParameterableElement >> templateParameter: aTemplateParameter [
	templateParameter := aTemplateParameter
]
