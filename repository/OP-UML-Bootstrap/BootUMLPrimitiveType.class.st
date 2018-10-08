Class {
	#name : #BootUMLPrimitiveType,
	#superclass : #OPUMLBootstrapObject,
	#category : 'OP-UML-Bootstrap-SimpleClassifiers'
}

{ #category : #'accessing - Type' }
BootUMLPrimitiveType >> association [
	^ (sharedGeneralizations at: #Type) association
]

{ #category : #'accessing - Type' }
BootUMLPrimitiveType >> association: anAssociation [
	(sharedGeneralizations at: #Type) association: anAssociation
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> attribute [
	^ (sharedGeneralizations at: #Classifier) attribute
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> attribute: aProperty [
	(sharedGeneralizations at: #Classifier) attribute: aProperty
]

{ #category : #'accessing - Type' }
BootUMLPrimitiveType >> behavioralFeature [
	^ (sharedGeneralizations at: #Type) behavioralFeature
]

{ #category : #'accessing - Type' }
BootUMLPrimitiveType >> behavioralFeature: aBehavioralFeature [
	(sharedGeneralizations at: #Type) behavioralFeature: aBehavioralFeature
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> classifier [
	^ (sharedGeneralizations at: #Classifier) classifier
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> classifier: aClassifier [
	(sharedGeneralizations at: #Classifier) classifier: aClassifier
]

{ #category : #'accessing - NamedElement' }
BootUMLPrimitiveType >> clientDependency [
	^ (sharedGeneralizations at: #NamedElement) clientDependency
]

{ #category : #'accessing - NamedElement' }
BootUMLPrimitiveType >> clientDependency: aDependency [
	(sharedGeneralizations at: #NamedElement) clientDependency: aDependency
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> collaborationUse [
	^ (sharedGeneralizations at: #Classifier) collaborationUse
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> collaborationUse: aCollaborationUse [
	(sharedGeneralizations at: #Classifier) collaborationUse: aCollaborationUse
]

{ #category : #'accessing - Element' }
BootUMLPrimitiveType >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : #'accessing - Element' }
BootUMLPrimitiveType >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : #'accessing - Element' }
BootUMLPrimitiveType >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : #'accessing - Element' }
BootUMLPrimitiveType >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : #'accessing - PackageableElement' }
BootUMLPrimitiveType >> deploymentTarget [
	^ (sharedGeneralizations at: #PackageableElement) deploymentTarget
]

{ #category : #'accessing - PackageableElement' }
BootUMLPrimitiveType >> deploymentTarget: aDeploymentTarget [
	(sharedGeneralizations at: #PackageableElement) deploymentTarget: aDeploymentTarget
]

{ #category : #'accessing - Element' }
BootUMLPrimitiveType >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : #'accessing - Element' }
BootUMLPrimitiveType >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : #'accessing - Namespace' }
BootUMLPrimitiveType >> elementImport [
	^ (sharedGeneralizations at: #Namespace) elementImport
]

{ #category : #'accessing - Namespace' }
BootUMLPrimitiveType >> elementImport: anElementImport [
	(sharedGeneralizations at: #Namespace) elementImport: anElementImport
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> feature [
	^ (sharedGeneralizations at: #Classifier) feature
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> feature: aFeature [
	(sharedGeneralizations at: #Classifier) feature: aFeature
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> general [
	^ (sharedGeneralizations at: #Classifier) general
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> general: aClassifier [
	(sharedGeneralizations at: #Classifier) general: aClassifier
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> generalization [
	^ (sharedGeneralizations at: #Classifier) generalization
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> generalization: aGeneralization [
	(sharedGeneralizations at: #Classifier) generalization: aGeneralization
]

{ #category : #'accessing - Namespace' }
BootUMLPrimitiveType >> importedMember [
	^ (sharedGeneralizations at: #Namespace) importedMember
]

{ #category : #'accessing - Namespace' }
BootUMLPrimitiveType >> importedMember: aPackageableElement [
	(sharedGeneralizations at: #Namespace) importedMember: aPackageableElement
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> inheritedMember [
	^ (sharedGeneralizations at: #Classifier) inheritedMember
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> inheritedMember: aNamedElement [
	(sharedGeneralizations at: #Classifier) inheritedMember: aNamedElement
]

{ #category : #'accessing - NamedElement' }
BootUMLPrimitiveType >> inheritingClassifier [
	^ (sharedGeneralizations at: #NamedElement) inheritingClassifier
]

{ #category : #'accessing - NamedElement' }
BootUMLPrimitiveType >> inheritingClassifier: aClassifier [
	(sharedGeneralizations at: #NamedElement) inheritingClassifier: aClassifier
]

{ #category : #initialization }
BootUMLPrimitiveType >> initialize [
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
	sharedGeneralizations at: #DataType put: (BootUMLDataType newOnShared: sharedGeneralizations).
	self initializeGeneralizations.

]

{ #category : #initialization }
BootUMLPrimitiveType >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #DataType.
	}

]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> instanceSpecification [
	^ (sharedGeneralizations at: #Classifier) instanceSpecification
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> instanceSpecification: anInstanceSpecification [
	(sharedGeneralizations at: #Classifier) instanceSpecification: anInstanceSpecification
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> isAbstract [
	^ (sharedGeneralizations at: #Classifier) isAbstract
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> isAbstract: aBoolean [
	(sharedGeneralizations at: #Classifier) isAbstract: aBoolean
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> isFinalSpecialization [
	^ (sharedGeneralizations at: #Classifier) isFinalSpecialization
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> isFinalSpecialization: aBoolean [
	(sharedGeneralizations at: #Classifier) isFinalSpecialization: aBoolean
]

{ #category : #'accessing - RedefinableElement' }
BootUMLPrimitiveType >> isLeaf [
	^ (sharedGeneralizations at: #RedefinableElement) isLeaf
]

{ #category : #'accessing - RedefinableElement' }
BootUMLPrimitiveType >> isLeaf: aBoolean [
	(sharedGeneralizations at: #RedefinableElement) isLeaf: aBoolean
]

{ #category : #'accessing - Namespace' }
BootUMLPrimitiveType >> member [
	^ (sharedGeneralizations at: #Namespace) member
]

{ #category : #'accessing - Namespace' }
BootUMLPrimitiveType >> member: aNamedElement [
	(sharedGeneralizations at: #Namespace) member: aNamedElement
]

{ #category : #'accessing - NamedElement' }
BootUMLPrimitiveType >> memberNamespace [
	^ (sharedGeneralizations at: #NamedElement) memberNamespace
]

{ #category : #'accessing - NamedElement' }
BootUMLPrimitiveType >> memberNamespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) memberNamespace: aNamespace
]

{ #category : #'accessing - NamedElement' }
BootUMLPrimitiveType >> name [
	^ (sharedGeneralizations at: #NamedElement) name
]

{ #category : #'accessing - NamedElement' }
BootUMLPrimitiveType >> name: aString [
	(sharedGeneralizations at: #NamedElement) name: aString
]

{ #category : #'accessing - NamedElement' }
BootUMLPrimitiveType >> nameExpression [
	^ (sharedGeneralizations at: #NamedElement) nameExpression
]

{ #category : #'accessing - NamedElement' }
BootUMLPrimitiveType >> nameExpression: aStringExpression [
	(sharedGeneralizations at: #NamedElement) nameExpression: aStringExpression
]

{ #category : #'accessing - PackageableElement' }
BootUMLPrimitiveType >> namespace [
	^ (sharedGeneralizations at: #PackageableElement) namespace
]

{ #category : #'accessing - PackageableElement' }
BootUMLPrimitiveType >> namespace: aNamespace [
	(sharedGeneralizations at: #PackageableElement) namespace: aNamespace
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> nestingClass [
	^ (sharedGeneralizations at: #Classifier) nestingClass
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> nestingClass: aClass [
	(sharedGeneralizations at: #Classifier) nestingClass: aClass
]

{ #category : #'accessing - Type' }
BootUMLPrimitiveType >> operation [
	^ (sharedGeneralizations at: #Type) operation
]

{ #category : #'accessing - Type' }
BootUMLPrimitiveType >> operation: anOperation [
	(sharedGeneralizations at: #Type) operation: anOperation
]

{ #category : #'accessing - DataType' }
BootUMLPrimitiveType >> ownedAttribute [
	^ (sharedGeneralizations at: #DataType) ownedAttribute
]

{ #category : #'accessing - DataType' }
BootUMLPrimitiveType >> ownedAttribute: aProperty [
	(sharedGeneralizations at: #DataType) ownedAttribute: aProperty
]

{ #category : #'accessing - Element' }
BootUMLPrimitiveType >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : #'accessing - Element' }
BootUMLPrimitiveType >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : #'accessing - Element' }
BootUMLPrimitiveType >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : #'accessing - Element' }
BootUMLPrimitiveType >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : #'accessing - Namespace' }
BootUMLPrimitiveType >> ownedMember [
	^ (sharedGeneralizations at: #Namespace) ownedMember
]

{ #category : #'accessing - Namespace' }
BootUMLPrimitiveType >> ownedMember: aNamedElement [
	(sharedGeneralizations at: #Namespace) ownedMember: aNamedElement
]

{ #category : #'accessing - DataType' }
BootUMLPrimitiveType >> ownedOperation [
	^ (sharedGeneralizations at: #DataType) ownedOperation
]

{ #category : #'accessing - DataType' }
BootUMLPrimitiveType >> ownedOperation: anOperation [
	(sharedGeneralizations at: #DataType) ownedOperation: anOperation
]

{ #category : #'accessing - Namespace' }
BootUMLPrimitiveType >> ownedRule [
	^ (sharedGeneralizations at: #Namespace) ownedRule
]

{ #category : #'accessing - Namespace' }
BootUMLPrimitiveType >> ownedRule: aConstraint [
	(sharedGeneralizations at: #Namespace) ownedRule: aConstraint
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> ownedTemplateSignature [
	^ (sharedGeneralizations at: #Classifier) ownedTemplateSignature
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> ownedTemplateSignature: aRedefinableTemplateSignature [
	(sharedGeneralizations at: #Classifier) ownedTemplateSignature: aRedefinableTemplateSignature
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> ownedUseCase [
	^ (sharedGeneralizations at: #Classifier) ownedUseCase
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> ownedUseCase: anUseCase [
	(sharedGeneralizations at: #Classifier) ownedUseCase: anUseCase
]

{ #category : #'accessing - Element' }
BootUMLPrimitiveType >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : #'accessing - Element' }
BootUMLPrimitiveType >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : #'accessing - PackageableElement' }
BootUMLPrimitiveType >> owningPackage [
	^ (sharedGeneralizations at: #PackageableElement) owningPackage
]

{ #category : #'accessing - PackageableElement' }
BootUMLPrimitiveType >> owningPackage: aPackage [
	(sharedGeneralizations at: #PackageableElement) owningPackage: aPackage
]

{ #category : #'accessing - ParameterableElement' }
BootUMLPrimitiveType >> owningTemplateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) owningTemplateParameter
]

{ #category : #'accessing - ParameterableElement' }
BootUMLPrimitiveType >> owningTemplateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) owningTemplateParameter: aTemplateParameter
]

{ #category : #'accessing - Type' }
BootUMLPrimitiveType >> package [
	^ (sharedGeneralizations at: #Type) package
]

{ #category : #'accessing - Type' }
BootUMLPrimitiveType >> package: aPackage [
	(sharedGeneralizations at: #Type) package: aPackage
]

{ #category : #'accessing - Namespace' }
BootUMLPrimitiveType >> packageImport [
	^ (sharedGeneralizations at: #Namespace) packageImport
]

{ #category : #'accessing - Namespace' }
BootUMLPrimitiveType >> packageImport: aPackageImport [
	(sharedGeneralizations at: #Namespace) packageImport: aPackageImport
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> powertypeExtent [
	^ (sharedGeneralizations at: #Classifier) powertypeExtent
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> powertypeExtent: aGeneralizationSet [
	(sharedGeneralizations at: #Classifier) powertypeExtent: aGeneralizationSet
]

{ #category : #'accessing - NamedElement' }
BootUMLPrimitiveType >> qualifiedName [
	^ (sharedGeneralizations at: #NamedElement) qualifiedName
]

{ #category : #'accessing - NamedElement' }
BootUMLPrimitiveType >> qualifiedName: aString [
	(sharedGeneralizations at: #NamedElement) qualifiedName: aString
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> redefinableElement [
	^ (sharedGeneralizations at: #Classifier) redefinableElement
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> redefinableElement: aRedefinableElement [
	(sharedGeneralizations at: #Classifier) redefinableElement: aRedefinableElement
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> redefinedClassifier [
	^ (sharedGeneralizations at: #Classifier) redefinedClassifier
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> redefinedClassifier: aClassifier [
	(sharedGeneralizations at: #Classifier) redefinedClassifier: aClassifier
]

{ #category : #'accessing - RedefinableElement' }
BootUMLPrimitiveType >> redefinedElement [
	^ (sharedGeneralizations at: #RedefinableElement) redefinedElement
]

{ #category : #'accessing - RedefinableElement' }
BootUMLPrimitiveType >> redefinedElement: aRedefinableElement [
	(sharedGeneralizations at: #RedefinableElement) redefinedElement: aRedefinableElement
]

{ #category : #'accessing - RedefinableElement' }
BootUMLPrimitiveType >> redefinitionContext [
	^ (sharedGeneralizations at: #RedefinableElement) redefinitionContext
]

{ #category : #'accessing - RedefinableElement' }
BootUMLPrimitiveType >> redefinitionContext: aClassifier [
	(sharedGeneralizations at: #RedefinableElement) redefinitionContext: aClassifier
]

{ #category : #'accessing - Element' }
BootUMLPrimitiveType >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : #'accessing - Element' }
BootUMLPrimitiveType >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> representation [
	^ (sharedGeneralizations at: #Classifier) representation
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> representation: aCollaborationUse [
	(sharedGeneralizations at: #Classifier) representation: aCollaborationUse
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> substitution [
	^ (sharedGeneralizations at: #Classifier) substitution
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> substitution: aSubstitution [
	(sharedGeneralizations at: #Classifier) substitution: aSubstitution
]

{ #category : #'accessing - TemplateableElement' }
BootUMLPrimitiveType >> templateBinding [
	^ (sharedGeneralizations at: #TemplateableElement) templateBinding
]

{ #category : #'accessing - TemplateableElement' }
BootUMLPrimitiveType >> templateBinding: aTemplateBinding [
	(sharedGeneralizations at: #TemplateableElement) templateBinding: aTemplateBinding
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> templateParameter [
	^ (sharedGeneralizations at: #Classifier) templateParameter
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> templateParameter: aClassifierTemplateParameter [
	(sharedGeneralizations at: #Classifier) templateParameter: aClassifierTemplateParameter
]

{ #category : #'accessing - Type' }
BootUMLPrimitiveType >> typedElement [
	^ (sharedGeneralizations at: #Type) typedElement
]

{ #category : #'accessing - Type' }
BootUMLPrimitiveType >> typedElement: aTypedElement [
	(sharedGeneralizations at: #Type) typedElement: aTypedElement
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> useCase [
	^ (sharedGeneralizations at: #Classifier) useCase
]

{ #category : #'accessing - Classifier' }
BootUMLPrimitiveType >> useCase: anUseCase [
	(sharedGeneralizations at: #Classifier) useCase: anUseCase
]

{ #category : #'accessing - PackageableElement' }
BootUMLPrimitiveType >> visibility [
	^ (sharedGeneralizations at: #PackageableElement) visibility
]

{ #category : #'accessing - PackageableElement' }
BootUMLPrimitiveType >> visibility: aVisibilityKind [
	(sharedGeneralizations at: #PackageableElement) visibility: aVisibilityKind
]
