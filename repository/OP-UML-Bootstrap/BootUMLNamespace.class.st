Class {
	#name : 'BootUMLNamespace',
	#superclass : 'OPUMLBootstrapObject',
	#instVars : [
		'packageImport',
		'member',
		'ownedMember',
		'importedMember',
		'elementImport',
		'ownedRule'
	],
	#category : 'OP-UML-Bootstrap-CommonStructure',
	#package : 'OP-UML-Bootstrap',
	#tag : 'CommonStructure'
}

{ #category : 'accessing - NamedElement' }
BootUMLNamespace >> clientDependency [
	^ (sharedGeneralizations at: #NamedElement) clientDependency
]

{ #category : 'accessing - NamedElement' }
BootUMLNamespace >> clientDependency: aDependency [
	(sharedGeneralizations at: #NamedElement) clientDependency: aDependency
]

{ #category : 'accessing - Element' }
BootUMLNamespace >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : 'accessing - Element' }
BootUMLNamespace >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : 'accessing - Element' }
BootUMLNamespace >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : 'accessing - Element' }
BootUMLNamespace >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : 'accessing - Element' }
BootUMLNamespace >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : 'accessing - Element' }
BootUMLNamespace >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : 'accessing' }
BootUMLNamespace >> elementImport [
	^ elementImport
]

{ #category : 'accessing' }
BootUMLNamespace >> elementImport: anElementImport [
	elementImport := anElementImport
]

{ #category : 'accessing' }
BootUMLNamespace >> importedMember [
	^ importedMember
]

{ #category : 'accessing' }
BootUMLNamespace >> importedMember: aPackageableElement [
	importedMember := aPackageableElement
]

{ #category : 'accessing - NamedElement' }
BootUMLNamespace >> inheritingClassifier [
	^ (sharedGeneralizations at: #NamedElement) inheritingClassifier
]

{ #category : 'accessing - NamedElement' }
BootUMLNamespace >> inheritingClassifier: aClassifier [
	(sharedGeneralizations at: #NamedElement) inheritingClassifier: aClassifier
]

{ #category : 'initialization' }
BootUMLNamespace >> initialize [
	super initialize.
	sharedGeneralizations at: #Element put: (BootUMLElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #NamedElement put: (BootUMLNamedElement newOnShared: sharedGeneralizations).
	self initializeGeneralizations.

]

{ #category : 'initialization' }
BootUMLNamespace >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #NamedElement.
	}

]

{ #category : 'accessing' }
BootUMLNamespace >> member [
	^ member
]

{ #category : 'accessing' }
BootUMLNamespace >> member: aNamedElement [
	member := aNamedElement
]

{ #category : 'accessing - NamedElement' }
BootUMLNamespace >> memberNamespace [
	^ (sharedGeneralizations at: #NamedElement) memberNamespace
]

{ #category : 'accessing - NamedElement' }
BootUMLNamespace >> memberNamespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) memberNamespace: aNamespace
]

{ #category : 'accessing - NamedElement' }
BootUMLNamespace >> name [
	^ (sharedGeneralizations at: #NamedElement) name
]

{ #category : 'accessing - NamedElement' }
BootUMLNamespace >> name: aString [
	(sharedGeneralizations at: #NamedElement) name: aString
]

{ #category : 'accessing - NamedElement' }
BootUMLNamespace >> nameExpression [
	^ (sharedGeneralizations at: #NamedElement) nameExpression
]

{ #category : 'accessing - NamedElement' }
BootUMLNamespace >> nameExpression: aStringExpression [
	(sharedGeneralizations at: #NamedElement) nameExpression: aStringExpression
]

{ #category : 'accessing - NamedElement' }
BootUMLNamespace >> namespace [
	^ (sharedGeneralizations at: #NamedElement) namespace
]

{ #category : 'accessing - NamedElement' }
BootUMLNamespace >> namespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) namespace: aNamespace
]

{ #category : 'accessing - Element' }
BootUMLNamespace >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : 'accessing - Element' }
BootUMLNamespace >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : 'accessing - Element' }
BootUMLNamespace >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : 'accessing - Element' }
BootUMLNamespace >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : 'accessing' }
BootUMLNamespace >> ownedMember [
	^ ownedMember
]

{ #category : 'accessing' }
BootUMLNamespace >> ownedMember: aNamedElement [
	ownedMember := aNamedElement
]

{ #category : 'accessing' }
BootUMLNamespace >> ownedRule [
	^ ownedRule
]

{ #category : 'accessing' }
BootUMLNamespace >> ownedRule: aConstraint [
	ownedRule := aConstraint
]

{ #category : 'accessing - Element' }
BootUMLNamespace >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : 'accessing - Element' }
BootUMLNamespace >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : 'accessing' }
BootUMLNamespace >> packageImport [
	^ packageImport
]

{ #category : 'accessing' }
BootUMLNamespace >> packageImport: aPackageImport [
	packageImport := aPackageImport
]

{ #category : 'accessing - NamedElement' }
BootUMLNamespace >> qualifiedName [
	^ (sharedGeneralizations at: #NamedElement) qualifiedName
]

{ #category : 'accessing - NamedElement' }
BootUMLNamespace >> qualifiedName: aString [
	(sharedGeneralizations at: #NamedElement) qualifiedName: aString
]

{ #category : 'accessing - Element' }
BootUMLNamespace >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : 'accessing - Element' }
BootUMLNamespace >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]

{ #category : 'accessing - NamedElement' }
BootUMLNamespace >> visibility [
	^ (sharedGeneralizations at: #NamedElement) visibility
]

{ #category : 'accessing - NamedElement' }
BootUMLNamespace >> visibility: aVisibilityKind [
	(sharedGeneralizations at: #NamedElement) visibility: aVisibilityKind
]
