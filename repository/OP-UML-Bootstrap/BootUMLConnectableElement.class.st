Class {
	#name : 'BootUMLConnectableElement',
	#superclass : 'OPUMLBootstrapObject',
	#instVars : [
		'end',
		'templateParameter',
		'structuredClassifier'
	],
	#category : 'OP-UML-Bootstrap-StructuredClassifiers',
	#package : 'OP-UML-Bootstrap',
	#tag : 'StructuredClassifiers'
}

{ #category : 'accessing - NamedElement' }
BootUMLConnectableElement >> clientDependency [
	^ (sharedGeneralizations at: #NamedElement) clientDependency
]

{ #category : 'accessing - NamedElement' }
BootUMLConnectableElement >> clientDependency: aDependency [
	(sharedGeneralizations at: #NamedElement) clientDependency: aDependency
]

{ #category : 'accessing - Element' }
BootUMLConnectableElement >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : 'accessing - Element' }
BootUMLConnectableElement >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : 'accessing - Element' }
BootUMLConnectableElement >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : 'accessing - Element' }
BootUMLConnectableElement >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : 'accessing - Element' }
BootUMLConnectableElement >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : 'accessing - Element' }
BootUMLConnectableElement >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : 'accessing' }
BootUMLConnectableElement >> end [
	^ end
]

{ #category : 'accessing' }
BootUMLConnectableElement >> end: aConnectorEnd [
	end := aConnectorEnd
]

{ #category : 'accessing - NamedElement' }
BootUMLConnectableElement >> inheritingClassifier [
	^ (sharedGeneralizations at: #NamedElement) inheritingClassifier
]

{ #category : 'accessing - NamedElement' }
BootUMLConnectableElement >> inheritingClassifier: aClassifier [
	(sharedGeneralizations at: #NamedElement) inheritingClassifier: aClassifier
]

{ #category : 'initialization' }
BootUMLConnectableElement >> initialize [
	super initialize.
	sharedGeneralizations at: #Element put: (BootUMLElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #NamedElement put: (BootUMLNamedElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #TypedElement put: (BootUMLTypedElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #ParameterableElement put: (BootUMLParameterableElement newOnShared: sharedGeneralizations).
	self initializeGeneralizations.

]

{ #category : 'initialization' }
BootUMLConnectableElement >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #TypedElement.
		sharedGeneralizations at: #ParameterableElement.
	}

]

{ #category : 'accessing - NamedElement' }
BootUMLConnectableElement >> memberNamespace [
	^ (sharedGeneralizations at: #NamedElement) memberNamespace
]

{ #category : 'accessing - NamedElement' }
BootUMLConnectableElement >> memberNamespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) memberNamespace: aNamespace
]

{ #category : 'accessing - NamedElement' }
BootUMLConnectableElement >> name [
	^ (sharedGeneralizations at: #NamedElement) name
]

{ #category : 'accessing - NamedElement' }
BootUMLConnectableElement >> name: aString [
	(sharedGeneralizations at: #NamedElement) name: aString
]

{ #category : 'accessing - NamedElement' }
BootUMLConnectableElement >> nameExpression [
	^ (sharedGeneralizations at: #NamedElement) nameExpression
]

{ #category : 'accessing - NamedElement' }
BootUMLConnectableElement >> nameExpression: aStringExpression [
	(sharedGeneralizations at: #NamedElement) nameExpression: aStringExpression
]

{ #category : 'accessing - NamedElement' }
BootUMLConnectableElement >> namespace [
	^ (sharedGeneralizations at: #NamedElement) namespace
]

{ #category : 'accessing - NamedElement' }
BootUMLConnectableElement >> namespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) namespace: aNamespace
]

{ #category : 'accessing - Element' }
BootUMLConnectableElement >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : 'accessing - Element' }
BootUMLConnectableElement >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : 'accessing - Element' }
BootUMLConnectableElement >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : 'accessing - Element' }
BootUMLConnectableElement >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : 'accessing - Element' }
BootUMLConnectableElement >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : 'accessing - Element' }
BootUMLConnectableElement >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : 'accessing - ParameterableElement' }
BootUMLConnectableElement >> owningTemplateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) owningTemplateParameter
]

{ #category : 'accessing - ParameterableElement' }
BootUMLConnectableElement >> owningTemplateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) owningTemplateParameter: aTemplateParameter
]

{ #category : 'accessing - NamedElement' }
BootUMLConnectableElement >> qualifiedName [
	^ (sharedGeneralizations at: #NamedElement) qualifiedName
]

{ #category : 'accessing - NamedElement' }
BootUMLConnectableElement >> qualifiedName: aString [
	(sharedGeneralizations at: #NamedElement) qualifiedName: aString
]

{ #category : 'accessing - Element' }
BootUMLConnectableElement >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : 'accessing - Element' }
BootUMLConnectableElement >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]

{ #category : 'accessing' }
BootUMLConnectableElement >> structuredClassifier [
	^ structuredClassifier
]

{ #category : 'accessing' }
BootUMLConnectableElement >> structuredClassifier: aStructuredClassifier [
	structuredClassifier := aStructuredClassifier
]

{ #category : 'accessing - ParameterableElement' }
BootUMLConnectableElement >> templateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) templateParameter
]

{ #category : 'accessing - ParameterableElement' }
BootUMLConnectableElement >> templateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) templateParameter: aTemplateParameter
]

{ #category : 'accessing - TypedElement' }
BootUMLConnectableElement >> type [
	^ (sharedGeneralizations at: #TypedElement) type
]

{ #category : 'accessing - TypedElement' }
BootUMLConnectableElement >> type: aType [
	(sharedGeneralizations at: #TypedElement) type: aType
]

{ #category : 'accessing - NamedElement' }
BootUMLConnectableElement >> visibility [
	^ (sharedGeneralizations at: #NamedElement) visibility
]

{ #category : 'accessing - NamedElement' }
BootUMLConnectableElement >> visibility: aVisibilityKind [
	(sharedGeneralizations at: #NamedElement) visibility: aVisibilityKind
]
