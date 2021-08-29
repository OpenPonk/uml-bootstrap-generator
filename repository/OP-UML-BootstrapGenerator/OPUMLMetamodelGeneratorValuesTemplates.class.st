Class {
	#name : #OPUMLMetamodelGeneratorValuesTemplates,
	#superclass : #OPUMLMetamodelGeneratorTemplates,
	#category : #'OP-UML-BootstrapGenerator-Templates'
}

{ #category : #templates }
OPUMLMetamodelGeneratorValuesTemplates >> literalBoolean [
	^ {#booleanValue -> '^ value'.
	#isComputable -> '^ true'}
]

{ #category : #templates }
OPUMLMetamodelGeneratorValuesTemplates >> literalInteger [
	^ {#integerValue -> '^ self value'.
	#isComputable -> '^ true'}
]

{ #category : #templates }
OPUMLMetamodelGeneratorValuesTemplates >> literalNull [
	^ {#isNull -> '^ true'.
	#isComputable -> '^ true'}
]

{ #category : #templates }
OPUMLMetamodelGeneratorValuesTemplates >> literalReal [
	^ {#realValue -> '^ value'.
	#isComputable -> '^ true'}
]

{ #category : #templates }
OPUMLMetamodelGeneratorValuesTemplates >> literalString [
	^ {#stringValue -> '^ value'.
	#isComputable -> '^ true'}
]

{ #category : #templates }
OPUMLMetamodelGeneratorValuesTemplates >> literalUnlimitedNatural [
	^ {#unlimitedValue -> '^ value'.
	#isComputable -> '^ true'}
]

{ #category : #templates }
OPUMLMetamodelGeneratorValuesTemplates >> valueSpecification [
	^ {#booleanValue -> '^ nil'.
	#integerValue -> '^ nil'.
	#isComputable -> '^ false'.
	#isNull -> '^ false'.
	#realValue -> '^ nil'.
	#stringValue -> '^ nil'.
	#unlimitedValue -> '^ nil'}
]
