generating - methods
addDelegationMethodsFrom: aClassModel to: aClass
	| supers |
	supers := (self allSuperclassesOf: aClassModel)
		collect: [ :each | classes at: each name ].
	supers
		do: [ :superClass | 
			superClass methods
				select: [ :method | method protocol = 'accessing' ]
				thenDo: [ :method | 
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