Class {
	#name : #OPUMLMetamodelTestParentElement,
	#superclass : #OPUMLMetamodelElementTemplate,
	#category : 'OP-UML-BootstrapGenerator-Tests'
}

{ #category : #accessing }
OPUMLMetamodelTestParentElement >> fromParent [
	^ 12
]

{ #category : #initialization }
OPUMLMetamodelTestParentElement >> initializeDirectGeneralizations [
	directGeneralizations := {}
]

{ #category : #initialization }
OPUMLMetamodelTestParentElement >> initializeSharedGeneralizations [
	sharedGeneralizations at: #MetamodelTestParentElement put: self
]
