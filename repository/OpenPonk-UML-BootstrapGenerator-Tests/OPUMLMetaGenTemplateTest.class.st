"
I am a unit test class verifying that the template injection system accurately identifies supported classes and extracts the correct methods to be injected.
"
Class {
	#name : 'OPUMLMetaGenTemplateTest',
	#superclass : 'TestCase',
	#category : 'OpenPonk-UML-BootstrapGenerator-Tests-Templates',
	#package : 'OpenPonk-UML-BootstrapGenerator-Tests',
	#tag : 'Templates'
}

{ #category : 'tests' }
OPUMLMetaGenTemplateTest >> testImplementedMethods [

	| methods |
	methods := OPUMLMetaGenPropertyTemplate new implementedMethods.
	self assertCollection: (methods collect: #key) includesAll: { #isComposite }
]

{ #category : 'tests' }
OPUMLMetaGenTemplateTest >> testSupportedClasses [
	self assert: OPUMLMetaGenPropertyTemplate new supportedClasses equals: #(Property)
]

{ #category : 'tests' }
OPUMLMetaGenTemplateTest >> testSupports [

	self
		assert: (OPUMLMetaGenPropertyTemplate new supportsClass: 'Property')
		description: 'OPUMLMetaGenPropertyTemplate must support Property class'
]
