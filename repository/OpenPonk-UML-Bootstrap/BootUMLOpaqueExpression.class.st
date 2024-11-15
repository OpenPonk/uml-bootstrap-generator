Class {
	#name : 'BootUMLOpaqueExpression',
	#superclass : 'OPUMLBootstrapObject',
	#instVars : [
		'behavior',
		'language',
		'body',
		'result'
	],
	#category : 'OpenPonk-UML-Bootstrap-Values',
	#package : 'OpenPonk-UML-Bootstrap',
	#tag : 'Values'
}

{ #category : 'accessing' }
BootUMLOpaqueExpression >> behavior [
	^ behavior
]

{ #category : 'accessing' }
BootUMLOpaqueExpression >> behavior: aBehavior [
	behavior := aBehavior
]

{ #category : 'accessing' }
BootUMLOpaqueExpression >> body [
	^ body
]

{ #category : 'accessing' }
BootUMLOpaqueExpression >> body: aString [
	body := aString
]

{ #category : 'accessing - NamedElement' }
BootUMLOpaqueExpression >> clientDependency [
	^ (sharedGeneralizations at: #NamedElement) clientDependency
]

{ #category : 'accessing - NamedElement' }
BootUMLOpaqueExpression >> clientDependency: aDependency [
	(sharedGeneralizations at: #NamedElement) clientDependency: aDependency
]

{ #category : 'accessing - Element' }
BootUMLOpaqueExpression >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : 'accessing - Element' }
BootUMLOpaqueExpression >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : 'accessing - Element' }
BootUMLOpaqueExpression >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : 'accessing - Element' }
BootUMLOpaqueExpression >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : 'accessing - PackageableElement' }
BootUMLOpaqueExpression >> deploymentTarget [
	^ (sharedGeneralizations at: #PackageableElement) deploymentTarget
]

{ #category : 'accessing - PackageableElement' }
BootUMLOpaqueExpression >> deploymentTarget: aDeploymentTarget [
	(sharedGeneralizations at: #PackageableElement) deploymentTarget: aDeploymentTarget
]

{ #category : 'accessing - Element' }
BootUMLOpaqueExpression >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : 'accessing - Element' }
BootUMLOpaqueExpression >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : 'accessing - NamedElement' }
BootUMLOpaqueExpression >> inheritingClassifier [
	^ (sharedGeneralizations at: #NamedElement) inheritingClassifier
]

{ #category : 'accessing - NamedElement' }
BootUMLOpaqueExpression >> inheritingClassifier: aClassifier [
	(sharedGeneralizations at: #NamedElement) inheritingClassifier: aClassifier
]

{ #category : 'initialization' }
BootUMLOpaqueExpression >> initialize [
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
BootUMLOpaqueExpression >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #ValueSpecification.
	}

]

{ #category : 'accessing' }
BootUMLOpaqueExpression >> language [
	^ language
]

{ #category : 'accessing' }
BootUMLOpaqueExpression >> language: aString [
	language := aString
]

{ #category : 'accessing - NamedElement' }
BootUMLOpaqueExpression >> memberNamespace [
	^ (sharedGeneralizations at: #NamedElement) memberNamespace
]

{ #category : 'accessing - NamedElement' }
BootUMLOpaqueExpression >> memberNamespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) memberNamespace: aNamespace
]

{ #category : 'accessing - NamedElement' }
BootUMLOpaqueExpression >> name [
	^ (sharedGeneralizations at: #NamedElement) name
]

{ #category : 'accessing - NamedElement' }
BootUMLOpaqueExpression >> name: aString [
	(sharedGeneralizations at: #NamedElement) name: aString
]

{ #category : 'accessing - NamedElement' }
BootUMLOpaqueExpression >> nameExpression [
	^ (sharedGeneralizations at: #NamedElement) nameExpression
]

{ #category : 'accessing - NamedElement' }
BootUMLOpaqueExpression >> nameExpression: aStringExpression [
	(sharedGeneralizations at: #NamedElement) nameExpression: aStringExpression
]

{ #category : 'accessing - PackageableElement' }
BootUMLOpaqueExpression >> namespace [
	^ (sharedGeneralizations at: #PackageableElement) namespace
]

{ #category : 'accessing - PackageableElement' }
BootUMLOpaqueExpression >> namespace: aNamespace [
	(sharedGeneralizations at: #PackageableElement) namespace: aNamespace
]

{ #category : 'accessing - Element' }
BootUMLOpaqueExpression >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : 'accessing - Element' }
BootUMLOpaqueExpression >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : 'accessing - Element' }
BootUMLOpaqueExpression >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : 'accessing - Element' }
BootUMLOpaqueExpression >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : 'accessing - Element' }
BootUMLOpaqueExpression >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : 'accessing - Element' }
BootUMLOpaqueExpression >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : 'accessing - ValueSpecification' }
BootUMLOpaqueExpression >> owningConstraint [
	^ (sharedGeneralizations at: #ValueSpecification) owningConstraint
]

{ #category : 'accessing - ValueSpecification' }
BootUMLOpaqueExpression >> owningConstraint: aConstraint [
	(sharedGeneralizations at: #ValueSpecification) owningConstraint: aConstraint
]

{ #category : 'accessing - ValueSpecification' }
BootUMLOpaqueExpression >> owningInstanceSpec [
	^ (sharedGeneralizations at: #ValueSpecification) owningInstanceSpec
]

{ #category : 'accessing - ValueSpecification' }
BootUMLOpaqueExpression >> owningInstanceSpec: anInstanceSpecification [
	(sharedGeneralizations at: #ValueSpecification) owningInstanceSpec: anInstanceSpecification
]

{ #category : 'accessing - ValueSpecification' }
BootUMLOpaqueExpression >> owningLower [
	^ (sharedGeneralizations at: #ValueSpecification) owningLower
]

{ #category : 'accessing - ValueSpecification' }
BootUMLOpaqueExpression >> owningLower: aMultiplicityElement [
	(sharedGeneralizations at: #ValueSpecification) owningLower: aMultiplicityElement
]

{ #category : 'accessing - PackageableElement' }
BootUMLOpaqueExpression >> owningPackage [
	^ (sharedGeneralizations at: #PackageableElement) owningPackage
]

{ #category : 'accessing - PackageableElement' }
BootUMLOpaqueExpression >> owningPackage: aPackage [
	(sharedGeneralizations at: #PackageableElement) owningPackage: aPackage
]

{ #category : 'accessing - ValueSpecification' }
BootUMLOpaqueExpression >> owningParameter [
	^ (sharedGeneralizations at: #ValueSpecification) owningParameter
]

{ #category : 'accessing - ValueSpecification' }
BootUMLOpaqueExpression >> owningParameter: aParameter [
	(sharedGeneralizations at: #ValueSpecification) owningParameter: aParameter
]

{ #category : 'accessing - ValueSpecification' }
BootUMLOpaqueExpression >> owningProperty [
	^ (sharedGeneralizations at: #ValueSpecification) owningProperty
]

{ #category : 'accessing - ValueSpecification' }
BootUMLOpaqueExpression >> owningProperty: aProperty [
	(sharedGeneralizations at: #ValueSpecification) owningProperty: aProperty
]

{ #category : 'accessing - ParameterableElement' }
BootUMLOpaqueExpression >> owningTemplateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) owningTemplateParameter
]

{ #category : 'accessing - ParameterableElement' }
BootUMLOpaqueExpression >> owningTemplateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) owningTemplateParameter: aTemplateParameter
]

{ #category : 'accessing - ValueSpecification' }
BootUMLOpaqueExpression >> owningUpper [
	^ (sharedGeneralizations at: #ValueSpecification) owningUpper
]

{ #category : 'accessing - ValueSpecification' }
BootUMLOpaqueExpression >> owningUpper: aMultiplicityElement [
	(sharedGeneralizations at: #ValueSpecification) owningUpper: aMultiplicityElement
]

{ #category : 'accessing - NamedElement' }
BootUMLOpaqueExpression >> qualifiedName [
	^ (sharedGeneralizations at: #NamedElement) qualifiedName
]

{ #category : 'accessing - NamedElement' }
BootUMLOpaqueExpression >> qualifiedName: aString [
	(sharedGeneralizations at: #NamedElement) qualifiedName: aString
]

{ #category : 'accessing - Element' }
BootUMLOpaqueExpression >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : 'accessing - Element' }
BootUMLOpaqueExpression >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]

{ #category : 'accessing' }
BootUMLOpaqueExpression >> result [
	^ result
]

{ #category : 'accessing' }
BootUMLOpaqueExpression >> result: aParameter [
	result := aParameter
]

{ #category : 'accessing - ParameterableElement' }
BootUMLOpaqueExpression >> templateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) templateParameter
]

{ #category : 'accessing - ParameterableElement' }
BootUMLOpaqueExpression >> templateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) templateParameter: aTemplateParameter
]

{ #category : 'accessing - TypedElement' }
BootUMLOpaqueExpression >> type [
	^ (sharedGeneralizations at: #TypedElement) type
]

{ #category : 'accessing - TypedElement' }
BootUMLOpaqueExpression >> type: aType [
	(sharedGeneralizations at: #TypedElement) type: aType
]

{ #category : 'accessing - PackageableElement' }
BootUMLOpaqueExpression >> visibility [
	^ (sharedGeneralizations at: #PackageableElement) visibility
]

{ #category : 'accessing - PackageableElement' }
BootUMLOpaqueExpression >> visibility: aVisibilityKind [
	(sharedGeneralizations at: #PackageableElement) visibility: aVisibilityKind
]
