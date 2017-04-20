initialization
initializeGeneralizations
	generalizations := {
		sharedGeneralizations at: #Namespace.
		sharedGeneralizations at: #Type.
		sharedGeneralizations at: #TemplateableElement.
		sharedGeneralizations at: #RedefinableElement.
	}
