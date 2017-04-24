generating - meta
createElementMeta
	| cls sourceClass |
	cls := self ensureCreateClass: 'Element' in: 'CommonStructure'.
	sourceClass := OPUMLMetamodelElementTemplate.
	sourceClass instanceVariables do: [ :each | cls addInstVarNamed: each ].
	sourceClass methods
		do: [ :each | 
			cls
				addMethod:
					(CBMethod new
						source: each sourceCode;
						protocol: each protocol) ].
	sourceClass class methods
		do: [ :each | 
			cls
				addMetaMethod:
					(CBMethod new
						source: each sourceCode;
						protocol: each protocol) ].
	^ cls