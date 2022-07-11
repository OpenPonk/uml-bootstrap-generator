Class {
	#name : #BootUMLEnumerationLiteral,
	#superclass : #OPUMLBootstrapObject,
	#instVars : [
		'classifier',
		'enumeration'
	],
	#category : 'OP-UML-Bootstrap-SimpleClassifiers'
}

{ #category : #'accessing - InstanceSpecification' }
BootUMLEnumerationLiteral >> classifier [
	^ (sharedGeneralizations at: #InstanceSpecification) classifier
]

{ #category : #'accessing - InstanceSpecification' }
BootUMLEnumerationLiteral >> classifier: aClassifier [
	(sharedGeneralizations at: #InstanceSpecification) classifier: aClassifier
]

{ #category : #'accessing - NamedElement' }
BootUMLEnumerationLiteral >> clientDependency [
	^ (sharedGeneralizations at: #NamedElement) clientDependency
]

{ #category : #'accessing - NamedElement' }
BootUMLEnumerationLiteral >> clientDependency: aDependency [
	(sharedGeneralizations at: #NamedElement) clientDependency: aDependency
]

{ #category : #'accessing - Element' }
BootUMLEnumerationLiteral >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : #'accessing - Element' }
BootUMLEnumerationLiteral >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : #'accessing - Element' }
BootUMLEnumerationLiteral >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : #'accessing - Element' }
BootUMLEnumerationLiteral >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : #'accessing - DeploymentTarget' }
BootUMLEnumerationLiteral >> deployedElement [
	^ (sharedGeneralizations at: #DeploymentTarget) deployedElement
]

{ #category : #'accessing - DeploymentTarget' }
BootUMLEnumerationLiteral >> deployedElement: aPackageableElement [
	(sharedGeneralizations at: #DeploymentTarget) deployedElement: aPackageableElement
]

{ #category : #'accessing - DeploymentTarget' }
BootUMLEnumerationLiteral >> deployment [
	^ (sharedGeneralizations at: #DeploymentTarget) deployment
]

{ #category : #'accessing - DeploymentTarget' }
BootUMLEnumerationLiteral >> deployment: aDeployment [
	(sharedGeneralizations at: #DeploymentTarget) deployment: aDeployment
]

{ #category : #'accessing - PackageableElement' }
BootUMLEnumerationLiteral >> deploymentTarget [
	^ (sharedGeneralizations at: #PackageableElement) deploymentTarget
]

{ #category : #'accessing - PackageableElement' }
BootUMLEnumerationLiteral >> deploymentTarget: aDeploymentTarget [
	(sharedGeneralizations at: #PackageableElement) deploymentTarget: aDeploymentTarget
]

{ #category : #'accessing - Element' }
BootUMLEnumerationLiteral >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : #'accessing - Element' }
BootUMLEnumerationLiteral >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : #accessing }
BootUMLEnumerationLiteral >> enumeration [
	^ enumeration
]

{ #category : #accessing }
BootUMLEnumerationLiteral >> enumeration: anEnumeration [
	enumeration := anEnumeration
]

{ #category : #'accessing - NamedElement' }
BootUMLEnumerationLiteral >> inheritingClassifier [
	^ (sharedGeneralizations at: #NamedElement) inheritingClassifier
]

{ #category : #'accessing - NamedElement' }
BootUMLEnumerationLiteral >> inheritingClassifier: aClassifier [
	(sharedGeneralizations at: #NamedElement) inheritingClassifier: aClassifier
]

{ #category : #initialization }
BootUMLEnumerationLiteral >> initialize [
	super initialize.
	sharedGeneralizations at: #Element put: (BootUMLElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #NamedElement put: (BootUMLNamedElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #ParameterableElement put: (BootUMLParameterableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #DeploymentTarget put: (BootUMLDeploymentTarget newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #PackageableElement put: (BootUMLPackageableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #DeployedArtifact put: (BootUMLDeployedArtifact newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #InstanceSpecification put: (BootUMLInstanceSpecification newOnShared: sharedGeneralizations).
	self initializeGeneralizations.

]

{ #category : #initialization }
BootUMLEnumerationLiteral >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #InstanceSpecification.
	}

]

{ #category : #'accessing - InstanceSpecification' }
BootUMLEnumerationLiteral >> instanceValue [
	^ (sharedGeneralizations at: #InstanceSpecification) instanceValue
]

{ #category : #'accessing - InstanceSpecification' }
BootUMLEnumerationLiteral >> instanceValue: anInstanceValue [
	(sharedGeneralizations at: #InstanceSpecification) instanceValue: anInstanceValue
]

{ #category : #'accessing - NamedElement' }
BootUMLEnumerationLiteral >> memberNamespace [
	^ (sharedGeneralizations at: #NamedElement) memberNamespace
]

{ #category : #'accessing - NamedElement' }
BootUMLEnumerationLiteral >> memberNamespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) memberNamespace: aNamespace
]

{ #category : #'accessing - NamedElement' }
BootUMLEnumerationLiteral >> name [
	^ (sharedGeneralizations at: #NamedElement) name
]

{ #category : #'accessing - NamedElement' }
BootUMLEnumerationLiteral >> name: aString [
	(sharedGeneralizations at: #NamedElement) name: aString
]

{ #category : #'accessing - NamedElement' }
BootUMLEnumerationLiteral >> nameExpression [
	^ (sharedGeneralizations at: #NamedElement) nameExpression
]

{ #category : #'accessing - NamedElement' }
BootUMLEnumerationLiteral >> nameExpression: aStringExpression [
	(sharedGeneralizations at: #NamedElement) nameExpression: aStringExpression
]

{ #category : #'accessing - PackageableElement' }
BootUMLEnumerationLiteral >> namespace [
	^ (sharedGeneralizations at: #PackageableElement) namespace
]

{ #category : #'accessing - PackageableElement' }
BootUMLEnumerationLiteral >> namespace: aNamespace [
	(sharedGeneralizations at: #PackageableElement) namespace: aNamespace
]

{ #category : #'accessing - Element' }
BootUMLEnumerationLiteral >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : #'accessing - Element' }
BootUMLEnumerationLiteral >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : #'accessing - Element' }
BootUMLEnumerationLiteral >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : #'accessing - Element' }
BootUMLEnumerationLiteral >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : #'accessing - Element' }
BootUMLEnumerationLiteral >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : #'accessing - Element' }
BootUMLEnumerationLiteral >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : #'accessing - PackageableElement' }
BootUMLEnumerationLiteral >> owningPackage [
	^ (sharedGeneralizations at: #PackageableElement) owningPackage
]

{ #category : #'accessing - PackageableElement' }
BootUMLEnumerationLiteral >> owningPackage: aPackage [
	(sharedGeneralizations at: #PackageableElement) owningPackage: aPackage
]

{ #category : #'accessing - ParameterableElement' }
BootUMLEnumerationLiteral >> owningTemplateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) owningTemplateParameter
]

{ #category : #'accessing - ParameterableElement' }
BootUMLEnumerationLiteral >> owningTemplateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) owningTemplateParameter: aTemplateParameter
]

{ #category : #'accessing - NamedElement' }
BootUMLEnumerationLiteral >> qualifiedName [
	^ (sharedGeneralizations at: #NamedElement) qualifiedName
]

{ #category : #'accessing - NamedElement' }
BootUMLEnumerationLiteral >> qualifiedName: aString [
	(sharedGeneralizations at: #NamedElement) qualifiedName: aString
]

{ #category : #'accessing - Element' }
BootUMLEnumerationLiteral >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : #'accessing - Element' }
BootUMLEnumerationLiteral >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]

{ #category : #'accessing - InstanceSpecification' }
BootUMLEnumerationLiteral >> slot [
	^ (sharedGeneralizations at: #InstanceSpecification) slot
]

{ #category : #'accessing - InstanceSpecification' }
BootUMLEnumerationLiteral >> slot: aSlot [
	(sharedGeneralizations at: #InstanceSpecification) slot: aSlot
]

{ #category : #'accessing - InstanceSpecification' }
BootUMLEnumerationLiteral >> specification [
	^ (sharedGeneralizations at: #InstanceSpecification) specification
]

{ #category : #'accessing - InstanceSpecification' }
BootUMLEnumerationLiteral >> specification: aValueSpecification [
	(sharedGeneralizations at: #InstanceSpecification) specification: aValueSpecification
]

{ #category : #'accessing - ParameterableElement' }
BootUMLEnumerationLiteral >> templateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) templateParameter
]

{ #category : #'accessing - ParameterableElement' }
BootUMLEnumerationLiteral >> templateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) templateParameter: aTemplateParameter
]

{ #category : #'accessing - PackageableElement' }
BootUMLEnumerationLiteral >> visibility [
	^ (sharedGeneralizations at: #PackageableElement) visibility
]

{ #category : #'accessing - PackageableElement' }
BootUMLEnumerationLiteral >> visibility: aVisibilityKind [
	(sharedGeneralizations at: #PackageableElement) visibility: aVisibilityKind
]
