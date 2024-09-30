Class {
	#name : 'BootUMLFeature',
	#superclass : 'OPUMLBootstrapObject',
	#instVars : [
		'featuringClassifier',
		'isStatic'
	],
	#category : 'OP-UML-Bootstrap-Classification',
	#package : 'OP-UML-Bootstrap',
	#tag : 'Classification'
}

{ #category : 'accessing - NamedElement' }
BootUMLFeature >> clientDependency [
	^ (sharedGeneralizations at: #NamedElement) clientDependency
]

{ #category : 'accessing - NamedElement' }
BootUMLFeature >> clientDependency: aDependency [
	(sharedGeneralizations at: #NamedElement) clientDependency: aDependency
]

{ #category : 'accessing - Element' }
BootUMLFeature >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : 'accessing - Element' }
BootUMLFeature >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : 'accessing - Element' }
BootUMLFeature >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : 'accessing - Element' }
BootUMLFeature >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : 'accessing - Element' }
BootUMLFeature >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : 'accessing - Element' }
BootUMLFeature >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : 'accessing' }
BootUMLFeature >> featuringClassifier [
	^ featuringClassifier
]

{ #category : 'accessing' }
BootUMLFeature >> featuringClassifier: aClassifier [
	featuringClassifier := aClassifier
]

{ #category : 'accessing - NamedElement' }
BootUMLFeature >> inheritingClassifier [
	^ (sharedGeneralizations at: #NamedElement) inheritingClassifier
]

{ #category : 'accessing - NamedElement' }
BootUMLFeature >> inheritingClassifier: aClassifier [
	(sharedGeneralizations at: #NamedElement) inheritingClassifier: aClassifier
]

{ #category : 'initialization' }
BootUMLFeature >> initialize [
	super initialize.
	sharedGeneralizations at: #Element put: (BootUMLElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #NamedElement put: (BootUMLNamedElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #RedefinableElement put: (BootUMLRedefinableElement newOnShared: sharedGeneralizations).
	self initializeGeneralizations.

]

{ #category : 'initialization' }
BootUMLFeature >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #RedefinableElement.
	}

]

{ #category : 'accessing - RedefinableElement' }
BootUMLFeature >> isLeaf [
	^ (sharedGeneralizations at: #RedefinableElement) isLeaf
]

{ #category : 'accessing - RedefinableElement' }
BootUMLFeature >> isLeaf: aBoolean [
	(sharedGeneralizations at: #RedefinableElement) isLeaf: aBoolean
]

{ #category : 'accessing' }
BootUMLFeature >> isStatic [
	^ isStatic
]

{ #category : 'accessing' }
BootUMLFeature >> isStatic: aBoolean [
	isStatic := aBoolean
]

{ #category : 'accessing - NamedElement' }
BootUMLFeature >> memberNamespace [
	^ (sharedGeneralizations at: #NamedElement) memberNamespace
]

{ #category : 'accessing - NamedElement' }
BootUMLFeature >> memberNamespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) memberNamespace: aNamespace
]

{ #category : 'accessing - NamedElement' }
BootUMLFeature >> name [
	^ (sharedGeneralizations at: #NamedElement) name
]

{ #category : 'accessing - NamedElement' }
BootUMLFeature >> name: aString [
	(sharedGeneralizations at: #NamedElement) name: aString
]

{ #category : 'accessing - NamedElement' }
BootUMLFeature >> nameExpression [
	^ (sharedGeneralizations at: #NamedElement) nameExpression
]

{ #category : 'accessing - NamedElement' }
BootUMLFeature >> nameExpression: aStringExpression [
	(sharedGeneralizations at: #NamedElement) nameExpression: aStringExpression
]

{ #category : 'accessing - NamedElement' }
BootUMLFeature >> namespace [
	^ (sharedGeneralizations at: #NamedElement) namespace
]

{ #category : 'accessing - NamedElement' }
BootUMLFeature >> namespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) namespace: aNamespace
]

{ #category : 'accessing - Element' }
BootUMLFeature >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : 'accessing - Element' }
BootUMLFeature >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : 'accessing - Element' }
BootUMLFeature >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : 'accessing - Element' }
BootUMLFeature >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : 'accessing - Element' }
BootUMLFeature >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : 'accessing - Element' }
BootUMLFeature >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : 'accessing - NamedElement' }
BootUMLFeature >> qualifiedName [
	^ (sharedGeneralizations at: #NamedElement) qualifiedName
]

{ #category : 'accessing - NamedElement' }
BootUMLFeature >> qualifiedName: aString [
	(sharedGeneralizations at: #NamedElement) qualifiedName: aString
]

{ #category : 'accessing - RedefinableElement' }
BootUMLFeature >> redefinableElement [
	^ (sharedGeneralizations at: #RedefinableElement) redefinableElement
]

{ #category : 'accessing - RedefinableElement' }
BootUMLFeature >> redefinableElement: aRedefinableElement [
	(sharedGeneralizations at: #RedefinableElement) redefinableElement: aRedefinableElement
]

{ #category : 'accessing - RedefinableElement' }
BootUMLFeature >> redefinedElement [
	^ (sharedGeneralizations at: #RedefinableElement) redefinedElement
]

{ #category : 'accessing - RedefinableElement' }
BootUMLFeature >> redefinedElement: aRedefinableElement [
	(sharedGeneralizations at: #RedefinableElement) redefinedElement: aRedefinableElement
]

{ #category : 'accessing - RedefinableElement' }
BootUMLFeature >> redefinitionContext [
	^ (sharedGeneralizations at: #RedefinableElement) redefinitionContext
]

{ #category : 'accessing - RedefinableElement' }
BootUMLFeature >> redefinitionContext: aClassifier [
	(sharedGeneralizations at: #RedefinableElement) redefinitionContext: aClassifier
]

{ #category : 'accessing - Element' }
BootUMLFeature >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : 'accessing - Element' }
BootUMLFeature >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]

{ #category : 'accessing - NamedElement' }
BootUMLFeature >> visibility [
	^ (sharedGeneralizations at: #NamedElement) visibility
]

{ #category : 'accessing - NamedElement' }
BootUMLFeature >> visibility: aVisibilityKind [
	(sharedGeneralizations at: #NamedElement) visibility: aVisibilityKind
]
