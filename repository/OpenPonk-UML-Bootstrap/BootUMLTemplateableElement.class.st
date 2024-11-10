Class {
	#name : 'BootUMLTemplateableElement',
	#superclass : 'OPUMLBootstrapObject',
	#instVars : [
		'ownedTemplateSignature',
		'templateBinding'
	],
	#category : 'OpenPonk-UML-Bootstrap-CommonStructure',
	#package : 'OpenPonk-UML-Bootstrap',
	#tag : 'CommonStructure'
}

{ #category : 'accessing - Element' }
BootUMLTemplateableElement >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : 'accessing - Element' }
BootUMLTemplateableElement >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : 'accessing - Element' }
BootUMLTemplateableElement >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : 'accessing - Element' }
BootUMLTemplateableElement >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : 'accessing - Element' }
BootUMLTemplateableElement >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : 'accessing - Element' }
BootUMLTemplateableElement >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : 'initialization' }
BootUMLTemplateableElement >> initialize [
	super initialize.
	sharedGeneralizations at: #Element put: (BootUMLElement newOnShared: sharedGeneralizations).
	self initializeGeneralizations.

]

{ #category : 'initialization' }
BootUMLTemplateableElement >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #Element.
	}

]

{ #category : 'accessing - Element' }
BootUMLTemplateableElement >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : 'accessing - Element' }
BootUMLTemplateableElement >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : 'accessing - Element' }
BootUMLTemplateableElement >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : 'accessing - Element' }
BootUMLTemplateableElement >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : 'accessing' }
BootUMLTemplateableElement >> ownedTemplateSignature [
	^ ownedTemplateSignature
]

{ #category : 'accessing' }
BootUMLTemplateableElement >> ownedTemplateSignature: aTemplateSignature [
	ownedTemplateSignature := aTemplateSignature
]

{ #category : 'accessing - Element' }
BootUMLTemplateableElement >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : 'accessing - Element' }
BootUMLTemplateableElement >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : 'accessing - Element' }
BootUMLTemplateableElement >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : 'accessing - Element' }
BootUMLTemplateableElement >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]

{ #category : 'accessing' }
BootUMLTemplateableElement >> templateBinding [
	^ templateBinding
]

{ #category : 'accessing' }
BootUMLTemplateableElement >> templateBinding: aTemplateBinding [
	templateBinding := aTemplateBinding
]
