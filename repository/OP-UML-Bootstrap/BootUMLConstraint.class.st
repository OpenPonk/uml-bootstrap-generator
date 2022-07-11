Class {
	#name : #BootUMLConstraint,
	#superclass : #OPUMLBootstrapObject,
	#instVars : [
		'constrainedElement',
		'specification',
		'bodyContext',
		'context',
		'postContext',
		'preContext'
	],
	#category : 'OP-UML-Bootstrap-CommonStructure'
}

{ #category : #accessing }
BootUMLConstraint >> bodyContext [
	^ bodyContext
]

{ #category : #accessing }
BootUMLConstraint >> bodyContext: anOperation [
	bodyContext := anOperation
]

{ #category : #'accessing - NamedElement' }
BootUMLConstraint >> clientDependency [
	^ (sharedGeneralizations at: #NamedElement) clientDependency
]

{ #category : #'accessing - NamedElement' }
BootUMLConstraint >> clientDependency: aDependency [
	(sharedGeneralizations at: #NamedElement) clientDependency: aDependency
]

{ #category : #'accessing - Element' }
BootUMLConstraint >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : #'accessing - Element' }
BootUMLConstraint >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : #accessing }
BootUMLConstraint >> constrainedElement [
	^ constrainedElement
]

{ #category : #accessing }
BootUMLConstraint >> constrainedElement: anElement [
	constrainedElement := anElement
]

{ #category : #'accessing - Element' }
BootUMLConstraint >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : #'accessing - Element' }
BootUMLConstraint >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : #accessing }
BootUMLConstraint >> context [
	^ context
]

{ #category : #accessing }
BootUMLConstraint >> context: aNamespace [
	context := aNamespace
]

{ #category : #'accessing - PackageableElement' }
BootUMLConstraint >> deploymentTarget [
	^ (sharedGeneralizations at: #PackageableElement) deploymentTarget
]

{ #category : #'accessing - PackageableElement' }
BootUMLConstraint >> deploymentTarget: aDeploymentTarget [
	(sharedGeneralizations at: #PackageableElement) deploymentTarget: aDeploymentTarget
]

{ #category : #'accessing - Element' }
BootUMLConstraint >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : #'accessing - Element' }
BootUMLConstraint >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : #'accessing - NamedElement' }
BootUMLConstraint >> inheritingClassifier [
	^ (sharedGeneralizations at: #NamedElement) inheritingClassifier
]

{ #category : #'accessing - NamedElement' }
BootUMLConstraint >> inheritingClassifier: aClassifier [
	(sharedGeneralizations at: #NamedElement) inheritingClassifier: aClassifier
]

{ #category : #initialization }
BootUMLConstraint >> initialize [
	super initialize.
	sharedGeneralizations at: #Element put: (BootUMLElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #ParameterableElement put: (BootUMLParameterableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #NamedElement put: (BootUMLNamedElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #PackageableElement put: (BootUMLPackageableElement newOnShared: sharedGeneralizations).
	self initializeGeneralizations.

]

{ #category : #initialization }
BootUMLConstraint >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #PackageableElement.
	}

]

{ #category : #'accessing - NamedElement' }
BootUMLConstraint >> memberNamespace [
	^ (sharedGeneralizations at: #NamedElement) memberNamespace
]

{ #category : #'accessing - NamedElement' }
BootUMLConstraint >> memberNamespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) memberNamespace: aNamespace
]

{ #category : #'accessing - NamedElement' }
BootUMLConstraint >> name [
	^ (sharedGeneralizations at: #NamedElement) name
]

{ #category : #'accessing - NamedElement' }
BootUMLConstraint >> name: aString [
	(sharedGeneralizations at: #NamedElement) name: aString
]

{ #category : #'accessing - NamedElement' }
BootUMLConstraint >> nameExpression [
	^ (sharedGeneralizations at: #NamedElement) nameExpression
]

{ #category : #'accessing - NamedElement' }
BootUMLConstraint >> nameExpression: aStringExpression [
	(sharedGeneralizations at: #NamedElement) nameExpression: aStringExpression
]

{ #category : #'accessing - PackageableElement' }
BootUMLConstraint >> namespace [
	^ (sharedGeneralizations at: #PackageableElement) namespace
]

{ #category : #'accessing - PackageableElement' }
BootUMLConstraint >> namespace: aNamespace [
	(sharedGeneralizations at: #PackageableElement) namespace: aNamespace
]

{ #category : #'accessing - Element' }
BootUMLConstraint >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : #'accessing - Element' }
BootUMLConstraint >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : #'accessing - Element' }
BootUMLConstraint >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : #'accessing - Element' }
BootUMLConstraint >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : #'accessing - Element' }
BootUMLConstraint >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : #'accessing - Element' }
BootUMLConstraint >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : #'accessing - PackageableElement' }
BootUMLConstraint >> owningPackage [
	^ (sharedGeneralizations at: #PackageableElement) owningPackage
]

{ #category : #'accessing - PackageableElement' }
BootUMLConstraint >> owningPackage: aPackage [
	(sharedGeneralizations at: #PackageableElement) owningPackage: aPackage
]

{ #category : #'accessing - ParameterableElement' }
BootUMLConstraint >> owningTemplateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) owningTemplateParameter
]

{ #category : #'accessing - ParameterableElement' }
BootUMLConstraint >> owningTemplateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) owningTemplateParameter: aTemplateParameter
]

{ #category : #accessing }
BootUMLConstraint >> postContext [
	^ postContext
]

{ #category : #accessing }
BootUMLConstraint >> postContext: anOperation [
	postContext := anOperation
]

{ #category : #accessing }
BootUMLConstraint >> preContext [
	^ preContext
]

{ #category : #accessing }
BootUMLConstraint >> preContext: anOperation [
	preContext := anOperation
]

{ #category : #'accessing - NamedElement' }
BootUMLConstraint >> qualifiedName [
	^ (sharedGeneralizations at: #NamedElement) qualifiedName
]

{ #category : #'accessing - NamedElement' }
BootUMLConstraint >> qualifiedName: aString [
	(sharedGeneralizations at: #NamedElement) qualifiedName: aString
]

{ #category : #'accessing - Element' }
BootUMLConstraint >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : #'accessing - Element' }
BootUMLConstraint >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]

{ #category : #accessing }
BootUMLConstraint >> specification [
	^ specification
]

{ #category : #accessing }
BootUMLConstraint >> specification: aValueSpecification [
	specification := aValueSpecification
]

{ #category : #'accessing - ParameterableElement' }
BootUMLConstraint >> templateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) templateParameter
]

{ #category : #'accessing - ParameterableElement' }
BootUMLConstraint >> templateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) templateParameter: aTemplateParameter
]

{ #category : #'accessing - PackageableElement' }
BootUMLConstraint >> visibility [
	^ (sharedGeneralizations at: #PackageableElement) visibility
]

{ #category : #'accessing - PackageableElement' }
BootUMLConstraint >> visibility: aVisibilityKind [
	(sharedGeneralizations at: #PackageableElement) visibility: aVisibilityKind
]
