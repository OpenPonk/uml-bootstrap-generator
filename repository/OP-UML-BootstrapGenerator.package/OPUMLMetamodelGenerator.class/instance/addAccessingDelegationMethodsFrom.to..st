generating - methods
addAccessingDelegationMethodsFrom: aClassModel to: aClass
	| redefinedNames |
	redefinedNames := Set new.
	aClassModel ownedAttribute
		ifNotNil: [ :attrs | 
			attrs
				select: [ :attr | attr redefinedProperty isNotNil ]
				thenDo: [ :attr | 
					redefinedNames
						addAll: (attr redefinedProperty collect: [ :prop | self attributeNameFor: prop ]) ] ].
	(self allSuperclassesOf: aClassModel)
		do: [ :superClassModel | 
			| superClass methods |
			superClass := classes at: superClassModel name.
			methods := (superClass methods select: [ :method | method protocol = 'accessing' ])
				reject: [ :method | 
					(redefinedNames includes: method selector)
						or: [ redefinedNames includes: (method selector withoutSuffix: ':') asSymbol ] ].
			methods
				do: [ :method | 
					| delegateMethod node |
					node := RBParser parseMethod: method source lines first.
					delegateMethod := node numArgs = 0
						ifTrue: [ CBMethod new
								getter: node selector
									delegateFrom: '(sharedGeneralizations at: #' , (superClass name withoutPrefix: self classPrefix) , ')';
								protocol: 'accessing - ' , (superClass name withoutPrefix: self classPrefix) ]
						ifFalse: [ CBMethod new
								setter: (node selector withoutSuffix: ':')
									argument: ((node argumentNames first withoutPrefix: 'a') withoutPrefix: 'n')
									delegateTo: '(sharedGeneralizations at: #' , (superClass name withoutPrefix: self classPrefix) , ')';
								protocol: 'accessing - ' , (superClass name withoutPrefix: self classPrefix) ].
					aClass addMethod: delegateMethod ] ]