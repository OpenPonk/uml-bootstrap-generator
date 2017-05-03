generating - meta
createElementMeta
	| cls sourceClass |
	cls := self ensureCreateClass: 'MetaElement' in: 'Meta'.
	cls comment: 'I am a metaclass for UML classes implementing some behavior for managing the classes and other stuff (like an announcer).'.
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