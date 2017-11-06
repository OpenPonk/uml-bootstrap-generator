generating
loadTemplateMethods
	| templateClasses allClasses |
	templateClasses := OPUMLMetamodelGeneratorTemplates allSubclasses
		copyWithout: OPUMLMetaGenTemplate.
	allClasses := sourceModel packagedElements
		select: [ :each | each oclIsKindOf: #Stereotype ].
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