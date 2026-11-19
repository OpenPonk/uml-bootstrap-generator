"
Unit tests for UML specification URL/source accessors, XMI parsing, and caching behavior of bootstrap specifications.
"
Class {
	#name : 'OPUMLBootstrapSpecsTest',
	#superclass : 'TestCase',
	#category : 'OpenPonk-UML-BootstrapGenerator-Tests-Bootstrap-Generator',
	#package : 'OpenPonk-UML-BootstrapGenerator-Tests',
	#tag : 'Bootstrap-Generator'
}

{ #category : 'tests' }
OPUMLBootstrapSpecsTest >> testRetrieveAndCacheUmlSpecs [

	| reloadedSpecs cachedSpecs |
	[
		OPUMLBootstrapSpecs resetUmlSpecs.
		reloadedSpecs := OPUMLBootstrapSpecs umlSpecs.
		cachedSpecs := OPUMLBootstrapSpecs umlSpecs.
		self assert: reloadedSpecs class identicalTo: OPXMIObjectElement.
		self assert: cachedSpecs identicalTo: reloadedSpecs ] ensure: [ OPUMLBootstrapSpecs umlSpecs ]
]

{ #category : 'tests' }
OPUMLBootstrapSpecsTest >> testSpecUrlsAndSources [

	self assert: OPUMLBootstrapSpecs umlSpecUrl equals: 'http://www.omg.org/spec/UML/20131001/UML.xmi'.
	self assert: OPUMLBootstrapSpecs primitiveTypesSpecUrl equals: 'http://www.omg.org/spec/UML/20131001/PrimitiveTypes.xmi'.
	self
		assert: (OPUMLBootstrapSpecs umlSpecSource includesSubstring: 'name="UML"')
		description: 'UML specification XMI source must define the UML package'.
	self
		assert: (OPUMLBootstrapSpecs primitiveTypesSpecSource includesSubstring: 'name="PrimitiveTypes"')
		description: 'PrimitiveTypes specification XMI source must define the PrimitiveTypes package'
]
