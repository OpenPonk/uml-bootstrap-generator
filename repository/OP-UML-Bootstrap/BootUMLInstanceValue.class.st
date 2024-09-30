Class {
	#name : 'BootUMLInstanceValue',
	#superclass : 'OPUMLBootstrapObject',
	#instVars : [
		'instance'
	],
	#category : 'OP-UML-Bootstrap-Classification',
	#package : 'OP-UML-Bootstrap',
	#tag : 'Classification'
}

{ #category : 'accessing - NamedElement' }
BootUMLInstanceValue >> clientDependency [
	^ (sharedGeneralizations at: #NamedElement) clientDependency
]

{ #category : 'accessing - NamedElement' }
BootUMLInstanceValue >> clientDependency: aDependency [
	(sharedGeneralizations at: #NamedElement) clientDependency: aDependency
]

{ #category : 'accessing - Element' }
BootUMLInstanceValue >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : 'accessing - Element' }
BootUMLInstanceValue >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : 'accessing - Element' }
BootUMLInstanceValue >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : 'accessing - Element' }
BootUMLInstanceValue >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : 'accessing - PackageableElement' }
BootUMLInstanceValue >> deploymentTarget [
	^ (sharedGeneralizations at: #PackageableElement) deploymentTarget
]

{ #category : 'accessing - PackageableElement' }
BootUMLInstanceValue >> deploymentTarget: aDeploymentTarget [
	(sharedGeneralizations at: #PackageableElement) deploymentTarget: aDeploymentTarget
]

{ #category : 'accessing - Element' }
BootUMLInstanceValue >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : 'accessing - Element' }
BootUMLInstanceValue >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : 'accessing - NamedElement' }
BootUMLInstanceValue >> inheritingClassifier [
	^ (sharedGeneralizations at: #NamedElement) inheritingClassifier
]

{ #category : 'accessing - NamedElement' }
BootUMLInstanceValue >> inheritingClassifier: aClassifier [
	(sharedGeneralizations at: #NamedElement) inheritingClassifier: aClassifier
]

{ #category : 'initialization' }
BootUMLInstanceValue >> initialize [
	super initialize.
	sharedGeneralizations at: #Element put: (BootUMLElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #NamedElement put: (BootUMLNamedElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #ParameterableElement put: (BootUMLParameterableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #TypedElement put: (BootUMLTypedElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #PackageableElement put: (BootUMLPackageableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #ValueSpecification put: (BootUMLValueSpecification newOnShared: sharedGeneralizations).
	self initializeGeneralizations.

]

{ #category : 'initialization' }
BootUMLInstanceValue >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #ValueSpecification.
	}

]

{ #category : 'accessing' }
BootUMLInstanceValue >> instance [
	^ instance
]

{ #category : 'accessing' }
BootUMLInstanceValue >> instance: anInstanceSpecification [
	instance := anInstanceSpecification
]

{ #category : 'accessing - NamedElement' }
BootUMLInstanceValue >> memberNamespace [
	^ (sharedGeneralizations at: #NamedElement) memberNamespace
]

{ #category : 'accessing - NamedElement' }
BootUMLInstanceValue >> memberNamespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) memberNamespace: aNamespace
]

{ #category : 'accessing - NamedElement' }
BootUMLInstanceValue >> name [
	^ (sharedGeneralizations at: #NamedElement) name
]

{ #category : 'accessing - NamedElement' }
BootUMLInstanceValue >> name: aString [
	(sharedGeneralizations at: #NamedElement) name: aString
]

{ #category : 'accessing - NamedElement' }
BootUMLInstanceValue >> nameExpression [
	^ (sharedGeneralizations at: #NamedElement) nameExpression
]

{ #category : 'accessing - NamedElement' }
BootUMLInstanceValue >> nameExpression: aStringExpression [
	(sharedGeneralizations at: #NamedElement) nameExpression: aStringExpression
]

{ #category : 'accessing - NamedElement' }
BootUMLInstanceValue >> namespace [
	^ (sharedGeneralizations at: #NamedElement) namespace
]

{ #category : 'accessing - NamedElement' }
BootUMLInstanceValue >> namespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) namespace: aNamespace
]

{ #category : 'accessing - Element' }
BootUMLInstanceValue >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : 'accessing - Element' }
BootUMLInstanceValue >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : 'accessing - Element' }
BootUMLInstanceValue >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : 'accessing - Element' }
BootUMLInstanceValue >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : 'accessing - Element' }
BootUMLInstanceValue >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : 'accessing - Element' }
BootUMLInstanceValue >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : 'accessing - ValueSpecification' }
BootUMLInstanceValue >> owningConstraint [
	^ (sharedGeneralizations at: #ValueSpecification) owningConstraint
]

{ #category : 'accessing - ValueSpecification' }
BootUMLInstanceValue >> owningConstraint: aConstraint [
	(sharedGeneralizations at: #ValueSpecification) owningConstraint: aConstraint
]

{ #category : 'accessing - ValueSpecification' }
BootUMLInstanceValue >> owningInstanceSpec [
	^ (sharedGeneralizations at: #ValueSpecification) owningInstanceSpec
]

{ #category : 'accessing - ValueSpecification' }
BootUMLInstanceValue >> owningInstanceSpec: anInstanceSpecification [
	(sharedGeneralizations at: #ValueSpecification) owningInstanceSpec: anInstanceSpecification
]

{ #category : 'accessing - ValueSpecification' }
BootUMLInstanceValue >> owningLower [
	^ (sharedGeneralizations at: #ValueSpecification) owningLower
]

{ #category : 'accessing - ValueSpecification' }
BootUMLInstanceValue >> owningLower: aMultiplicityElement [
	(sharedGeneralizations at: #ValueSpecification) owningLower: aMultiplicityElement
]

{ #category : 'accessing - PackageableElement' }
BootUMLInstanceValue >> owningPackage [
	^ (sharedGeneralizations at: #PackageableElement) owningPackage
]

{ #category : 'accessing - PackageableElement' }
BootUMLInstanceValue >> owningPackage: aPackage [
	(sharedGeneralizations at: #PackageableElement) owningPackage: aPackage
]

{ #category : 'accessing - ValueSpecification' }
BootUMLInstanceValue >> owningParameter [
	^ (sharedGeneralizations at: #ValueSpecification) owningParameter
]

{ #category : 'accessing - ValueSpecification' }
BootUMLInstanceValue >> owningParameter: aParameter [
	(sharedGeneralizations at: #ValueSpecification) owningParameter: aParameter
]

{ #category : 'accessing - ValueSpecification' }
BootUMLInstanceValue >> owningProperty [
	^ (sharedGeneralizations at: #ValueSpecification) owningProperty
]

{ #category : 'accessing - ValueSpecification' }
BootUMLInstanceValue >> owningProperty: aProperty [
	(sharedGeneralizations at: #ValueSpecification) owningProperty: aProperty
]

{ #category : 'accessing - ParameterableElement' }
BootUMLInstanceValue >> owningTemplateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) owningTemplateParameter
]

{ #category : 'accessing - ParameterableElement' }
BootUMLInstanceValue >> owningTemplateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) owningTemplateParameter: aTemplateParameter
]

{ #category : 'accessing - ValueSpecification' }
BootUMLInstanceValue >> owningUpper [
	^ (sharedGeneralizations at: #ValueSpecification) owningUpper
]

{ #category : 'accessing - ValueSpecification' }
BootUMLInstanceValue >> owningUpper: aMultiplicityElement [
	(sharedGeneralizations at: #ValueSpecification) owningUpper: aMultiplicityElement
]

{ #category : 'accessing - NamedElement' }
BootUMLInstanceValue >> qualifiedName [
	^ (sharedGeneralizations at: #NamedElement) qualifiedName
]

{ #category : 'accessing - NamedElement' }
BootUMLInstanceValue >> qualifiedName: aString [
	(sharedGeneralizations at: #NamedElement) qualifiedName: aString
]

{ #category : 'accessing - Element' }
BootUMLInstanceValue >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : 'accessing - Element' }
BootUMLInstanceValue >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]

{ #category : 'accessing - ParameterableElement' }
BootUMLInstanceValue >> templateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) templateParameter
]

{ #category : 'accessing - ParameterableElement' }
BootUMLInstanceValue >> templateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) templateParameter: aTemplateParameter
]

{ #category : 'accessing - TypedElement' }
BootUMLInstanceValue >> type [
	^ (sharedGeneralizations at: #TypedElement) type
]

{ #category : 'accessing - TypedElement' }
BootUMLInstanceValue >> type: aType [
	(sharedGeneralizations at: #TypedElement) type: aType
]

{ #category : 'accessing - NamedElement' }
BootUMLInstanceValue >> visibility [
	^ (sharedGeneralizations at: #NamedElement) visibility
]

{ #category : 'accessing - NamedElement' }
BootUMLInstanceValue >> visibility: aVisibilityKind [
	(sharedGeneralizations at: #NamedElement) visibility: aVisibilityKind
]
