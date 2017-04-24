generating - methods
addGeneralizationsFrom: aClassModel to: cls
	| sharedMethod directMethod initMethod |
	initMethod := CBMethodBuilder new.
	initMethod selector: 'initialize'.
	initMethod addLine: 'super initialize.'.
	initMethod addLine: 'self initializeSharedGeneralizations.'.
	initMethod addLine: 'self initializeDirectGeneralizations'.
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
	directMethod addLine: 'generalizations := {'.
	directMethod addIndent.
	aClassModel generalization
		ifNotNil: [ :gen | 
			gen
				do: [ :each | directMethod addLine: 'sharedGeneralizations at: #' , each general name , '.' ] ].
	directMethod removeIndent.
	directMethod addLine: '}'.
	cls compile: initMethod source trimmed classified: 'initialization'.
	cls compile: sharedMethod source trimmed classified: 'initialization'.
	cls compile: directMethod source trimmed classified: 'initialization'