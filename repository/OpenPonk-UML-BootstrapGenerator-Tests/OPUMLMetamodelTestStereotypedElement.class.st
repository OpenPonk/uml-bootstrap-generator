"
Test double element providing name and stereotype extension slots for metamodel element template tests.
"
Class {
	#name : 'OPUMLMetamodelTestStereotypedElement',
	#superclass : 'OPUMLMetamodelTestChildElement',
	#instVars : [
		'name',
		'extensionBaseStereo',
		'extensionOtherStereo'
	],
	#category : 'OpenPonk-UML-BootstrapGenerator-Tests-Metamodel-Generator',
	#package : 'OpenPonk-UML-BootstrapGenerator-Tests',
	#tag : 'Metamodel-Generator'
}

{ #category : 'accessing' }
OPUMLMetamodelTestStereotypedElement >> extension_BaseStereo [

	^ extensionBaseStereo
]

{ #category : 'accessing' }
OPUMLMetamodelTestStereotypedElement >> extension_BaseStereo: aStereotype [

	extensionBaseStereo := aStereotype
]

{ #category : 'accessing' }
OPUMLMetamodelTestStereotypedElement >> extension_OtherStereo [

	^ extensionOtherStereo
]

{ #category : 'accessing' }
OPUMLMetamodelTestStereotypedElement >> extension_OtherStereo: aStereotype [

	extensionOtherStereo := aStereotype
]

{ #category : 'accessing' }
OPUMLMetamodelTestStereotypedElement >> name [

	^ name
]

{ #category : 'accessing' }
OPUMLMetamodelTestStereotypedElement >> name: aString [

	name := aString
]
