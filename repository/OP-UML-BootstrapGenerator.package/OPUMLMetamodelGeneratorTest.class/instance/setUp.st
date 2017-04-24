running
setUp
	super setUp.
	generator := OPUMLMetamodelGenerator new.
	generator sourceModel: self class umlBootstrapModel.
	generator classPrefix: 'MBUT'.
	generator packageName: 'Generated-UMLMetamodelTest'