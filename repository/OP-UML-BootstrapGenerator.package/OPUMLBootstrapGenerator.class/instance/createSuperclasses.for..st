generating
createSuperclasses: aCollectionOfLayers for: aClassName
	| cls added sharedMethod directMethod |
	cls := classes at: aClassName ifAbsent: [ ^ self ].
	sharedMethod := CBMethodBuilder new.
	sharedMethod selector: 'initialize'.
	sharedMethod addLine: 'super initialize.'.
	added := Set new.
	aCollectionOfLayers
		do: [ :layer | 
			layer
				reject: [ :each | added includes: each ]
				thenDo: [ :each | 
					added add: each.
					sharedMethod
						addLine:
							('sharedGeneralizations at: #<1s> put: (<2s> newOnShared: sharedGeneralizations).'
								expandMacrosWith: each
								with: (self classNameFor: each)) ] ].
	sharedMethod addLine: 'self initializeGeneralizations.'.
	directMethod := CBMethodBuilder new.
	directMethod selector: 'initializeGeneralizations'.
	directMethod addLine: 'generalizations := {'.
	directMethod addIndent.
	aCollectionOfLayers
		ifNotEmpty: [ aCollectionOfLayers last
				do: [ :each | directMethod addLine: 'sharedGeneralizations at: #' , each , '.' ] ].
	directMethod removeIndent.
	directMethod addLine: '}'.
	cls compile: sharedMethod source classified: 'initialization'.
	cls compile: directMethod source classified: 'initialization'