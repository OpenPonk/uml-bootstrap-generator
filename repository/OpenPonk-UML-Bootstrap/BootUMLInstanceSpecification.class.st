Class {
	#name : 'BootUMLInstanceSpecification',
	#superclass : 'OPUMLBootstrapObject',
	#instVars : [
		'classifier',
		'slot',
		'instanceValue',
		'specification'
	],
	#category : 'OpenPonk-UML-Bootstrap-Classification',
	#package : 'OpenPonk-UML-Bootstrap',
	#tag : 'Classification'
}

{ #category : 'accessing' }
BootUMLInstanceSpecification >> classifier [
	^ classifier
]

{ #category : 'accessing' }
BootUMLInstanceSpecification >> classifier: aClassifier [
	classifier := aClassifier
]

{ #category : 'accessing - NamedElement' }
BootUMLInstanceSpecification >> clientDependency [
	^ (sharedGeneralizations at: #NamedElement) clientDependency
]

{ #category : 'accessing - NamedElement' }
BootUMLInstanceSpecification >> clientDependency: aDependency [
	(sharedGeneralizations at: #NamedElement) clientDependency: aDependency
]

{ #category : 'accessing - Element' }
BootUMLInstanceSpecification >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : 'accessing - Element' }
BootUMLInstanceSpecification >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : 'accessing - Element' }
BootUMLInstanceSpecification >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : 'accessing - Element' }
BootUMLInstanceSpecification >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : 'accessing - DeploymentTarget' }
BootUMLInstanceSpecification >> deployedElement [
	^ (sharedGeneralizations at: #DeploymentTarget) deployedElement
]

{ #category : 'accessing - DeploymentTarget' }
BootUMLInstanceSpecification >> deployedElement: aPackageableElement [
	(sharedGeneralizations at: #DeploymentTarget) deployedElement: aPackageableElement
]

{ #category : 'accessing - DeploymentTarget' }
BootUMLInstanceSpecification >> deployment [
	^ (sharedGeneralizations at: #DeploymentTarget) deployment
]

{ #category : 'accessing - DeploymentTarget' }
BootUMLInstanceSpecification >> deployment: aDeployment [
	(sharedGeneralizations at: #DeploymentTarget) deployment: aDeployment
]

{ #category : 'accessing - PackageableElement' }
BootUMLInstanceSpecification >> deploymentTarget [
	^ (sharedGeneralizations at: #PackageableElement) deploymentTarget
]

{ #category : 'accessing - PackageableElement' }
BootUMLInstanceSpecification >> deploymentTarget: aDeploymentTarget [
	(sharedGeneralizations at: #PackageableElement) deploymentTarget: aDeploymentTarget
]

{ #category : 'accessing - Element' }
BootUMLInstanceSpecification >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : 'accessing - Element' }
BootUMLInstanceSpecification >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : 'accessing - NamedElement' }
BootUMLInstanceSpecification >> inheritingClassifier [
	^ (sharedGeneralizations at: #NamedElement) inheritingClassifier
]

{ #category : 'accessing - NamedElement' }
BootUMLInstanceSpecification >> inheritingClassifier: aClassifier [
	(sharedGeneralizations at: #NamedElement) inheritingClassifier: aClassifier
]

{ #category : 'initialization' }
BootUMLInstanceSpecification >> initialize [
	super initialize.
	sharedGeneralizations at: #Element put: (BootUMLElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #NamedElement put: (BootUMLNamedElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #ParameterableElement put: (BootUMLParameterableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #DeploymentTarget put: (BootUMLDeploymentTarget newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #PackageableElement put: (BootUMLPackageableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #DeployedArtifact put: (BootUMLDeployedArtifact newOnShared: sharedGeneralizations).
	self initializeGeneralizations.

]

{ #category : 'initialization' }
BootUMLInstanceSpecification >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #DeploymentTarget.
		sharedGeneralizations at: #PackageableElement.
		sharedGeneralizations at: #DeployedArtifact.
	}

]

{ #category : 'accessing' }
BootUMLInstanceSpecification >> instanceValue [
	^ instanceValue
]

{ #category : 'accessing' }
BootUMLInstanceSpecification >> instanceValue: anInstanceValue [
	instanceValue := anInstanceValue
]

{ #category : 'accessing - NamedElement' }
BootUMLInstanceSpecification >> memberNamespace [
	^ (sharedGeneralizations at: #NamedElement) memberNamespace
]

{ #category : 'accessing - NamedElement' }
BootUMLInstanceSpecification >> memberNamespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) memberNamespace: aNamespace
]

{ #category : 'accessing - NamedElement' }
BootUMLInstanceSpecification >> name [
	^ (sharedGeneralizations at: #NamedElement) name
]

{ #category : 'accessing - NamedElement' }
BootUMLInstanceSpecification >> name: aString [
	(sharedGeneralizations at: #NamedElement) name: aString
]

{ #category : 'accessing - NamedElement' }
BootUMLInstanceSpecification >> nameExpression [
	^ (sharedGeneralizations at: #NamedElement) nameExpression
]

{ #category : 'accessing - NamedElement' }
BootUMLInstanceSpecification >> nameExpression: aStringExpression [
	(sharedGeneralizations at: #NamedElement) nameExpression: aStringExpression
]

{ #category : 'accessing - NamedElement' }
BootUMLInstanceSpecification >> namespace [
	^ (sharedGeneralizations at: #NamedElement) namespace
]

{ #category : 'accessing - NamedElement' }
BootUMLInstanceSpecification >> namespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) namespace: aNamespace
]

{ #category : 'accessing - Element' }
BootUMLInstanceSpecification >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : 'accessing - Element' }
BootUMLInstanceSpecification >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : 'accessing - Element' }
BootUMLInstanceSpecification >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : 'accessing - Element' }
BootUMLInstanceSpecification >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : 'accessing - Element' }
BootUMLInstanceSpecification >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : 'accessing - Element' }
BootUMLInstanceSpecification >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : 'accessing - PackageableElement' }
BootUMLInstanceSpecification >> owningPackage [
	^ (sharedGeneralizations at: #PackageableElement) owningPackage
]

{ #category : 'accessing - PackageableElement' }
BootUMLInstanceSpecification >> owningPackage: aPackage [
	(sharedGeneralizations at: #PackageableElement) owningPackage: aPackage
]

{ #category : 'accessing - ParameterableElement' }
BootUMLInstanceSpecification >> owningTemplateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) owningTemplateParameter
]

{ #category : 'accessing - ParameterableElement' }
BootUMLInstanceSpecification >> owningTemplateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) owningTemplateParameter: aTemplateParameter
]

{ #category : 'accessing - NamedElement' }
BootUMLInstanceSpecification >> qualifiedName [
	^ (sharedGeneralizations at: #NamedElement) qualifiedName
]

{ #category : 'accessing - NamedElement' }
BootUMLInstanceSpecification >> qualifiedName: aString [
	(sharedGeneralizations at: #NamedElement) qualifiedName: aString
]

{ #category : 'accessing - Element' }
BootUMLInstanceSpecification >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : 'accessing - Element' }
BootUMLInstanceSpecification >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]

{ #category : 'accessing' }
BootUMLInstanceSpecification >> slot [
	^ slot
]

{ #category : 'accessing' }
BootUMLInstanceSpecification >> slot: aSlot [
	slot := aSlot
]

{ #category : 'accessing' }
BootUMLInstanceSpecification >> specification [
	^ specification
]

{ #category : 'accessing' }
BootUMLInstanceSpecification >> specification: aValueSpecification [
	specification := aValueSpecification
]

{ #category : 'accessing - ParameterableElement' }
BootUMLInstanceSpecification >> templateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) templateParameter
]

{ #category : 'accessing - ParameterableElement' }
BootUMLInstanceSpecification >> templateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) templateParameter: aTemplateParameter
]

{ #category : 'accessing - NamedElement' }
BootUMLInstanceSpecification >> visibility [
	^ (sharedGeneralizations at: #NamedElement) visibility
]

{ #category : 'accessing - NamedElement' }
BootUMLInstanceSpecification >> visibility: aVisibilityKind [
	(sharedGeneralizations at: #NamedElement) visibility: aVisibilityKind
]
