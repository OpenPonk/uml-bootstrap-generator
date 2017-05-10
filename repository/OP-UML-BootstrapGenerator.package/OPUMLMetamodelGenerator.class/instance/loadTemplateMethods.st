generating
loadTemplateMethods
	| templateClasses allClasses |
	templateClasses := OPUMLMetamodelGeneratorTemplates allSubclasses.
	allClasses := (sourceModel packagedElement flatCollect: #packagedElement)
		select: [ :each | each isKindOf: BootUMLClass ].
	templateClasses
		do: [ :cls | 
			| supported template |
			template := cls new.
			supported := template supportedClasses.
			supported
				do: [ :name | 
					| classModel |
					classModel := allClasses detect: [ :each | each name = name ].
					classModel ownedOperation
						do: [ :op | op method: (template methodsFor: op inClassNamed: name) ] ] ]