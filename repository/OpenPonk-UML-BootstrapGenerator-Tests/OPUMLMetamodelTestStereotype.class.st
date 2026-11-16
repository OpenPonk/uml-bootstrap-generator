"
Lightweight stereotype test double supporting umlClassName, umlMetaClass, type comparison, and sample tagged-value attributes for template tests.
"
Class {
	#name : 'OPUMLMetamodelTestStereotype',
	#superclass : 'Object',
	#instVars : [
		'umlClassName',
		'umlMetaClass',
		'label',
		'priority'
	],
	#category : 'OpenPonk-UML-BootstrapGenerator-Tests-Metamodel-Generator',
	#package : 'OpenPonk-UML-BootstrapGenerator-Tests',
	#tag : 'Metamodel-Generator'
}

{ #category : 'accessing' }
OPUMLMetamodelTestStereotype >> label [

	^ label
]

{ #category : 'accessing' }
OPUMLMetamodelTestStereotype >> label: aString [

	label := aString
]

{ #category : 'testing' }
OPUMLMetamodelTestStereotype >> oclIsTypeOf: aClassifier [

	^ umlClassName = aClassifier
]

{ #category : 'accessing' }
OPUMLMetamodelTestStereotype >> priority [

	^ priority
]

{ #category : 'accessing' }
OPUMLMetamodelTestStereotype >> priority: anInteger [

	priority := anInteger
]

{ #category : 'accessing' }
OPUMLMetamodelTestStereotype >> umlClassName [

	^ umlClassName
]

{ #category : 'accessing' }
OPUMLMetamodelTestStereotype >> umlClassName: aString [

	umlClassName := aString
]

{ #category : 'accessing' }
OPUMLMetamodelTestStereotype >> umlMetaClass [

	^ umlMetaClass
]

{ #category : 'accessing' }
OPUMLMetamodelTestStereotype >> umlMetaClass: aMetaClass [

	umlMetaClass := aMetaClass
]
