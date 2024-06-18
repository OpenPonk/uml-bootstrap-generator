Class {
	#name : 'BootUMLRedefinableElement',
	#superclass : 'OPUMLBootstrapObject',
	#instVars : [
		'redefinedElement',
		'redefinitionContext',
		'redefinableElement',
		'isLeaf'
	],
	#category : 'OP-UML-Bootstrap-Classification',
	#package : 'OP-UML-Bootstrap',
	#tag : 'Classification'
}

{ #category : 'accessing - NamedElement' }
BootUMLRedefinableElement >> clientDependency [
	^ (sharedGeneralizations at: #NamedElement) clientDependency
]

{ #category : 'accessing - NamedElement' }
BootUMLRedefinableElement >> clientDependency: aDependency [
	(sharedGeneralizations at: #NamedElement) clientDependency: aDependency
]

{ #category : 'accessing - Element' }
BootUMLRedefinableElement >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : 'accessing - Element' }
BootUMLRedefinableElement >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : 'accessing - Element' }
BootUMLRedefinableElement >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : 'accessing - Element' }
BootUMLRedefinableElement >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : 'accessing - Element' }
BootUMLRedefinableElement >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : 'accessing - Element' }
BootUMLRedefinableElement >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : 'accessing - NamedElement' }
BootUMLRedefinableElement >> inheritingClassifier [
	^ (sharedGeneralizations at: #NamedElement) inheritingClassifier
]

{ #category : 'accessing - NamedElement' }
BootUMLRedefinableElement >> inheritingClassifier: aClassifier [
	(sharedGeneralizations at: #NamedElement) inheritingClassifier: aClassifier
]

{ #category : 'initialization' }
BootUMLRedefinableElement >> initialize [
	super initialize.
	sharedGeneralizations at: #Element put: (BootUMLElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #NamedElement put: (BootUMLNamedElement newOnShared: sharedGeneralizations).
	self initializeGeneralizations.

]

{ #category : 'initialization' }
BootUMLRedefinableElement >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #NamedElement.
	}

]

{ #category : 'accessing' }
BootUMLRedefinableElement >> isLeaf [
	^ isLeaf
]

{ #category : 'accessing' }
BootUMLRedefinableElement >> isLeaf: aBoolean [
	isLeaf := aBoolean
]

{ #category : 'accessing - NamedElement' }
BootUMLRedefinableElement >> memberNamespace [
	^ (sharedGeneralizations at: #NamedElement) memberNamespace
]

{ #category : 'accessing - NamedElement' }
BootUMLRedefinableElement >> memberNamespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) memberNamespace: aNamespace
]

{ #category : 'accessing - NamedElement' }
BootUMLRedefinableElement >> name [
	^ (sharedGeneralizations at: #NamedElement) name
]

{ #category : 'accessing - NamedElement' }
BootUMLRedefinableElement >> name: aString [
	(sharedGeneralizations at: #NamedElement) name: aString
]

{ #category : 'accessing - NamedElement' }
BootUMLRedefinableElement >> nameExpression [
	^ (sharedGeneralizations at: #NamedElement) nameExpression
]

{ #category : 'accessing - NamedElement' }
BootUMLRedefinableElement >> nameExpression: aStringExpression [
	(sharedGeneralizations at: #NamedElement) nameExpression: aStringExpression
]

{ #category : 'accessing - NamedElement' }
BootUMLRedefinableElement >> namespace [
	^ (sharedGeneralizations at: #NamedElement) namespace
]

{ #category : 'accessing - NamedElement' }
BootUMLRedefinableElement >> namespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) namespace: aNamespace
]

{ #category : 'accessing - Element' }
BootUMLRedefinableElement >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : 'accessing - Element' }
BootUMLRedefinableElement >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : 'accessing - Element' }
BootUMLRedefinableElement >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : 'accessing - Element' }
BootUMLRedefinableElement >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : 'accessing - Element' }
BootUMLRedefinableElement >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : 'accessing - Element' }
BootUMLRedefinableElement >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : 'accessing - NamedElement' }
BootUMLRedefinableElement >> qualifiedName [
	^ (sharedGeneralizations at: #NamedElement) qualifiedName
]

{ #category : 'accessing - NamedElement' }
BootUMLRedefinableElement >> qualifiedName: aString [
	(sharedGeneralizations at: #NamedElement) qualifiedName: aString
]

{ #category : 'accessing' }
BootUMLRedefinableElement >> redefinableElement [
	^ redefinableElement
]

{ #category : 'accessing' }
BootUMLRedefinableElement >> redefinableElement: aRedefinableElement [
	redefinableElement := aRedefinableElement
]

{ #category : 'accessing' }
BootUMLRedefinableElement >> redefinedElement [
	^ redefinedElement
]

{ #category : 'accessing' }
BootUMLRedefinableElement >> redefinedElement: aRedefinableElement [
	redefinedElement := aRedefinableElement
]

{ #category : 'accessing' }
BootUMLRedefinableElement >> redefinitionContext [
	^ redefinitionContext
]

{ #category : 'accessing' }
BootUMLRedefinableElement >> redefinitionContext: aClassifier [
	redefinitionContext := aClassifier
]

{ #category : 'accessing - Element' }
BootUMLRedefinableElement >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : 'accessing - Element' }
BootUMLRedefinableElement >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]

{ #category : 'accessing - NamedElement' }
BootUMLRedefinableElement >> visibility [
	^ (sharedGeneralizations at: #NamedElement) visibility
]

{ #category : 'accessing - NamedElement' }
BootUMLRedefinableElement >> visibility: aVisibilityKind [
	(sharedGeneralizations at: #NamedElement) visibility: aVisibilityKind
]
