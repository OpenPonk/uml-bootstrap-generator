Class {
	#name : #BootUMLLiteralInteger,
	#superclass : #OPUMLBootstrapObject,
	#instVars : [
		'value'
	],
	#category : 'OP-UML-Bootstrap-Values'
}

{ #category : #'accessing - NamedElement' }
BootUMLLiteralInteger >> clientDependency [
	^ (sharedGeneralizations at: #NamedElement) clientDependency
]

{ #category : #'accessing - NamedElement' }
BootUMLLiteralInteger >> clientDependency: aDependency [
	(sharedGeneralizations at: #NamedElement) clientDependency: aDependency
]

{ #category : #'accessing - Element' }
BootUMLLiteralInteger >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : #'accessing - Element' }
BootUMLLiteralInteger >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : #'accessing - Element' }
BootUMLLiteralInteger >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : #'accessing - Element' }
BootUMLLiteralInteger >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : #'accessing - PackageableElement' }
BootUMLLiteralInteger >> deploymentTarget [
	^ (sharedGeneralizations at: #PackageableElement) deploymentTarget
]

{ #category : #'accessing - PackageableElement' }
BootUMLLiteralInteger >> deploymentTarget: aDeploymentTarget [
	(sharedGeneralizations at: #PackageableElement) deploymentTarget: aDeploymentTarget
]

{ #category : #'accessing - Element' }
BootUMLLiteralInteger >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : #'accessing - Element' }
BootUMLLiteralInteger >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : #'accessing - NamedElement' }
BootUMLLiteralInteger >> inheritingClassifier [
	^ (sharedGeneralizations at: #NamedElement) inheritingClassifier
]

{ #category : #'accessing - NamedElement' }
BootUMLLiteralInteger >> inheritingClassifier: aClassifier [
	(sharedGeneralizations at: #NamedElement) inheritingClassifier: aClassifier
]

{ #category : #initialization }
BootUMLLiteralInteger >> initialize [
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
BootUMLLiteralInteger >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #LiteralSpecification.
	}

]

{ #category : #'accessing - NamedElement' }
BootUMLLiteralInteger >> memberNamespace [
	^ (sharedGeneralizations at: #NamedElement) memberNamespace
]

{ #category : #'accessing - NamedElement' }
BootUMLLiteralInteger >> memberNamespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) memberNamespace: aNamespace
]

{ #category : #'accessing - NamedElement' }
BootUMLLiteralInteger >> name [
	^ (sharedGeneralizations at: #NamedElement) name
]

{ #category : #'accessing - NamedElement' }
BootUMLLiteralInteger >> name: aString [
	(sharedGeneralizations at: #NamedElement) name: aString
]

{ #category : #'accessing - NamedElement' }
BootUMLLiteralInteger >> nameExpression [
	^ (sharedGeneralizations at: #NamedElement) nameExpression
]

{ #category : #'accessing - NamedElement' }
BootUMLLiteralInteger >> nameExpression: aStringExpression [
	(sharedGeneralizations at: #NamedElement) nameExpression: aStringExpression
]

{ #category : #'accessing - PackageableElement' }
BootUMLLiteralInteger >> namespace [
	^ (sharedGeneralizations at: #PackageableElement) namespace
]

{ #category : #'accessing - PackageableElement' }
BootUMLLiteralInteger >> namespace: aNamespace [
	(sharedGeneralizations at: #PackageableElement) namespace: aNamespace
]

{ #category : #'accessing - Element' }
BootUMLLiteralInteger >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : #'accessing - Element' }
BootUMLLiteralInteger >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : #'accessing - Element' }
BootUMLLiteralInteger >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : #'accessing - Element' }
BootUMLLiteralInteger >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : #'accessing - Element' }
BootUMLLiteralInteger >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : #'accessing - Element' }
BootUMLLiteralInteger >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralInteger >> owningConstraint [
	^ (sharedGeneralizations at: #ValueSpecification) owningConstraint
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralInteger >> owningConstraint: aConstraint [
	(sharedGeneralizations at: #ValueSpecification) owningConstraint: aConstraint
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralInteger >> owningInstanceSpec [
	^ (sharedGeneralizations at: #ValueSpecification) owningInstanceSpec
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralInteger >> owningInstanceSpec: anInstanceSpecification [
	(sharedGeneralizations at: #ValueSpecification) owningInstanceSpec: anInstanceSpecification
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralInteger >> owningLower [
	^ (sharedGeneralizations at: #ValueSpecification) owningLower
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralInteger >> owningLower: aMultiplicityElement [
	(sharedGeneralizations at: #ValueSpecification) owningLower: aMultiplicityElement
]

{ #category : #'accessing - PackageableElement' }
BootUMLLiteralInteger >> owningPackage [
	^ (sharedGeneralizations at: #PackageableElement) owningPackage
]

{ #category : #'accessing - PackageableElement' }
BootUMLLiteralInteger >> owningPackage: aPackage [
	(sharedGeneralizations at: #PackageableElement) owningPackage: aPackage
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralInteger >> owningParameter [
	^ (sharedGeneralizations at: #ValueSpecification) owningParameter
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralInteger >> owningParameter: aParameter [
	(sharedGeneralizations at: #ValueSpecification) owningParameter: aParameter
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralInteger >> owningProperty [
	^ (sharedGeneralizations at: #ValueSpecification) owningProperty
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralInteger >> owningProperty: aProperty [
	(sharedGeneralizations at: #ValueSpecification) owningProperty: aProperty
]

{ #category : #'accessing - ParameterableElement' }
BootUMLLiteralInteger >> owningTemplateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) owningTemplateParameter
]

{ #category : #'accessing - ParameterableElement' }
BootUMLLiteralInteger >> owningTemplateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) owningTemplateParameter: aTemplateParameter
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralInteger >> owningUpper [
	^ (sharedGeneralizations at: #ValueSpecification) owningUpper
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralInteger >> owningUpper: aMultiplicityElement [
	(sharedGeneralizations at: #ValueSpecification) owningUpper: aMultiplicityElement
]

{ #category : #'accessing - NamedElement' }
BootUMLLiteralInteger >> qualifiedName [
	^ (sharedGeneralizations at: #NamedElement) qualifiedName
]

{ #category : #'accessing - NamedElement' }
BootUMLLiteralInteger >> qualifiedName: aString [
	(sharedGeneralizations at: #NamedElement) qualifiedName: aString
]

{ #category : #'accessing - Element' }
BootUMLLiteralInteger >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : #'accessing - Element' }
BootUMLLiteralInteger >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]

{ #category : #'accessing - ParameterableElement' }
BootUMLLiteralInteger >> templateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) templateParameter
]

{ #category : #'accessing - ParameterableElement' }
BootUMLLiteralInteger >> templateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) templateParameter: aTemplateParameter
]

{ #category : #'accessing - TypedElement' }
BootUMLLiteralInteger >> type [
	^ (sharedGeneralizations at: #TypedElement) type
]

{ #category : #'accessing - TypedElement' }
BootUMLLiteralInteger >> type: aType [
	(sharedGeneralizations at: #TypedElement) type: aType
]

{ #category : #accessing }
BootUMLLiteralInteger >> value [
	^ value
]

{ #category : #accessing }
BootUMLLiteralInteger >> value: anInteger [
	value := anInteger
]

{ #category : #'accessing - PackageableElement' }
BootUMLLiteralInteger >> visibility [
	^ (sharedGeneralizations at: #PackageableElement) visibility
]

{ #category : #'accessing - PackageableElement' }
BootUMLLiteralInteger >> visibility: aVisibilityKind [
	(sharedGeneralizations at: #PackageableElement) visibility: aVisibilityKind
]
