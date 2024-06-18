Class {
	#name : 'BootUMLBehavioralFeature',
	#superclass : 'OPUMLBootstrapObject',
	#instVars : [
		'concurrency',
		'raisedException',
		'ownedParameter',
		'method',
		'isAbstract',
		'ownedParameterSet'
	],
	#category : 'OP-UML-Bootstrap-Classification',
	#package : 'OP-UML-Bootstrap',
	#tag : 'Classification'
}

{ #category : 'accessing - NamedElement' }
BootUMLBehavioralFeature >> clientDependency [
	^ (sharedGeneralizations at: #NamedElement) clientDependency
]

{ #category : 'accessing - NamedElement' }
BootUMLBehavioralFeature >> clientDependency: aDependency [
	(sharedGeneralizations at: #NamedElement) clientDependency: aDependency
]

{ #category : 'accessing - Element' }
BootUMLBehavioralFeature >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : 'accessing - Element' }
BootUMLBehavioralFeature >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : 'accessing' }
BootUMLBehavioralFeature >> concurrency [
	^ concurrency
]

{ #category : 'accessing' }
BootUMLBehavioralFeature >> concurrency: aCallConcurrencyKind [
	concurrency := aCallConcurrencyKind
]

{ #category : 'accessing - Element' }
BootUMLBehavioralFeature >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : 'accessing - Element' }
BootUMLBehavioralFeature >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : 'accessing - Element' }
BootUMLBehavioralFeature >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : 'accessing - Element' }
BootUMLBehavioralFeature >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : 'accessing - Namespace' }
BootUMLBehavioralFeature >> elementImport [
	^ (sharedGeneralizations at: #Namespace) elementImport
]

{ #category : 'accessing - Namespace' }
BootUMLBehavioralFeature >> elementImport: anElementImport [
	(sharedGeneralizations at: #Namespace) elementImport: anElementImport
]

{ #category : 'accessing - Feature' }
BootUMLBehavioralFeature >> featuringClassifier [
	^ (sharedGeneralizations at: #Feature) featuringClassifier
]

{ #category : 'accessing - Feature' }
BootUMLBehavioralFeature >> featuringClassifier: aClassifier [
	(sharedGeneralizations at: #Feature) featuringClassifier: aClassifier
]

{ #category : 'accessing - Namespace' }
BootUMLBehavioralFeature >> importedMember [
	^ (sharedGeneralizations at: #Namespace) importedMember
]

{ #category : 'accessing - Namespace' }
BootUMLBehavioralFeature >> importedMember: aPackageableElement [
	(sharedGeneralizations at: #Namespace) importedMember: aPackageableElement
]

{ #category : 'accessing - NamedElement' }
BootUMLBehavioralFeature >> inheritingClassifier [
	^ (sharedGeneralizations at: #NamedElement) inheritingClassifier
]

{ #category : 'accessing - NamedElement' }
BootUMLBehavioralFeature >> inheritingClassifier: aClassifier [
	(sharedGeneralizations at: #NamedElement) inheritingClassifier: aClassifier
]

{ #category : 'initialization' }
BootUMLBehavioralFeature >> initialize [
	super initialize.
	sharedGeneralizations at: #Element put: (BootUMLElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #NamedElement put: (BootUMLNamedElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #RedefinableElement put: (BootUMLRedefinableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Feature put: (BootUMLFeature newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Namespace put: (BootUMLNamespace newOnShared: sharedGeneralizations).
	self initializeGeneralizations.

]

{ #category : 'initialization' }
BootUMLBehavioralFeature >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #Feature.
		sharedGeneralizations at: #Namespace.
	}

]

{ #category : 'accessing' }
BootUMLBehavioralFeature >> isAbstract [
	^ isAbstract
]

{ #category : 'accessing' }
BootUMLBehavioralFeature >> isAbstract: aBoolean [
	isAbstract := aBoolean
]

{ #category : 'accessing - RedefinableElement' }
BootUMLBehavioralFeature >> isLeaf [
	^ (sharedGeneralizations at: #RedefinableElement) isLeaf
]

{ #category : 'accessing - RedefinableElement' }
BootUMLBehavioralFeature >> isLeaf: aBoolean [
	(sharedGeneralizations at: #RedefinableElement) isLeaf: aBoolean
]

{ #category : 'accessing - Feature' }
BootUMLBehavioralFeature >> isStatic [
	^ (sharedGeneralizations at: #Feature) isStatic
]

{ #category : 'accessing - Feature' }
BootUMLBehavioralFeature >> isStatic: aBoolean [
	(sharedGeneralizations at: #Feature) isStatic: aBoolean
]

{ #category : 'accessing - Namespace' }
BootUMLBehavioralFeature >> member [
	^ (sharedGeneralizations at: #Namespace) member
]

{ #category : 'accessing - Namespace' }
BootUMLBehavioralFeature >> member: aNamedElement [
	(sharedGeneralizations at: #Namespace) member: aNamedElement
]

{ #category : 'accessing - NamedElement' }
BootUMLBehavioralFeature >> memberNamespace [
	^ (sharedGeneralizations at: #NamedElement) memberNamespace
]

{ #category : 'accessing - NamedElement' }
BootUMLBehavioralFeature >> memberNamespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) memberNamespace: aNamespace
]

{ #category : 'accessing' }
BootUMLBehavioralFeature >> method [
	^ method
]

{ #category : 'accessing' }
BootUMLBehavioralFeature >> method: aBehavior [
	method := aBehavior
]

{ #category : 'accessing - NamedElement' }
BootUMLBehavioralFeature >> name [
	^ (sharedGeneralizations at: #NamedElement) name
]

{ #category : 'accessing - NamedElement' }
BootUMLBehavioralFeature >> name: aString [
	(sharedGeneralizations at: #NamedElement) name: aString
]

{ #category : 'accessing - NamedElement' }
BootUMLBehavioralFeature >> nameExpression [
	^ (sharedGeneralizations at: #NamedElement) nameExpression
]

{ #category : 'accessing - NamedElement' }
BootUMLBehavioralFeature >> nameExpression: aStringExpression [
	(sharedGeneralizations at: #NamedElement) nameExpression: aStringExpression
]

{ #category : 'accessing - NamedElement' }
BootUMLBehavioralFeature >> namespace [
	^ (sharedGeneralizations at: #NamedElement) namespace
]

{ #category : 'accessing - NamedElement' }
BootUMLBehavioralFeature >> namespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) namespace: aNamespace
]

{ #category : 'accessing - Element' }
BootUMLBehavioralFeature >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : 'accessing - Element' }
BootUMLBehavioralFeature >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : 'accessing - Element' }
BootUMLBehavioralFeature >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : 'accessing - Element' }
BootUMLBehavioralFeature >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : 'accessing - Namespace' }
BootUMLBehavioralFeature >> ownedMember [
	^ (sharedGeneralizations at: #Namespace) ownedMember
]

{ #category : 'accessing - Namespace' }
BootUMLBehavioralFeature >> ownedMember: aNamedElement [
	(sharedGeneralizations at: #Namespace) ownedMember: aNamedElement
]

{ #category : 'accessing' }
BootUMLBehavioralFeature >> ownedParameter [
	^ ownedParameter
]

{ #category : 'accessing' }
BootUMLBehavioralFeature >> ownedParameter: aParameter [
	ownedParameter := aParameter
]

{ #category : 'accessing' }
BootUMLBehavioralFeature >> ownedParameterSet [
	^ ownedParameterSet
]

{ #category : 'accessing' }
BootUMLBehavioralFeature >> ownedParameterSet: aParameterSet [
	ownedParameterSet := aParameterSet
]

{ #category : 'accessing - Namespace' }
BootUMLBehavioralFeature >> ownedRule [
	^ (sharedGeneralizations at: #Namespace) ownedRule
]

{ #category : 'accessing - Namespace' }
BootUMLBehavioralFeature >> ownedRule: aConstraint [
	(sharedGeneralizations at: #Namespace) ownedRule: aConstraint
]

{ #category : 'accessing - Element' }
BootUMLBehavioralFeature >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : 'accessing - Element' }
BootUMLBehavioralFeature >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : 'accessing - Namespace' }
BootUMLBehavioralFeature >> packageImport [
	^ (sharedGeneralizations at: #Namespace) packageImport
]

{ #category : 'accessing - Namespace' }
BootUMLBehavioralFeature >> packageImport: aPackageImport [
	(sharedGeneralizations at: #Namespace) packageImport: aPackageImport
]

{ #category : 'accessing - NamedElement' }
BootUMLBehavioralFeature >> qualifiedName [
	^ (sharedGeneralizations at: #NamedElement) qualifiedName
]

{ #category : 'accessing - NamedElement' }
BootUMLBehavioralFeature >> qualifiedName: aString [
	(sharedGeneralizations at: #NamedElement) qualifiedName: aString
]

{ #category : 'accessing' }
BootUMLBehavioralFeature >> raisedException [
	^ raisedException
]

{ #category : 'accessing' }
BootUMLBehavioralFeature >> raisedException: aType [
	raisedException := aType
]

{ #category : 'accessing - RedefinableElement' }
BootUMLBehavioralFeature >> redefinableElement [
	^ (sharedGeneralizations at: #RedefinableElement) redefinableElement
]

{ #category : 'accessing - RedefinableElement' }
BootUMLBehavioralFeature >> redefinableElement: aRedefinableElement [
	(sharedGeneralizations at: #RedefinableElement) redefinableElement: aRedefinableElement
]

{ #category : 'accessing - RedefinableElement' }
BootUMLBehavioralFeature >> redefinedElement [
	^ (sharedGeneralizations at: #RedefinableElement) redefinedElement
]

{ #category : 'accessing - RedefinableElement' }
BootUMLBehavioralFeature >> redefinedElement: aRedefinableElement [
	(sharedGeneralizations at: #RedefinableElement) redefinedElement: aRedefinableElement
]

{ #category : 'accessing - RedefinableElement' }
BootUMLBehavioralFeature >> redefinitionContext [
	^ (sharedGeneralizations at: #RedefinableElement) redefinitionContext
]

{ #category : 'accessing - RedefinableElement' }
BootUMLBehavioralFeature >> redefinitionContext: aClassifier [
	(sharedGeneralizations at: #RedefinableElement) redefinitionContext: aClassifier
]

{ #category : 'accessing - Element' }
BootUMLBehavioralFeature >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : 'accessing - Element' }
BootUMLBehavioralFeature >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]

{ #category : 'accessing - NamedElement' }
BootUMLBehavioralFeature >> visibility [
	^ (sharedGeneralizations at: #NamedElement) visibility
]

{ #category : 'accessing - NamedElement' }
BootUMLBehavioralFeature >> visibility: aVisibilityKind [
	(sharedGeneralizations at: #NamedElement) visibility: aVisibilityKind
]
