Class {
	#name : #BootUMLLiteralBoolean,
	#superclass : #OPUMLBootstrapObject,
	#instVars : [
		'value'
	],
	#category : 'OP-UML-Bootstrap-Values'
}

{ #category : #'accessing - NamedElement' }
BootUMLLiteralBoolean >> clientDependency [
	^ (sharedGeneralizations at: #NamedElement) clientDependency
]

{ #category : #'accessing - NamedElement' }
BootUMLLiteralBoolean >> clientDependency: aDependency [
	(sharedGeneralizations at: #NamedElement) clientDependency: aDependency
]

{ #category : #'accessing - Element' }
BootUMLLiteralBoolean >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : #'accessing - Element' }
BootUMLLiteralBoolean >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : #'accessing - Element' }
BootUMLLiteralBoolean >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : #'accessing - Element' }
BootUMLLiteralBoolean >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : #'accessing - PackageableElement' }
BootUMLLiteralBoolean >> deploymentTarget [
	^ (sharedGeneralizations at: #PackageableElement) deploymentTarget
]

{ #category : #'accessing - PackageableElement' }
BootUMLLiteralBoolean >> deploymentTarget: aDeploymentTarget [
	(sharedGeneralizations at: #PackageableElement) deploymentTarget: aDeploymentTarget
]

{ #category : #'accessing - Element' }
BootUMLLiteralBoolean >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : #'accessing - Element' }
BootUMLLiteralBoolean >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : #'accessing - NamedElement' }
BootUMLLiteralBoolean >> inheritingClassifier [
	^ (sharedGeneralizations at: #NamedElement) inheritingClassifier
]

{ #category : #'accessing - NamedElement' }
BootUMLLiteralBoolean >> inheritingClassifier: aClassifier [
	(sharedGeneralizations at: #NamedElement) inheritingClassifier: aClassifier
]

{ #category : #initialization }
BootUMLLiteralBoolean >> initialize [
	super initialize.
	sharedGeneralizations at: #Element put: (BootUMLElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #NamedElement put: (BootUMLNamedElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #ParameterableElement put: (BootUMLParameterableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #TypedElement put: (BootUMLTypedElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #PackageableElement put: (BootUMLPackageableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #ValueSpecification put: (BootUMLValueSpecification newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #LiteralSpecification put: (BootUMLLiteralSpecification newOnShared: sharedGeneralizations).
	self initializeGeneralizations.

]

{ #category : #initialization }
BootUMLLiteralBoolean >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #LiteralSpecification.
	}

]

{ #category : #'accessing - NamedElement' }
BootUMLLiteralBoolean >> memberNamespace [
	^ (sharedGeneralizations at: #NamedElement) memberNamespace
]

{ #category : #'accessing - NamedElement' }
BootUMLLiteralBoolean >> memberNamespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) memberNamespace: aNamespace
]

{ #category : #'accessing - NamedElement' }
BootUMLLiteralBoolean >> name [
	^ (sharedGeneralizations at: #NamedElement) name
]

{ #category : #'accessing - NamedElement' }
BootUMLLiteralBoolean >> name: aString [
	(sharedGeneralizations at: #NamedElement) name: aString
]

{ #category : #'accessing - NamedElement' }
BootUMLLiteralBoolean >> nameExpression [
	^ (sharedGeneralizations at: #NamedElement) nameExpression
]

{ #category : #'accessing - NamedElement' }
BootUMLLiteralBoolean >> nameExpression: aStringExpression [
	(sharedGeneralizations at: #NamedElement) nameExpression: aStringExpression
]

{ #category : #'accessing - PackageableElement' }
BootUMLLiteralBoolean >> namespace [
	^ (sharedGeneralizations at: #PackageableElement) namespace
]

{ #category : #'accessing - PackageableElement' }
BootUMLLiteralBoolean >> namespace: aNamespace [
	(sharedGeneralizations at: #PackageableElement) namespace: aNamespace
]

{ #category : #'accessing - Element' }
BootUMLLiteralBoolean >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : #'accessing - Element' }
BootUMLLiteralBoolean >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : #'accessing - Element' }
BootUMLLiteralBoolean >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : #'accessing - Element' }
BootUMLLiteralBoolean >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : #'accessing - Element' }
BootUMLLiteralBoolean >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : #'accessing - Element' }
BootUMLLiteralBoolean >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralBoolean >> owningConstraint [
	^ (sharedGeneralizations at: #ValueSpecification) owningConstraint
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralBoolean >> owningConstraint: aConstraint [
	(sharedGeneralizations at: #ValueSpecification) owningConstraint: aConstraint
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralBoolean >> owningInstanceSpec [
	^ (sharedGeneralizations at: #ValueSpecification) owningInstanceSpec
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralBoolean >> owningInstanceSpec: anInstanceSpecification [
	(sharedGeneralizations at: #ValueSpecification) owningInstanceSpec: anInstanceSpecification
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralBoolean >> owningLower [
	^ (sharedGeneralizations at: #ValueSpecification) owningLower
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralBoolean >> owningLower: aMultiplicityElement [
	(sharedGeneralizations at: #ValueSpecification) owningLower: aMultiplicityElement
]

{ #category : #'accessing - PackageableElement' }
BootUMLLiteralBoolean >> owningPackage [
	^ (sharedGeneralizations at: #PackageableElement) owningPackage
]

{ #category : #'accessing - PackageableElement' }
BootUMLLiteralBoolean >> owningPackage: aPackage [
	(sharedGeneralizations at: #PackageableElement) owningPackage: aPackage
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralBoolean >> owningParameter [
	^ (sharedGeneralizations at: #ValueSpecification) owningParameter
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralBoolean >> owningParameter: aParameter [
	(sharedGeneralizations at: #ValueSpecification) owningParameter: aParameter
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralBoolean >> owningProperty [
	^ (sharedGeneralizations at: #ValueSpecification) owningProperty
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralBoolean >> owningProperty: aProperty [
	(sharedGeneralizations at: #ValueSpecification) owningProperty: aProperty
]

{ #category : #'accessing - ParameterableElement' }
BootUMLLiteralBoolean >> owningTemplateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) owningTemplateParameter
]

{ #category : #'accessing - ParameterableElement' }
BootUMLLiteralBoolean >> owningTemplateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) owningTemplateParameter: aTemplateParameter
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralBoolean >> owningUpper [
	^ (sharedGeneralizations at: #ValueSpecification) owningUpper
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralBoolean >> owningUpper: aMultiplicityElement [
	(sharedGeneralizations at: #ValueSpecification) owningUpper: aMultiplicityElement
]

{ #category : #'accessing - NamedElement' }
BootUMLLiteralBoolean >> qualifiedName [
	^ (sharedGeneralizations at: #NamedElement) qualifiedName
]

{ #category : #'accessing - NamedElement' }
BootUMLLiteralBoolean >> qualifiedName: aString [
	(sharedGeneralizations at: #NamedElement) qualifiedName: aString
]

{ #category : #'accessing - Element' }
BootUMLLiteralBoolean >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : #'accessing - Element' }
BootUMLLiteralBoolean >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]

{ #category : #'accessing - ParameterableElement' }
BootUMLLiteralBoolean >> templateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) templateParameter
]

{ #category : #'accessing - ParameterableElement' }
BootUMLLiteralBoolean >> templateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) templateParameter: aTemplateParameter
]

{ #category : #'accessing - TypedElement' }
BootUMLLiteralBoolean >> type [
	^ (sharedGeneralizations at: #TypedElement) type
]

{ #category : #'accessing - TypedElement' }
BootUMLLiteralBoolean >> type: aType [
	(sharedGeneralizations at: #TypedElement) type: aType
]

{ #category : #accessing }
BootUMLLiteralBoolean >> value [
	^ value
]

{ #category : #accessing }
BootUMLLiteralBoolean >> value: aBoolean [
	value := aBoolean
]

{ #category : #'accessing - PackageableElement' }
BootUMLLiteralBoolean >> visibility [
	^ (sharedGeneralizations at: #PackageableElement) visibility
]

{ #category : #'accessing - PackageableElement' }
BootUMLLiteralBoolean >> visibility: aVisibilityKind [
	(sharedGeneralizations at: #PackageableElement) visibility: aVisibilityKind
]
