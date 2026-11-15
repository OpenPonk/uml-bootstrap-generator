"
Unit test suite verifying UML profile code generation, including generation of stereotype extension getter and setter methods onto existing target metaclasses.
"
Class {
	#name : 'OPUMLProfileGeneratorTest',
	#superclass : 'TestCase',
	#instVars : [
		'generator'
	],
	#category : 'OpenPonk-UML-BootstrapGenerator-Tests-Profile-Generator',
	#package : 'OpenPonk-UML-BootstrapGenerator-Tests',
	#tag : 'Profile-Generator'
}

{ #category : 'asserting' }
OPUMLProfileGeneratorTest >> assertMethod: actualCode equals: expectedCode [

	self
		assert: (OCParser parseMethod: actualCode) formattedCode withUnixLineEndings
		equals: (OCParser parseMethod: expectedCode) formattedCode withUnixLineEndings
]

{ #category : 'running' }
OPUMLProfileGeneratorTest >> setUp [

	super setUp.
	generator := OPUMLProfileGenerator new.
	generator classPrefix: 'PTG'.
	generator packageName: 'Generated-ProfileTest'
]

{ #category : 'tests - generating' }
OPUMLProfileGeneratorTest >> testGenerateExtensionMethods [

	| profile nonExtensionElement extensionElement extensionEnd stereotypeElement oppositeEnd metaclassElement generatedClass getterMethod setterMethod changes |
	stereotypeElement := OPUMLProfileTestElement new
		                     name: 'SampleStereotype';
		                     yourself.
	metaclassElement := OPUMLProfileTestElement new
		                    name: 'MetamodelTestParentElement';
		                    yourself.
	oppositeEnd := OPUMLProfileTestElement new
		               name: 'base_MetamodelTestParentElement';
		               type: metaclassElement;
		               yourself.
	extensionEnd := OPUMLProfileTestElement new
		                name: 'extension_SampleStereotype';
		                type: stereotypeElement;
		                opposite: oppositeEnd;
		                yourself.
	extensionElement := OPUMLProfileTestElement new
		                    kind: #Extension;
		                    ownedEnd: extensionEnd;
		                    yourself.
	nonExtensionElement := OPUMLProfileTestElement new
		                       kind: #Stereotype;
		                       name: 'SampleStereotype';
		                       yourself.
	profile := OPUMLProfileTestElement new
		           implementationPackage: 'Generated-ProfileTest';
		           packagedElements: {
				           nonExtensionElement.
				           extensionElement };
		           yourself.

	generator sourceModel: profile.
	generator generateExtensionMethods.

	self assertCollection: generator classes keys hasSameElements: #( #OPUMLMetamodelTestParentElement ).
	generatedClass := generator classes at: #OPUMLMetamodelTestParentElement.
	self assert: generatedClass packageTag equals: OPUMLMetamodelTestParentElement packageTagName asString.
	self
		assertCollection: (generatedClass methods collect: #selector)
		hasSameElements: #( #extension_SampleStereotype #extension_SampleStereotype: ).

	getterMethod := generatedClass methodNamed: #extension_SampleStereotype.
	setterMethod := generatedClass methodNamed: #extension_SampleStereotype:.
	self assert: getterMethod protocolName equals: '*Generated-ProfileTest'.
	self assert: setterMethod protocolName equals: '*Generated-ProfileTest'.
	self assertMethod: getterMethod source equals: 'extension_SampleStereotype
	^ self tagAt: #extension_SampleStereotype ifAbsent: [ nil ]'.
	self assertMethod: setterMethod source equals: 'extension_SampleStereotype: aSampleStereotype
	| oldSampleStereotype |
	oldSampleStereotype := self extension_SampleStereotype.
	self tagAt: #extension_SampleStereotype put: aSampleStereotype.
	OPUMLToOneLink
		on: self
		thisSelector: #extension_SampleStereotype
		otherSelector: #base_MetamodelTestParentElement
		updateFrom: oldSampleStereotype
		to: aSampleStereotype'.

	changes := generator changes.
	self assert: changes size equals: 2.
	self
		assertCollection: (changes collect: #selector)
		hasSameElements: #( #extension_SampleStereotype #extension_SampleStereotype: )
]
