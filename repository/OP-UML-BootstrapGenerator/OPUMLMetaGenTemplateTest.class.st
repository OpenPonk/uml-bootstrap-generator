Class {
	#name : #OPUMLMetaGenTemplateTest,
	#superclass : #TestCase,
	#category : 'OP-UML-BootstrapGenerator-Tests'
}

{ #category : #tests }
OPUMLMetaGenTemplateTest >> testImplementedMethods [
	| methods |
	methods := OPUMLMetaGenPropertyTemplate new implementedMethods.
	self assert: ((methods collect: #key) includes: #isComposite)
]

{ #category : #tests }
OPUMLMetaGenTemplateTest >> testSupportedClasses [
	self assert: OPUMLMetaGenPropertyTemplate new supportedClasses equals: #(Property)
]

{ #category : #tests }
OPUMLMetaGenTemplateTest >> testSupports [
	self assert: (OPUMLMetaGenPropertyTemplate new supportsClass: 'Property')
]
