"
I am a unit test class verifying that the template injection system accurately identifies supported classes and extracts the correct methods to be injected.
"
Class {
	#name : 'OPUMLMetaGenTemplateTest',
	#superclass : 'TestCase',
	#category : 'OpenPonk-UML-BootstrapGenerator-Tests',
	#package : 'OpenPonk-UML-BootstrapGenerator',
	#tag : 'Tests'
}

{ #category : 'tests' }
OPUMLMetaGenTemplateTest >> testImplementedMethods [
	| methods |
	methods := OPUMLMetaGenPropertyTemplate new implementedMethods.
	self assert: ((methods collect: #key) includes: #isComposite)
]

{ #category : 'tests' }
OPUMLMetaGenTemplateTest >> testSupportedClasses [
	self assert: OPUMLMetaGenPropertyTemplate new supportedClasses equals: #(Property)
]

{ #category : 'tests' }
OPUMLMetaGenTemplateTest >> testSupports [
	self assert: (OPUMLMetaGenPropertyTemplate new supportsClass: 'Property')
]
