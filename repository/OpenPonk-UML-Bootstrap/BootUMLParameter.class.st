Class {
	#name : 'BootUMLParameter',
	#superclass : 'OPUMLBootstrapObject',
	#instVars : [
		'isStream',
		'defaultValue',
		'default',
		'parameterSet',
		'operation',
		'ownerFormalParam',
		'isException',
		'effect',
		'direction',
		'opaqueExpression'
	],
	#category : 'OpenPonk-UML-Bootstrap-Classification',
	#package : 'OpenPonk-UML-Bootstrap',
	#tag : 'Classification'
}

{ #category : 'accessing - NamedElement' }
BootUMLParameter >> clientDependency [
	^ (sharedGeneralizations at: #NamedElement) clientDependency
]

{ #category : 'accessing - NamedElement' }
BootUMLParameter >> clientDependency: aDependency [
	(sharedGeneralizations at: #NamedElement) clientDependency: aDependency
]

{ #category : 'accessing - Element' }
BootUMLParameter >> comment [
	^ (sharedGeneralizations at: #Element) comment
]

{ #category : 'accessing - Element' }
BootUMLParameter >> comment: aComment [
	(sharedGeneralizations at: #Element) comment: aComment
]

{ #category : 'accessing - Element' }
BootUMLParameter >> constraint [
	^ (sharedGeneralizations at: #Element) constraint
]

{ #category : 'accessing - Element' }
BootUMLParameter >> constraint: aConstraint [
	(sharedGeneralizations at: #Element) constraint: aConstraint
]

{ #category : 'accessing' }
BootUMLParameter >> default [
	^ default
]

{ #category : 'accessing' }
BootUMLParameter >> default: aString [
	default := aString
]

{ #category : 'accessing' }
BootUMLParameter >> defaultValue [
	^ defaultValue
]

{ #category : 'accessing' }
BootUMLParameter >> defaultValue: aValueSpecification [
	defaultValue := aValueSpecification
]

{ #category : 'accessing - Element' }
BootUMLParameter >> directedRelationship [
	^ (sharedGeneralizations at: #Element) directedRelationship
]

{ #category : 'accessing - Element' }
BootUMLParameter >> directedRelationship: aDirectedRelationship [
	(sharedGeneralizations at: #Element) directedRelationship: aDirectedRelationship
]

{ #category : 'accessing' }
BootUMLParameter >> direction [
	^ direction
]

{ #category : 'accessing' }
BootUMLParameter >> direction: aParameterDirectionKind [
	direction := aParameterDirectionKind
]

{ #category : 'accessing' }
BootUMLParameter >> effect [
	^ effect
]

{ #category : 'accessing' }
BootUMLParameter >> effect: aParameterEffectKind [
	effect := aParameterEffectKind
]

{ #category : 'accessing - ConnectableElement' }
BootUMLParameter >> end [
	^ (sharedGeneralizations at: #ConnectableElement) end
]

{ #category : 'accessing - ConnectableElement' }
BootUMLParameter >> end: aConnectorEnd [
	(sharedGeneralizations at: #ConnectableElement) end: aConnectorEnd
]

{ #category : 'accessing - NamedElement' }
BootUMLParameter >> inheritingClassifier [
	^ (sharedGeneralizations at: #NamedElement) inheritingClassifier
]

{ #category : 'accessing - NamedElement' }
BootUMLParameter >> inheritingClassifier: aClassifier [
	(sharedGeneralizations at: #NamedElement) inheritingClassifier: aClassifier
]

{ #category : 'initialization' }
BootUMLParameter >> initialize [
	super initialize.
	sharedGeneralizations at: #Element put: (BootUMLElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #NamedElement put: (BootUMLNamedElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #TypedElement put: (BootUMLTypedElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #ParameterableElement put: (BootUMLParameterableElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #MultiplicityElement put: (BootUMLMultiplicityElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #ConnectableElement put: (BootUMLConnectableElement newOnShared: sharedGeneralizations).
	self initializeGeneralizations.

]

{ #category : 'initialization' }
BootUMLParameter >> initializeGeneralizations [
	generalizations := {
		sharedGeneralizations at: #MultiplicityElement.
		sharedGeneralizations at: #ConnectableElement.
	}

]

{ #category : 'accessing' }
BootUMLParameter >> isException [
	^ isException
]

{ #category : 'accessing' }
BootUMLParameter >> isException: aBoolean [
	isException := aBoolean
]

{ #category : 'accessing - MultiplicityElement' }
BootUMLParameter >> isOrdered [
	^ (sharedGeneralizations at: #MultiplicityElement) isOrdered
]

{ #category : 'accessing - MultiplicityElement' }
BootUMLParameter >> isOrdered: aBoolean [
	(sharedGeneralizations at: #MultiplicityElement) isOrdered: aBoolean
]

{ #category : 'accessing' }
BootUMLParameter >> isStream [
	^ isStream
]

{ #category : 'accessing' }
BootUMLParameter >> isStream: aBoolean [
	isStream := aBoolean
]

{ #category : 'accessing - MultiplicityElement' }
BootUMLParameter >> isUnique [
	^ (sharedGeneralizations at: #MultiplicityElement) isUnique
]

{ #category : 'accessing - MultiplicityElement' }
BootUMLParameter >> isUnique: aBoolean [
	(sharedGeneralizations at: #MultiplicityElement) isUnique: aBoolean
]

{ #category : 'accessing - MultiplicityElement' }
BootUMLParameter >> lower [
	^ (sharedGeneralizations at: #MultiplicityElement) lower
]

{ #category : 'accessing - MultiplicityElement' }
BootUMLParameter >> lower: anInteger [
	(sharedGeneralizations at: #MultiplicityElement) lower: anInteger
]

{ #category : 'accessing - MultiplicityElement' }
BootUMLParameter >> lowerValue [
	^ (sharedGeneralizations at: #MultiplicityElement) lowerValue
]

{ #category : 'accessing - MultiplicityElement' }
BootUMLParameter >> lowerValue: aValueSpecification [
	(sharedGeneralizations at: #MultiplicityElement) lowerValue: aValueSpecification
]

{ #category : 'accessing - NamedElement' }
BootUMLParameter >> memberNamespace [
	^ (sharedGeneralizations at: #NamedElement) memberNamespace
]

{ #category : 'accessing - NamedElement' }
BootUMLParameter >> memberNamespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) memberNamespace: aNamespace
]

{ #category : 'accessing - NamedElement' }
BootUMLParameter >> name [
	^ (sharedGeneralizations at: #NamedElement) name
]

{ #category : 'accessing - NamedElement' }
BootUMLParameter >> name: aString [
	(sharedGeneralizations at: #NamedElement) name: aString
]

{ #category : 'accessing - NamedElement' }
BootUMLParameter >> nameExpression [
	^ (sharedGeneralizations at: #NamedElement) nameExpression
]

{ #category : 'accessing - NamedElement' }
BootUMLParameter >> nameExpression: aStringExpression [
	(sharedGeneralizations at: #NamedElement) nameExpression: aStringExpression
]

{ #category : 'accessing - NamedElement' }
BootUMLParameter >> namespace [
	^ (sharedGeneralizations at: #NamedElement) namespace
]

{ #category : 'accessing - NamedElement' }
BootUMLParameter >> namespace: aNamespace [
	(sharedGeneralizations at: #NamedElement) namespace: aNamespace
]

{ #category : 'accessing' }
BootUMLParameter >> opaqueExpression [
	^ opaqueExpression
]

{ #category : 'accessing' }
BootUMLParameter >> opaqueExpression: anOpaqueExpression [
	opaqueExpression := anOpaqueExpression
]

{ #category : 'accessing' }
BootUMLParameter >> operation [
	^ operation
]

{ #category : 'accessing' }
BootUMLParameter >> operation: anOperation [
	operation := anOperation
]

{ #category : 'accessing - Element' }
BootUMLParameter >> ownedComment [
	^ (sharedGeneralizations at: #Element) ownedComment
]

{ #category : 'accessing - Element' }
BootUMLParameter >> ownedComment: aComment [
	(sharedGeneralizations at: #Element) ownedComment: aComment
]

{ #category : 'accessing - Element' }
BootUMLParameter >> ownedElement [
	^ (sharedGeneralizations at: #Element) ownedElement
]

{ #category : 'accessing - Element' }
BootUMLParameter >> ownedElement: anElement [
	(sharedGeneralizations at: #Element) ownedElement: anElement
]

{ #category : 'accessing - Element' }
BootUMLParameter >> owner [
	^ (sharedGeneralizations at: #Element) owner
]

{ #category : 'accessing - Element' }
BootUMLParameter >> owner: anElement [
	(sharedGeneralizations at: #Element) owner: anElement
]

{ #category : 'accessing' }
BootUMLParameter >> ownerFormalParam [
	^ ownerFormalParam
]

{ #category : 'accessing' }
BootUMLParameter >> ownerFormalParam: aBehavioralFeature [
	ownerFormalParam := aBehavioralFeature
]

{ #category : 'accessing - ParameterableElement' }
BootUMLParameter >> owningTemplateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) owningTemplateParameter
]

{ #category : 'accessing - ParameterableElement' }
BootUMLParameter >> owningTemplateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) owningTemplateParameter: aTemplateParameter
]

{ #category : 'accessing' }
BootUMLParameter >> parameterSet [
	^ parameterSet
]

{ #category : 'accessing' }
BootUMLParameter >> parameterSet: aParameterSet [
	parameterSet := aParameterSet
]

{ #category : 'accessing - NamedElement' }
BootUMLParameter >> qualifiedName [
	^ (sharedGeneralizations at: #NamedElement) qualifiedName
]

{ #category : 'accessing - NamedElement' }
BootUMLParameter >> qualifiedName: aString [
	(sharedGeneralizations at: #NamedElement) qualifiedName: aString
]

{ #category : 'accessing - Element' }
BootUMLParameter >> relationship [
	^ (sharedGeneralizations at: #Element) relationship
]

{ #category : 'accessing - Element' }
BootUMLParameter >> relationship: aRelationship [
	(sharedGeneralizations at: #Element) relationship: aRelationship
]

{ #category : 'accessing - ConnectableElement' }
BootUMLParameter >> structuredClassifier [
	^ (sharedGeneralizations at: #ConnectableElement) structuredClassifier
]

{ #category : 'accessing - ConnectableElement' }
BootUMLParameter >> structuredClassifier: aStructuredClassifier [
	(sharedGeneralizations at: #ConnectableElement) structuredClassifier: aStructuredClassifier
]

{ #category : 'accessing - ParameterableElement' }
BootUMLParameter >> templateParameter [
	^ (sharedGeneralizations at: #ParameterableElement) templateParameter
]

{ #category : 'accessing - ParameterableElement' }
BootUMLParameter >> templateParameter: aTemplateParameter [
	(sharedGeneralizations at: #ParameterableElement) templateParameter: aTemplateParameter
]

{ #category : 'accessing - TypedElement' }
BootUMLParameter >> type [
	^ (sharedGeneralizations at: #TypedElement) type
]

{ #category : 'accessing - TypedElement' }
BootUMLParameter >> type: aType [
	(sharedGeneralizations at: #TypedElement) type: aType
]

{ #category : 'accessing - MultiplicityElement' }
BootUMLParameter >> upper [
	^ (sharedGeneralizations at: #MultiplicityElement) upper
]

{ #category : 'accessing - MultiplicityElement' }
BootUMLParameter >> upper: anUnlimitedNatural [
	(sharedGeneralizations at: #MultiplicityElement) upper: anUnlimitedNatural
]

{ #category : 'accessing - MultiplicityElement' }
BootUMLParameter >> upperValue [
	^ (sharedGeneralizations at: #MultiplicityElement) upperValue
]

{ #category : 'accessing - MultiplicityElement' }
BootUMLParameter >> upperValue: aValueSpecification [
	(sharedGeneralizations at: #MultiplicityElement) upperValue: aValueSpecification
]

{ #category : 'accessing - NamedElement' }
BootUMLParameter >> visibility [
	^ (sharedGeneralizations at: #NamedElement) visibility
]

{ #category : 'accessing - NamedElement' }
BootUMLParameter >> visibility: aVisibilityKind [
	(sharedGeneralizations at: #NamedElement) visibility: aVisibilityKind
]
