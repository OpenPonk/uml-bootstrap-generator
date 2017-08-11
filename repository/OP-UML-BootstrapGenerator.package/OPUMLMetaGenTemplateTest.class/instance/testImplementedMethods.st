tests
testImplementedMethods
	| methods |
	methods := OPUMLMetaGenPropertyTemplate new implementedMethods.
	self assert: ((methods collect: #key) includes: #isComposite)