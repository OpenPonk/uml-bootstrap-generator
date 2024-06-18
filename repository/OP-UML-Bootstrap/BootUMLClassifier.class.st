Class {
	#name : 'BootUMLClassifier',
	#superclass : 'OPUMLBootstrapObject',
	#instVars : [
		'general',
		'generalization',
		'feature',
		'substitution',
		'useCase',
		'classifier',
		'redefinableElement',
		'powertypeExtent',
		'ownedTemplateSignature',
		'isAbstract',
		'inheritedMember',
		'ownedUseCase',
		'collaborationUse',
		'attribute',
		'templateParameter',
		'nestingClass',
		'redefinedClassifier',
		'representation',
		'isFinalSpecialization',
		'instanceSpecification'
	],
	#category : 'OP-UML-Bootstrap-Classification',
	#package : 'OP-UML-Bootstrap',
	#tag : 'Classification'
}

{ #category : 'accessing - Type' }
BootUMLClassifier >> association [
	^ (sharedGeneralizations at: #Type) association
]

{ #category : 'accessing - Type' }
BootUMLClassifier >> association: anAssociation [
	(sharedGeneralizations at: #Type) association: anAssociation
]

{ #category : 'accessing' }
BootUMLClassifier >> attribute [
	^ attribute
]

{ #category : 'accessing' }
BootUMLClassifier >> attribute: aProperty [
	attribute := aProperty
]

{ #category : 'accessing - Type' }
BootUMLClassifier >> behavioralFeature [
	^ (sharedGeneralizations at: #Type) behavioralFeature
]

{ #category : 'accessing - Type' }
BootUMLClassifier >> behavioralFeature: aBehavioralFeature [
	(sharedGeneralizations at: #Type) behavioralFeature: aBehavioralFeature
]

{ #category : 'accessing' }
BootUMLClassifier >> classifier [
	^ classifier
]

{ #category : 'accessing' }
BootUMLClassifier >> classifier: aClassifier [
	classifier := aClassifier
]

{ #category : 'accessing - NamedElement' }
BootUMLClassifier >> clientDependency [
	^ (sharedGeneralizations at: #NamedElement) clientDependency
]

{ #category : 'accessing - NamedElement' }
BootUMLClassifier >> clientDependency: aDependency [
	(sharedGeneralizations at: #NamedElement) clientDependency: aDependency
]

{ #category : 'accessing' }
BootUMLClassifier >> collaborationUse [
	^ collaborationUse
]

{ #category : 'accessing' }
BootUMLClassifier >> collaborationUse: aCollaborationUse [
	collaborationUse := aCollaborationUse
]

{ #category : 'accessing - Element' }
BootUMLClassifier >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : 'accessing - Element' }
BootUMLClassifier >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : 'accessing - Element' }
BootUMLClassifier >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : 'accessing - Element' }
BootUMLClassifier >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : 'accessing - PackageableElement' }
BootUMLClassifier >> deploymentTarget [
	^ (sharedGeneralizations at: #PackageableElement) deploymentTarget
]

{ #category : 'accessing - PackageableElement' }
BootUMLClassifier >> deploymentTarget: aDeploymentTarget [
	(sharedGeneralizations at: #PackageableElement) deploymentTarget: aDeploymentTarget
]

{ #category : 'accessing - Element' }
BootUMLClassifier >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : 'accessing - Element' }
BootUMLClassifier >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : 'accessing - Namespace' }
BootUMLClassifier >> elementImport [
	^ (sharedGeneralizations at: #Namespace) elementImport
]

{ #category : 'accessing - Namespace' }
BootUMLClassifier >> elementImport: anElementImport [
	(sharedGeneralizations at: #Namespace) elementImport: anElementImport
]

{ #category : 'accessing' }
BootUMLClassifier >> feature [
	^ feature
]

{ #category : 'accessing' }
BootUMLClassifier >> feature: aFeature [
	feature := aFeature
]

{ #category : 'accessing' }
BootUMLClassifier >> general [
	^ general
]

{ #category : 'accessing' }
BootUMLClassifier >> general: aClassifier [
	general := aClassifier
]

{ #category : 'accessing' }
BootUMLClassifier >> generalization [
	^ generalization
]

{ #category : 'accessing' }
BootUMLClassifier >> generalization: aGeneralization [
	generalization := aGeneralization
]

{ #category : 'accessing - Namespace' }
BootUMLClassifier >> importedMember [
	^ (sharedGeneralizations at: #Namespace) importedMember
]

{ #category : 'accessing - Namespace' }
BootUMLClassifier >> importedMember: aPackageableElement [
	(sharedGeneralizations at: #Namespace) importedMember: aPackageableElement
]

{ #category : 'accessing' }
BootUMLClassifier >> inheritedMember [
	^ inheritedMember
]

{ #category : 'accessing' }
BootUMLClassifier >> inheritedMember: aNamedElement [
	inheritedMember := aNamedElement
]

{ #category : 'accessing - NamedElement' }
BootUMLClassifier >> inheritingClassifier [
	^ (sharedGeneralizations at: #NamedElement) inheritingClassifier
]

{ #category : 'accessing - NamedElement' }
BootUMLClassifier >> inheritingClassifier: aClassifier [
	(sharedGeneralizations at: #NamedElement) inheritingClassifier: aClassifier
]

{ #category : 'initialization' }
BootUMLClassifier >> initialize [
	super initialize.
	sharedGeneralizations at: #Element put: (BootUMLElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #ParameterableElement put: (BootUMLParameterableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #NamedElement put: (BootUMLNamedElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #PackageableElement put: (BootUMLPackageableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Namespace put: (BootUMLNamespace newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Type put: (BootUMLType newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #TemplateableElement put: (BootUMLTemplateableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #RedefinableElement put: (BootUMLRedefinableElement newOnShared: sharedGeneralizations).
	self initializeGeneralizations.

]

{ #category : 'initialization' }
BootUMLClassifier >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #Namespace.
		sharedGeneralizations at: #Type.
		sharedGeneralizations at: #TemplateableElement.
		sharedGeneralizations at: #RedefinableElement.
	}

]

{ #category : 'accessing' }
BootUMLClassifier >> instanceSpecification [
	^ instanceSpecification
]

{ #category : 'accessing' }
BootUMLClassifier >> instanceSpecification: anInstanceSpecification [
	instanceSpecification := anInstanceSpecification
]

{ #category : 'accessing' }
BootUMLClassifier >> isAbstract [
	^ isAbstract
]

{ #category : 'accessing' }
BootUMLClassifier >> isAbstract: aBoolean [
	isAbstract := aBoolean
]

{ #category : 'accessing' }
BootUMLClassifier >> isFinalSpecialization [
	^ isFinalSpecialization
]

{ #category : 'accessing' }
BootUMLClassifier >> isFinalSpecialization: aBoolean [
	isFinalSpecialization := aBoolean
]

{ #category : 'accessing - RedefinableElement' }
BootUMLClassifier >> isLeaf [
	^ (sharedGeneralizations at: #RedefinableElement) isLeaf
]

{ #category : 'accessing - RedefinableElement' }
BootUMLClassifier >> isLeaf: aBoolean [
	(sharedGeneralizations at: #RedefinableElement) isLeaf: aBoolean
]

{ #category : 'accessing - Namespace' }
BootUMLClassifier >> member [
	^ (sharedGeneralizations at: #Namespace) member
]

{ #category : 'accessing - Namespace' }
BootUMLClassifier >> member: aNamedElement [
	(sharedGeneralizations at: #Namespace) member: aNamedElement
]

{ #category : 'accessing - NamedElement' }
BootUMLClassifier >> memberNamespace [
	^ (sharedGeneralizations at: #NamedElement) memberNamespace
]

{ #category : 'accessing - NamedElement' }
BootUMLClassifier >> memberNamespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) memberNamespace: aNamespace
]

{ #category : 'accessing - NamedElement' }
BootUMLClassifier >> name [
	^ (sharedGeneralizations at: #NamedElement) name
]

{ #category : 'accessing - NamedElement' }
BootUMLClassifier >> name: aString [
	(sharedGeneralizations at: #NamedElement) name: aString
]

{ #category : 'accessing - NamedElement' }
BootUMLClassifier >> nameExpression [
	^ (sharedGeneralizations at: #NamedElement) nameExpression
]

{ #category : 'accessing - NamedElement' }
BootUMLClassifier >> nameExpression: aStringExpression [
	(sharedGeneralizations at: #NamedElement) nameExpression: aStringExpression
]

{ #category : 'accessing - NamedElement' }
BootUMLClassifier >> namespace [
	^ (sharedGeneralizations at: #NamedElement) namespace
]

{ #category : 'accessing - NamedElement' }
BootUMLClassifier >> namespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) namespace: aNamespace
]

{ #category : 'accessing' }
BootUMLClassifier >> nestingClass [
	^ nestingClass
]

{ #category : 'accessing' }
BootUMLClassifier >> nestingClass: aClass [
	nestingClass := aClass
]

{ #category : 'accessing - Type' }
BootUMLClassifier >> operation [
	^ (sharedGeneralizations at: #Type) operation
]

{ #category : 'accessing - Type' }
BootUMLClassifier >> operation: anOperation [
	(sharedGeneralizations at: #Type) operation: anOperation
]

{ #category : 'accessing - Element' }
BootUMLClassifier >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : 'accessing - Element' }
BootUMLClassifier >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : 'accessing - Element' }
BootUMLClassifier >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : 'accessing - Element' }
BootUMLClassifier >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : 'accessing - Namespace' }
BootUMLClassifier >> ownedMember [
	^ (sharedGeneralizations at: #Namespace) ownedMember
]

{ #category : 'accessing - Namespace' }
BootUMLClassifier >> ownedMember: aNamedElement [
	(sharedGeneralizations at: #Namespace) ownedMember: aNamedElement
]

{ #category : 'accessing - Namespace' }
BootUMLClassifier >> ownedRule [
	^ (sharedGeneralizations at: #Namespace) ownedRule
]

{ #category : 'accessing - Namespace' }
BootUMLClassifier >> ownedRule: aConstraint [
	(sharedGeneralizations at: #Namespace) ownedRule: aConstraint
]

{ #category : 'accessing - TemplateableElement' }
BootUMLClassifier >> ownedTemplateSignature [
	^ (sharedGeneralizations at: #TemplateableElement) ownedTemplateSignature
]

{ #category : 'accessing - TemplateableElement' }
BootUMLClassifier >> ownedTemplateSignature: aTemplateSignature [
	(sharedGeneralizations at: #TemplateableElement) ownedTemplateSignature: aTemplateSignature
]

{ #category : 'accessing' }
BootUMLClassifier >> ownedUseCase [
	^ ownedUseCase
]

{ #category : 'accessing' }
BootUMLClassifier >> ownedUseCase: anUseCase [
	ownedUseCase := anUseCase
]

{ #category : 'accessing - Element' }
BootUMLClassifier >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : 'accessing - Element' }
BootUMLClassifier >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : 'accessing - PackageableElement' }
BootUMLClassifier >> owningPackage [
	^ (sharedGeneralizations at: #PackageableElement) owningPackage
]

{ #category : 'accessing - PackageableElement' }
BootUMLClassifier >> owningPackage: aPackage [
	(sharedGeneralizations at: #PackageableElement) owningPackage: aPackage
]

{ #category : 'accessing - ParameterableElement' }
BootUMLClassifier >> owningTemplateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) owningTemplateParameter
]

{ #category : 'accessing - ParameterableElement' }
BootUMLClassifier >> owningTemplateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) owningTemplateParameter: aTemplateParameter
]

{ #category : 'accessing - Type' }
BootUMLClassifier >> package [
	^ (sharedGeneralizations at: #Type) package
]

{ #category : 'accessing - Type' }
BootUMLClassifier >> package: aPackage [
	(sharedGeneralizations at: #Type) package: aPackage
]

{ #category : 'accessing - Namespace' }
BootUMLClassifier >> packageImport [
	^ (sharedGeneralizations at: #Namespace) packageImport
]

{ #category : 'accessing - Namespace' }
BootUMLClassifier >> packageImport: aPackageImport [
	(sharedGeneralizations at: #Namespace) packageImport: aPackageImport
]

{ #category : 'accessing' }
BootUMLClassifier >> powertypeExtent [
	^ powertypeExtent
]

{ #category : 'accessing' }
BootUMLClassifier >> powertypeExtent: aGeneralizationSet [
	powertypeExtent := aGeneralizationSet
]

{ #category : 'accessing - NamedElement' }
BootUMLClassifier >> qualifiedName [
	^ (sharedGeneralizations at: #NamedElement) qualifiedName
]

{ #category : 'accessing - NamedElement' }
BootUMLClassifier >> qualifiedName: aString [
	(sharedGeneralizations at: #NamedElement) qualifiedName: aString
]

{ #category : 'accessing - RedefinableElement' }
BootUMLClassifier >> redefinableElement [
	^ (sharedGeneralizations at: #RedefinableElement) redefinableElement
]

{ #category : 'accessing - RedefinableElement' }
BootUMLClassifier >> redefinableElement: aRedefinableElement [
	(sharedGeneralizations at: #RedefinableElement) redefinableElement: aRedefinableElement
]

{ #category : 'accessing' }
BootUMLClassifier >> redefinedClassifier [
	^ redefinedClassifier
]

{ #category : 'accessing' }
BootUMLClassifier >> redefinedClassifier: aClassifier [
	redefinedClassifier := aClassifier
]

{ #category : 'accessing - RedefinableElement' }
BootUMLClassifier >> redefinedElement [
	^ (sharedGeneralizations at: #RedefinableElement) redefinedElement
]

{ #category : 'accessing - RedefinableElement' }
BootUMLClassifier >> redefinedElement: aRedefinableElement [
	(sharedGeneralizations at: #RedefinableElement) redefinedElement: aRedefinableElement
]

{ #category : 'accessing - RedefinableElement' }
BootUMLClassifier >> redefinitionContext [
	^ (sharedGeneralizations at: #RedefinableElement) redefinitionContext
]

{ #category : 'accessing - RedefinableElement' }
BootUMLClassifier >> redefinitionContext: aClassifier [
	(sharedGeneralizations at: #RedefinableElement) redefinitionContext: aClassifier
]

{ #category : 'accessing - Element' }
BootUMLClassifier >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : 'accessing - Element' }
BootUMLClassifier >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]

{ #category : 'accessing' }
BootUMLClassifier >> representation [
	^ representation
]

{ #category : 'accessing' }
BootUMLClassifier >> representation: aCollaborationUse [
	representation := aCollaborationUse
]

{ #category : 'accessing' }
BootUMLClassifier >> substitution [
	^ substitution
]

{ #category : 'accessing' }
BootUMLClassifier >> substitution: aSubstitution [
	substitution := aSubstitution
]

{ #category : 'accessing - TemplateableElement' }
BootUMLClassifier >> templateBinding [
	^ (sharedGeneralizations at: #TemplateableElement) templateBinding
]

{ #category : 'accessing - TemplateableElement' }
BootUMLClassifier >> templateBinding: aTemplateBinding [
	(sharedGeneralizations at: #TemplateableElement) templateBinding: aTemplateBinding
]

{ #category : 'accessing - ParameterableElement' }
BootUMLClassifier >> templateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) templateParameter
]

{ #category : 'accessing - ParameterableElement' }
BootUMLClassifier >> templateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) templateParameter: aTemplateParameter
]

{ #category : 'accessing - Type' }
BootUMLClassifier >> typedElement [
	^ (sharedGeneralizations at: #Type) typedElement
]

{ #category : 'accessing - Type' }
BootUMLClassifier >> typedElement: aTypedElement [
	(sharedGeneralizations at: #Type) typedElement: aTypedElement
]

{ #category : 'accessing' }
BootUMLClassifier >> useCase [
	^ useCase
]

{ #category : 'accessing' }
BootUMLClassifier >> useCase: anUseCase [
	useCase := anUseCase
]

{ #category : 'accessing - NamedElement' }
BootUMLClassifier >> visibility [
	^ (sharedGeneralizations at: #NamedElement) visibility
]

{ #category : 'accessing - NamedElement' }
BootUMLClassifier >> visibility: aVisibilityKind [
	(sharedGeneralizations at: #NamedElement) visibility: aVisibilityKind
]
