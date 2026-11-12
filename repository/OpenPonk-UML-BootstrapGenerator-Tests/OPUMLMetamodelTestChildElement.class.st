"
I am a mock child template class extending OPUMLMetamodelTestParentElement, used exclusively for unit testing the inheritance and method overriding resolution in the generator framework.
"
Class {
	#name : 'OPUMLMetamodelTestChildElement',
	#superclass : 'OPUMLMetamodelTestParentElement',
	#category : 'OpenPonk-UML-BootstrapGenerator-Tests-Metamodel-Generator',
	#package : 'OpenPonk-UML-BootstrapGenerator-Tests',
	#tag : 'Metamodel-Generator'
}

{ #category : 'accessing' }
OPUMLMetamodelTestChildElement >> emptyValue [
	^ #()
]

{ #category : 'initialization' }
OPUMLMetamodelTestChildElement >> initializeDirectGeneralizations [
	directGeneralizations := {sharedGeneralizations at: #MetamodelTestParentElement}
]

{ #category : 'initialization' }
OPUMLMetamodelTestChildElement >> initializeSharedGeneralizations [
	sharedGeneralizations
		at: #MetamodelTestParentElement
		put: (OPUMLMetamodelTestParentElement newOnShared: sharedGeneralizations).
	sharedGeneralizations at: #MetamodelTestChildElement put: self
]

{ #category : 'accessing' }
OPUMLMetamodelTestChildElement >> nilValue [
	^ nil
]

{ #category : 'accessing' }
OPUMLMetamodelTestChildElement >> operation [
	^ #operation
]
