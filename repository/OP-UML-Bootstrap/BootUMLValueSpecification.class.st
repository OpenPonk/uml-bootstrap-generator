Class {
	#name : 'BootUMLValueSpecification',
	#superclass : 'OPUMLBootstrapObject',
	#instVars : [
		'owningUpper',
		'owningConstraint',
		'owningProperty',
		'owningInstanceSpec',
		'owningParameter',
		'owningLower'
	],
	#category : 'OP-UML-Bootstrap-Values',
	#package : 'OP-UML-Bootstrap',
	#tag : 'Values'
}

{ #category : 'accessing - NamedElement' }
BootUMLValueSpecification >> clientDependency [
	^ (sharedGeneralizations at: #NamedElement) clientDependency
]

{ #category : 'accessing - NamedElement' }
BootUMLValueSpecification >> clientDependency: aDependency [
	(sharedGeneralizations at: #NamedElement) clientDependency: aDependency
]

{ #category : 'accessing - Element' }
BootUMLValueSpecification >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : 'accessing - Element' }
BootUMLValueSpecification >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : 'accessing - Element' }
BootUMLValueSpecification >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : 'accessing - Element' }
BootUMLValueSpecification >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : 'accessing - PackageableElement' }
BootUMLValueSpecification >> deploymentTarget [
	^ (sharedGeneralizations at: #PackageableElement) deploymentTarget
]

{ #category : 'accessing - PackageableElement' }
BootUMLValueSpecification >> deploymentTarget: aDeploymentTarget [
	(sharedGeneralizations at: #PackageableElement) deploymentTarget: aDeploymentTarget
]

{ #category : 'accessing - Element' }
BootUMLValueSpecification >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : 'accessing - Element' }
BootUMLValueSpecification >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : 'accessing - NamedElement' }
BootUMLValueSpecification >> inheritingClassifier [
	^ (sharedGeneralizations at: #NamedElement) inheritingClassifier
]

{ #category : 'accessing - NamedElement' }
BootUMLValueSpecification >> inheritingClassifier: aClassifier [
	(sharedGeneralizations at: #NamedElement) inheritingClassifier: aClassifier
]

{ #category : 'initialization' }
BootUMLValueSpecification >> initialize [
	super initialize.
	sharedGeneralizations at: #Element put: (BootUMLElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #NamedElement put: (BootUMLNamedElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #ParameterableElement put: (BootUMLParameterableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #TypedElement put: (BootUMLTypedElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #PackageableElement put: (BootUMLPackageableElement newOnShared: sharedGeneralizations).
	self initializeGeneralizations.

]

{ #category : 'initialization' }
BootUMLValueSpecification >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #TypedElement.
		sharedGeneralizations at: #PackageableElement.
	}

]

{ #category : 'accessing - NamedElement' }
BootUMLValueSpecification >> memberNamespace [
	^ (sharedGeneralizations at: #NamedElement) memberNamespace
]

{ #category : 'accessing - NamedElement' }
BootUMLValueSpecification >> memberNamespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) memberNamespace: aNamespace
]

{ #category : 'accessing - NamedElement' }
BootUMLValueSpecification >> name [
	^ (sharedGeneralizations at: #NamedElement) name
]

{ #category : 'accessing - NamedElement' }
BootUMLValueSpecification >> name: aString [
	(sharedGeneralizations at: #NamedElement) name: aString
]

{ #category : 'accessing - NamedElement' }
BootUMLValueSpecification >> nameExpression [
	^ (sharedGeneralizations at: #NamedElement) nameExpression
]

{ #category : 'accessing - NamedElement' }
BootUMLValueSpecification >> nameExpression: aStringExpression [
	(sharedGeneralizations at: #NamedElement) nameExpression: aStringExpression
]

{ #category : 'accessing - PackageableElement' }
BootUMLValueSpecification >> namespace [
	^ (sharedGeneralizations at: #PackageableElement) namespace
]

{ #category : 'accessing - PackageableElement' }
BootUMLValueSpecification >> namespace: aNamespace [
	(sharedGeneralizations at: #PackageableElement) namespace: aNamespace
]

{ #category : 'accessing - Element' }
BootUMLValueSpecification >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : 'accessing - Element' }
BootUMLValueSpecification >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : 'accessing - Element' }
BootUMLValueSpecification >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : 'accessing - Element' }
BootUMLValueSpecification >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : 'accessing - Element' }
BootUMLValueSpecification >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : 'accessing - Element' }
BootUMLValueSpecification >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : 'accessing' }
BootUMLValueSpecification >> owningConstraint [
	^ owningConstraint
]

{ #category : 'accessing' }
BootUMLValueSpecification >> owningConstraint: aConstraint [
	owningConstraint := aConstraint
]

{ #category : 'accessing' }
BootUMLValueSpecification >> owningInstanceSpec [
	^ owningInstanceSpec
]

{ #category : 'accessing' }
BootUMLValueSpecification >> owningInstanceSpec: anInstanceSpecification [
	owningInstanceSpec := anInstanceSpecification
]

{ #category : 'accessing' }
BootUMLValueSpecification >> owningLower [
	^ owningLower
]

{ #category : 'accessing' }
BootUMLValueSpecification >> owningLower: aMultiplicityElement [
	owningLower := aMultiplicityElement
]

{ #category : 'accessing - PackageableElement' }
BootUMLValueSpecification >> owningPackage [
	^ (sharedGeneralizations at: #PackageableElement) owningPackage
]

{ #category : 'accessing - PackageableElement' }
BootUMLValueSpecification >> owningPackage: aPackage [
	(sharedGeneralizations at: #PackageableElement) owningPackage: aPackage
]

{ #category : 'accessing' }
BootUMLValueSpecification >> owningParameter [
	^ owningParameter
]

{ #category : 'accessing' }
BootUMLValueSpecification >> owningParameter: aParameter [
	owningParameter := aParameter
]

{ #category : 'accessing' }
BootUMLValueSpecification >> owningProperty [
	^ owningProperty
]

{ #category : 'accessing' }
BootUMLValueSpecification >> owningProperty: aProperty [
	owningProperty := aProperty
]

{ #category : 'accessing - ParameterableElement' }
BootUMLValueSpecification >> owningTemplateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) owningTemplateParameter
]

{ #category : 'accessing - ParameterableElement' }
BootUMLValueSpecification >> owningTemplateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) owningTemplateParameter: aTemplateParameter
]

{ #category : 'accessing' }
BootUMLValueSpecification >> owningUpper [
	^ owningUpper
]

{ #category : 'accessing' }
BootUMLValueSpecification >> owningUpper: aMultiplicityElement [
	owningUpper := aMultiplicityElement
]

{ #category : 'accessing - NamedElement' }
BootUMLValueSpecification >> qualifiedName [
	^ (sharedGeneralizations at: #NamedElement) qualifiedName
]

{ #category : 'accessing - NamedElement' }
BootUMLValueSpecification >> qualifiedName: aString [
	(sharedGeneralizations at: #NamedElement) qualifiedName: aString
]

{ #category : 'accessing - Element' }
BootUMLValueSpecification >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : 'accessing - Element' }
BootUMLValueSpecification >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]

{ #category : 'accessing - ParameterableElement' }
BootUMLValueSpecification >> templateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) templateParameter
]

{ #category : 'accessing - ParameterableElement' }
BootUMLValueSpecification >> templateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) templateParameter: aTemplateParameter
]

{ #category : 'accessing - TypedElement' }
BootUMLValueSpecification >> type [
	^ (sharedGeneralizations at: #TypedElement) type
]

{ #category : 'accessing - TypedElement' }
BootUMLValueSpecification >> type: aType [
	(sharedGeneralizations at: #TypedElement) type: aType
]

{ #category : 'accessing - PackageableElement' }
BootUMLValueSpecification >> visibility [
	^ (sharedGeneralizations at: #PackageableElement) visibility
]

{ #category : 'accessing - PackageableElement' }
BootUMLValueSpecification >> visibility: aVisibilityKind [
	(sharedGeneralizations at: #PackageableElement) visibility: aVisibilityKind
]
