Class {
	#name : #BootUMLEnumeration,
	#superclass : #OPUMLBootstrapObject,
	#instVars : [
		'ownedLiteral',
		'enumerationLiteral'
	],
	#category : 'OP-UML-Bootstrap-SimpleClassifiers'
}

{ #category : #'accessing - Type' }
BootUMLEnumeration >> association [
	^ (sharedGeneralizations at: #Type) association
]

{ #category : #'accessing - Type' }
BootUMLEnumeration >> association: anAssociation [
	(sharedGeneralizations at: #Type) association: anAssociation
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> attribute [
	^ (sharedGeneralizations at: #Classifier) attribute
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> attribute: aProperty [
	(sharedGeneralizations at: #Classifier) attribute: aProperty
]

{ #category : #'accessing - Type' }
BootUMLEnumeration >> behavioralFeature [
	^ (sharedGeneralizations at: #Type) behavioralFeature
]

{ #category : #'accessing - Type' }
BootUMLEnumeration >> behavioralFeature: aBehavioralFeature [
	(sharedGeneralizations at: #Type) behavioralFeature: aBehavioralFeature
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> classifier [
	^ (sharedGeneralizations at: #Classifier) classifier
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> classifier: aClassifier [
	(sharedGeneralizations at: #Classifier) classifier: aClassifier
]

{ #category : #'accessing - NamedElement' }
BootUMLEnumeration >> clientDependency [
	^ (sharedGeneralizations at: #NamedElement) clientDependency
]

{ #category : #'accessing - NamedElement' }
BootUMLEnumeration >> clientDependency: aDependency [
	(sharedGeneralizations at: #NamedElement) clientDependency: aDependency
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> collaborationUse [
	^ (sharedGeneralizations at: #Classifier) collaborationUse
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> collaborationUse: aCollaborationUse [
	(sharedGeneralizations at: #Classifier) collaborationUse: aCollaborationUse
]

{ #category : #'accessing - Element' }
BootUMLEnumeration >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : #'accessing - Element' }
BootUMLEnumeration >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : #'accessing - Element' }
BootUMLEnumeration >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : #'accessing - Element' }
BootUMLEnumeration >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : #'accessing - PackageableElement' }
BootUMLEnumeration >> deploymentTarget [
	^ (sharedGeneralizations at: #PackageableElement) deploymentTarget
]

{ #category : #'accessing - PackageableElement' }
BootUMLEnumeration >> deploymentTarget: aDeploymentTarget [
	(sharedGeneralizations at: #PackageableElement) deploymentTarget: aDeploymentTarget
]

{ #category : #'accessing - Element' }
BootUMLEnumeration >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : #'accessing - Element' }
BootUMLEnumeration >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : #'accessing - Namespace' }
BootUMLEnumeration >> elementImport [
	^ (sharedGeneralizations at: #Namespace) elementImport
]

{ #category : #'accessing - Namespace' }
BootUMLEnumeration >> elementImport: anElementImport [
	(sharedGeneralizations at: #Namespace) elementImport: anElementImport
]

{ #category : #accessing }
BootUMLEnumeration >> enumerationLiteral [
	^ enumerationLiteral
]

{ #category : #accessing }
BootUMLEnumeration >> enumerationLiteral: anEnumerationLiteral [
	enumerationLiteral := anEnumerationLiteral
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> feature [
	^ (sharedGeneralizations at: #Classifier) feature
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> feature: aFeature [
	(sharedGeneralizations at: #Classifier) feature: aFeature
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> general [
	^ (sharedGeneralizations at: #Classifier) general
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> general: aClassifier [
	(sharedGeneralizations at: #Classifier) general: aClassifier
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> generalization [
	^ (sharedGeneralizations at: #Classifier) generalization
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> generalization: aGeneralization [
	(sharedGeneralizations at: #Classifier) generalization: aGeneralization
]

{ #category : #'accessing - Namespace' }
BootUMLEnumeration >> importedMember [
	^ (sharedGeneralizations at: #Namespace) importedMember
]

{ #category : #'accessing - Namespace' }
BootUMLEnumeration >> importedMember: aPackageableElement [
	(sharedGeneralizations at: #Namespace) importedMember: aPackageableElement
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> inheritedMember [
	^ (sharedGeneralizations at: #Classifier) inheritedMember
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> inheritedMember: aNamedElement [
	(sharedGeneralizations at: #Classifier) inheritedMember: aNamedElement
]

{ #category : #'accessing - NamedElement' }
BootUMLEnumeration >> inheritingClassifier [
	^ (sharedGeneralizations at: #NamedElement) inheritingClassifier
]

{ #category : #'accessing - NamedElement' }
BootUMLEnumeration >> inheritingClassifier: aClassifier [
	(sharedGeneralizations at: #NamedElement) inheritingClassifier: aClassifier
]

{ #category : #initialization }
BootUMLEnumeration >> initialize [
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
BootUMLEnumeration >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #DataType.
	}

]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> instanceSpecification [
	^ (sharedGeneralizations at: #Classifier) instanceSpecification
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> instanceSpecification: anInstanceSpecification [
	(sharedGeneralizations at: #Classifier) instanceSpecification: anInstanceSpecification
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> isAbstract [
	^ (sharedGeneralizations at: #Classifier) isAbstract
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> isAbstract: aBoolean [
	(sharedGeneralizations at: #Classifier) isAbstract: aBoolean
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> isFinalSpecialization [
	^ (sharedGeneralizations at: #Classifier) isFinalSpecialization
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> isFinalSpecialization: aBoolean [
	(sharedGeneralizations at: #Classifier) isFinalSpecialization: aBoolean
]

{ #category : #'accessing - RedefinableElement' }
BootUMLEnumeration >> isLeaf [
	^ (sharedGeneralizations at: #RedefinableElement) isLeaf
]

{ #category : #'accessing - RedefinableElement' }
BootUMLEnumeration >> isLeaf: aBoolean [
	(sharedGeneralizations at: #RedefinableElement) isLeaf: aBoolean
]

{ #category : #'accessing - Namespace' }
BootUMLEnumeration >> member [
	^ (sharedGeneralizations at: #Namespace) member
]

{ #category : #'accessing - Namespace' }
BootUMLEnumeration >> member: aNamedElement [
	(sharedGeneralizations at: #Namespace) member: aNamedElement
]

{ #category : #'accessing - NamedElement' }
BootUMLEnumeration >> memberNamespace [
	^ (sharedGeneralizations at: #NamedElement) memberNamespace
]

{ #category : #'accessing - NamedElement' }
BootUMLEnumeration >> memberNamespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) memberNamespace: aNamespace
]

{ #category : #'accessing - NamedElement' }
BootUMLEnumeration >> name [
	^ (sharedGeneralizations at: #NamedElement) name
]

{ #category : #'accessing - NamedElement' }
BootUMLEnumeration >> name: aString [
	(sharedGeneralizations at: #NamedElement) name: aString
]

{ #category : #'accessing - NamedElement' }
BootUMLEnumeration >> nameExpression [
	^ (sharedGeneralizations at: #NamedElement) nameExpression
]

{ #category : #'accessing - NamedElement' }
BootUMLEnumeration >> nameExpression: aStringExpression [
	(sharedGeneralizations at: #NamedElement) nameExpression: aStringExpression
]

{ #category : #'accessing - PackageableElement' }
BootUMLEnumeration >> namespace [
	^ (sharedGeneralizations at: #PackageableElement) namespace
]

{ #category : #'accessing - PackageableElement' }
BootUMLEnumeration >> namespace: aNamespace [
	(sharedGeneralizations at: #PackageableElement) namespace: aNamespace
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> nestingClass [
	^ (sharedGeneralizations at: #Classifier) nestingClass
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> nestingClass: aClass [
	(sharedGeneralizations at: #Classifier) nestingClass: aClass
]

{ #category : #'accessing - Type' }
BootUMLEnumeration >> operation [
	^ (sharedGeneralizations at: #Type) operation
]

{ #category : #'accessing - Type' }
BootUMLEnumeration >> operation: anOperation [
	(sharedGeneralizations at: #Type) operation: anOperation
]

{ #category : #'accessing - DataType' }
BootUMLEnumeration >> ownedAttribute [
	^ (sharedGeneralizations at: #DataType) ownedAttribute
]

{ #category : #'accessing - DataType' }
BootUMLEnumeration >> ownedAttribute: aProperty [
	(sharedGeneralizations at: #DataType) ownedAttribute: aProperty
]

{ #category : #'accessing - Element' }
BootUMLEnumeration >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : #'accessing - Element' }
BootUMLEnumeration >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : #'accessing - Element' }
BootUMLEnumeration >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : #'accessing - Element' }
BootUMLEnumeration >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : #accessing }
BootUMLEnumeration >> ownedLiteral [
	^ ownedLiteral
]

{ #category : #accessing }
BootUMLEnumeration >> ownedLiteral: anEnumerationLiteral [
	ownedLiteral := anEnumerationLiteral
]

{ #category : #'accessing - Namespace' }
BootUMLEnumeration >> ownedMember [
	^ (sharedGeneralizations at: #Namespace) ownedMember
]

{ #category : #'accessing - Namespace' }
BootUMLEnumeration >> ownedMember: aNamedElement [
	(sharedGeneralizations at: #Namespace) ownedMember: aNamedElement
]

{ #category : #'accessing - DataType' }
BootUMLEnumeration >> ownedOperation [
	^ (sharedGeneralizations at: #DataType) ownedOperation
]

{ #category : #'accessing - DataType' }
BootUMLEnumeration >> ownedOperation: anOperation [
	(sharedGeneralizations at: #DataType) ownedOperation: anOperation
]

{ #category : #'accessing - Namespace' }
BootUMLEnumeration >> ownedRule [
	^ (sharedGeneralizations at: #Namespace) ownedRule
]

{ #category : #'accessing - Namespace' }
BootUMLEnumeration >> ownedRule: aConstraint [
	(sharedGeneralizations at: #Namespace) ownedRule: aConstraint
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> ownedTemplateSignature [
	^ (sharedGeneralizations at: #Classifier) ownedTemplateSignature
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> ownedTemplateSignature: aRedefinableTemplateSignature [
	(sharedGeneralizations at: #Classifier) ownedTemplateSignature: aRedefinableTemplateSignature
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> ownedUseCase [
	^ (sharedGeneralizations at: #Classifier) ownedUseCase
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> ownedUseCase: anUseCase [
	(sharedGeneralizations at: #Classifier) ownedUseCase: anUseCase
]

{ #category : #'accessing - Element' }
BootUMLEnumeration >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : #'accessing - Element' }
BootUMLEnumeration >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : #'accessing - PackageableElement' }
BootUMLEnumeration >> owningPackage [
	^ (sharedGeneralizations at: #PackageableElement) owningPackage
]

{ #category : #'accessing - PackageableElement' }
BootUMLEnumeration >> owningPackage: aPackage [
	(sharedGeneralizations at: #PackageableElement) owningPackage: aPackage
]

{ #category : #'accessing - ParameterableElement' }
BootUMLEnumeration >> owningTemplateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) owningTemplateParameter
]

{ #category : #'accessing - ParameterableElement' }
BootUMLEnumeration >> owningTemplateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) owningTemplateParameter: aTemplateParameter
]

{ #category : #'accessing - Type' }
BootUMLEnumeration >> package [
	^ (sharedGeneralizations at: #Type) package
]

{ #category : #'accessing - Type' }
BootUMLEnumeration >> package: aPackage [
	(sharedGeneralizations at: #Type) package: aPackage
]

{ #category : #'accessing - Namespace' }
BootUMLEnumeration >> packageImport [
	^ (sharedGeneralizations at: #Namespace) packageImport
]

{ #category : #'accessing - Namespace' }
BootUMLEnumeration >> packageImport: aPackageImport [
	(sharedGeneralizations at: #Namespace) packageImport: aPackageImport
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> powertypeExtent [
	^ (sharedGeneralizations at: #Classifier) powertypeExtent
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> powertypeExtent: aGeneralizationSet [
	(sharedGeneralizations at: #Classifier) powertypeExtent: aGeneralizationSet
]

{ #category : #'accessing - NamedElement' }
BootUMLEnumeration >> qualifiedName [
	^ (sharedGeneralizations at: #NamedElement) qualifiedName
]

{ #category : #'accessing - NamedElement' }
BootUMLEnumeration >> qualifiedName: aString [
	(sharedGeneralizations at: #NamedElement) qualifiedName: aString
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> redefinableElement [
	^ (sharedGeneralizations at: #Classifier) redefinableElement
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> redefinableElement: aRedefinableElement [
	(sharedGeneralizations at: #Classifier) redefinableElement: aRedefinableElement
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> redefinedClassifier [
	^ (sharedGeneralizations at: #Classifier) redefinedClassifier
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> redefinedClassifier: aClassifier [
	(sharedGeneralizations at: #Classifier) redefinedClassifier: aClassifier
]

{ #category : #'accessing - RedefinableElement' }
BootUMLEnumeration >> redefinedElement [
	^ (sharedGeneralizations at: #RedefinableElement) redefinedElement
]

{ #category : #'accessing - RedefinableElement' }
BootUMLEnumeration >> redefinedElement: aRedefinableElement [
	(sharedGeneralizations at: #RedefinableElement) redefinedElement: aRedefinableElement
]

{ #category : #'accessing - RedefinableElement' }
BootUMLEnumeration >> redefinitionContext [
	^ (sharedGeneralizations at: #RedefinableElement) redefinitionContext
]

{ #category : #'accessing - RedefinableElement' }
BootUMLEnumeration >> redefinitionContext: aClassifier [
	(sharedGeneralizations at: #RedefinableElement) redefinitionContext: aClassifier
]

{ #category : #'accessing - Element' }
BootUMLEnumeration >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : #'accessing - Element' }
BootUMLEnumeration >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> representation [
	^ (sharedGeneralizations at: #Classifier) representation
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> representation: aCollaborationUse [
	(sharedGeneralizations at: #Classifier) representation: aCollaborationUse
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> substitution [
	^ (sharedGeneralizations at: #Classifier) substitution
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> substitution: aSubstitution [
	(sharedGeneralizations at: #Classifier) substitution: aSubstitution
]

{ #category : #'accessing - TemplateableElement' }
BootUMLEnumeration >> templateBinding [
	^ (sharedGeneralizations at: #TemplateableElement) templateBinding
]

{ #category : #'accessing - TemplateableElement' }
BootUMLEnumeration >> templateBinding: aTemplateBinding [
	(sharedGeneralizations at: #TemplateableElement) templateBinding: aTemplateBinding
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> templateParameter [
	^ (sharedGeneralizations at: #Classifier) templateParameter
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> templateParameter: aClassifierTemplateParameter [
	(sharedGeneralizations at: #Classifier) templateParameter: aClassifierTemplateParameter
]

{ #category : #'accessing - Type' }
BootUMLEnumeration >> typedElement [
	^ (sharedGeneralizations at: #Type) typedElement
]

{ #category : #'accessing - Type' }
BootUMLEnumeration >> typedElement: aTypedElement [
	(sharedGeneralizations at: #Type) typedElement: aTypedElement
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> useCase [
	^ (sharedGeneralizations at: #Classifier) useCase
]

{ #category : #'accessing - Classifier' }
BootUMLEnumeration >> useCase: anUseCase [
	(sharedGeneralizations at: #Classifier) useCase: anUseCase
]

{ #category : #'accessing - PackageableElement' }
BootUMLEnumeration >> visibility [
	^ (sharedGeneralizations at: #PackageableElement) visibility
]

{ #category : #'accessing - PackageableElement' }
BootUMLEnumeration >> visibility: aVisibilityKind [
	(sharedGeneralizations at: #PackageableElement) visibility: aVisibilityKind
]
