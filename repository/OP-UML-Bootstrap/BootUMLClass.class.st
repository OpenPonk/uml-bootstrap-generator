Class {
	#name : 'BootUMLClass',
	#superclass : 'OPUMLBootstrapObject',
	#instVars : [
		'nestedClassifier',
		'superClass',
		'isActive',
		'ownedAttribute',
		'isAbstract',
		'ownedReception',
		'ownedOperation',
		'owningClass',
		'extension'
	],
	#category : 'OP-UML-Bootstrap-StructuredClassifiers',
	#package : 'OP-UML-Bootstrap',
	#tag : 'StructuredClassifiers'
}

{ #category : 'accessing - Type' }
BootUMLClass >> association [
	^ (sharedGeneralizations at: #Type) association
]

{ #category : 'accessing - Type' }
BootUMLClass >> association: anAssociation [
	(sharedGeneralizations at: #Type) association: anAssociation
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> attribute [
	^ (sharedGeneralizations at: #Classifier) attribute
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> attribute: aProperty [
	(sharedGeneralizations at: #Classifier) attribute: aProperty
]

{ #category : 'accessing - Type' }
BootUMLClass >> behavioralFeature [
	^ (sharedGeneralizations at: #Type) behavioralFeature
]

{ #category : 'accessing - Type' }
BootUMLClass >> behavioralFeature: aBehavioralFeature [
	(sharedGeneralizations at: #Type) behavioralFeature: aBehavioralFeature
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> classifier [
	^ (sharedGeneralizations at: #Classifier) classifier
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> classifier: aClassifier [
	(sharedGeneralizations at: #Classifier) classifier: aClassifier
]

{ #category : 'accessing - BehavioredClassifier' }
BootUMLClass >> classifierBehavior [
	^ (sharedGeneralizations at: #BehavioredClassifier) classifierBehavior
]

{ #category : 'accessing - BehavioredClassifier' }
BootUMLClass >> classifierBehavior: aBehavior [
	(sharedGeneralizations at: #BehavioredClassifier) classifierBehavior: aBehavior
]

{ #category : 'accessing - NamedElement' }
BootUMLClass >> clientDependency [
	^ (sharedGeneralizations at: #NamedElement) clientDependency
]

{ #category : 'accessing - NamedElement' }
BootUMLClass >> clientDependency: aDependency [
	(sharedGeneralizations at: #NamedElement) clientDependency: aDependency
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> collaborationUse [
	^ (sharedGeneralizations at: #Classifier) collaborationUse
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> collaborationUse: aCollaborationUse [
	(sharedGeneralizations at: #Classifier) collaborationUse: aCollaborationUse
]

{ #category : 'accessing - Element' }
BootUMLClass >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : 'accessing - Element' }
BootUMLClass >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : 'accessing - Element' }
BootUMLClass >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : 'accessing - Element' }
BootUMLClass >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : 'accessing - PackageableElement' }
BootUMLClass >> deploymentTarget [
	^ (sharedGeneralizations at: #PackageableElement) deploymentTarget
]

{ #category : 'accessing - PackageableElement' }
BootUMLClass >> deploymentTarget: aDeploymentTarget [
	(sharedGeneralizations at: #PackageableElement) deploymentTarget: aDeploymentTarget
]

{ #category : 'accessing - Element' }
BootUMLClass >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : 'accessing - Element' }
BootUMLClass >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : 'accessing - Namespace' }
BootUMLClass >> elementImport [
	^ (sharedGeneralizations at: #Namespace) elementImport
]

{ #category : 'accessing - Namespace' }
BootUMLClass >> elementImport: anElementImport [
	(sharedGeneralizations at: #Namespace) elementImport: anElementImport
]

{ #category : 'accessing' }
BootUMLClass >> extension [
	^ extension
]

{ #category : 'accessing' }
BootUMLClass >> extension: anExtension [
	extension := anExtension
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> feature [
	^ (sharedGeneralizations at: #Classifier) feature
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> feature: aFeature [
	(sharedGeneralizations at: #Classifier) feature: aFeature
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> general [
	^ (sharedGeneralizations at: #Classifier) general
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> general: aClassifier [
	(sharedGeneralizations at: #Classifier) general: aClassifier
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> generalization [
	^ (sharedGeneralizations at: #Classifier) generalization
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> generalization: aGeneralization [
	(sharedGeneralizations at: #Classifier) generalization: aGeneralization
]

{ #category : 'accessing - Namespace' }
BootUMLClass >> importedMember [
	^ (sharedGeneralizations at: #Namespace) importedMember
]

{ #category : 'accessing - Namespace' }
BootUMLClass >> importedMember: aPackageableElement [
	(sharedGeneralizations at: #Namespace) importedMember: aPackageableElement
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> inheritedMember [
	^ (sharedGeneralizations at: #Classifier) inheritedMember
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> inheritedMember: aNamedElement [
	(sharedGeneralizations at: #Classifier) inheritedMember: aNamedElement
]

{ #category : 'accessing - NamedElement' }
BootUMLClass >> inheritingClassifier [
	^ (sharedGeneralizations at: #NamedElement) inheritingClassifier
]

{ #category : 'accessing - NamedElement' }
BootUMLClass >> inheritingClassifier: aClassifier [
	(sharedGeneralizations at: #NamedElement) inheritingClassifier: aClassifier
]

{ #category : 'initialization' }
BootUMLClass >> initialize [
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
	sharedGeneralizations at: #BehavioredClassifier put: (BootUMLBehavioredClassifier newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #EncapsulatedClassifier put: (BootUMLEncapsulatedClassifier newOnShared: sharedGeneralizations).
	self initializeGeneralizations.

]

{ #category : 'initialization' }
BootUMLClass >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #BehavioredClassifier.
		sharedGeneralizations at: #EncapsulatedClassifier.
	}

]

{ #category : 'accessing - Classifier' }
BootUMLClass >> instanceSpecification [
	^ (sharedGeneralizations at: #Classifier) instanceSpecification
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> instanceSpecification: anInstanceSpecification [
	(sharedGeneralizations at: #Classifier) instanceSpecification: anInstanceSpecification
]

{ #category : 'accessing - BehavioredClassifier' }
BootUMLClass >> interfaceRealization [
	^ (sharedGeneralizations at: #BehavioredClassifier) interfaceRealization
]

{ #category : 'accessing - BehavioredClassifier' }
BootUMLClass >> interfaceRealization: anInterfaceRealization [
	(sharedGeneralizations at: #BehavioredClassifier) interfaceRealization: anInterfaceRealization
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> isAbstract [
	^ (sharedGeneralizations at: #Classifier) isAbstract
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> isAbstract: aBoolean [
	(sharedGeneralizations at: #Classifier) isAbstract: aBoolean
]

{ #category : 'accessing' }
BootUMLClass >> isActive [
	^ isActive
]

{ #category : 'accessing' }
BootUMLClass >> isActive: aBoolean [
	isActive := aBoolean
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> isFinalSpecialization [
	^ (sharedGeneralizations at: #Classifier) isFinalSpecialization
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> isFinalSpecialization: aBoolean [
	(sharedGeneralizations at: #Classifier) isFinalSpecialization: aBoolean
]

{ #category : 'accessing - RedefinableElement' }
BootUMLClass >> isLeaf [
	^ (sharedGeneralizations at: #RedefinableElement) isLeaf
]

{ #category : 'accessing - RedefinableElement' }
BootUMLClass >> isLeaf: aBoolean [
	(sharedGeneralizations at: #RedefinableElement) isLeaf: aBoolean
]

{ #category : 'accessing - Namespace' }
BootUMLClass >> member [
	^ (sharedGeneralizations at: #Namespace) member
]

{ #category : 'accessing - Namespace' }
BootUMLClass >> member: aNamedElement [
	(sharedGeneralizations at: #Namespace) member: aNamedElement
]

{ #category : 'accessing - NamedElement' }
BootUMLClass >> memberNamespace [
	^ (sharedGeneralizations at: #NamedElement) memberNamespace
]

{ #category : 'accessing - NamedElement' }
BootUMLClass >> memberNamespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) memberNamespace: aNamespace
]

{ #category : 'accessing - NamedElement' }
BootUMLClass >> name [
	^ (sharedGeneralizations at: #NamedElement) name
]

{ #category : 'accessing - NamedElement' }
BootUMLClass >> name: aString [
	(sharedGeneralizations at: #NamedElement) name: aString
]

{ #category : 'accessing - NamedElement' }
BootUMLClass >> nameExpression [
	^ (sharedGeneralizations at: #NamedElement) nameExpression
]

{ #category : 'accessing - NamedElement' }
BootUMLClass >> nameExpression: aStringExpression [
	(sharedGeneralizations at: #NamedElement) nameExpression: aStringExpression
]

{ #category : 'accessing - PackageableElement' }
BootUMLClass >> namespace [
	^ (sharedGeneralizations at: #PackageableElement) namespace
]

{ #category : 'accessing - PackageableElement' }
BootUMLClass >> namespace: aNamespace [
	(sharedGeneralizations at: #PackageableElement) namespace: aNamespace
]

{ #category : 'accessing' }
BootUMLClass >> nestedClassifier [
	^ nestedClassifier
]

{ #category : 'accessing' }
BootUMLClass >> nestedClassifier: aClassifier [
	nestedClassifier := aClassifier
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> nestingClass [
	^ (sharedGeneralizations at: #Classifier) nestingClass
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> nestingClass: aClass [
	(sharedGeneralizations at: #Classifier) nestingClass: aClass
]

{ #category : 'accessing - Type' }
BootUMLClass >> operation [
	^ (sharedGeneralizations at: #Type) operation
]

{ #category : 'accessing - Type' }
BootUMLClass >> operation: anOperation [
	(sharedGeneralizations at: #Type) operation: anOperation
]

{ #category : 'accessing - StructuredClassifier' }
BootUMLClass >> ownedAttribute [
	^ (sharedGeneralizations at: #StructuredClassifier) ownedAttribute
]

{ #category : 'accessing - StructuredClassifier' }
BootUMLClass >> ownedAttribute: aProperty [
	(sharedGeneralizations at: #StructuredClassifier) ownedAttribute: aProperty
]

{ #category : 'accessing - BehavioredClassifier' }
BootUMLClass >> ownedBehavior [
	^ (sharedGeneralizations at: #BehavioredClassifier) ownedBehavior
]

{ #category : 'accessing - BehavioredClassifier' }
BootUMLClass >> ownedBehavior: aBehavior [
	(sharedGeneralizations at: #BehavioredClassifier) ownedBehavior: aBehavior
]

{ #category : 'accessing - Element' }
BootUMLClass >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : 'accessing - Element' }
BootUMLClass >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : 'accessing - StructuredClassifier' }
BootUMLClass >> ownedConnector [
	^ (sharedGeneralizations at: #StructuredClassifier) ownedConnector
]

{ #category : 'accessing - StructuredClassifier' }
BootUMLClass >> ownedConnector: aConnector [
	(sharedGeneralizations at: #StructuredClassifier) ownedConnector: aConnector
]

{ #category : 'accessing - Element' }
BootUMLClass >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : 'accessing - Element' }
BootUMLClass >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : 'accessing - Namespace' }
BootUMLClass >> ownedMember [
	^ (sharedGeneralizations at: #Namespace) ownedMember
]

{ #category : 'accessing - Namespace' }
BootUMLClass >> ownedMember: aNamedElement [
	(sharedGeneralizations at: #Namespace) ownedMember: aNamedElement
]

{ #category : 'accessing' }
BootUMLClass >> ownedOperation [
	^ ownedOperation
]

{ #category : 'accessing' }
BootUMLClass >> ownedOperation: anOperation [
	ownedOperation := anOperation
]

{ #category : 'accessing - EncapsulatedClassifier' }
BootUMLClass >> ownedPort [
	^ (sharedGeneralizations at: #EncapsulatedClassifier) ownedPort
]

{ #category : 'accessing - EncapsulatedClassifier' }
BootUMLClass >> ownedPort: aPort [
	(sharedGeneralizations at: #EncapsulatedClassifier) ownedPort: aPort
]

{ #category : 'accessing' }
BootUMLClass >> ownedReception [
	^ ownedReception
]

{ #category : 'accessing' }
BootUMLClass >> ownedReception: aReception [
	ownedReception := aReception
]

{ #category : 'accessing - Namespace' }
BootUMLClass >> ownedRule [
	^ (sharedGeneralizations at: #Namespace) ownedRule
]

{ #category : 'accessing - Namespace' }
BootUMLClass >> ownedRule: aConstraint [
	(sharedGeneralizations at: #Namespace) ownedRule: aConstraint
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> ownedTemplateSignature [
	^ (sharedGeneralizations at: #Classifier) ownedTemplateSignature
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> ownedTemplateSignature: aRedefinableTemplateSignature [
	(sharedGeneralizations at: #Classifier) ownedTemplateSignature: aRedefinableTemplateSignature
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> ownedUseCase [
	^ (sharedGeneralizations at: #Classifier) ownedUseCase
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> ownedUseCase: anUseCase [
	(sharedGeneralizations at: #Classifier) ownedUseCase: anUseCase
]

{ #category : 'accessing - Element' }
BootUMLClass >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : 'accessing - Element' }
BootUMLClass >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : 'accessing' }
BootUMLClass >> owningClass [
	^ owningClass
]

{ #category : 'accessing' }
BootUMLClass >> owningClass: aClass [
	owningClass := aClass
]

{ #category : 'accessing - PackageableElement' }
BootUMLClass >> owningPackage [
	^ (sharedGeneralizations at: #PackageableElement) owningPackage
]

{ #category : 'accessing - PackageableElement' }
BootUMLClass >> owningPackage: aPackage [
	(sharedGeneralizations at: #PackageableElement) owningPackage: aPackage
]

{ #category : 'accessing - ParameterableElement' }
BootUMLClass >> owningTemplateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) owningTemplateParameter
]

{ #category : 'accessing - ParameterableElement' }
BootUMLClass >> owningTemplateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) owningTemplateParameter: aTemplateParameter
]

{ #category : 'accessing - Type' }
BootUMLClass >> package [
	^ (sharedGeneralizations at: #Type) package
]

{ #category : 'accessing - Type' }
BootUMLClass >> package: aPackage [
	(sharedGeneralizations at: #Type) package: aPackage
]

{ #category : 'accessing - Namespace' }
BootUMLClass >> packageImport [
	^ (sharedGeneralizations at: #Namespace) packageImport
]

{ #category : 'accessing - Namespace' }
BootUMLClass >> packageImport: aPackageImport [
	(sharedGeneralizations at: #Namespace) packageImport: aPackageImport
]

{ #category : 'accessing - StructuredClassifier' }
BootUMLClass >> part [
	^ (sharedGeneralizations at: #StructuredClassifier) part
]

{ #category : 'accessing - StructuredClassifier' }
BootUMLClass >> part: aProperty [
	(sharedGeneralizations at: #StructuredClassifier) part: aProperty
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> powertypeExtent [
	^ (sharedGeneralizations at: #Classifier) powertypeExtent
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> powertypeExtent: aGeneralizationSet [
	(sharedGeneralizations at: #Classifier) powertypeExtent: aGeneralizationSet
]

{ #category : 'accessing - NamedElement' }
BootUMLClass >> qualifiedName [
	^ (sharedGeneralizations at: #NamedElement) qualifiedName
]

{ #category : 'accessing - NamedElement' }
BootUMLClass >> qualifiedName: aString [
	(sharedGeneralizations at: #NamedElement) qualifiedName: aString
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> redefinableElement [
	^ (sharedGeneralizations at: #Classifier) redefinableElement
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> redefinableElement: aRedefinableElement [
	(sharedGeneralizations at: #Classifier) redefinableElement: aRedefinableElement
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> redefinedClassifier [
	^ (sharedGeneralizations at: #Classifier) redefinedClassifier
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> redefinedClassifier: aClassifier [
	(sharedGeneralizations at: #Classifier) redefinedClassifier: aClassifier
]

{ #category : 'accessing - RedefinableElement' }
BootUMLClass >> redefinedElement [
	^ (sharedGeneralizations at: #RedefinableElement) redefinedElement
]

{ #category : 'accessing - RedefinableElement' }
BootUMLClass >> redefinedElement: aRedefinableElement [
	(sharedGeneralizations at: #RedefinableElement) redefinedElement: aRedefinableElement
]

{ #category : 'accessing - RedefinableElement' }
BootUMLClass >> redefinitionContext [
	^ (sharedGeneralizations at: #RedefinableElement) redefinitionContext
]

{ #category : 'accessing - RedefinableElement' }
BootUMLClass >> redefinitionContext: aClassifier [
	(sharedGeneralizations at: #RedefinableElement) redefinitionContext: aClassifier
]

{ #category : 'accessing - Element' }
BootUMLClass >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : 'accessing - Element' }
BootUMLClass >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> representation [
	^ (sharedGeneralizations at: #Classifier) representation
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> representation: aCollaborationUse [
	(sharedGeneralizations at: #Classifier) representation: aCollaborationUse
]

{ #category : 'accessing - StructuredClassifier' }
BootUMLClass >> role [
	^ (sharedGeneralizations at: #StructuredClassifier) role
]

{ #category : 'accessing - StructuredClassifier' }
BootUMLClass >> role: aConnectableElement [
	(sharedGeneralizations at: #StructuredClassifier) role: aConnectableElement
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> substitution [
	^ (sharedGeneralizations at: #Classifier) substitution
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> substitution: aSubstitution [
	(sharedGeneralizations at: #Classifier) substitution: aSubstitution
]

{ #category : 'accessing' }
BootUMLClass >> superClass [
	^ superClass
]

{ #category : 'accessing' }
BootUMLClass >> superClass: aClass [
	superClass := aClass
]

{ #category : 'accessing - TemplateableElement' }
BootUMLClass >> templateBinding [
	^ (sharedGeneralizations at: #TemplateableElement) templateBinding
]

{ #category : 'accessing - TemplateableElement' }
BootUMLClass >> templateBinding: aTemplateBinding [
	(sharedGeneralizations at: #TemplateableElement) templateBinding: aTemplateBinding
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> templateParameter [
	^ (sharedGeneralizations at: #Classifier) templateParameter
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> templateParameter: aClassifierTemplateParameter [
	(sharedGeneralizations at: #Classifier) templateParameter: aClassifierTemplateParameter
]

{ #category : 'accessing - Type' }
BootUMLClass >> typedElement [
	^ (sharedGeneralizations at: #Type) typedElement
]

{ #category : 'accessing - Type' }
BootUMLClass >> typedElement: aTypedElement [
	(sharedGeneralizations at: #Type) typedElement: aTypedElement
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> useCase [
	^ (sharedGeneralizations at: #Classifier) useCase
]

{ #category : 'accessing - Classifier' }
BootUMLClass >> useCase: anUseCase [
	(sharedGeneralizations at: #Classifier) useCase: anUseCase
]

{ #category : 'accessing - PackageableElement' }
BootUMLClass >> visibility [
	^ (sharedGeneralizations at: #PackageableElement) visibility
]

{ #category : 'accessing - PackageableElement' }
BootUMLClass >> visibility: aVisibilityKind [
	(sharedGeneralizations at: #PackageableElement) visibility: aVisibilityKind
]
