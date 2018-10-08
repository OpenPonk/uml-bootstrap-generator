Class {
	#name : #BootUMLOperation,
	#superclass : #OPUMLBootstrapObject,
	#instVars : [
		'redefinedOperation',
		'datatype',
		'lower',
		'bodyCondition',
		'precondition',
		'operation',
		'ownedParameter',
		'templateParameter',
		'isQuery',
		'isUnique',
		'upper',
		'owningClass',
		'interface',
		'type',
		'isOrdered',
		'raisedException',
		'postcondition'
	],
	#category : 'OP-UML-Bootstrap-Classification'
}

{ #category : #accessing }
BootUMLOperation >> bodyCondition [
	^ bodyCondition
]

{ #category : #accessing }
BootUMLOperation >> bodyCondition: aConstraint [
	bodyCondition := aConstraint
]

{ #category : #'accessing - NamedElement' }
BootUMLOperation >> clientDependency [
	^ (sharedGeneralizations at: #NamedElement) clientDependency
]

{ #category : #'accessing - NamedElement' }
BootUMLOperation >> clientDependency: aDependency [
	(sharedGeneralizations at: #NamedElement) clientDependency: aDependency
]

{ #category : #'accessing - Element' }
BootUMLOperation >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : #'accessing - Element' }
BootUMLOperation >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : #'accessing - BehavioralFeature' }
BootUMLOperation >> concurrency [
	^ (sharedGeneralizations at: #BehavioralFeature) concurrency
]

{ #category : #'accessing - BehavioralFeature' }
BootUMLOperation >> concurrency: aCallConcurrencyKind [
	(sharedGeneralizations at: #BehavioralFeature) concurrency: aCallConcurrencyKind
]

{ #category : #'accessing - Element' }
BootUMLOperation >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : #'accessing - Element' }
BootUMLOperation >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : #accessing }
BootUMLOperation >> datatype [
	^ datatype
]

{ #category : #accessing }
BootUMLOperation >> datatype: aDataType [
	datatype := aDataType
]

{ #category : #'accessing - Element' }
BootUMLOperation >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : #'accessing - Element' }
BootUMLOperation >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : #'accessing - Namespace' }
BootUMLOperation >> elementImport [
	^ (sharedGeneralizations at: #Namespace) elementImport
]

{ #category : #'accessing - Namespace' }
BootUMLOperation >> elementImport: anElementImport [
	(sharedGeneralizations at: #Namespace) elementImport: anElementImport
]

{ #category : #'accessing - Feature' }
BootUMLOperation >> featuringClassifier [
	^ (sharedGeneralizations at: #Feature) featuringClassifier
]

{ #category : #'accessing - Feature' }
BootUMLOperation >> featuringClassifier: aClassifier [
	(sharedGeneralizations at: #Feature) featuringClassifier: aClassifier
]

{ #category : #'accessing - Namespace' }
BootUMLOperation >> importedMember [
	^ (sharedGeneralizations at: #Namespace) importedMember
]

{ #category : #'accessing - Namespace' }
BootUMLOperation >> importedMember: aPackageableElement [
	(sharedGeneralizations at: #Namespace) importedMember: aPackageableElement
]

{ #category : #'accessing - NamedElement' }
BootUMLOperation >> inheritingClassifier [
	^ (sharedGeneralizations at: #NamedElement) inheritingClassifier
]

{ #category : #'accessing - NamedElement' }
BootUMLOperation >> inheritingClassifier: aClassifier [
	(sharedGeneralizations at: #NamedElement) inheritingClassifier: aClassifier
]

{ #category : #initialization }
BootUMLOperation >> initialize [
	super initialize.
	sharedGeneralizations at: #Element put: (BootUMLElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #NamedElement put: (BootUMLNamedElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #RedefinableElement put: (BootUMLRedefinableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Feature put: (BootUMLFeature newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Namespace put: (BootUMLNamespace newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #TemplateableElement put: (BootUMLTemplateableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #ParameterableElement put: (BootUMLParameterableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #BehavioralFeature put: (BootUMLBehavioralFeature newOnShared: sharedGeneralizations).
	self initializeGeneralizations.

]

{ #category : #initialization }
BootUMLOperation >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #TemplateableElement.
		sharedGeneralizations at: #ParameterableElement.
		sharedGeneralizations at: #BehavioralFeature.
	}

]

{ #category : #accessing }
BootUMLOperation >> interface [
	^ interface
]

{ #category : #accessing }
BootUMLOperation >> interface: anInterface [
	interface := anInterface
]

{ #category : #'accessing - BehavioralFeature' }
BootUMLOperation >> isAbstract [
	^ (sharedGeneralizations at: #BehavioralFeature) isAbstract
]

{ #category : #'accessing - BehavioralFeature' }
BootUMLOperation >> isAbstract: aBoolean [
	(sharedGeneralizations at: #BehavioralFeature) isAbstract: aBoolean
]

{ #category : #'accessing - RedefinableElement' }
BootUMLOperation >> isLeaf [
	^ (sharedGeneralizations at: #RedefinableElement) isLeaf
]

{ #category : #'accessing - RedefinableElement' }
BootUMLOperation >> isLeaf: aBoolean [
	(sharedGeneralizations at: #RedefinableElement) isLeaf: aBoolean
]

{ #category : #accessing }
BootUMLOperation >> isOrdered [
	^ isOrdered
]

{ #category : #accessing }
BootUMLOperation >> isOrdered: aBoolean [
	isOrdered := aBoolean
]

{ #category : #accessing }
BootUMLOperation >> isQuery [
	^ isQuery
]

{ #category : #accessing }
BootUMLOperation >> isQuery: aBoolean [
	isQuery := aBoolean
]

{ #category : #'accessing - Feature' }
BootUMLOperation >> isStatic [
	^ (sharedGeneralizations at: #Feature) isStatic
]

{ #category : #'accessing - Feature' }
BootUMLOperation >> isStatic: aBoolean [
	(sharedGeneralizations at: #Feature) isStatic: aBoolean
]

{ #category : #accessing }
BootUMLOperation >> isUnique [
	^ isUnique
]

{ #category : #accessing }
BootUMLOperation >> isUnique: aBoolean [
	isUnique := aBoolean
]

{ #category : #accessing }
BootUMLOperation >> lower [
	^ lower
]

{ #category : #accessing }
BootUMLOperation >> lower: anInteger [
	lower := anInteger
]

{ #category : #'accessing - Namespace' }
BootUMLOperation >> member [
	^ (sharedGeneralizations at: #Namespace) member
]

{ #category : #'accessing - Namespace' }
BootUMLOperation >> member: aNamedElement [
	(sharedGeneralizations at: #Namespace) member: aNamedElement
]

{ #category : #'accessing - NamedElement' }
BootUMLOperation >> memberNamespace [
	^ (sharedGeneralizations at: #NamedElement) memberNamespace
]

{ #category : #'accessing - NamedElement' }
BootUMLOperation >> memberNamespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) memberNamespace: aNamespace
]

{ #category : #'accessing - BehavioralFeature' }
BootUMLOperation >> method [
	^ (sharedGeneralizations at: #BehavioralFeature) method
]

{ #category : #'accessing - BehavioralFeature' }
BootUMLOperation >> method: aBehavior [
	(sharedGeneralizations at: #BehavioralFeature) method: aBehavior
]

{ #category : #'accessing - NamedElement' }
BootUMLOperation >> name [
	^ (sharedGeneralizations at: #NamedElement) name
]

{ #category : #'accessing - NamedElement' }
BootUMLOperation >> name: aString [
	(sharedGeneralizations at: #NamedElement) name: aString
]

{ #category : #'accessing - NamedElement' }
BootUMLOperation >> nameExpression [
	^ (sharedGeneralizations at: #NamedElement) nameExpression
]

{ #category : #'accessing - NamedElement' }
BootUMLOperation >> nameExpression: aStringExpression [
	(sharedGeneralizations at: #NamedElement) nameExpression: aStringExpression
]

{ #category : #'accessing - NamedElement' }
BootUMLOperation >> namespace [
	^ (sharedGeneralizations at: #NamedElement) namespace
]

{ #category : #'accessing - NamedElement' }
BootUMLOperation >> namespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) namespace: aNamespace
]

{ #category : #accessing }
BootUMLOperation >> operation [
	^ operation
]

{ #category : #accessing }
BootUMLOperation >> operation: anOperation [
	operation := anOperation
]

{ #category : #'accessing - Element' }
BootUMLOperation >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : #'accessing - Element' }
BootUMLOperation >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : #'accessing - Element' }
BootUMLOperation >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : #'accessing - Element' }
BootUMLOperation >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : #'accessing - Namespace' }
BootUMLOperation >> ownedMember [
	^ (sharedGeneralizations at: #Namespace) ownedMember
]

{ #category : #'accessing - Namespace' }
BootUMLOperation >> ownedMember: aNamedElement [
	(sharedGeneralizations at: #Namespace) ownedMember: aNamedElement
]

{ #category : #'accessing - BehavioralFeature' }
BootUMLOperation >> ownedParameter [
	^ (sharedGeneralizations at: #BehavioralFeature) ownedParameter
]

{ #category : #'accessing - BehavioralFeature' }
BootUMLOperation >> ownedParameter: aParameter [
	(sharedGeneralizations at: #BehavioralFeature) ownedParameter: aParameter
]

{ #category : #'accessing - BehavioralFeature' }
BootUMLOperation >> ownedParameterSet [
	^ (sharedGeneralizations at: #BehavioralFeature) ownedParameterSet
]

{ #category : #'accessing - BehavioralFeature' }
BootUMLOperation >> ownedParameterSet: aParameterSet [
	(sharedGeneralizations at: #BehavioralFeature) ownedParameterSet: aParameterSet
]

{ #category : #'accessing - Namespace' }
BootUMLOperation >> ownedRule [
	^ (sharedGeneralizations at: #Namespace) ownedRule
]

{ #category : #'accessing - Namespace' }
BootUMLOperation >> ownedRule: aConstraint [
	(sharedGeneralizations at: #Namespace) ownedRule: aConstraint
]

{ #category : #'accessing - TemplateableElement' }
BootUMLOperation >> ownedTemplateSignature [
	^ (sharedGeneralizations at: #TemplateableElement) ownedTemplateSignature
]

{ #category : #'accessing - TemplateableElement' }
BootUMLOperation >> ownedTemplateSignature: aTemplateSignature [
	(sharedGeneralizations at: #TemplateableElement) ownedTemplateSignature: aTemplateSignature
]

{ #category : #'accessing - Element' }
BootUMLOperation >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : #'accessing - Element' }
BootUMLOperation >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : #accessing }
BootUMLOperation >> owningClass [
	^ owningClass
]

{ #category : #accessing }
BootUMLOperation >> owningClass: aClass [
	owningClass := aClass
]

{ #category : #'accessing - ParameterableElement' }
BootUMLOperation >> owningTemplateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) owningTemplateParameter
]

{ #category : #'accessing - ParameterableElement' }
BootUMLOperation >> owningTemplateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) owningTemplateParameter: aTemplateParameter
]

{ #category : #'accessing - Namespace' }
BootUMLOperation >> packageImport [
	^ (sharedGeneralizations at: #Namespace) packageImport
]

{ #category : #'accessing - Namespace' }
BootUMLOperation >> packageImport: aPackageImport [
	(sharedGeneralizations at: #Namespace) packageImport: aPackageImport
]

{ #category : #accessing }
BootUMLOperation >> postcondition [
	^ postcondition
]

{ #category : #accessing }
BootUMLOperation >> postcondition: aConstraint [
	postcondition := aConstraint
]

{ #category : #accessing }
BootUMLOperation >> precondition [
	^ precondition
]

{ #category : #accessing }
BootUMLOperation >> precondition: aConstraint [
	precondition := aConstraint
]

{ #category : #'accessing - NamedElement' }
BootUMLOperation >> qualifiedName [
	^ (sharedGeneralizations at: #NamedElement) qualifiedName
]

{ #category : #'accessing - NamedElement' }
BootUMLOperation >> qualifiedName: aString [
	(sharedGeneralizations at: #NamedElement) qualifiedName: aString
]

{ #category : #'accessing - BehavioralFeature' }
BootUMLOperation >> raisedException [
	^ (sharedGeneralizations at: #BehavioralFeature) raisedException
]

{ #category : #'accessing - BehavioralFeature' }
BootUMLOperation >> raisedException: aType [
	(sharedGeneralizations at: #BehavioralFeature) raisedException: aType
]

{ #category : #'accessing - RedefinableElement' }
BootUMLOperation >> redefinableElement [
	^ (sharedGeneralizations at: #RedefinableElement) redefinableElement
]

{ #category : #'accessing - RedefinableElement' }
BootUMLOperation >> redefinableElement: aRedefinableElement [
	(sharedGeneralizations at: #RedefinableElement) redefinableElement: aRedefinableElement
]

{ #category : #'accessing - RedefinableElement' }
BootUMLOperation >> redefinedElement [
	^ (sharedGeneralizations at: #RedefinableElement) redefinedElement
]

{ #category : #'accessing - RedefinableElement' }
BootUMLOperation >> redefinedElement: aRedefinableElement [
	(sharedGeneralizations at: #RedefinableElement) redefinedElement: aRedefinableElement
]

{ #category : #accessing }
BootUMLOperation >> redefinedOperation [
	^ redefinedOperation
]

{ #category : #accessing }
BootUMLOperation >> redefinedOperation: anOperation [
	redefinedOperation := anOperation
]

{ #category : #'accessing - RedefinableElement' }
BootUMLOperation >> redefinitionContext [
	^ (sharedGeneralizations at: #RedefinableElement) redefinitionContext
]

{ #category : #'accessing - RedefinableElement' }
BootUMLOperation >> redefinitionContext: aClassifier [
	(sharedGeneralizations at: #RedefinableElement) redefinitionContext: aClassifier
]

{ #category : #'accessing - Element' }
BootUMLOperation >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : #'accessing - Element' }
BootUMLOperation >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]

{ #category : #'accessing - TemplateableElement' }
BootUMLOperation >> templateBinding [
	^ (sharedGeneralizations at: #TemplateableElement) templateBinding
]

{ #category : #'accessing - TemplateableElement' }
BootUMLOperation >> templateBinding: aTemplateBinding [
	(sharedGeneralizations at: #TemplateableElement) templateBinding: aTemplateBinding
]

{ #category : #'accessing - ParameterableElement' }
BootUMLOperation >> templateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) templateParameter
]

{ #category : #'accessing - ParameterableElement' }
BootUMLOperation >> templateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) templateParameter: aTemplateParameter
]

{ #category : #accessing }
BootUMLOperation >> type [
	^ type
]

{ #category : #accessing }
BootUMLOperation >> type: aType [
	type := aType
]

{ #category : #accessing }
BootUMLOperation >> upper [
	^ upper
]

{ #category : #accessing }
BootUMLOperation >> upper: anUnlimitedNatural [
	upper := anUnlimitedNatural
]

{ #category : #'accessing - NamedElement' }
BootUMLOperation >> visibility [
	^ (sharedGeneralizations at: #NamedElement) visibility
]

{ #category : #'accessing - NamedElement' }
BootUMLOperation >> visibility: aVisibilityKind [
	(sharedGeneralizations at: #NamedElement) visibility: aVisibilityKind
]
