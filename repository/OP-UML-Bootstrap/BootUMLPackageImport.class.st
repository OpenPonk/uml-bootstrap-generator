Class {
	#name : #BootUMLPackageImport,
	#superclass : #OPUMLBootstrapObject,
	#instVars : [
		'importedPackage',
		'importingNamespace',
		'visibility'
	],
	#category : 'OP-UML-Bootstrap-CommonStructure'
}

{ #category : #'accessing - Element' }
BootUMLPackageImport >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : #'accessing - Element' }
BootUMLPackageImport >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : #'accessing - Element' }
BootUMLPackageImport >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : #'accessing - Element' }
BootUMLPackageImport >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : #'accessing - Element' }
BootUMLPackageImport >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : #'accessing - Element' }
BootUMLPackageImport >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : #accessing }
BootUMLPackageImport >> importedPackage [
	^ importedPackage
]

{ #category : #accessing }
BootUMLPackageImport >> importedPackage: aPackage [
	importedPackage := aPackage
]

{ #category : #accessing }
BootUMLPackageImport >> importingNamespace [
	^ importingNamespace
]

{ #category : #accessing }
BootUMLPackageImport >> importingNamespace: aNamespace [
	importingNamespace := aNamespace
]

{ #category : #initialization }
BootUMLPackageImport >> initialize [
	super initialize.
	sharedGeneralizations at: #Element put: (BootUMLElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #Relationship put: (BootUMLRelationship newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #DirectedRelationship put: (BootUMLDirectedRelationship newOnShared: sharedGeneralizations).
	self initializeGeneralizations.

]

{ #category : #initialization }
BootUMLPackageImport >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #DirectedRelationship.
	}

]

{ #category : #'accessing - Element' }
BootUMLPackageImport >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : #'accessing - Element' }
BootUMLPackageImport >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : #'accessing - Element' }
BootUMLPackageImport >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : #'accessing - Element' }
BootUMLPackageImport >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : #'accessing - Element' }
BootUMLPackageImport >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : #'accessing - Element' }
BootUMLPackageImport >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : #'accessing - Relationship' }
BootUMLPackageImport >> relatedElement [
	^ (sharedGeneralizations at: #Relationship) relatedElement
]

{ #category : #'accessing - Relationship' }
BootUMLPackageImport >> relatedElement: anElement [
	(sharedGeneralizations at: #Relationship) relatedElement: anElement
]

{ #category : #'accessing - Element' }
BootUMLPackageImport >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : #'accessing - Element' }
BootUMLPackageImport >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]

{ #category : #'accessing - DirectedRelationship' }
BootUMLPackageImport >> source [
	^ (sharedGeneralizations at: #DirectedRelationship) source
]

{ #category : #'accessing - DirectedRelationship' }
BootUMLPackageImport >> source: anElement [
	(sharedGeneralizations at: #DirectedRelationship) source: anElement
]

{ #category : #'accessing - DirectedRelationship' }
BootUMLPackageImport >> target [
	^ (sharedGeneralizations at: #DirectedRelationship) target
]

{ #category : #'accessing - DirectedRelationship' }
BootUMLPackageImport >> target: anElement [
	(sharedGeneralizations at: #DirectedRelationship) target: anElement
]

{ #category : #accessing }
BootUMLPackageImport >> visibility [
	^ visibility
]

{ #category : #accessing }
BootUMLPackageImport >> visibility: aVisibilityKind [
	visibility := aVisibilityKind
]
