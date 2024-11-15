Class {
	#name : 'OPUMLMetamodelElementTemplateTest',
	#superclass : 'TestCase',
	#category : 'OpenPonk-UML-BootstrapGenerator-Tests',
	#package : 'OpenPonk-UML-BootstrapGenerator',
	#tag : 'Tests'
}

{ #category : 'running' }
OPUMLMetamodelElementTemplateTest >> setUp [

	| generator metaElementClassName |
	super setUp.

	generator := OPUMLMetamodelGenerator newDefault.
	metaElementClassName := generator classNameFor:
		                        generator metaElementName.

	(Smalltalk globals includesKey: metaElementClassName) ifTrue: [
		^ self ].

	Object classInstaller make: [ :builder |
		builder
			superclass: Object;
			name: metaElementClassName asSymbol;
			package: generator packageName;
			tag: generator metaTag;
			environment: Object environment ]
]

{ #category : 'tests' }
OPUMLMetamodelElementTemplateTest >> testAddTag [
	| el |
	el := OPUMLMetamodelTestChildElement new.
	self deny: (el hasTagAt: 'key').
	el tagAt: 'key' put: 12.
	self assert: (el hasTagAt: 'key')
]

{ #category : 'tests' }
OPUMLMetamodelElementTemplateTest >> testInspectorProperties [
	self
		assert: OPUMLMetamodelTestChildElement new inspectorProperties
		equals:
			{#emptyValue -> #().
			#fromParent -> 12.
			#nilValue -> nil.
			#operation -> #operation}
]

{ #category : 'tests' }
OPUMLMetamodelElementTemplateTest >> testNonEmptyInspectorProperties [
	self
		assert: OPUMLMetamodelTestChildElement new nonEmptyinspectorProperties
		equals:
			{#fromParent -> 12.
			#operation -> #operation}
]

{ #category : 'tests  - ocl-experimental' }
OPUMLMetamodelElementTemplateTest >> testOclAsType [
	| el |
	el := OPUMLMetamodelTestChildElement new.
	self
		assert: (el oclAsType: 'MetamodelTestParentElement') class
		equals: OPUMLMetamodelTestParentElement
]

{ #category : 'tests  - ocl-experimental' }
OPUMLMetamodelElementTemplateTest >> testOclIsKindOf [
	| el |
	el := OPUMLMetamodelTestChildElement new.
	self assert: (el oclIsKindOf: 'MetamodelTestChildElement')
]

{ #category : 'tests  - ocl-experimental' }
OPUMLMetamodelElementTemplateTest >> testOclIsKindOfParent [
	| el |
	el := OPUMLMetamodelTestChildElement new.
	self assert: (el oclIsKindOf: 'MetamodelTestParentElement')
]

{ #category : 'tests  - ocl-experimental' }
OPUMLMetamodelElementTemplateTest >> testOclIsTypeOf [
	| el |
	el := OPUMLMetamodelTestChildElement new.
	self assert: (el oclIsTypeOf: 'MetamodelTestChildElement')
]

{ #category : 'tests' }
OPUMLMetamodelElementTemplateTest >> testPresentedSelectors [
	self
		assert: OPUMLMetamodelTestChildElement new inspectorPropertiesSelectors sorted
		equals: #(fromParent emptyValue nilValue operation) sorted
]

{ #category : 'tests' }
OPUMLMetamodelElementTemplateTest >> testRemoveTag [
	| el |
	el := OPUMLMetamodelTestChildElement new.
	el tagAt: 'key' put: 12.
	el removeTagAt: 'key'.
	self deny: (el hasTagAt: 'key')
]

{ #category : 'tests' }
OPUMLMetamodelElementTemplateTest >> testRetrieveTag [
	| el |
	el := OPUMLMetamodelTestChildElement new.
	el tagAt: 'key' put: 12.
	self assert: (el tagAt: 'key') equals: 12
]
