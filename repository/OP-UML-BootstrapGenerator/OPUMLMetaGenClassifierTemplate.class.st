Class {
	#name : #OPUMLMetaGenClassifierTemplate,
	#superclass : #OPUMLMetaGenTemplate,
	#instVars : [
		'sharedGeneralizations'
	],
	#category : 'OP-UML-BootstrapGenerator-Templates'
}

{ #category : #implementation }
OPUMLMetaGenClassifierTemplate >> allAttributes [
	| allAttributes |
	allAttributes := OrderedCollection new.
	allAttributes addAll: self attributes.
	sharedGeneralizations
		at: #Class
		ifPresent: [ :cls | allAttributes addAll: cls ownedAttributes ].
	self parents do: [ :each | allAttributes addAll: each allAttributes ].
	^ (allAttributes collect: [ :each | each -> 1 ]) asOrderedDictionary keys
]

{ #category : #implementation }
OPUMLMetaGenClassifierTemplate >> allParents [
	^ self parents union: (self parents flatCollect: #allParents)
]

{ #category : #implementation }
OPUMLMetaGenClassifierTemplate >> general [
	^ self parents
]

{ #category : #implementation }
OPUMLMetaGenClassifierTemplate >> parents [
	^ (self generalizations collect: #general) asSet
]
