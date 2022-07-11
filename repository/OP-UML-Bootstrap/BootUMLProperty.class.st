Class {
	#name : #BootUMLProperty,
	#superclass : #OPUMLBootstrapObject,
	#instVars : [
		'structuredClassifier',
		'redefinedProperty',
		'owningClass',
		'isComposite',
		'opposite',
		'isID',
		'defaultValue',
		'interface',
		'associationEnd',
		'aggregation',
		'qualifier',
		'isDerived',
		'datatype',
		'owningAssociation',
		'isDerivedUnion',
		'association',
		'subsettedProperty',
		'property',
		'classifier'
	],
	#category : 'OP-UML-Bootstrap-Classification'
}

{ #category : #accessing }
BootUMLProperty >> aggregation [
	^ aggregation
]

{ #category : #accessing }
BootUMLProperty >> aggregation: anAggregationKind [
	aggregation := anAggregationKind
]

{ #category : #accessing }
BootUMLProperty >> association [
	^ association
]

{ #category : #accessing }
BootUMLProperty >> association: anAssociation [
	association := anAssociation
]

{ #category : #accessing }
BootUMLProperty >> associationEnd [
	^ associationEnd
]

{ #category : #accessing }
BootUMLProperty >> associationEnd: aProperty [
	associationEnd := aProperty
]

{ #category : #accessing }
BootUMLProperty >> classifier [
	^ classifier
]

{ #category : #accessing }
BootUMLProperty >> classifier: aClassifier [
	classifier := aClassifier
]

{ #category : #'accessing - NamedElement' }
BootUMLProperty >> clientDependency [
	^ (sharedGeneralizations at: #NamedElement) clientDependency
]

{ #category : #'accessing - NamedElement' }
BootUMLProperty >> clientDependency: aDependency [
	(sharedGeneralizations at: #NamedElement) clientDependency: aDependency
]

{ #category : #'accessing - Element' }
BootUMLProperty >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : #'accessing - Element' }
BootUMLProperty >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : #'accessing - Element' }
BootUMLProperty >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : #'accessing - Element' }
BootUMLProperty >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : #accessing }
BootUMLProperty >> datatype [
	^ datatype
]

{ #category : #accessing }
BootUMLProperty >> datatype: aDataType [
	datatype := aDataType
]

{ #category : #accessing }
BootUMLProperty >> defaultValue [
	^ defaultValue
]

{ #category : #accessing }
BootUMLProperty >> defaultValue: aValueSpecification [
	defaultValue := aValueSpecification
]

{ #category : #'accessing - DeploymentTarget' }
BootUMLProperty >> deployedElement [
	^ (sharedGeneralizations at: #DeploymentTarget) deployedElement
]

{ #category : #'accessing - DeploymentTarget' }
BootUMLProperty >> deployedElement: aPackageableElement [
	(sharedGeneralizations at: #DeploymentTarget) deployedElement: aPackageableElement
]

{ #category : #'accessing - DeploymentTarget' }
BootUMLProperty >> deployment [
	^ (sharedGeneralizations at: #DeploymentTarget) deployment
]

{ #category : #'accessing - DeploymentTarget' }
BootUMLProperty >> deployment: aDeployment [
	(sharedGeneralizations at: #DeploymentTarget) deployment: aDeployment
]

{ #category : #'accessing - Element' }
BootUMLProperty >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : #'accessing - Element' }
BootUMLProperty >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : #'accessing - ConnectableElement' }
BootUMLProperty >> end [
	^ (sharedGeneralizations at: #ConnectableElement) end
]

{ #category : #'accessing - ConnectableElement' }
BootUMLProperty >> end: aConnectorEnd [
	(sharedGeneralizations at: #ConnectableElement) end: aConnectorEnd
]

{ #category : #'accessing - Feature' }
BootUMLProperty >> featuringClassifier [
	^ (sharedGeneralizations at: #Feature) featuringClassifier
]

{ #category : #'accessing - Feature' }
BootUMLProperty >> featuringClassifier: aClassifier [
	(sharedGeneralizations at: #Feature) featuringClassifier: aClassifier
]

{ #category : #'accessing - NamedElement' }
BootUMLProperty >> inheritingClassifier [
	^ (sharedGeneralizations at: #NamedElement) inheritingClassifier
]

{ #category : #'accessing - NamedElement' }
BootUMLProperty >> inheritingClassifier: aClassifier [
	(sharedGeneralizations at: #NamedElement) inheritingClassifier: aClassifier
]

{ #category : #initialization }
BootUMLProperty >> initialize [
	super initialize.
	sharedGeneralizations at: #Element put: (BootUMLElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #NamedElement put: (BootUMLNamedElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #RedefinableElement put: (BootUMLRedefinableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #TypedElement put: (BootUMLTypedElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #ParameterableElement put: (BootUMLParameterableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #MultiplicityElement put: (BootUMLMultiplicityElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Feature put: (BootUMLFeature newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #ConnectableElement put: (BootUMLConnectableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #DeploymentTarget put: (BootUMLDeploymentTarget newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #StructuralFeature put: (BootUMLStructuralFeature newOnShared: sharedGeneralizations).
	self initializeGeneralizations.

]

{ #category : #initialization }
BootUMLProperty >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #ConnectableElement.
		sharedGeneralizations at: #DeploymentTarget.
		sharedGeneralizations at: #StructuralFeature.
	}

]

{ #category : #accessing }
BootUMLProperty >> interface [
	^ interface
]

{ #category : #accessing }
BootUMLProperty >> interface: anInterface [
	interface := anInterface
]

{ #category : #accessing }
BootUMLProperty >> isComposite [
	^ isComposite
]

{ #category : #accessing }
BootUMLProperty >> isComposite: aBoolean [
	isComposite := aBoolean
]

{ #category : #accessing }
BootUMLProperty >> isDerived [
	^ isDerived
]

{ #category : #accessing }
BootUMLProperty >> isDerived: aBoolean [
	isDerived := aBoolean
]

{ #category : #accessing }
BootUMLProperty >> isDerivedUnion [
	^ isDerivedUnion
]

{ #category : #accessing }
BootUMLProperty >> isDerivedUnion: aBoolean [
	isDerivedUnion := aBoolean
]

{ #category : #accessing }
BootUMLProperty >> isID [
	^ isID
]

{ #category : #accessing }
BootUMLProperty >> isID: aBoolean [
	isID := aBoolean
]

{ #category : #'accessing - RedefinableElement' }
BootUMLProperty >> isLeaf [
	^ (sharedGeneralizations at: #RedefinableElement) isLeaf
]

{ #category : #'accessing - RedefinableElement' }
BootUMLProperty >> isLeaf: aBoolean [
	(sharedGeneralizations at: #RedefinableElement) isLeaf: aBoolean
]

{ #category : #'accessing - MultiplicityElement' }
BootUMLProperty >> isOrdered [
	^ (sharedGeneralizations at: #MultiplicityElement) isOrdered
]

{ #category : #'accessing - MultiplicityElement' }
BootUMLProperty >> isOrdered: aBoolean [
	(sharedGeneralizations at: #MultiplicityElement) isOrdered: aBoolean
]

{ #category : #'accessing - StructuralFeature' }
BootUMLProperty >> isReadOnly [
	^ (sharedGeneralizations at: #StructuralFeature) isReadOnly
]

{ #category : #'accessing - StructuralFeature' }
BootUMLProperty >> isReadOnly: aBoolean [
	(sharedGeneralizations at: #StructuralFeature) isReadOnly: aBoolean
]

{ #category : #'accessing - Feature' }
BootUMLProperty >> isStatic [
	^ (sharedGeneralizations at: #Feature) isStatic
]

{ #category : #'accessing - Feature' }
BootUMLProperty >> isStatic: aBoolean [
	(sharedGeneralizations at: #Feature) isStatic: aBoolean
]

{ #category : #'accessing - MultiplicityElement' }
BootUMLProperty >> isUnique [
	^ (sharedGeneralizations at: #MultiplicityElement) isUnique
]

{ #category : #'accessing - MultiplicityElement' }
BootUMLProperty >> isUnique: aBoolean [
	(sharedGeneralizations at: #MultiplicityElement) isUnique: aBoolean
]

{ #category : #'accessing - MultiplicityElement' }
BootUMLProperty >> lower [
	^ (sharedGeneralizations at: #MultiplicityElement) lower
]

{ #category : #'accessing - MultiplicityElement' }
BootUMLProperty >> lower: anInteger [
	(sharedGeneralizations at: #MultiplicityElement) lower: anInteger
]

{ #category : #'accessing - MultiplicityElement' }
BootUMLProperty >> lowerValue [
	^ (sharedGeneralizations at: #MultiplicityElement) lowerValue
]

{ #category : #'accessing - MultiplicityElement' }
BootUMLProperty >> lowerValue: aValueSpecification [
	(sharedGeneralizations at: #MultiplicityElement) lowerValue: aValueSpecification
]

{ #category : #'accessing - NamedElement' }
BootUMLProperty >> memberNamespace [
	^ (sharedGeneralizations at: #NamedElement) memberNamespace
]

{ #category : #'accessing - NamedElement' }
BootUMLProperty >> memberNamespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) memberNamespace: aNamespace
]

{ #category : #'accessing - NamedElement' }
BootUMLProperty >> name [
	^ (sharedGeneralizations at: #NamedElement) name
]

{ #category : #'accessing - NamedElement' }
BootUMLProperty >> name: aString [
	(sharedGeneralizations at: #NamedElement) name: aString
]

{ #category : #'accessing - NamedElement' }
BootUMLProperty >> nameExpression [
	^ (sharedGeneralizations at: #NamedElement) nameExpression
]

{ #category : #'accessing - NamedElement' }
BootUMLProperty >> nameExpression: aStringExpression [
	(sharedGeneralizations at: #NamedElement) nameExpression: aStringExpression
]

{ #category : #'accessing - NamedElement' }
BootUMLProperty >> namespace [
	^ (sharedGeneralizations at: #NamedElement) namespace
]

{ #category : #'accessing - NamedElement' }
BootUMLProperty >> namespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) namespace: aNamespace
]

{ #category : #accessing }
BootUMLProperty >> opposite [
	^ opposite
]

{ #category : #accessing }
BootUMLProperty >> opposite: aProperty [
	opposite := aProperty
]

{ #category : #'accessing - Element' }
BootUMLProperty >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : #'accessing - Element' }
BootUMLProperty >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : #'accessing - Element' }
BootUMLProperty >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : #'accessing - Element' }
BootUMLProperty >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : #'accessing - Element' }
BootUMLProperty >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : #'accessing - Element' }
BootUMLProperty >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : #accessing }
BootUMLProperty >> owningAssociation [
	^ owningAssociation
]

{ #category : #accessing }
BootUMLProperty >> owningAssociation: anAssociation [
	owningAssociation := anAssociation
]

{ #category : #accessing }
BootUMLProperty >> owningClass [
	^ owningClass
]

{ #category : #accessing }
BootUMLProperty >> owningClass: aClass [
	owningClass := aClass
]

{ #category : #'accessing - ParameterableElement' }
BootUMLProperty >> owningTemplateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) owningTemplateParameter
]

{ #category : #'accessing - ParameterableElement' }
BootUMLProperty >> owningTemplateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) owningTemplateParameter: aTemplateParameter
]

{ #category : #accessing }
BootUMLProperty >> property [
	^ property
]

{ #category : #accessing }
BootUMLProperty >> property: aProperty [
	property := aProperty
]

{ #category : #'accessing - NamedElement' }
BootUMLProperty >> qualifiedName [
	^ (sharedGeneralizations at: #NamedElement) qualifiedName
]

{ #category : #'accessing - NamedElement' }
BootUMLProperty >> qualifiedName: aString [
	(sharedGeneralizations at: #NamedElement) qualifiedName: aString
]

{ #category : #accessing }
BootUMLProperty >> qualifier [
	^ qualifier
]

{ #category : #accessing }
BootUMLProperty >> qualifier: aProperty [
	qualifier := aProperty
]

{ #category : #'accessing - RedefinableElement' }
BootUMLProperty >> redefinableElement [
	^ (sharedGeneralizations at: #RedefinableElement) redefinableElement
]

{ #category : #'accessing - RedefinableElement' }
BootUMLProperty >> redefinableElement: aRedefinableElement [
	(sharedGeneralizations at: #RedefinableElement) redefinableElement: aRedefinableElement
]

{ #category : #'accessing - RedefinableElement' }
BootUMLProperty >> redefinedElement [
	^ (sharedGeneralizations at: #RedefinableElement) redefinedElement
]

{ #category : #'accessing - RedefinableElement' }
BootUMLProperty >> redefinedElement: aRedefinableElement [
	(sharedGeneralizations at: #RedefinableElement) redefinedElement: aRedefinableElement
]

{ #category : #accessing }
BootUMLProperty >> redefinedProperty [
	^ redefinedProperty
]

{ #category : #accessing }
BootUMLProperty >> redefinedProperty: aProperty [
	redefinedProperty := aProperty
]

{ #category : #'accessing - RedefinableElement' }
BootUMLProperty >> redefinitionContext [
	^ (sharedGeneralizations at: #RedefinableElement) redefinitionContext
]

{ #category : #'accessing - RedefinableElement' }
BootUMLProperty >> redefinitionContext: aClassifier [
	(sharedGeneralizations at: #RedefinableElement) redefinitionContext: aClassifier
]

{ #category : #'accessing - Element' }
BootUMLProperty >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : #'accessing - Element' }
BootUMLProperty >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]

{ #category : #'accessing - ConnectableElement' }
BootUMLProperty >> structuredClassifier [
	^ (sharedGeneralizations at: #ConnectableElement) structuredClassifier
]

{ #category : #'accessing - ConnectableElement' }
BootUMLProperty >> structuredClassifier: aStructuredClassifier [
	(sharedGeneralizations at: #ConnectableElement) structuredClassifier: aStructuredClassifier
]

{ #category : #accessing }
BootUMLProperty >> subsettedProperty [
	^ subsettedProperty
]

{ #category : #accessing }
BootUMLProperty >> subsettedProperty: aProperty [
	subsettedProperty := aProperty
]

{ #category : #'accessing - ParameterableElement' }
BootUMLProperty >> templateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) templateParameter
]

{ #category : #'accessing - ParameterableElement' }
BootUMLProperty >> templateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) templateParameter: aTemplateParameter
]

{ #category : #'accessing - TypedElement' }
BootUMLProperty >> type [
	^ (sharedGeneralizations at: #TypedElement) type
]

{ #category : #'accessing - TypedElement' }
BootUMLProperty >> type: aType [
	(sharedGeneralizations at: #TypedElement) type: aType
]

{ #category : #'accessing - MultiplicityElement' }
BootUMLProperty >> upper [
	^ (sharedGeneralizations at: #MultiplicityElement) upper
]

{ #category : #'accessing - MultiplicityElement' }
BootUMLProperty >> upper: anUnlimitedNatural [
	(sharedGeneralizations at: #MultiplicityElement) upper: anUnlimitedNatural
]

{ #category : #'accessing - MultiplicityElement' }
BootUMLProperty >> upperValue [
	^ (sharedGeneralizations at: #MultiplicityElement) upperValue
]

{ #category : #'accessing - MultiplicityElement' }
BootUMLProperty >> upperValue: aValueSpecification [
	(sharedGeneralizations at: #MultiplicityElement) upperValue: aValueSpecification
]

{ #category : #'accessing - NamedElement' }
BootUMLProperty >> visibility [
	^ (sharedGeneralizations at: #NamedElement) visibility
]

{ #category : #'accessing - NamedElement' }
BootUMLProperty >> visibility: aVisibilityKind [
	(sharedGeneralizations at: #NamedElement) visibility: aVisibilityKind
]
