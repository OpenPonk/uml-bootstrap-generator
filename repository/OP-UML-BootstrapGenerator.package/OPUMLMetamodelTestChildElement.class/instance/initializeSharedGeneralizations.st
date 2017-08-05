initialization
initializeSharedGeneralizations
	sharedGeneralizations
		at: #MetamodelTestParentElement
		put: (OPUMLMetamodelTestParentElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #MetamodelTestChildElement put: self