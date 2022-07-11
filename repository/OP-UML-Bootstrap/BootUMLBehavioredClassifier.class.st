Class {
	#name : #BootUMLBehavioredClassifier,
	#superclass : #OPUMLBootstrapObject,
	#instVars : [
		'ownedBehavior',
		'interfaceRealization',
		'classifierBehavior'
	],
	#category : 'OP-UML-Bootstrap-SimpleClassifiers'
}

{ #category : #'accessing - Type' }
BootUMLBehavioredClassifier >> association [
	^ (sharedGeneralizations at: #Type) association
]

{ #category : #'accessing - Type' }
BootUMLBehavioredClassifier >> association: anAssociation [
	(sharedGeneralizations at: #Type) association: anAssociation
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> attribute [
	^ (sharedGeneralizations at: #Classifier) attribute
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> attribute: aProperty [
	(sharedGeneralizations at: #Classifier) attribute: aProperty
]

{ #category : #'accessing - Type' }
BootUMLBehavioredClassifier >> behavioralFeature [
	^ (sharedGeneralizations at: #Type) behavioralFeature
]

{ #category : #'accessing - Type' }
BootUMLBehavioredClassifier >> behavioralFeature: aBehavioralFeature [
	(sharedGeneralizations at: #Type) behavioralFeature: aBehavioralFeature
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> classifier [
	^ (sharedGeneralizations at: #Classifier) classifier
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> classifier: aClassifier [
	(sharedGeneralizations at: #Classifier) classifier: aClassifier
]

{ #category : #accessing }
BootUMLBehavioredClassifier >> classifierBehavior [
	^ classifierBehavior
]

{ #category : #accessing }
BootUMLBehavioredClassifier >> classifierBehavior: aBehavior [
	classifierBehavior := aBehavior
]

{ #category : #'accessing - NamedElement' }
BootUMLBehavioredClassifier >> clientDependency [
	^ (sharedGeneralizations at: #NamedElement) clientDependency
]

{ #category : #'accessing - NamedElement' }
BootUMLBehavioredClassifier >> clientDependency: aDependency [
	(sharedGeneralizations at: #NamedElement) clientDependency: aDependency
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> collaborationUse [
	^ (sharedGeneralizations at: #Classifier) collaborationUse
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> collaborationUse: aCollaborationUse [
	(sharedGeneralizations at: #Classifier) collaborationUse: aCollaborationUse
]

{ #category : #'accessing - Element' }
BootUMLBehavioredClassifier >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : #'accessing - Element' }
BootUMLBehavioredClassifier >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : #'accessing - Element' }
BootUMLBehavioredClassifier >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : #'accessing - Element' }
BootUMLBehavioredClassifier >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : #'accessing - PackageableElement' }
BootUMLBehavioredClassifier >> deploymentTarget [
	^ (sharedGeneralizations at: #PackageableElement) deploymentTarget
]

{ #category : #'accessing - PackageableElement' }
BootUMLBehavioredClassifier >> deploymentTarget: aDeploymentTarget [
	(sharedGeneralizations at: #PackageableElement) deploymentTarget: aDeploymentTarget
]

{ #category : #'accessing - Element' }
BootUMLBehavioredClassifier >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : #'accessing - Element' }
BootUMLBehavioredClassifier >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : #'accessing - Namespace' }
BootUMLBehavioredClassifier >> elementImport [
	^ (sharedGeneralizations at: #Namespace) elementImport
]

{ #category : #'accessing - Namespace' }
BootUMLBehavioredClassifier >> elementImport: anElementImport [
	(sharedGeneralizations at: #Namespace) elementImport: anElementImport
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> feature [
	^ (sharedGeneralizations at: #Classifier) feature
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> feature: aFeature [
	(sharedGeneralizations at: #Classifier) feature: aFeature
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> general [
	^ (sharedGeneralizations at: #Classifier) general
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> general: aClassifier [
	(sharedGeneralizations at: #Classifier) general: aClassifier
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> generalization [
	^ (sharedGeneralizations at: #Classifier) generalization
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> generalization: aGeneralization [
	(sharedGeneralizations at: #Classifier) generalization: aGeneralization
]

{ #category : #'accessing - Namespace' }
BootUMLBehavioredClassifier >> importedMember [
	^ (sharedGeneralizations at: #Namespace) importedMember
]

{ #category : #'accessing - Namespace' }
BootUMLBehavioredClassifier >> importedMember: aPackageableElement [
	(sharedGeneralizations at: #Namespace) importedMember: aPackageableElement
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> inheritedMember [
	^ (sharedGeneralizations at: #Classifier) inheritedMember
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> inheritedMember: aNamedElement [
	(sharedGeneralizations at: #Classifier) inheritedMember: aNamedElement
]

{ #category : #'accessing - NamedElement' }
BootUMLBehavioredClassifier >> inheritingClassifier [
	^ (sharedGeneralizations at: #NamedElement) inheritingClassifier
]

{ #category : #'accessing - NamedElement' }
BootUMLBehavioredClassifier >> inheritingClassifier: aClassifier [
	(sharedGeneralizations at: #NamedElement) inheritingClassifier: aClassifier
]

{ #category : #initialization }
BootUMLBehavioredClassifier >> initialize [
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
BootUMLBehavioredClassifier >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #Classifier.
	}

]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> instanceSpecification [
	^ (sharedGeneralizations at: #Classifier) instanceSpecification
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> instanceSpecification: anInstanceSpecification [
	(sharedGeneralizations at: #Classifier) instanceSpecification: anInstanceSpecification
]

{ #category : #accessing }
BootUMLBehavioredClassifier >> interfaceRealization [
	^ interfaceRealization
]

{ #category : #accessing }
BootUMLBehavioredClassifier >> interfaceRealization: anInterfaceRealization [
	interfaceRealization := anInterfaceRealization
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> isAbstract [
	^ (sharedGeneralizations at: #Classifier) isAbstract
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> isAbstract: aBoolean [
	(sharedGeneralizations at: #Classifier) isAbstract: aBoolean
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> isFinalSpecialization [
	^ (sharedGeneralizations at: #Classifier) isFinalSpecialization
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> isFinalSpecialization: aBoolean [
	(sharedGeneralizations at: #Classifier) isFinalSpecialization: aBoolean
]

{ #category : #'accessing - RedefinableElement' }
BootUMLBehavioredClassifier >> isLeaf [
	^ (sharedGeneralizations at: #RedefinableElement) isLeaf
]

{ #category : #'accessing - RedefinableElement' }
BootUMLBehavioredClassifier >> isLeaf: aBoolean [
	(sharedGeneralizations at: #RedefinableElement) isLeaf: aBoolean
]

{ #category : #'accessing - Namespace' }
BootUMLBehavioredClassifier >> member [
	^ (sharedGeneralizations at: #Namespace) member
]

{ #category : #'accessing - Namespace' }
BootUMLBehavioredClassifier >> member: aNamedElement [
	(sharedGeneralizations at: #Namespace) member: aNamedElement
]

{ #category : #'accessing - NamedElement' }
BootUMLBehavioredClassifier >> memberNamespace [
	^ (sharedGeneralizations at: #NamedElement) memberNamespace
]

{ #category : #'accessing - NamedElement' }
BootUMLBehavioredClassifier >> memberNamespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) memberNamespace: aNamespace
]

{ #category : #'accessing - NamedElement' }
BootUMLBehavioredClassifier >> name [
	^ (sharedGeneralizations at: #NamedElement) name
]

{ #category : #'accessing - NamedElement' }
BootUMLBehavioredClassifier >> name: aString [
	(sharedGeneralizations at: #NamedElement) name: aString
]

{ #category : #'accessing - NamedElement' }
BootUMLBehavioredClassifier >> nameExpression [
	^ (sharedGeneralizations at: #NamedElement) nameExpression
]

{ #category : #'accessing - NamedElement' }
BootUMLBehavioredClassifier >> nameExpression: aStringExpression [
	(sharedGeneralizations at: #NamedElement) nameExpression: aStringExpression
]

{ #category : #'accessing - PackageableElement' }
BootUMLBehavioredClassifier >> namespace [
	^ (sharedGeneralizations at: #PackageableElement) namespace
]

{ #category : #'accessing - PackageableElement' }
BootUMLBehavioredClassifier >> namespace: aNamespace [
	(sharedGeneralizations at: #PackageableElement) namespace: aNamespace
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> nestingClass [
	^ (sharedGeneralizations at: #Classifier) nestingClass
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> nestingClass: aClass [
	(sharedGeneralizations at: #Classifier) nestingClass: aClass
]

{ #category : #'accessing - Type' }
BootUMLBehavioredClassifier >> operation [
	^ (sharedGeneralizations at: #Type) operation
]

{ #category : #'accessing - Type' }
BootUMLBehavioredClassifier >> operation: anOperation [
	(sharedGeneralizations at: #Type) operation: anOperation
]

{ #category : #accessing }
BootUMLBehavioredClassifier >> ownedBehavior [
	^ ownedBehavior
]

{ #category : #accessing }
BootUMLBehavioredClassifier >> ownedBehavior: aBehavior [
	ownedBehavior := aBehavior
]

{ #category : #'accessing - Element' }
BootUMLBehavioredClassifier >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : #'accessing - Element' }
BootUMLBehavioredClassifier >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : #'accessing - Element' }
BootUMLBehavioredClassifier >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : #'accessing - Element' }
BootUMLBehavioredClassifier >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : #'accessing - Namespace' }
BootUMLBehavioredClassifier >> ownedMember [
	^ (sharedGeneralizations at: #Namespace) ownedMember
]

{ #category : #'accessing - Namespace' }
BootUMLBehavioredClassifier >> ownedMember: aNamedElement [
	(sharedGeneralizations at: #Namespace) ownedMember: aNamedElement
]

{ #category : #'accessing - Namespace' }
BootUMLBehavioredClassifier >> ownedRule [
	^ (sharedGeneralizations at: #Namespace) ownedRule
]

{ #category : #'accessing - Namespace' }
BootUMLBehavioredClassifier >> ownedRule: aConstraint [
	(sharedGeneralizations at: #Namespace) ownedRule: aConstraint
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> ownedTemplateSignature [
	^ (sharedGeneralizations at: #Classifier) ownedTemplateSignature
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> ownedTemplateSignature: aRedefinableTemplateSignature [
	(sharedGeneralizations at: #Classifier) ownedTemplateSignature: aRedefinableTemplateSignature
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> ownedUseCase [
	^ (sharedGeneralizations at: #Classifier) ownedUseCase
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> ownedUseCase: anUseCase [
	(sharedGeneralizations at: #Classifier) ownedUseCase: anUseCase
]

{ #category : #'accessing - Element' }
BootUMLBehavioredClassifier >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : #'accessing - Element' }
BootUMLBehavioredClassifier >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : #'accessing - PackageableElement' }
BootUMLBehavioredClassifier >> owningPackage [
	^ (sharedGeneralizations at: #PackageableElement) owningPackage
]

{ #category : #'accessing - PackageableElement' }
BootUMLBehavioredClassifier >> owningPackage: aPackage [
	(sharedGeneralizations at: #PackageableElement) owningPackage: aPackage
]

{ #category : #'accessing - ParameterableElement' }
BootUMLBehavioredClassifier >> owningTemplateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) owningTemplateParameter
]

{ #category : #'accessing - ParameterableElement' }
BootUMLBehavioredClassifier >> owningTemplateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) owningTemplateParameter: aTemplateParameter
]

{ #category : #'accessing - Type' }
BootUMLBehavioredClassifier >> package [
	^ (sharedGeneralizations at: #Type) package
]

{ #category : #'accessing - Type' }
BootUMLBehavioredClassifier >> package: aPackage [
	(sharedGeneralizations at: #Type) package: aPackage
]

{ #category : #'accessing - Namespace' }
BootUMLBehavioredClassifier >> packageImport [
	^ (sharedGeneralizations at: #Namespace) packageImport
]

{ #category : #'accessing - Namespace' }
BootUMLBehavioredClassifier >> packageImport: aPackageImport [
	(sharedGeneralizations at: #Namespace) packageImport: aPackageImport
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> powertypeExtent [
	^ (sharedGeneralizations at: #Classifier) powertypeExtent
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> powertypeExtent: aGeneralizationSet [
	(sharedGeneralizations at: #Classifier) powertypeExtent: aGeneralizationSet
]

{ #category : #'accessing - NamedElement' }
BootUMLBehavioredClassifier >> qualifiedName [
	^ (sharedGeneralizations at: #NamedElement) qualifiedName
]

{ #category : #'accessing - NamedElement' }
BootUMLBehavioredClassifier >> qualifiedName: aString [
	(sharedGeneralizations at: #NamedElement) qualifiedName: aString
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> redefinableElement [
	^ (sharedGeneralizations at: #Classifier) redefinableElement
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> redefinableElement: aRedefinableElement [
	(sharedGeneralizations at: #Classifier) redefinableElement: aRedefinableElement
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> redefinedClassifier [
	^ (sharedGeneralizations at: #Classifier) redefinedClassifier
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> redefinedClassifier: aClassifier [
	(sharedGeneralizations at: #Classifier) redefinedClassifier: aClassifier
]

{ #category : #'accessing - RedefinableElement' }
BootUMLBehavioredClassifier >> redefinedElement [
	^ (sharedGeneralizations at: #RedefinableElement) redefinedElement
]

{ #category : #'accessing - RedefinableElement' }
BootUMLBehavioredClassifier >> redefinedElement: aRedefinableElement [
	(sharedGeneralizations at: #RedefinableElement) redefinedElement: aRedefinableElement
]

{ #category : #'accessing - RedefinableElement' }
BootUMLBehavioredClassifier >> redefinitionContext [
	^ (sharedGeneralizations at: #RedefinableElement) redefinitionContext
]

{ #category : #'accessing - RedefinableElement' }
BootUMLBehavioredClassifier >> redefinitionContext: aClassifier [
	(sharedGeneralizations at: #RedefinableElement) redefinitionContext: aClassifier
]

{ #category : #'accessing - Element' }
BootUMLBehavioredClassifier >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : #'accessing - Element' }
BootUMLBehavioredClassifier >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> representation [
	^ (sharedGeneralizations at: #Classifier) representation
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> representation: aCollaborationUse [
	(sharedGeneralizations at: #Classifier) representation: aCollaborationUse
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> substitution [
	^ (sharedGeneralizations at: #Classifier) substitution
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> substitution: aSubstitution [
	(sharedGeneralizations at: #Classifier) substitution: aSubstitution
]

{ #category : #'accessing - TemplateableElement' }
BootUMLBehavioredClassifier >> templateBinding [
	^ (sharedGeneralizations at: #TemplateableElement) templateBinding
]

{ #category : #'accessing - TemplateableElement' }
BootUMLBehavioredClassifier >> templateBinding: aTemplateBinding [
	(sharedGeneralizations at: #TemplateableElement) templateBinding: aTemplateBinding
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> templateParameter [
	^ (sharedGeneralizations at: #Classifier) templateParameter
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> templateParameter: aClassifierTemplateParameter [
	(sharedGeneralizations at: #Classifier) templateParameter: aClassifierTemplateParameter
]

{ #category : #'accessing - Type' }
BootUMLBehavioredClassifier >> typedElement [
	^ (sharedGeneralizations at: #Type) typedElement
]

{ #category : #'accessing - Type' }
BootUMLBehavioredClassifier >> typedElement: aTypedElement [
	(sharedGeneralizations at: #Type) typedElement: aTypedElement
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> useCase [
	^ (sharedGeneralizations at: #Classifier) useCase
]

{ #category : #'accessing - Classifier' }
BootUMLBehavioredClassifier >> useCase: anUseCase [
	(sharedGeneralizations at: #Classifier) useCase: anUseCase
]

{ #category : #'accessing - PackageableElement' }
BootUMLBehavioredClassifier >> visibility [
	^ (sharedGeneralizations at: #PackageableElement) visibility
]

{ #category : #'accessing - PackageableElement' }
BootUMLBehavioredClassifier >> visibility: aVisibilityKind [
	(sharedGeneralizations at: #PackageableElement) visibility: aVisibilityKind
]
