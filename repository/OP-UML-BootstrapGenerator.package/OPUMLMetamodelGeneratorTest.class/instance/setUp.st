running
setUp
	super setUp.
	generator := OPUMLMetamodelGenerator new.
	generator sourceModel: self class umlBootstrapModel.
	generator rootClassName: 'OPUMLBootstrapObject'.
	generator classPrefix: 'MBUT'.
	generator packageName: 'Generated-UMLMetamodelTest'