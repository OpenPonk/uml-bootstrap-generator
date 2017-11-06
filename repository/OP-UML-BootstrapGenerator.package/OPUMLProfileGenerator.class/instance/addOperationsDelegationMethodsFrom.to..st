generating - methods
addOperationsDelegationMethodsFrom: aClassModel to: aClass
	| redefinedNames |
	redefinedNames := Set new.
	aClassModel ownedOperations
		ifNotNil:
			[ :ops | ops select: [ :op | op method isNotNil ] thenDo: [ :op | redefinedNames add: op name ] ].
	(self allSuperclassesOf: aClassModel)
		do: [ :superClassModel | 
			| superClass methods |
			superClass := classes at: superClassModel name.
			methods := (superClass methods select: [ :method | method protocol = 'operations' ])
				reject: [ :method | 
					(redefinedNames includes: method selector)
						or: [ redefinedNames includes: (method selector withoutSuffix: ':') asSymbol ] ].
			methods
				do: [ :method | 
					| delegateMethod node |
					node := RBParser parseMethod: method source lines first.
					delegateMethod := CBMethod new
						getter: node selector
							delegateFrom: '(sharedGeneralizations at: #' , (superClass name withoutPrefix: self classPrefix) , ')';
						protocol: 'operations - ' , (superClass name withoutPrefix: self classPrefix).
					aClass addMethod: delegateMethod ] ]