writing
writeElement: anElement
	"	(anElement isKindOf: OPUMLMetaElement) ifFalse: [ 
		^ self valueFor: anElement.
	]."

	| objectElement containedItems |
	identityCache at: anElement uuid ifPresent: [ :node | ^node ].
	self ensureInIdentityCache: anElement.
	objectElement := identityCache at: anElement uuid.
	containedItems := objectElement containedItems.
	containedItems add: (OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:' , (self elementNameFor: anElement)).
	containedItems add: (OPXMIValueAttribute xmiName: 'xmi:id' value: anElement uuid asString).
	anElement nonEmptyinspectorProperties
		do: [ :pair | 
			| name value converted |
			name := self asSingular: pair key.
			value := pair value.
			(value isKindOf: OPUMLToManyLinks) | (value isKindOf: OrderedCollection)
				ifTrue: [ value
						do: [ :item | 
							converted := self writeElement: item.
							converted xmiName: name.
							containedItems add: converted ] ]
				ifFalse: [ (value isKindOf: OPUMLMetaElement)
						ifTrue: [ converted := self writeElement: value.
							converted xmiName: name.
							containedItems add: converted ].
					(value isKindOf: OPUMLToOneLink)
						ifTrue: [ converted := self writeReference: value.
							converted xmiName: name.
							containedItems add: converted ].
					(value isKindOf: OPUMLMetaElement) | (value isKindOf: OPUMLToOneLink)
						ifFalse: [ converted := self writeValueElement: value.
							converted xmiName: name.
							containedItems add: converted ] ] ].
	^ objectElement