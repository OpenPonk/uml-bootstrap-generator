Class {
	#name : #BootUMLLiteralUnlimitedNatural,
	#superclass : #OPUMLBootstrapObject,
	#instVars : [
		'value'
	],
	#category : 'OP-UML-Bootstrap-Values'
}

{ #category : #'accessing - NamedElement' }
BootUMLLiteralUnlimitedNatural >> clientDependency [
	^ (sharedGeneralizations at: #NamedElement) clientDependency
]

{ #category : #'accessing - NamedElement' }
BootUMLLiteralUnlimitedNatural >> clientDependency: aDependency [
	(sharedGeneralizations at: #NamedElement) clientDependency: aDependency
]

{ #category : #'accessing - Element' }
BootUMLLiteralUnlimitedNatural >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : #'accessing - Element' }
BootUMLLiteralUnlimitedNatural >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : #'accessing - Element' }
BootUMLLiteralUnlimitedNatural >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : #'accessing - Element' }
BootUMLLiteralUnlimitedNatural >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : #'accessing - PackageableElement' }
BootUMLLiteralUnlimitedNatural >> deploymentTarget [
	^ (sharedGeneralizations at: #PackageableElement) deploymentTarget
]

{ #category : #'accessing - PackageableElement' }
BootUMLLiteralUnlimitedNatural >> deploymentTarget: aDeploymentTarget [
	(sharedGeneralizations at: #PackageableElement) deploymentTarget: aDeploymentTarget
]

{ #category : #'accessing - Element' }
BootUMLLiteralUnlimitedNatural >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : #'accessing - Element' }
BootUMLLiteralUnlimitedNatural >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : #'accessing - NamedElement' }
BootUMLLiteralUnlimitedNatural >> inheritingClassifier [
	^ (sharedGeneralizations at: #NamedElement) inheritingClassifier
]

{ #category : #'accessing - NamedElement' }
BootUMLLiteralUnlimitedNatural >> inheritingClassifier: aClassifier [
	(sharedGeneralizations at: #NamedElement) inheritingClassifier: aClassifier
]

{ #category : #initialization }
BootUMLLiteralUnlimitedNatural >> initialize [
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
BootUMLLiteralUnlimitedNatural >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #LiteralSpecification.
	}

]

{ #category : #'accessing - NamedElement' }
BootUMLLiteralUnlimitedNatural >> memberNamespace [
	^ (sharedGeneralizations at: #NamedElement) memberNamespace
]

{ #category : #'accessing - NamedElement' }
BootUMLLiteralUnlimitedNatural >> memberNamespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) memberNamespace: aNamespace
]

{ #category : #'accessing - NamedElement' }
BootUMLLiteralUnlimitedNatural >> name [
	^ (sharedGeneralizations at: #NamedElement) name
]

{ #category : #'accessing - NamedElement' }
BootUMLLiteralUnlimitedNatural >> name: aString [
	(sharedGeneralizations at: #NamedElement) name: aString
]

{ #category : #'accessing - NamedElement' }
BootUMLLiteralUnlimitedNatural >> nameExpression [
	^ (sharedGeneralizations at: #NamedElement) nameExpression
]

{ #category : #'accessing - NamedElement' }
BootUMLLiteralUnlimitedNatural >> nameExpression: aStringExpression [
	(sharedGeneralizations at: #NamedElement) nameExpression: aStringExpression
]

{ #category : #'accessing - PackageableElement' }
BootUMLLiteralUnlimitedNatural >> namespace [
	^ (sharedGeneralizations at: #PackageableElement) namespace
]

{ #category : #'accessing - PackageableElement' }
BootUMLLiteralUnlimitedNatural >> namespace: aNamespace [
	(sharedGeneralizations at: #PackageableElement) namespace: aNamespace
]

{ #category : #'accessing - Element' }
BootUMLLiteralUnlimitedNatural >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : #'accessing - Element' }
BootUMLLiteralUnlimitedNatural >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : #'accessing - Element' }
BootUMLLiteralUnlimitedNatural >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : #'accessing - Element' }
BootUMLLiteralUnlimitedNatural >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : #'accessing - Element' }
BootUMLLiteralUnlimitedNatural >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : #'accessing - Element' }
BootUMLLiteralUnlimitedNatural >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralUnlimitedNatural >> owningConstraint [
	^ (sharedGeneralizations at: #ValueSpecification) owningConstraint
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralUnlimitedNatural >> owningConstraint: aConstraint [
	(sharedGeneralizations at: #ValueSpecification) owningConstraint: aConstraint
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralUnlimitedNatural >> owningInstanceSpec [
	^ (sharedGeneralizations at: #ValueSpecification) owningInstanceSpec
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralUnlimitedNatural >> owningInstanceSpec: anInstanceSpecification [
	(sharedGeneralizations at: #ValueSpecification) owningInstanceSpec: anInstanceSpecification
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralUnlimitedNatural >> owningLower [
	^ (sharedGeneralizations at: #ValueSpecification) owningLower
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralUnlimitedNatural >> owningLower: aMultiplicityElement [
	(sharedGeneralizations at: #ValueSpecification) owningLower: aMultiplicityElement
]

{ #category : #'accessing - PackageableElement' }
BootUMLLiteralUnlimitedNatural >> owningPackage [
	^ (sharedGeneralizations at: #PackageableElement) owningPackage
]

{ #category : #'accessing - PackageableElement' }
BootUMLLiteralUnlimitedNatural >> owningPackage: aPackage [
	(sharedGeneralizations at: #PackageableElement) owningPackage: aPackage
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralUnlimitedNatural >> owningParameter [
	^ (sharedGeneralizations at: #ValueSpecification) owningParameter
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralUnlimitedNatural >> owningParameter: aParameter [
	(sharedGeneralizations at: #ValueSpecification) owningParameter: aParameter
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralUnlimitedNatural >> owningProperty [
	^ (sharedGeneralizations at: #ValueSpecification) owningProperty
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralUnlimitedNatural >> owningProperty: aProperty [
	(sharedGeneralizations at: #ValueSpecification) owningProperty: aProperty
]

{ #category : #'accessing - ParameterableElement' }
BootUMLLiteralUnlimitedNatural >> owningTemplateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) owningTemplateParameter
]

{ #category : #'accessing - ParameterableElement' }
BootUMLLiteralUnlimitedNatural >> owningTemplateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) owningTemplateParameter: aTemplateParameter
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralUnlimitedNatural >> owningUpper [
	^ (sharedGeneralizations at: #ValueSpecification) owningUpper
]

{ #category : #'accessing - ValueSpecification' }
BootUMLLiteralUnlimitedNatural >> owningUpper: aMultiplicityElement [
	(sharedGeneralizations at: #ValueSpecification) owningUpper: aMultiplicityElement
]

{ #category : #'accessing - NamedElement' }
BootUMLLiteralUnlimitedNatural >> qualifiedName [
	^ (sharedGeneralizations at: #NamedElement) qualifiedName
]

{ #category : #'accessing - NamedElement' }
BootUMLLiteralUnlimitedNatural >> qualifiedName: aString [
	(sharedGeneralizations at: #NamedElement) qualifiedName: aString
]

{ #category : #'accessing - Element' }
BootUMLLiteralUnlimitedNatural >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : #'accessing - Element' }
BootUMLLiteralUnlimitedNatural >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]

{ #category : #'accessing - ParameterableElement' }
BootUMLLiteralUnlimitedNatural >> templateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) templateParameter
]

{ #category : #'accessing - ParameterableElement' }
BootUMLLiteralUnlimitedNatural >> templateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) templateParameter: aTemplateParameter
]

{ #category : #'accessing - TypedElement' }
BootUMLLiteralUnlimitedNatural >> type [
	^ (sharedGeneralizations at: #TypedElement) type
]

{ #category : #'accessing - TypedElement' }
BootUMLLiteralUnlimitedNatural >> type: aType [
	(sharedGeneralizations at: #TypedElement) type: aType
]

{ #category : #accessing }
BootUMLLiteralUnlimitedNatural >> value [
	^ value
]

{ #category : #accessing }
BootUMLLiteralUnlimitedNatural >> value: anUnlimitedNatural [
	value := anUnlimitedNatural
]

{ #category : #'accessing - PackageableElement' }
BootUMLLiteralUnlimitedNatural >> visibility [
	^ (sharedGeneralizations at: #PackageableElement) visibility
]

{ #category : #'accessing - PackageableElement' }
BootUMLLiteralUnlimitedNatural >> visibility: aVisibilityKind [
	(sharedGeneralizations at: #PackageableElement) visibility: aVisibilityKind
]
