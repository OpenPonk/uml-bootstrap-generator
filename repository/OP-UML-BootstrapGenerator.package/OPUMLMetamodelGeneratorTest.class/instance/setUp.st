initialization
setUp
	super setUp.
	generator := OPUMLMetamodelGenerator new.
	generator sourceModel: self model.
	generator classPrefix: 'MBUT'.
	generator packageName: 'Generated-UMLMetamodelTest'