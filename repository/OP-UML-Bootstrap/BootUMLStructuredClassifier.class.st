Class {
	#name : #BootUMLStructuredClassifier,
	#superclass : #OPUMLBootstrapObject,
	#instVars : [
		'ownedAttribute',
		'role',
		'ownedConnector',
		'part'
	],
	#category : 'OP-UML-Bootstrap-StructuredClassifiers'
}

{ #category : #'accessing - Type' }
BootUMLStructuredClassifier >> association [
	^ (sharedGeneralizations at: #Type) association
]

{ #category : #'accessing - Type' }
BootUMLStructuredClassifier >> association: anAssociation [
	(sharedGeneralizations at: #Type) association: anAssociation
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> attribute [
	^ (sharedGeneralizations at: #Classifier) attribute
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> attribute: aProperty [
	(sharedGeneralizations at: #Classifier) attribute: aProperty
]

{ #category : #'accessing - Type' }
BootUMLStructuredClassifier >> behavioralFeature [
	^ (sharedGeneralizations at: #Type) behavioralFeature
]

{ #category : #'accessing - Type' }
BootUMLStructuredClassifier >> behavioralFeature: aBehavioralFeature [
	(sharedGeneralizations at: #Type) behavioralFeature: aBehavioralFeature
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> classifier [
	^ (sharedGeneralizations at: #Classifier) classifier
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> classifier: aClassifier [
	(sharedGeneralizations at: #Classifier) classifier: aClassifier
]

{ #category : #'accessing - NamedElement' }
BootUMLStructuredClassifier >> clientDependency [
	^ (sharedGeneralizations at: #NamedElement) clientDependency
]

{ #category : #'accessing - NamedElement' }
BootUMLStructuredClassifier >> clientDependency: aDependency [
	(sharedGeneralizations at: #NamedElement) clientDependency: aDependency
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> collaborationUse [
	^ (sharedGeneralizations at: #Classifier) collaborationUse
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> collaborationUse: aCollaborationUse [
	(sharedGeneralizations at: #Classifier) collaborationUse: aCollaborationUse
]

{ #category : #'accessing - Element' }
BootUMLStructuredClassifier >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : #'accessing - Element' }
BootUMLStructuredClassifier >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : #'accessing - Element' }
BootUMLStructuredClassifier >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : #'accessing - Element' }
BootUMLStructuredClassifier >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : #'accessing - PackageableElement' }
BootUMLStructuredClassifier >> deploymentTarget [
	^ (sharedGeneralizations at: #PackageableElement) deploymentTarget
]

{ #category : #'accessing - PackageableElement' }
BootUMLStructuredClassifier >> deploymentTarget: aDeploymentTarget [
	(sharedGeneralizations at: #PackageableElement) deploymentTarget: aDeploymentTarget
]

{ #category : #'accessing - Element' }
BootUMLStructuredClassifier >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : #'accessing - Element' }
BootUMLStructuredClassifier >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : #'accessing - Namespace' }
BootUMLStructuredClassifier >> elementImport [
	^ (sharedGeneralizations at: #Namespace) elementImport
]

{ #category : #'accessing - Namespace' }
BootUMLStructuredClassifier >> elementImport: anElementImport [
	(sharedGeneralizations at: #Namespace) elementImport: anElementImport
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> feature [
	^ (sharedGeneralizations at: #Classifier) feature
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> feature: aFeature [
	(sharedGeneralizations at: #Classifier) feature: aFeature
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> general [
	^ (sharedGeneralizations at: #Classifier) general
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> general: aClassifier [
	(sharedGeneralizations at: #Classifier) general: aClassifier
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> generalization [
	^ (sharedGeneralizations at: #Classifier) generalization
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> generalization: aGeneralization [
	(sharedGeneralizations at: #Classifier) generalization: aGeneralization
]

{ #category : #'accessing - Namespace' }
BootUMLStructuredClassifier >> importedMember [
	^ (sharedGeneralizations at: #Namespace) importedMember
]

{ #category : #'accessing - Namespace' }
BootUMLStructuredClassifier >> importedMember: aPackageableElement [
	(sharedGeneralizations at: #Namespace) importedMember: aPackageableElement
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> inheritedMember [
	^ (sharedGeneralizations at: #Classifier) inheritedMember
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> inheritedMember: aNamedElement [
	(sharedGeneralizations at: #Classifier) inheritedMember: aNamedElement
]

{ #category : #'accessing - NamedElement' }
BootUMLStructuredClassifier >> inheritingClassifier [
	^ (sharedGeneralizations at: #NamedElement) inheritingClassifier
]

{ #category : #'accessing - NamedElement' }
BootUMLStructuredClassifier >> inheritingClassifier: aClassifier [
	(sharedGeneralizations at: #NamedElement) inheritingClassifier: aClassifier
]

{ #category : #initialization }
BootUMLStructuredClassifier >> initialize [
	super initialize.
	sharedGeneralizations at: #Element put: (BootUMLElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #ParameterableElement put: (BootUMLParameterableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #NamedElement put: (BootUMLNamedElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #PackageableElement put: (BootUMLPackageableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Namespace put: (BootUMLNamespace newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Type put: (BootUMLType newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #TemplateableElement put: (BootUMLTemplateableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #RedefinableElement put: (BootUMLRedefinableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Classifier put: (BootUMLClassifier newOnShared: sharedGeneralizations).
	self initializeGeneralizations.

]

{ #category : #initialization }
BootUMLStructuredClassifier >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #Classifier.
	}

]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> instanceSpecification [
	^ (sharedGeneralizations at: #Classifier) instanceSpecification
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> instanceSpecification: anInstanceSpecification [
	(sharedGeneralizations at: #Classifier) instanceSpecification: anInstanceSpecification
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> isAbstract [
	^ (sharedGeneralizations at: #Classifier) isAbstract
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> isAbstract: aBoolean [
	(sharedGeneralizations at: #Classifier) isAbstract: aBoolean
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> isFinalSpecialization [
	^ (sharedGeneralizations at: #Classifier) isFinalSpecialization
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> isFinalSpecialization: aBoolean [
	(sharedGeneralizations at: #Classifier) isFinalSpecialization: aBoolean
]

{ #category : #'accessing - RedefinableElement' }
BootUMLStructuredClassifier >> isLeaf [
	^ (sharedGeneralizations at: #RedefinableElement) isLeaf
]

{ #category : #'accessing - RedefinableElement' }
BootUMLStructuredClassifier >> isLeaf: aBoolean [
	(sharedGeneralizations at: #RedefinableElement) isLeaf: aBoolean
]

{ #category : #'accessing - Namespace' }
BootUMLStructuredClassifier >> member [
	^ (sharedGeneralizations at: #Namespace) member
]

{ #category : #'accessing - Namespace' }
BootUMLStructuredClassifier >> member: aNamedElement [
	(sharedGeneralizations at: #Namespace) member: aNamedElement
]

{ #category : #'accessing - NamedElement' }
BootUMLStructuredClassifier >> memberNamespace [
	^ (sharedGeneralizations at: #NamedElement) memberNamespace
]

{ #category : #'accessing - NamedElement' }
BootUMLStructuredClassifier >> memberNamespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) memberNamespace: aNamespace
]

{ #category : #'accessing - NamedElement' }
BootUMLStructuredClassifier >> name [
	^ (sharedGeneralizations at: #NamedElement) name
]

{ #category : #'accessing - NamedElement' }
BootUMLStructuredClassifier >> name: aString [
	(sharedGeneralizations at: #NamedElement) name: aString
]

{ #category : #'accessing - NamedElement' }
BootUMLStructuredClassifier >> nameExpression [
	^ (sharedGeneralizations at: #NamedElement) nameExpression
]

{ #category : #'accessing - NamedElement' }
BootUMLStructuredClassifier >> nameExpression: aStringExpression [
	(sharedGeneralizations at: #NamedElement) nameExpression: aStringExpression
]

{ #category : #'accessing - PackageableElement' }
BootUMLStructuredClassifier >> namespace [
	^ (sharedGeneralizations at: #PackageableElement) namespace
]

{ #category : #'accessing - PackageableElement' }
BootUMLStructuredClassifier >> namespace: aNamespace [
	(sharedGeneralizations at: #PackageableElement) namespace: aNamespace
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> nestingClass [
	^ (sharedGeneralizations at: #Classifier) nestingClass
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> nestingClass: aClass [
	(sharedGeneralizations at: #Classifier) nestingClass: aClass
]

{ #category : #'accessing - Type' }
BootUMLStructuredClassifier >> operation [
	^ (sharedGeneralizations at: #Type) operation
]

{ #category : #'accessing - Type' }
BootUMLStructuredClassifier >> operation: anOperation [
	(sharedGeneralizations at: #Type) operation: anOperation
]

{ #category : #accessing }
BootUMLStructuredClassifier >> ownedAttribute [
	^ ownedAttribute
]

{ #category : #accessing }
BootUMLStructuredClassifier >> ownedAttribute: aProperty [
	ownedAttribute := aProperty
]

{ #category : #'accessing - Element' }
BootUMLStructuredClassifier >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : #'accessing - Element' }
BootUMLStructuredClassifier >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : #accessing }
BootUMLStructuredClassifier >> ownedConnector [
	^ ownedConnector
]

{ #category : #accessing }
BootUMLStructuredClassifier >> ownedConnector: aConnector [
	ownedConnector := aConnector
]

{ #category : #'accessing - Element' }
BootUMLStructuredClassifier >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : #'accessing - Element' }
BootUMLStructuredClassifier >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : #'accessing - Namespace' }
BootUMLStructuredClassifier >> ownedMember [
	^ (sharedGeneralizations at: #Namespace) ownedMember
]

{ #category : #'accessing - Namespace' }
BootUMLStructuredClassifier >> ownedMember: aNamedElement [
	(sharedGeneralizations at: #Namespace) ownedMember: aNamedElement
]

{ #category : #'accessing - Namespace' }
BootUMLStructuredClassifier >> ownedRule [
	^ (sharedGeneralizations at: #Namespace) ownedRule
]

{ #category : #'accessing - Namespace' }
BootUMLStructuredClassifier >> ownedRule: aConstraint [
	(sharedGeneralizations at: #Namespace) ownedRule: aConstraint
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> ownedTemplateSignature [
	^ (sharedGeneralizations at: #Classifier) ownedTemplateSignature
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> ownedTemplateSignature: aRedefinableTemplateSignature [
	(sharedGeneralizations at: #Classifier) ownedTemplateSignature: aRedefinableTemplateSignature
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> ownedUseCase [
	^ (sharedGeneralizations at: #Classifier) ownedUseCase
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> ownedUseCase: anUseCase [
	(sharedGeneralizations at: #Classifier) ownedUseCase: anUseCase
]

{ #category : #'accessing - Element' }
BootUMLStructuredClassifier >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : #'accessing - Element' }
BootUMLStructuredClassifier >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : #'accessing - PackageableElement' }
BootUMLStructuredClassifier >> owningPackage [
	^ (sharedGeneralizations at: #PackageableElement) owningPackage
]

{ #category : #'accessing - PackageableElement' }
BootUMLStructuredClassifier >> owningPackage: aPackage [
	(sharedGeneralizations at: #PackageableElement) owningPackage: aPackage
]

{ #category : #'accessing - ParameterableElement' }
BootUMLStructuredClassifier >> owningTemplateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) owningTemplateParameter
]

{ #category : #'accessing - ParameterableElement' }
BootUMLStructuredClassifier >> owningTemplateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) owningTemplateParameter: aTemplateParameter
]

{ #category : #'accessing - Type' }
BootUMLStructuredClassifier >> package [
	^ (sharedGeneralizations at: #Type) package
]

{ #category : #'accessing - Type' }
BootUMLStructuredClassifier >> package: aPackage [
	(sharedGeneralizations at: #Type) package: aPackage
]

{ #category : #'accessing - Namespace' }
BootUMLStructuredClassifier >> packageImport [
	^ (sharedGeneralizations at: #Namespace) packageImport
]

{ #category : #'accessing - Namespace' }
BootUMLStructuredClassifier >> packageImport: aPackageImport [
	(sharedGeneralizations at: #Namespace) packageImport: aPackageImport
]

{ #category : #accessing }
BootUMLStructuredClassifier >> part [
	^ part
]

{ #category : #accessing }
BootUMLStructuredClassifier >> part: aProperty [
	part := aProperty
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> powertypeExtent [
	^ (sharedGeneralizations at: #Classifier) powertypeExtent
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> powertypeExtent: aGeneralizationSet [
	(sharedGeneralizations at: #Classifier) powertypeExtent: aGeneralizationSet
]

{ #category : #'accessing - NamedElement' }
BootUMLStructuredClassifier >> qualifiedName [
	^ (sharedGeneralizations at: #NamedElement) qualifiedName
]

{ #category : #'accessing - NamedElement' }
BootUMLStructuredClassifier >> qualifiedName: aString [
	(sharedGeneralizations at: #NamedElement) qualifiedName: aString
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> redefinableElement [
	^ (sharedGeneralizations at: #Classifier) redefinableElement
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> redefinableElement: aRedefinableElement [
	(sharedGeneralizations at: #Classifier) redefinableElement: aRedefinableElement
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> redefinedClassifier [
	^ (sharedGeneralizations at: #Classifier) redefinedClassifier
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> redefinedClassifier: aClassifier [
	(sharedGeneralizations at: #Classifier) redefinedClassifier: aClassifier
]

{ #category : #'accessing - RedefinableElement' }
BootUMLStructuredClassifier >> redefinedElement [
	^ (sharedGeneralizations at: #RedefinableElement) redefinedElement
]

{ #category : #'accessing - RedefinableElement' }
BootUMLStructuredClassifier >> redefinedElement: aRedefinableElement [
	(sharedGeneralizations at: #RedefinableElement) redefinedElement: aRedefinableElement
]

{ #category : #'accessing - RedefinableElement' }
BootUMLStructuredClassifier >> redefinitionContext [
	^ (sharedGeneralizations at: #RedefinableElement) redefinitionContext
]

{ #category : #'accessing - RedefinableElement' }
BootUMLStructuredClassifier >> redefinitionContext: aClassifier [
	(sharedGeneralizations at: #RedefinableElement) redefinitionContext: aClassifier
]

{ #category : #'accessing - Element' }
BootUMLStructuredClassifier >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : #'accessing - Element' }
BootUMLStructuredClassifier >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> representation [
	^ (sharedGeneralizations at: #Classifier) representation
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> representation: aCollaborationUse [
	(sharedGeneralizations at: #Classifier) representation: aCollaborationUse
]

{ #category : #accessing }
BootUMLStructuredClassifier >> role [
	^ role
]

{ #category : #accessing }
BootUMLStructuredClassifier >> role: aConnectableElement [
	role := aConnectableElement
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> substitution [
	^ (sharedGeneralizations at: #Classifier) substitution
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> substitution: aSubstitution [
	(sharedGeneralizations at: #Classifier) substitution: aSubstitution
]

{ #category : #'accessing - TemplateableElement' }
BootUMLStructuredClassifier >> templateBinding [
	^ (sharedGeneralizations at: #TemplateableElement) templateBinding
]

{ #category : #'accessing - TemplateableElement' }
BootUMLStructuredClassifier >> templateBinding: aTemplateBinding [
	(sharedGeneralizations at: #TemplateableElement) templateBinding: aTemplateBinding
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> templateParameter [
	^ (sharedGeneralizations at: #Classifier) templateParameter
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> templateParameter: aClassifierTemplateParameter [
	(sharedGeneralizations at: #Classifier) templateParameter: aClassifierTemplateParameter
]

{ #category : #'accessing - Type' }
BootUMLStructuredClassifier >> typedElement [
	^ (sharedGeneralizations at: #Type) typedElement
]

{ #category : #'accessing - Type' }
BootUMLStructuredClassifier >> typedElement: aTypedElement [
	(sharedGeneralizations at: #Type) typedElement: aTypedElement
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> useCase [
	^ (sharedGeneralizations at: #Classifier) useCase
]

{ #category : #'accessing - Classifier' }
BootUMLStructuredClassifier >> useCase: anUseCase [
	(sharedGeneralizations at: #Classifier) useCase: anUseCase
]

{ #category : #'accessing - PackageableElement' }
BootUMLStructuredClassifier >> visibility [
	^ (sharedGeneralizations at: #PackageableElement) visibility
]

{ #category : #'accessing - PackageableElement' }
BootUMLStructuredClassifier >> visibility: aVisibilityKind [
	(sharedGeneralizations at: #PackageableElement) visibility: aVisibilityKind
]
