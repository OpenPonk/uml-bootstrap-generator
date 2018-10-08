Class {
	#name : #OPUMLMetamodelTestChildElement,
	#superclass : #OPUMLMetamodelTestParentElement,
	#category : 'OP-UML-BootstrapGenerator-Tests'
}

{ #category : #accessing }
OPUMLMetamodelTestChildElement >> emptyValue [
	^ #()
]

{ #category : #initialization }
OPUMLMetamodelTestChildElement >> initializeDirectGeneralizations [
	directGeneralizations := {sharedGeneralizations at: #MetamodelTestParentElement}
]

{ #category : #initialization }
OPUMLMetamodelTestChildElement >> initializeSharedGeneralizations [
	sharedGeneralizations
		at: #MetamodelTestParentElement
		put: (OPUMLMetamodelTestParentElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #MetamodelTestChildElement put: self
]

{ #category : #accessing }
OPUMLMetamodelTestChildElement >> nilValue [
	^ nil
]

{ #category : #accessing }
OPUMLMetamodelTestChildElement >> operation [
	^ #operation
]
