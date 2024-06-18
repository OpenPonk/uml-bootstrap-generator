Class {
	#name : 'BootUMLEncapsulatedClassifier',
	#superclass : 'OPUMLBootstrapObject',
	#instVars : [
		'ownedPort'
	],
	#category : 'OP-UML-Bootstrap-StructuredClassifiers',
	#package : 'OP-UML-Bootstrap',
	#tag : 'StructuredClassifiers'
}

{ #category : 'accessing - Type' }
BootUMLEncapsulatedClassifier >> association [
	^ (sharedGeneralizations at: #Type) association
]

{ #category : 'accessing - Type' }
BootUMLEncapsulatedClassifier >> association: anAssociation [
	(sharedGeneralizations at: #Type) association: anAssociation
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> attribute [
	^ (sharedGeneralizations at: #Classifier) attribute
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> attribute: aProperty [
	(sharedGeneralizations at: #Classifier) attribute: aProperty
]

{ #category : 'accessing - Type' }
BootUMLEncapsulatedClassifier >> behavioralFeature [
	^ (sharedGeneralizations at: #Type) behavioralFeature
]

{ #category : 'accessing - Type' }
BootUMLEncapsulatedClassifier >> behavioralFeature: aBehavioralFeature [
	(sharedGeneralizations at: #Type) behavioralFeature: aBehavioralFeature
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> classifier [
	^ (sharedGeneralizations at: #Classifier) classifier
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> classifier: aClassifier [
	(sharedGeneralizations at: #Classifier) classifier: aClassifier
]

{ #category : 'accessing - NamedElement' }
BootUMLEncapsulatedClassifier >> clientDependency [
	^ (sharedGeneralizations at: #NamedElement) clientDependency
]

{ #category : 'accessing - NamedElement' }
BootUMLEncapsulatedClassifier >> clientDependency: aDependency [
	(sharedGeneralizations at: #NamedElement) clientDependency: aDependency
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> collaborationUse [
	^ (sharedGeneralizations at: #Classifier) collaborationUse
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> collaborationUse: aCollaborationUse [
	(sharedGeneralizations at: #Classifier) collaborationUse: aCollaborationUse
]

{ #category : 'accessing - Element' }
BootUMLEncapsulatedClassifier >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : 'accessing - Element' }
BootUMLEncapsulatedClassifier >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : 'accessing - Element' }
BootUMLEncapsulatedClassifier >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : 'accessing - Element' }
BootUMLEncapsulatedClassifier >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : 'accessing - PackageableElement' }
BootUMLEncapsulatedClassifier >> deploymentTarget [
	^ (sharedGeneralizations at: #PackageableElement) deploymentTarget
]

{ #category : 'accessing - PackageableElement' }
BootUMLEncapsulatedClassifier >> deploymentTarget: aDeploymentTarget [
	(sharedGeneralizations at: #PackageableElement) deploymentTarget: aDeploymentTarget
]

{ #category : 'accessing - Element' }
BootUMLEncapsulatedClassifier >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : 'accessing - Element' }
BootUMLEncapsulatedClassifier >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : 'accessing - Namespace' }
BootUMLEncapsulatedClassifier >> elementImport [
	^ (sharedGeneralizations at: #Namespace) elementImport
]

{ #category : 'accessing - Namespace' }
BootUMLEncapsulatedClassifier >> elementImport: anElementImport [
	(sharedGeneralizations at: #Namespace) elementImport: anElementImport
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> feature [
	^ (sharedGeneralizations at: #Classifier) feature
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> feature: aFeature [
	(sharedGeneralizations at: #Classifier) feature: aFeature
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> general [
	^ (sharedGeneralizations at: #Classifier) general
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> general: aClassifier [
	(sharedGeneralizations at: #Classifier) general: aClassifier
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> generalization [
	^ (sharedGeneralizations at: #Classifier) generalization
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> generalization: aGeneralization [
	(sharedGeneralizations at: #Classifier) generalization: aGeneralization
]

{ #category : 'accessing - Namespace' }
BootUMLEncapsulatedClassifier >> importedMember [
	^ (sharedGeneralizations at: #Namespace) importedMember
]

{ #category : 'accessing - Namespace' }
BootUMLEncapsulatedClassifier >> importedMember: aPackageableElement [
	(sharedGeneralizations at: #Namespace) importedMember: aPackageableElement
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> inheritedMember [
	^ (sharedGeneralizations at: #Classifier) inheritedMember
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> inheritedMember: aNamedElement [
	(sharedGeneralizations at: #Classifier) inheritedMember: aNamedElement
]

{ #category : 'accessing - NamedElement' }
BootUMLEncapsulatedClassifier >> inheritingClassifier [
	^ (sharedGeneralizations at: #NamedElement) inheritingClassifier
]

{ #category : 'accessing - NamedElement' }
BootUMLEncapsulatedClassifier >> inheritingClassifier: aClassifier [
	(sharedGeneralizations at: #NamedElement) inheritingClassifier: aClassifier
]

{ #category : 'initialization' }
BootUMLEncapsulatedClassifier >> initialize [
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
	sharedGeneralizations at: #StructuredClassifier put: (BootUMLStructuredClassifier newOnShared: sharedGeneralizations).
	self initializeGeneralizations.

]

{ #category : 'initialization' }
BootUMLEncapsulatedClassifier >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #StructuredClassifier.
	}

]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> instanceSpecification [
	^ (sharedGeneralizations at: #Classifier) instanceSpecification
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> instanceSpecification: anInstanceSpecification [
	(sharedGeneralizations at: #Classifier) instanceSpecification: anInstanceSpecification
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> isAbstract [
	^ (sharedGeneralizations at: #Classifier) isAbstract
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> isAbstract: aBoolean [
	(sharedGeneralizations at: #Classifier) isAbstract: aBoolean
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> isFinalSpecialization [
	^ (sharedGeneralizations at: #Classifier) isFinalSpecialization
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> isFinalSpecialization: aBoolean [
	(sharedGeneralizations at: #Classifier) isFinalSpecialization: aBoolean
]

{ #category : 'accessing - RedefinableElement' }
BootUMLEncapsulatedClassifier >> isLeaf [
	^ (sharedGeneralizations at: #RedefinableElement) isLeaf
]

{ #category : 'accessing - RedefinableElement' }
BootUMLEncapsulatedClassifier >> isLeaf: aBoolean [
	(sharedGeneralizations at: #RedefinableElement) isLeaf: aBoolean
]

{ #category : 'accessing - Namespace' }
BootUMLEncapsulatedClassifier >> member [
	^ (sharedGeneralizations at: #Namespace) member
]

{ #category : 'accessing - Namespace' }
BootUMLEncapsulatedClassifier >> member: aNamedElement [
	(sharedGeneralizations at: #Namespace) member: aNamedElement
]

{ #category : 'accessing - NamedElement' }
BootUMLEncapsulatedClassifier >> memberNamespace [
	^ (sharedGeneralizations at: #NamedElement) memberNamespace
]

{ #category : 'accessing - NamedElement' }
BootUMLEncapsulatedClassifier >> memberNamespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) memberNamespace: aNamespace
]

{ #category : 'accessing - NamedElement' }
BootUMLEncapsulatedClassifier >> name [
	^ (sharedGeneralizations at: #NamedElement) name
]

{ #category : 'accessing - NamedElement' }
BootUMLEncapsulatedClassifier >> name: aString [
	(sharedGeneralizations at: #NamedElement) name: aString
]

{ #category : 'accessing - NamedElement' }
BootUMLEncapsulatedClassifier >> nameExpression [
	^ (sharedGeneralizations at: #NamedElement) nameExpression
]

{ #category : 'accessing - NamedElement' }
BootUMLEncapsulatedClassifier >> nameExpression: aStringExpression [
	(sharedGeneralizations at: #NamedElement) nameExpression: aStringExpression
]

{ #category : 'accessing - PackageableElement' }
BootUMLEncapsulatedClassifier >> namespace [
	^ (sharedGeneralizations at: #PackageableElement) namespace
]

{ #category : 'accessing - PackageableElement' }
BootUMLEncapsulatedClassifier >> namespace: aNamespace [
	(sharedGeneralizations at: #PackageableElement) namespace: aNamespace
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> nestingClass [
	^ (sharedGeneralizations at: #Classifier) nestingClass
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> nestingClass: aClass [
	(sharedGeneralizations at: #Classifier) nestingClass: aClass
]

{ #category : 'accessing - Type' }
BootUMLEncapsulatedClassifier >> operation [
	^ (sharedGeneralizations at: #Type) operation
]

{ #category : 'accessing - Type' }
BootUMLEncapsulatedClassifier >> operation: anOperation [
	(sharedGeneralizations at: #Type) operation: anOperation
]

{ #category : 'accessing - StructuredClassifier' }
BootUMLEncapsulatedClassifier >> ownedAttribute [
	^ (sharedGeneralizations at: #StructuredClassifier) ownedAttribute
]

{ #category : 'accessing - StructuredClassifier' }
BootUMLEncapsulatedClassifier >> ownedAttribute: aProperty [
	(sharedGeneralizations at: #StructuredClassifier) ownedAttribute: aProperty
]

{ #category : 'accessing - Element' }
BootUMLEncapsulatedClassifier >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : 'accessing - Element' }
BootUMLEncapsulatedClassifier >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : 'accessing - StructuredClassifier' }
BootUMLEncapsulatedClassifier >> ownedConnector [
	^ (sharedGeneralizations at: #StructuredClassifier) ownedConnector
]

{ #category : 'accessing - StructuredClassifier' }
BootUMLEncapsulatedClassifier >> ownedConnector: aConnector [
	(sharedGeneralizations at: #StructuredClassifier) ownedConnector: aConnector
]

{ #category : 'accessing - Element' }
BootUMLEncapsulatedClassifier >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : 'accessing - Element' }
BootUMLEncapsulatedClassifier >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : 'accessing - Namespace' }
BootUMLEncapsulatedClassifier >> ownedMember [
	^ (sharedGeneralizations at: #Namespace) ownedMember
]

{ #category : 'accessing - Namespace' }
BootUMLEncapsulatedClassifier >> ownedMember: aNamedElement [
	(sharedGeneralizations at: #Namespace) ownedMember: aNamedElement
]

{ #category : 'accessing' }
BootUMLEncapsulatedClassifier >> ownedPort [
	^ ownedPort
]

{ #category : 'accessing' }
BootUMLEncapsulatedClassifier >> ownedPort: aPort [
	ownedPort := aPort
]

{ #category : 'accessing - Namespace' }
BootUMLEncapsulatedClassifier >> ownedRule [
	^ (sharedGeneralizations at: #Namespace) ownedRule
]

{ #category : 'accessing - Namespace' }
BootUMLEncapsulatedClassifier >> ownedRule: aConstraint [
	(sharedGeneralizations at: #Namespace) ownedRule: aConstraint
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> ownedTemplateSignature [
	^ (sharedGeneralizations at: #Classifier) ownedTemplateSignature
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> ownedTemplateSignature: aRedefinableTemplateSignature [
	(sharedGeneralizations at: #Classifier) ownedTemplateSignature: aRedefinableTemplateSignature
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> ownedUseCase [
	^ (sharedGeneralizations at: #Classifier) ownedUseCase
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> ownedUseCase: anUseCase [
	(sharedGeneralizations at: #Classifier) ownedUseCase: anUseCase
]

{ #category : 'accessing - Element' }
BootUMLEncapsulatedClassifier >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : 'accessing - Element' }
BootUMLEncapsulatedClassifier >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : 'accessing - PackageableElement' }
BootUMLEncapsulatedClassifier >> owningPackage [
	^ (sharedGeneralizations at: #PackageableElement) owningPackage
]

{ #category : 'accessing - PackageableElement' }
BootUMLEncapsulatedClassifier >> owningPackage: aPackage [
	(sharedGeneralizations at: #PackageableElement) owningPackage: aPackage
]

{ #category : 'accessing - ParameterableElement' }
BootUMLEncapsulatedClassifier >> owningTemplateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) owningTemplateParameter
]

{ #category : 'accessing - ParameterableElement' }
BootUMLEncapsulatedClassifier >> owningTemplateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) owningTemplateParameter: aTemplateParameter
]

{ #category : 'accessing - Type' }
BootUMLEncapsulatedClassifier >> package [
	^ (sharedGeneralizations at: #Type) package
]

{ #category : 'accessing - Type' }
BootUMLEncapsulatedClassifier >> package: aPackage [
	(sharedGeneralizations at: #Type) package: aPackage
]

{ #category : 'accessing - Namespace' }
BootUMLEncapsulatedClassifier >> packageImport [
	^ (sharedGeneralizations at: #Namespace) packageImport
]

{ #category : 'accessing - Namespace' }
BootUMLEncapsulatedClassifier >> packageImport: aPackageImport [
	(sharedGeneralizations at: #Namespace) packageImport: aPackageImport
]

{ #category : 'accessing - StructuredClassifier' }
BootUMLEncapsulatedClassifier >> part [
	^ (sharedGeneralizations at: #StructuredClassifier) part
]

{ #category : 'accessing - StructuredClassifier' }
BootUMLEncapsulatedClassifier >> part: aProperty [
	(sharedGeneralizations at: #StructuredClassifier) part: aProperty
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> powertypeExtent [
	^ (sharedGeneralizations at: #Classifier) powertypeExtent
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> powertypeExtent: aGeneralizationSet [
	(sharedGeneralizations at: #Classifier) powertypeExtent: aGeneralizationSet
]

{ #category : 'accessing - NamedElement' }
BootUMLEncapsulatedClassifier >> qualifiedName [
	^ (sharedGeneralizations at: #NamedElement) qualifiedName
]

{ #category : 'accessing - NamedElement' }
BootUMLEncapsulatedClassifier >> qualifiedName: aString [
	(sharedGeneralizations at: #NamedElement) qualifiedName: aString
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> redefinableElement [
	^ (sharedGeneralizations at: #Classifier) redefinableElement
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> redefinableElement: aRedefinableElement [
	(sharedGeneralizations at: #Classifier) redefinableElement: aRedefinableElement
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> redefinedClassifier [
	^ (sharedGeneralizations at: #Classifier) redefinedClassifier
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> redefinedClassifier: aClassifier [
	(sharedGeneralizations at: #Classifier) redefinedClassifier: aClassifier
]

{ #category : 'accessing - RedefinableElement' }
BootUMLEncapsulatedClassifier >> redefinedElement [
	^ (sharedGeneralizations at: #RedefinableElement) redefinedElement
]

{ #category : 'accessing - RedefinableElement' }
BootUMLEncapsulatedClassifier >> redefinedElement: aRedefinableElement [
	(sharedGeneralizations at: #RedefinableElement) redefinedElement: aRedefinableElement
]

{ #category : 'accessing - RedefinableElement' }
BootUMLEncapsulatedClassifier >> redefinitionContext [
	^ (sharedGeneralizations at: #RedefinableElement) redefinitionContext
]

{ #category : 'accessing - RedefinableElement' }
BootUMLEncapsulatedClassifier >> redefinitionContext: aClassifier [
	(sharedGeneralizations at: #RedefinableElement) redefinitionContext: aClassifier
]

{ #category : 'accessing - Element' }
BootUMLEncapsulatedClassifier >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : 'accessing - Element' }
BootUMLEncapsulatedClassifier >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> representation [
	^ (sharedGeneralizations at: #Classifier) representation
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> representation: aCollaborationUse [
	(sharedGeneralizations at: #Classifier) representation: aCollaborationUse
]

{ #category : 'accessing - StructuredClassifier' }
BootUMLEncapsulatedClassifier >> role [
	^ (sharedGeneralizations at: #StructuredClassifier) role
]

{ #category : 'accessing - StructuredClassifier' }
BootUMLEncapsulatedClassifier >> role: aConnectableElement [
	(sharedGeneralizations at: #StructuredClassifier) role: aConnectableElement
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> substitution [
	^ (sharedGeneralizations at: #Classifier) substitution
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> substitution: aSubstitution [
	(sharedGeneralizations at: #Classifier) substitution: aSubstitution
]

{ #category : 'accessing - TemplateableElement' }
BootUMLEncapsulatedClassifier >> templateBinding [
	^ (sharedGeneralizations at: #TemplateableElement) templateBinding
]

{ #category : 'accessing - TemplateableElement' }
BootUMLEncapsulatedClassifier >> templateBinding: aTemplateBinding [
	(sharedGeneralizations at: #TemplateableElement) templateBinding: aTemplateBinding
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> templateParameter [
	^ (sharedGeneralizations at: #Classifier) templateParameter
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> templateParameter: aClassifierTemplateParameter [
	(sharedGeneralizations at: #Classifier) templateParameter: aClassifierTemplateParameter
]

{ #category : 'accessing - Type' }
BootUMLEncapsulatedClassifier >> typedElement [
	^ (sharedGeneralizations at: #Type) typedElement
]

{ #category : 'accessing - Type' }
BootUMLEncapsulatedClassifier >> typedElement: aTypedElement [
	(sharedGeneralizations at: #Type) typedElement: aTypedElement
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> useCase [
	^ (sharedGeneralizations at: #Classifier) useCase
]

{ #category : 'accessing - Classifier' }
BootUMLEncapsulatedClassifier >> useCase: anUseCase [
	(sharedGeneralizations at: #Classifier) useCase: anUseCase
]

{ #category : 'accessing - PackageableElement' }
BootUMLEncapsulatedClassifier >> visibility [
	^ (sharedGeneralizations at: #PackageableElement) visibility
]

{ #category : 'accessing - PackageableElement' }
BootUMLEncapsulatedClassifier >> visibility: aVisibilityKind [
	(sharedGeneralizations at: #PackageableElement) visibility: aVisibilityKind
]
