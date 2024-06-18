Class {
	#name : 'BootUMLStructuralFeature',
	#superclass : 'OPUMLBootstrapObject',
	#instVars : [
		'isReadOnly'
	],
	#category : 'OP-UML-Bootstrap-Classification',
	#package : 'OP-UML-Bootstrap',
	#tag : 'Classification'
}

{ #category : 'accessing - NamedElement' }
BootUMLStructuralFeature >> clientDependency [
	^ (sharedGeneralizations at: #NamedElement) clientDependency
]

{ #category : 'accessing - NamedElement' }
BootUMLStructuralFeature >> clientDependency: aDependency [
	(sharedGeneralizations at: #NamedElement) clientDependency: aDependency
]

{ #category : 'accessing - Element' }
BootUMLStructuralFeature >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : 'accessing - Element' }
BootUMLStructuralFeature >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : 'accessing - Element' }
BootUMLStructuralFeature >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : 'accessing - Element' }
BootUMLStructuralFeature >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : 'accessing - Element' }
BootUMLStructuralFeature >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : 'accessing - Element' }
BootUMLStructuralFeature >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : 'accessing - Feature' }
BootUMLStructuralFeature >> featuringClassifier [
	^ (sharedGeneralizations at: #Feature) featuringClassifier
]

{ #category : 'accessing - Feature' }
BootUMLStructuralFeature >> featuringClassifier: aClassifier [
	(sharedGeneralizations at: #Feature) featuringClassifier: aClassifier
]

{ #category : 'accessing - NamedElement' }
BootUMLStructuralFeature >> inheritingClassifier [
	^ (sharedGeneralizations at: #NamedElement) inheritingClassifier
]

{ #category : 'accessing - NamedElement' }
BootUMLStructuralFeature >> inheritingClassifier: aClassifier [
	(sharedGeneralizations at: #NamedElement) inheritingClassifier: aClassifier
]

{ #category : 'initialization' }
BootUMLStructuralFeature >> initialize [
	super initialize.
	sharedGeneralizations at: #Element put: (BootUMLElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #NamedElement put: (BootUMLNamedElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #RedefinableElement put: (BootUMLRedefinableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #MultiplicityElement put: (BootUMLMultiplicityElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #TypedElement put: (BootUMLTypedElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Feature put: (BootUMLFeature newOnShared: sharedGeneralizations).
	self initializeGeneralizations.

]

{ #category : 'initialization' }
BootUMLStructuralFeature >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #MultiplicityElement.
		sharedGeneralizations at: #TypedElement.
		sharedGeneralizations at: #Feature.
	}

]

{ #category : 'accessing - RedefinableElement' }
BootUMLStructuralFeature >> isLeaf [
	^ (sharedGeneralizations at: #RedefinableElement) isLeaf
]

{ #category : 'accessing - RedefinableElement' }
BootUMLStructuralFeature >> isLeaf: aBoolean [
	(sharedGeneralizations at: #RedefinableElement) isLeaf: aBoolean
]

{ #category : 'accessing - MultiplicityElement' }
BootUMLStructuralFeature >> isOrdered [
	^ (sharedGeneralizations at: #MultiplicityElement) isOrdered
]

{ #category : 'accessing - MultiplicityElement' }
BootUMLStructuralFeature >> isOrdered: aBoolean [
	(sharedGeneralizations at: #MultiplicityElement) isOrdered: aBoolean
]

{ #category : 'accessing' }
BootUMLStructuralFeature >> isReadOnly [
	^ isReadOnly
]

{ #category : 'accessing' }
BootUMLStructuralFeature >> isReadOnly: aBoolean [
	isReadOnly := aBoolean
]

{ #category : 'accessing - Feature' }
BootUMLStructuralFeature >> isStatic [
	^ (sharedGeneralizations at: #Feature) isStatic
]

{ #category : 'accessing - Feature' }
BootUMLStructuralFeature >> isStatic: aBoolean [
	(sharedGeneralizations at: #Feature) isStatic: aBoolean
]

{ #category : 'accessing - MultiplicityElement' }
BootUMLStructuralFeature >> isUnique [
	^ (sharedGeneralizations at: #MultiplicityElement) isUnique
]

{ #category : 'accessing - MultiplicityElement' }
BootUMLStructuralFeature >> isUnique: aBoolean [
	(sharedGeneralizations at: #MultiplicityElement) isUnique: aBoolean
]

{ #category : 'accessing - MultiplicityElement' }
BootUMLStructuralFeature >> lower [
	^ (sharedGeneralizations at: #MultiplicityElement) lower
]

{ #category : 'accessing - MultiplicityElement' }
BootUMLStructuralFeature >> lower: anInteger [
	(sharedGeneralizations at: #MultiplicityElement) lower: anInteger
]

{ #category : 'accessing - MultiplicityElement' }
BootUMLStructuralFeature >> lowerValue [
	^ (sharedGeneralizations at: #MultiplicityElement) lowerValue
]

{ #category : 'accessing - MultiplicityElement' }
BootUMLStructuralFeature >> lowerValue: aValueSpecification [
	(sharedGeneralizations at: #MultiplicityElement) lowerValue: aValueSpecification
]

{ #category : 'accessing - NamedElement' }
BootUMLStructuralFeature >> memberNamespace [
	^ (sharedGeneralizations at: #NamedElement) memberNamespace
]

{ #category : 'accessing - NamedElement' }
BootUMLStructuralFeature >> memberNamespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) memberNamespace: aNamespace
]

{ #category : 'accessing - NamedElement' }
BootUMLStructuralFeature >> name [
	^ (sharedGeneralizations at: #NamedElement) name
]

{ #category : 'accessing - NamedElement' }
BootUMLStructuralFeature >> name: aString [
	(sharedGeneralizations at: #NamedElement) name: aString
]

{ #category : 'accessing - NamedElement' }
BootUMLStructuralFeature >> nameExpression [
	^ (sharedGeneralizations at: #NamedElement) nameExpression
]

{ #category : 'accessing - NamedElement' }
BootUMLStructuralFeature >> nameExpression: aStringExpression [
	(sharedGeneralizations at: #NamedElement) nameExpression: aStringExpression
]

{ #category : 'accessing - NamedElement' }
BootUMLStructuralFeature >> namespace [
	^ (sharedGeneralizations at: #NamedElement) namespace
]

{ #category : 'accessing - NamedElement' }
BootUMLStructuralFeature >> namespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) namespace: aNamespace
]

{ #category : 'accessing - Element' }
BootUMLStructuralFeature >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : 'accessing - Element' }
BootUMLStructuralFeature >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : 'accessing - Element' }
BootUMLStructuralFeature >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : 'accessing - Element' }
BootUMLStructuralFeature >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : 'accessing - Element' }
BootUMLStructuralFeature >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : 'accessing - Element' }
BootUMLStructuralFeature >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : 'accessing - NamedElement' }
BootUMLStructuralFeature >> qualifiedName [
	^ (sharedGeneralizations at: #NamedElement) qualifiedName
]

{ #category : 'accessing - NamedElement' }
BootUMLStructuralFeature >> qualifiedName: aString [
	(sharedGeneralizations at: #NamedElement) qualifiedName: aString
]

{ #category : 'accessing - RedefinableElement' }
BootUMLStructuralFeature >> redefinableElement [
	^ (sharedGeneralizations at: #RedefinableElement) redefinableElement
]

{ #category : 'accessing - RedefinableElement' }
BootUMLStructuralFeature >> redefinableElement: aRedefinableElement [
	(sharedGeneralizations at: #RedefinableElement) redefinableElement: aRedefinableElement
]

{ #category : 'accessing - RedefinableElement' }
BootUMLStructuralFeature >> redefinedElement [
	^ (sharedGeneralizations at: #RedefinableElement) redefinedElement
]

{ #category : 'accessing - RedefinableElement' }
BootUMLStructuralFeature >> redefinedElement: aRedefinableElement [
	(sharedGeneralizations at: #RedefinableElement) redefinedElement: aRedefinableElement
]

{ #category : 'accessing - RedefinableElement' }
BootUMLStructuralFeature >> redefinitionContext [
	^ (sharedGeneralizations at: #RedefinableElement) redefinitionContext
]

{ #category : 'accessing - RedefinableElement' }
BootUMLStructuralFeature >> redefinitionContext: aClassifier [
	(sharedGeneralizations at: #RedefinableElement) redefinitionContext: aClassifier
]

{ #category : 'accessing - Element' }
BootUMLStructuralFeature >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : 'accessing - Element' }
BootUMLStructuralFeature >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]

{ #category : 'accessing - TypedElement' }
BootUMLStructuralFeature >> type [
	^ (sharedGeneralizations at: #TypedElement) type
]

{ #category : 'accessing - TypedElement' }
BootUMLStructuralFeature >> type: aType [
	(sharedGeneralizations at: #TypedElement) type: aType
]

{ #category : 'accessing - MultiplicityElement' }
BootUMLStructuralFeature >> upper [
	^ (sharedGeneralizations at: #MultiplicityElement) upper
]

{ #category : 'accessing - MultiplicityElement' }
BootUMLStructuralFeature >> upper: anUnlimitedNatural [
	(sharedGeneralizations at: #MultiplicityElement) upper: anUnlimitedNatural
]

{ #category : 'accessing - MultiplicityElement' }
BootUMLStructuralFeature >> upperValue [
	^ (sharedGeneralizations at: #MultiplicityElement) upperValue
]

{ #category : 'accessing - MultiplicityElement' }
BootUMLStructuralFeature >> upperValue: aValueSpecification [
	(sharedGeneralizations at: #MultiplicityElement) upperValue: aValueSpecification
]

{ #category : 'accessing - NamedElement' }
BootUMLStructuralFeature >> visibility [
	^ (sharedGeneralizations at: #NamedElement) visibility
]

{ #category : 'accessing - NamedElement' }
BootUMLStructuralFeature >> visibility: aVisibilityKind [
	(sharedGeneralizations at: #NamedElement) visibility: aVisibilityKind
]
