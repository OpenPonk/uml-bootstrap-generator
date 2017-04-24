generating - methods
addGeneralizationsFrom: aClassModel to: cls
	| sharedMethod directMethod |
	sharedMethod := CBMethodBuilder new.
	sharedMethod selector: 'initializeSharedGeneralizations'.
	(self allSuperclassesOf: aClassModel)
		do: [ :each | 
			sharedMethod
				addLine:
					('sharedGeneralizations at: #<1s> put: (<2s> newOnShared: sharedGeneralizations).'
						expandMacrosWith: each name
						with: (self classNameFor: each name)) ].
	directMethod := CBMethodBuilder new.
	directMethod selector: 'initializeDirectGeneralizations'.
	directMethod addLine: 'directGeneralizations := {'.
	directMethod addIndent.
	aClassModel generalization
		ifNotNil: [ :gen | 
			gen
				reject: [ :each | each general name = 'Element' ]
				thenDo: [ :each | directMethod addLine: 'sharedGeneralizations at: #' , each general name , '.' ] ].
	directMethod removeIndent.
	directMethod addLine: '}'.
	cls compile: sharedMethod source trimmed classified: 'initialization'.
	cls compile: directMethod source trimmed classified: 'initialization'