Class {
	#name : #BootUMLAssociation,
	#superclass : #OPUMLBootstrapObject,
	#instVars : [
		'ownedEnd',
		'endType',
		'isDerived',
		'memberEnd',
		'navigableOwnedEnd'
	],
	#category : 'OP-UML-Bootstrap-StructuredClassifiers'
}

{ #category : #'accessing - Type' }
BootUMLAssociation >> association [
	^ (sharedGeneralizations at: #Type) association
]

{ #category : #'accessing - Type' }
BootUMLAssociation >> association: anAssociation [
	(sharedGeneralizations at: #Type) association: anAssociation
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> attribute [
	^ (sharedGeneralizations at: #Classifier) attribute
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> attribute: aProperty [
	(sharedGeneralizations at: #Classifier) attribute: aProperty
]

{ #category : #'accessing - Type' }
BootUMLAssociation >> behavioralFeature [
	^ (sharedGeneralizations at: #Type) behavioralFeature
]

{ #category : #'accessing - Type' }
BootUMLAssociation >> behavioralFeature: aBehavioralFeature [
	(sharedGeneralizations at: #Type) behavioralFeature: aBehavioralFeature
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> classifier [
	^ (sharedGeneralizations at: #Classifier) classifier
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> classifier: aClassifier [
	(sharedGeneralizations at: #Classifier) classifier: aClassifier
]

{ #category : #'accessing - NamedElement' }
BootUMLAssociation >> clientDependency [
	^ (sharedGeneralizations at: #NamedElement) clientDependency
]

{ #category : #'accessing - NamedElement' }
BootUMLAssociation >> clientDependency: aDependency [
	(sharedGeneralizations at: #NamedElement) clientDependency: aDependency
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> collaborationUse [
	^ (sharedGeneralizations at: #Classifier) collaborationUse
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> collaborationUse: aCollaborationUse [
	(sharedGeneralizations at: #Classifier) collaborationUse: aCollaborationUse
]

{ #category : #'accessing - Element' }
BootUMLAssociation >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : #'accessing - Element' }
BootUMLAssociation >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : #'accessing - Element' }
BootUMLAssociation >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : #'accessing - Element' }
BootUMLAssociation >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : #'accessing - PackageableElement' }
BootUMLAssociation >> deploymentTarget [
	^ (sharedGeneralizations at: #PackageableElement) deploymentTarget
]

{ #category : #'accessing - PackageableElement' }
BootUMLAssociation >> deploymentTarget: aDeploymentTarget [
	(sharedGeneralizations at: #PackageableElement) deploymentTarget: aDeploymentTarget
]

{ #category : #'accessing - Element' }
BootUMLAssociation >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : #'accessing - Element' }
BootUMLAssociation >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : #'accessing - Namespace' }
BootUMLAssociation >> elementImport [
	^ (sharedGeneralizations at: #Namespace) elementImport
]

{ #category : #'accessing - Namespace' }
BootUMLAssociation >> elementImport: anElementImport [
	(sharedGeneralizations at: #Namespace) elementImport: anElementImport
]

{ #category : #accessing }
BootUMLAssociation >> endType [
	^ endType
]

{ #category : #accessing }
BootUMLAssociation >> endType: aType [
	endType := aType
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> feature [
	^ (sharedGeneralizations at: #Classifier) feature
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> feature: aFeature [
	(sharedGeneralizations at: #Classifier) feature: aFeature
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> general [
	^ (sharedGeneralizations at: #Classifier) general
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> general: aClassifier [
	(sharedGeneralizations at: #Classifier) general: aClassifier
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> generalization [
	^ (sharedGeneralizations at: #Classifier) generalization
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> generalization: aGeneralization [
	(sharedGeneralizations at: #Classifier) generalization: aGeneralization
]

{ #category : #'accessing - Namespace' }
BootUMLAssociation >> importedMember [
	^ (sharedGeneralizations at: #Namespace) importedMember
]

{ #category : #'accessing - Namespace' }
BootUMLAssociation >> importedMember: aPackageableElement [
	(sharedGeneralizations at: #Namespace) importedMember: aPackageableElement
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> inheritedMember [
	^ (sharedGeneralizations at: #Classifier) inheritedMember
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> inheritedMember: aNamedElement [
	(sharedGeneralizations at: #Classifier) inheritedMember: aNamedElement
]

{ #category : #'accessing - NamedElement' }
BootUMLAssociation >> inheritingClassifier [
	^ (sharedGeneralizations at: #NamedElement) inheritingClassifier
]

{ #category : #'accessing - NamedElement' }
BootUMLAssociation >> inheritingClassifier: aClassifier [
	(sharedGeneralizations at: #NamedElement) inheritingClassifier: aClassifier
]

{ #category : #initialization }
BootUMLAssociation >> initialize [
	super initialize.
	sharedGeneralizations at: #Element put: (BootUMLElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #ParameterableElement put: (BootUMLParameterableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #NamedElement put: (BootUMLNamedElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #PackageableElement put: (BootUMLPackageableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Namespace put: (BootUMLNamespace newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Type put: (BootUMLType newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #TemplateableElement put: (BootUMLTemplateableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #RedefinableElement put: (BootUMLRedefinableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Relationship put: (BootUMLRelationship newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Classifier put: (BootUMLClassifier newOnShared: sharedGeneralizations).
	self initializeGeneralizations.

]

{ #category : #initialization }
BootUMLAssociation >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #Relationship.
		sharedGeneralizations at: #Classifier.
	}

]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> instanceSpecification [
	^ (sharedGeneralizations at: #Classifier) instanceSpecification
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> instanceSpecification: anInstanceSpecification [
	(sharedGeneralizations at: #Classifier) instanceSpecification: anInstanceSpecification
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> isAbstract [
	^ (sharedGeneralizations at: #Classifier) isAbstract
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> isAbstract: aBoolean [
	(sharedGeneralizations at: #Classifier) isAbstract: aBoolean
]

{ #category : #accessing }
BootUMLAssociation >> isDerived [
	^ isDerived
]

{ #category : #accessing }
BootUMLAssociation >> isDerived: aBoolean [
	isDerived := aBoolean
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> isFinalSpecialization [
	^ (sharedGeneralizations at: #Classifier) isFinalSpecialization
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> isFinalSpecialization: aBoolean [
	(sharedGeneralizations at: #Classifier) isFinalSpecialization: aBoolean
]

{ #category : #'accessing - RedefinableElement' }
BootUMLAssociation >> isLeaf [
	^ (sharedGeneralizations at: #RedefinableElement) isLeaf
]

{ #category : #'accessing - RedefinableElement' }
BootUMLAssociation >> isLeaf: aBoolean [
	(sharedGeneralizations at: #RedefinableElement) isLeaf: aBoolean
]

{ #category : #'accessing - Namespace' }
BootUMLAssociation >> member [
	^ (sharedGeneralizations at: #Namespace) member
]

{ #category : #'accessing - Namespace' }
BootUMLAssociation >> member: aNamedElement [
	(sharedGeneralizations at: #Namespace) member: aNamedElement
]

{ #category : #accessing }
BootUMLAssociation >> memberEnd [
	^ memberEnd
]

{ #category : #accessing }
BootUMLAssociation >> memberEnd: aProperty [
	memberEnd := aProperty
]

{ #category : #'accessing - NamedElement' }
BootUMLAssociation >> memberNamespace [
	^ (sharedGeneralizations at: #NamedElement) memberNamespace
]

{ #category : #'accessing - NamedElement' }
BootUMLAssociation >> memberNamespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) memberNamespace: aNamespace
]

{ #category : #'accessing - NamedElement' }
BootUMLAssociation >> name [
	^ (sharedGeneralizations at: #NamedElement) name
]

{ #category : #'accessing - NamedElement' }
BootUMLAssociation >> name: aString [
	(sharedGeneralizations at: #NamedElement) name: aString
]

{ #category : #'accessing - NamedElement' }
BootUMLAssociation >> nameExpression [
	^ (sharedGeneralizations at: #NamedElement) nameExpression
]

{ #category : #'accessing - NamedElement' }
BootUMLAssociation >> nameExpression: aStringExpression [
	(sharedGeneralizations at: #NamedElement) nameExpression: aStringExpression
]

{ #category : #'accessing - PackageableElement' }
BootUMLAssociation >> namespace [
	^ (sharedGeneralizations at: #PackageableElement) namespace
]

{ #category : #'accessing - PackageableElement' }
BootUMLAssociation >> namespace: aNamespace [
	(sharedGeneralizations at: #PackageableElement) namespace: aNamespace
]

{ #category : #accessing }
BootUMLAssociation >> navigableOwnedEnd [
	^ navigableOwnedEnd
]

{ #category : #accessing }
BootUMLAssociation >> navigableOwnedEnd: aProperty [
	navigableOwnedEnd := aProperty
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> nestingClass [
	^ (sharedGeneralizations at: #Classifier) nestingClass
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> nestingClass: aClass [
	(sharedGeneralizations at: #Classifier) nestingClass: aClass
]

{ #category : #'accessing - Type' }
BootUMLAssociation >> operation [
	^ (sharedGeneralizations at: #Type) operation
]

{ #category : #'accessing - Type' }
BootUMLAssociation >> operation: anOperation [
	(sharedGeneralizations at: #Type) operation: anOperation
]

{ #category : #'accessing - Element' }
BootUMLAssociation >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : #'accessing - Element' }
BootUMLAssociation >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : #'accessing - Element' }
BootUMLAssociation >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : #'accessing - Element' }
BootUMLAssociation >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : #accessing }
BootUMLAssociation >> ownedEnd [
	^ ownedEnd
]

{ #category : #accessing }
BootUMLAssociation >> ownedEnd: aProperty [
	ownedEnd := aProperty
]

{ #category : #'accessing - Namespace' }
BootUMLAssociation >> ownedMember [
	^ (sharedGeneralizations at: #Namespace) ownedMember
]

{ #category : #'accessing - Namespace' }
BootUMLAssociation >> ownedMember: aNamedElement [
	(sharedGeneralizations at: #Namespace) ownedMember: aNamedElement
]

{ #category : #'accessing - Namespace' }
BootUMLAssociation >> ownedRule [
	^ (sharedGeneralizations at: #Namespace) ownedRule
]

{ #category : #'accessing - Namespace' }
BootUMLAssociation >> ownedRule: aConstraint [
	(sharedGeneralizations at: #Namespace) ownedRule: aConstraint
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> ownedTemplateSignature [
	^ (sharedGeneralizations at: #Classifier) ownedTemplateSignature
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> ownedTemplateSignature: aRedefinableTemplateSignature [
	(sharedGeneralizations at: #Classifier) ownedTemplateSignature: aRedefinableTemplateSignature
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> ownedUseCase [
	^ (sharedGeneralizations at: #Classifier) ownedUseCase
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> ownedUseCase: anUseCase [
	(sharedGeneralizations at: #Classifier) ownedUseCase: anUseCase
]

{ #category : #'accessing - Element' }
BootUMLAssociation >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : #'accessing - Element' }
BootUMLAssociation >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : #'accessing - PackageableElement' }
BootUMLAssociation >> owningPackage [
	^ (sharedGeneralizations at: #PackageableElement) owningPackage
]

{ #category : #'accessing - PackageableElement' }
BootUMLAssociation >> owningPackage: aPackage [
	(sharedGeneralizations at: #PackageableElement) owningPackage: aPackage
]

{ #category : #'accessing - ParameterableElement' }
BootUMLAssociation >> owningTemplateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) owningTemplateParameter
]

{ #category : #'accessing - ParameterableElement' }
BootUMLAssociation >> owningTemplateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) owningTemplateParameter: aTemplateParameter
]

{ #category : #'accessing - Type' }
BootUMLAssociation >> package [
	^ (sharedGeneralizations at: #Type) package
]

{ #category : #'accessing - Type' }
BootUMLAssociation >> package: aPackage [
	(sharedGeneralizations at: #Type) package: aPackage
]

{ #category : #'accessing - Namespace' }
BootUMLAssociation >> packageImport [
	^ (sharedGeneralizations at: #Namespace) packageImport
]

{ #category : #'accessing - Namespace' }
BootUMLAssociation >> packageImport: aPackageImport [
	(sharedGeneralizations at: #Namespace) packageImport: aPackageImport
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> powertypeExtent [
	^ (sharedGeneralizations at: #Classifier) powertypeExtent
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> powertypeExtent: aGeneralizationSet [
	(sharedGeneralizations at: #Classifier) powertypeExtent: aGeneralizationSet
]

{ #category : #'accessing - NamedElement' }
BootUMLAssociation >> qualifiedName [
	^ (sharedGeneralizations at: #NamedElement) qualifiedName
]

{ #category : #'accessing - NamedElement' }
BootUMLAssociation >> qualifiedName: aString [
	(sharedGeneralizations at: #NamedElement) qualifiedName: aString
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> redefinableElement [
	^ (sharedGeneralizations at: #Classifier) redefinableElement
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> redefinableElement: aRedefinableElement [
	(sharedGeneralizations at: #Classifier) redefinableElement: aRedefinableElement
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> redefinedClassifier [
	^ (sharedGeneralizations at: #Classifier) redefinedClassifier
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> redefinedClassifier: aClassifier [
	(sharedGeneralizations at: #Classifier) redefinedClassifier: aClassifier
]

{ #category : #'accessing - RedefinableElement' }
BootUMLAssociation >> redefinedElement [
	^ (sharedGeneralizations at: #RedefinableElement) redefinedElement
]

{ #category : #'accessing - RedefinableElement' }
BootUMLAssociation >> redefinedElement: aRedefinableElement [
	(sharedGeneralizations at: #RedefinableElement) redefinedElement: aRedefinableElement
]

{ #category : #'accessing - RedefinableElement' }
BootUMLAssociation >> redefinitionContext [
	^ (sharedGeneralizations at: #RedefinableElement) redefinitionContext
]

{ #category : #'accessing - RedefinableElement' }
BootUMLAssociation >> redefinitionContext: aClassifier [
	(sharedGeneralizations at: #RedefinableElement) redefinitionContext: aClassifier
]

{ #category : #'accessing - Relationship' }
BootUMLAssociation >> relatedElement [
	^ (sharedGeneralizations at: #Relationship) relatedElement
]

{ #category : #'accessing - Relationship' }
BootUMLAssociation >> relatedElement: anElement [
	(sharedGeneralizations at: #Relationship) relatedElement: anElement
]

{ #category : #'accessing - Element' }
BootUMLAssociation >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : #'accessing - Element' }
BootUMLAssociation >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> representation [
	^ (sharedGeneralizations at: #Classifier) representation
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> representation: aCollaborationUse [
	(sharedGeneralizations at: #Classifier) representation: aCollaborationUse
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> substitution [
	^ (sharedGeneralizations at: #Classifier) substitution
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> substitution: aSubstitution [
	(sharedGeneralizations at: #Classifier) substitution: aSubstitution
]

{ #category : #'accessing - TemplateableElement' }
BootUMLAssociation >> templateBinding [
	^ (sharedGeneralizations at: #TemplateableElement) templateBinding
]

{ #category : #'accessing - TemplateableElement' }
BootUMLAssociation >> templateBinding: aTemplateBinding [
	(sharedGeneralizations at: #TemplateableElement) templateBinding: aTemplateBinding
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> templateParameter [
	^ (sharedGeneralizations at: #Classifier) templateParameter
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> templateParameter: aClassifierTemplateParameter [
	(sharedGeneralizations at: #Classifier) templateParameter: aClassifierTemplateParameter
]

{ #category : #'accessing - Type' }
BootUMLAssociation >> typedElement [
	^ (sharedGeneralizations at: #Type) typedElement
]

{ #category : #'accessing - Type' }
BootUMLAssociation >> typedElement: aTypedElement [
	(sharedGeneralizations at: #Type) typedElement: aTypedElement
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> useCase [
	^ (sharedGeneralizations at: #Classifier) useCase
]

{ #category : #'accessing - Classifier' }
BootUMLAssociation >> useCase: anUseCase [
	(sharedGeneralizations at: #Classifier) useCase: anUseCase
]

{ #category : #'accessing - PackageableElement' }
BootUMLAssociation >> visibility [
	^ (sharedGeneralizations at: #PackageableElement) visibility
]

{ #category : #'accessing - PackageableElement' }
BootUMLAssociation >> visibility: aVisibilityKind [
	(sharedGeneralizations at: #PackageableElement) visibility: aVisibilityKind
]
