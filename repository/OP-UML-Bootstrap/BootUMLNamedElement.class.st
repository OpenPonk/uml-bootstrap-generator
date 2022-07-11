Class {
	#name : #BootUMLNamedElement,
	#superclass : #OPUMLBootstrapObject,
	#instVars : [
		'visibility',
		'qualifiedName',
		'memberNamespace',
		'inheritingClassifier',
		'nameExpression',
		'name',
		'clientDependency',
		'namespace'
	],
	#category : 'OP-UML-Bootstrap-CommonStructure'
}

{ #category : #accessing }
BootUMLNamedElement >> clientDependency [
	^ clientDependency
]

{ #category : #accessing }
BootUMLNamedElement >> clientDependency: aDependency [
	clientDependency := aDependency
]

{ #category : #'accessing - Element' }
BootUMLNamedElement >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : #'accessing - Element' }
BootUMLNamedElement >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : #'accessing - Element' }
BootUMLNamedElement >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : #'accessing - Element' }
BootUMLNamedElement >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : #'accessing - Element' }
BootUMLNamedElement >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : #'accessing - Element' }
BootUMLNamedElement >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : #accessing }
BootUMLNamedElement >> inheritingClassifier [
	^ inheritingClassifier
]

{ #category : #accessing }
BootUMLNamedElement >> inheritingClassifier: aClassifier [
	inheritingClassifier := aClassifier
]

{ #category : #initialization }
BootUMLNamedElement >> initialize [
	super initialize.
	sharedGeneralizations at: #Element put: (BootUMLElement newOnShared: sharedGeneralizations).
	self initializeGeneralizations.

]

{ #category : #initialization }
BootUMLNamedElement >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #Element.
	}

]

{ #category : #accessing }
BootUMLNamedElement >> memberNamespace [
	^ memberNamespace
]

{ #category : #accessing }
BootUMLNamedElement >> memberNamespace: aNamespace [
	memberNamespace := aNamespace
]

{ #category : #accessing }
BootUMLNamedElement >> name [
	^ name
]

{ #category : #accessing }
BootUMLNamedElement >> name: aString [
	name := aString
]

{ #category : #accessing }
BootUMLNamedElement >> nameExpression [
	^ nameExpression
]

{ #category : #accessing }
BootUMLNamedElement >> nameExpression: aStringExpression [
	nameExpression := aStringExpression
]

{ #category : #accessing }
BootUMLNamedElement >> namespace [
	^ namespace
]

{ #category : #accessing }
BootUMLNamedElement >> namespace: aNamespace [
	namespace := aNamespace
]

{ #category : #'accessing - Element' }
BootUMLNamedElement >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : #'accessing - Element' }
BootUMLNamedElement >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : #'accessing - Element' }
BootUMLNamedElement >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : #'accessing - Element' }
BootUMLNamedElement >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : #'accessing - Element' }
BootUMLNamedElement >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : #'accessing - Element' }
BootUMLNamedElement >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : #accessing }
BootUMLNamedElement >> qualifiedName [
	^ qualifiedName
]

{ #category : #accessing }
BootUMLNamedElement >> qualifiedName: aString [
	qualifiedName := aString
]

{ #category : #'accessing - Element' }
BootUMLNamedElement >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : #'accessing - Element' }
BootUMLNamedElement >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]

{ #category : #accessing }
BootUMLNamedElement >> visibility [
	^ visibility
]

{ #category : #accessing }
BootUMLNamedElement >> visibility: aVisibilityKind [
	visibility := aVisibilityKind
]
