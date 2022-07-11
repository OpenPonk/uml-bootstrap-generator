Class {
	#name : #BootUMLPackage,
	#superclass : #OPUMLBootstrapObject,
	#instVars : [
		'ownedType',
		'nestedPackage',
		'packageImport',
		'packageMerge',
		'ownedStereotype',
		'packagedElement',
		'profileApplication',
		'nestingPackage',
		'URI'
	],
	#category : 'OP-UML-Bootstrap-Packages'
}

{ #category : #accessing }
BootUMLPackage >> URI [
	^ URI
]

{ #category : #accessing }
BootUMLPackage >> URI: aString [
	URI := aString
]

{ #category : #'accessing - NamedElement' }
BootUMLPackage >> clientDependency [
	^ (sharedGeneralizations at: #NamedElement) clientDependency
]

{ #category : #'accessing - NamedElement' }
BootUMLPackage >> clientDependency: aDependency [
	(sharedGeneralizations at: #NamedElement) clientDependency: aDependency
]

{ #category : #'accessing - Element' }
BootUMLPackage >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : #'accessing - Element' }
BootUMLPackage >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : #'accessing - Element' }
BootUMLPackage >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : #'accessing - Element' }
BootUMLPackage >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : #'accessing - PackageableElement' }
BootUMLPackage >> deploymentTarget [
	^ (sharedGeneralizations at: #PackageableElement) deploymentTarget
]

{ #category : #'accessing - PackageableElement' }
BootUMLPackage >> deploymentTarget: aDeploymentTarget [
	(sharedGeneralizations at: #PackageableElement) deploymentTarget: aDeploymentTarget
]

{ #category : #'accessing - Element' }
BootUMLPackage >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : #'accessing - Element' }
BootUMLPackage >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : #'accessing - Namespace' }
BootUMLPackage >> elementImport [
	^ (sharedGeneralizations at: #Namespace) elementImport
]

{ #category : #'accessing - Namespace' }
BootUMLPackage >> elementImport: anElementImport [
	(sharedGeneralizations at: #Namespace) elementImport: anElementImport
]

{ #category : #'accessing - Namespace' }
BootUMLPackage >> importedMember [
	^ (sharedGeneralizations at: #Namespace) importedMember
]

{ #category : #'accessing - Namespace' }
BootUMLPackage >> importedMember: aPackageableElement [
	(sharedGeneralizations at: #Namespace) importedMember: aPackageableElement
]

{ #category : #'accessing - NamedElement' }
BootUMLPackage >> inheritingClassifier [
	^ (sharedGeneralizations at: #NamedElement) inheritingClassifier
]

{ #category : #'accessing - NamedElement' }
BootUMLPackage >> inheritingClassifier: aClassifier [
	(sharedGeneralizations at: #NamedElement) inheritingClassifier: aClassifier
]

{ #category : #initialization }
BootUMLPackage >> initialize [
	super initialize.
	sharedGeneralizations at: #Element put: (BootUMLElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #ParameterableElement put: (BootUMLParameterableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #NamedElement put: (BootUMLNamedElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #PackageableElement put: (BootUMLPackageableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #TemplateableElement put: (BootUMLTemplateableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Namespace put: (BootUMLNamespace newOnShared: sharedGeneralizations).
	self initializeGeneralizations.

]

{ #category : #initialization }
BootUMLPackage >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #PackageableElement.
		sharedGeneralizations at: #TemplateableElement.
		sharedGeneralizations at: #Namespace.
	}

]

{ #category : #'accessing - Namespace' }
BootUMLPackage >> member [
	^ (sharedGeneralizations at: #Namespace) member
]

{ #category : #'accessing - Namespace' }
BootUMLPackage >> member: aNamedElement [
	(sharedGeneralizations at: #Namespace) member: aNamedElement
]

{ #category : #'accessing - NamedElement' }
BootUMLPackage >> memberNamespace [
	^ (sharedGeneralizations at: #NamedElement) memberNamespace
]

{ #category : #'accessing - NamedElement' }
BootUMLPackage >> memberNamespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) memberNamespace: aNamespace
]

{ #category : #'accessing - NamedElement' }
BootUMLPackage >> name [
	^ (sharedGeneralizations at: #NamedElement) name
]

{ #category : #'accessing - NamedElement' }
BootUMLPackage >> name: aString [
	(sharedGeneralizations at: #NamedElement) name: aString
]

{ #category : #'accessing - NamedElement' }
BootUMLPackage >> nameExpression [
	^ (sharedGeneralizations at: #NamedElement) nameExpression
]

{ #category : #'accessing - NamedElement' }
BootUMLPackage >> nameExpression: aStringExpression [
	(sharedGeneralizations at: #NamedElement) nameExpression: aStringExpression
]

{ #category : #'accessing - PackageableElement' }
BootUMLPackage >> namespace [
	^ (sharedGeneralizations at: #PackageableElement) namespace
]

{ #category : #'accessing - PackageableElement' }
BootUMLPackage >> namespace: aNamespace [
	(sharedGeneralizations at: #PackageableElement) namespace: aNamespace
]

{ #category : #accessing }
BootUMLPackage >> nestedPackage [
	^ nestedPackage
]

{ #category : #accessing }
BootUMLPackage >> nestedPackage: aPackage [
	nestedPackage := aPackage
]

{ #category : #accessing }
BootUMLPackage >> nestingPackage [
	^ nestingPackage
]

{ #category : #accessing }
BootUMLPackage >> nestingPackage: aPackage [
	nestingPackage := aPackage
]

{ #category : #'accessing - Element' }
BootUMLPackage >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : #'accessing - Element' }
BootUMLPackage >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : #'accessing - Element' }
BootUMLPackage >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : #'accessing - Element' }
BootUMLPackage >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : #'accessing - Namespace' }
BootUMLPackage >> ownedMember [
	^ (sharedGeneralizations at: #Namespace) ownedMember
]

{ #category : #'accessing - Namespace' }
BootUMLPackage >> ownedMember: aNamedElement [
	(sharedGeneralizations at: #Namespace) ownedMember: aNamedElement
]

{ #category : #'accessing - Namespace' }
BootUMLPackage >> ownedRule [
	^ (sharedGeneralizations at: #Namespace) ownedRule
]

{ #category : #'accessing - Namespace' }
BootUMLPackage >> ownedRule: aConstraint [
	(sharedGeneralizations at: #Namespace) ownedRule: aConstraint
]

{ #category : #accessing }
BootUMLPackage >> ownedStereotype [
	^ ownedStereotype
]

{ #category : #accessing }
BootUMLPackage >> ownedStereotype: aStereotype [
	ownedStereotype := aStereotype
]

{ #category : #'accessing - TemplateableElement' }
BootUMLPackage >> ownedTemplateSignature [
	^ (sharedGeneralizations at: #TemplateableElement) ownedTemplateSignature
]

{ #category : #'accessing - TemplateableElement' }
BootUMLPackage >> ownedTemplateSignature: aTemplateSignature [
	(sharedGeneralizations at: #TemplateableElement) ownedTemplateSignature: aTemplateSignature
]

{ #category : #accessing }
BootUMLPackage >> ownedType [
	^ ownedType
]

{ #category : #accessing }
BootUMLPackage >> ownedType: aType [
	ownedType := aType
]

{ #category : #'accessing - Element' }
BootUMLPackage >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : #'accessing - Element' }
BootUMLPackage >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : #'accessing - PackageableElement' }
BootUMLPackage >> owningPackage [
	^ (sharedGeneralizations at: #PackageableElement) owningPackage
]

{ #category : #'accessing - PackageableElement' }
BootUMLPackage >> owningPackage: aPackage [
	(sharedGeneralizations at: #PackageableElement) owningPackage: aPackage
]

{ #category : #'accessing - ParameterableElement' }
BootUMLPackage >> owningTemplateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) owningTemplateParameter
]

{ #category : #'accessing - ParameterableElement' }
BootUMLPackage >> owningTemplateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) owningTemplateParameter: aTemplateParameter
]

{ #category : #'accessing - Namespace' }
BootUMLPackage >> packageImport [
	^ (sharedGeneralizations at: #Namespace) packageImport
]

{ #category : #'accessing - Namespace' }
BootUMLPackage >> packageImport: aPackageImport [
	(sharedGeneralizations at: #Namespace) packageImport: aPackageImport
]

{ #category : #accessing }
BootUMLPackage >> packageMerge [
	^ packageMerge
]

{ #category : #accessing }
BootUMLPackage >> packageMerge: aPackageMerge [
	packageMerge := aPackageMerge
]

{ #category : #accessing }
BootUMLPackage >> packagedElement [
	^ packagedElement
]

{ #category : #accessing }
BootUMLPackage >> packagedElement: aPackageableElement [
	packagedElement := aPackageableElement
]

{ #category : #accessing }
BootUMLPackage >> profileApplication [
	^ profileApplication
]

{ #category : #accessing }
BootUMLPackage >> profileApplication: aProfileApplication [
	profileApplication := aProfileApplication
]

{ #category : #'accessing - NamedElement' }
BootUMLPackage >> qualifiedName [
	^ (sharedGeneralizations at: #NamedElement) qualifiedName
]

{ #category : #'accessing - NamedElement' }
BootUMLPackage >> qualifiedName: aString [
	(sharedGeneralizations at: #NamedElement) qualifiedName: aString
]

{ #category : #'accessing - Element' }
BootUMLPackage >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : #'accessing - Element' }
BootUMLPackage >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]

{ #category : #'accessing - TemplateableElement' }
BootUMLPackage >> templateBinding [
	^ (sharedGeneralizations at: #TemplateableElement) templateBinding
]

{ #category : #'accessing - TemplateableElement' }
BootUMLPackage >> templateBinding: aTemplateBinding [
	(sharedGeneralizations at: #TemplateableElement) templateBinding: aTemplateBinding
]

{ #category : #'accessing - ParameterableElement' }
BootUMLPackage >> templateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) templateParameter
]

{ #category : #'accessing - ParameterableElement' }
BootUMLPackage >> templateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) templateParameter: aTemplateParameter
]

{ #category : #'accessing - PackageableElement' }
BootUMLPackage >> visibility [
	^ (sharedGeneralizations at: #PackageableElement) visibility
]

{ #category : #'accessing - PackageableElement' }
BootUMLPackage >> visibility: aVisibilityKind [
	(sharedGeneralizations at: #PackageableElement) visibility: aVisibilityKind
]
