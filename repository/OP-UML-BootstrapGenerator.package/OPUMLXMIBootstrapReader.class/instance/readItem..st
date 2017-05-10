reading
readItem: anItem
	| instance groups |
	anItem isValueItem
		ifTrue: [ ^ self valueFor: anItem value ].
	anItem isReferenceItem
		ifTrue: [ ^ anItem referencedElements collect: [ :each | self readItem: each ] ].
	instanceCache at: (self uniqueIdOf: anItem) ifPresent: [ :match | ^ match ].
	instance := self instanceFor: anItem.
	groups := self groupedChildrenIn: anItem.
	groups
		keysAndValuesDo: [ :key :values | 
			| selector arguments sg |
			selector := (key , ':') asSymbol.
			sg := (instance class selectors includes: selector)
				or: [ instance class superclass name = (self classPrefix , 'Element')
						and: [ instance class superclass selectors includes: selector ] ].
			self assert: [ sg ].
			arguments := values collect: [ :each | self readItem: each ].
			(arguments anyOne isArray or: [ arguments anyOne isKindOf: OrderedCollection ])
				ifTrue: [ arguments := arguments gather: #yourself ].
			(self isCollectionAttribute: key inClass: instance class)
				ifTrue: [ instance perform: selector with: arguments ]
				ifFalse: [ self assert: [ values size = 1 ].
					instance perform: selector with: arguments first ] ].
	^ instance