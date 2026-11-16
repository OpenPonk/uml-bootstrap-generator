"
I am a unit test class verifying the core behaviors (such as tag management, stereotype application, and OCL type checking) defined within OPUMLMetamodelElementTemplate.
"
Class {
	#name : 'OPUMLMetamodelElementTemplateTest',
	#superclass : 'TestCase',
	#instVars : [
		'metaElementClass',
		'createdMetaElementClass',
		'preexistingMetaPackage'
	],
	#category : 'OpenPonk-UML-BootstrapGenerator-Tests-Metamodel-Generator',
	#package : 'OpenPonk-UML-BootstrapGenerator-Tests',
	#tag : 'Metamodel-Generator'
}

{ #category : 'instance creation' }
OPUMLMetamodelElementTemplateTest >> newStereotypeNamed: aStereotypeName extensionEndName: anExtensionEndName baseTypeName: aBaseTypeName extraAttributeNames: aCollectionOfNames [

	| baseAttribute metaClass extraAttributes |
	baseAttribute := OPUMLProfileTestElement new
		                 name: 'base_' , aBaseTypeName;
		                 type: (OPUMLProfileTestElement new
				                  name: aBaseTypeName;
				                  yourself);
		                 opposite: (OPUMLProfileTestElement new
				                  name: anExtensionEndName;
				                  yourself);
		                 yourself.
	extraAttributes := aCollectionOfNames collect: [ :each |
			                   OPUMLProfileTestElement new
				                   name: each;
				                   yourself ].
	metaClass := OPUMLProfileTestElement new
		             name: aStereotypeName;
		             allAttributes: { baseAttribute } , extraAttributes;
		             yourself.
	^ OPUMLMetamodelTestStereotype new
		  umlClassName: aStereotypeName;
		  umlMetaClass: metaClass;
		  yourself
]

{ #category : 'running' }
OPUMLMetamodelElementTemplateTest >> setUp [

	| generator metaElementClassName |
	super setUp.
	generator := OPUMLMetamodelGenerator newDefault.
	metaElementClassName := (generator classNameFor: generator metaElementName) asSymbol.
	metaElementClass := self class environment at: metaElementClassName ifAbsent: [ nil ].
	metaElementClass ifNotNil: [ ^ self ].
	preexistingMetaPackage := self packageOrganizer hasPackage: generator packageName.
	createdMetaElementClass := Object classInstaller make: [ :builder |
			                           builder
				                           superclass: Object;
				                           name: metaElementClassName;
				                           package: generator packageName;
				                           tag: generator metaTag;
				                           environment: self class environment ].
	metaElementClass := createdMetaElementClass
]

{ #category : 'running' }
OPUMLMetamodelElementTemplateTest >> tearDown [

	createdMetaElementClass ifNotNil: [ :createdClass |
			| packageName |
			packageName := createdClass package name.
			createdClass removeFromSystem.
			(preexistingMetaPackage ifNil: [ false ]) ifFalse: [
					self packageOrganizer
						packageNamed: packageName
						ifPresent: [ :package | package isEmpty ifTrue: [ self packageOrganizer removePackage: package ] ] ] ].
	createdMetaElementClass := nil.
	metaElementClass := nil.
	preexistingMetaPackage := nil.
	super tearDown
]

{ #category : 'tests' }
OPUMLMetamodelElementTemplateTest >> testAbstractGeneralizationInitializers [

	| element |
	element := OPUMLMetamodelElementTemplate basicNew.
	self should: [ element initializeDirectGeneralizations ] raise: SubclassResponsibility.
	self should: [ element initializeSharedGeneralizations ] raise: SubclassResponsibility
]

{ #category : 'tests' }
OPUMLMetamodelElementTemplateTest >> testAddTag [

	| el |
	el := OPUMLMetamodelTestChildElement new.
	self deny: (el hasTagAt: 'key') description: 'Fresh element must not have tag at #key'.
	el tagAt: 'key' put: 12.
	self assert: (el hasTagAt: 'key') description: 'Element must have tag at #key after tagAt:put:'
]

{ #category : 'tests' }
OPUMLMetamodelElementTemplateTest >> testApplyAndUnapplyInheritedStereotype [

	| element inheritedStereotype duplicateStereotype otherStereotype |
	element := OPUMLMetamodelTestStereotypedElement new.
	inheritedStereotype := self
		                       newStereotypeNamed: 'ChildStereo'
		                       extensionEndName: 'extension_BaseStereo'
		                       baseTypeName: 'MetamodelTestParentElement'
		                       extraAttributeNames: #( 'label' ).
	duplicateStereotype := self
		                       newStereotypeNamed: 'ChildStereo'
		                       extensionEndName: 'extension_BaseStereo'
		                       baseTypeName: 'MetamodelTestParentElement'
		                       extraAttributeNames: #( 'label' ).
	otherStereotype := self
		                   newStereotypeNamed: 'OtherStereo'
		                   extensionEndName: 'extension_OtherStereo'
		                   baseTypeName: 'MetamodelTestChildElement'
		                   extraAttributeNames: #(  ).

	element applyStereotype: inheritedStereotype.
	self assertCollection: element appliedStereotypes hasSameElements: { inheritedStereotype }.
	self assert: element extension_BaseStereo identicalTo: inheritedStereotype.

	element applyStereotype: duplicateStereotype.
	self assertCollection: element appliedStereotypes hasSameElements: { inheritedStereotype }.

	element unapplyStereotype: otherStereotype.
	self assertCollection: element appliedStereotypes hasSameElements: { inheritedStereotype }.
	self assert: element extension_OtherStereo identicalTo: nil.

	element unapplyStereotype: inheritedStereotype.
	self assertEmpty: element appliedStereotypes.
	self assert: element extension_BaseStereo identicalTo: nil
]

{ #category : 'tests' }
OPUMLMetamodelElementTemplateTest >> testGeneratePrintAsClassifierNameOn [

	| unnamedSubclass namedElement unnamedOutput namedOutput |
	unnamedSubclass := OPUMLMetamodelTestParentElement newAnonymousSubclass.
	unnamedSubclass compile: 'oclClassifierNameFrom: anObject
	anObject == self class ifTrue: [ ^ ''MetamodelTestParentElement'' ].
	^ super oclClassifierNameFrom: anObject'.
	namedElement := OPUMLMetamodelTestStereotypedElement new
		                name: 'Customer';
		                yourself.
	unnamedOutput := String streamContents: [ :stream | unnamedSubclass new generateprintAsClassifierNameOn: stream ].
	namedOutput := String streamContents: [ :stream | namedElement generateprintAsClassifierNameOn: stream ].
	self assert: unnamedOutput equals: 'MetamodelTestParentElement'.
	self assert: namedOutput equals: 'MetamodelTestStereotypedElement(''Customer'')'
]

{ #category : 'tests' }
OPUMLMetamodelElementTemplateTest >> testGeneratePrintOn [

	| unnamedElement namedElement unnamedOutput namedOutput |
	unnamedElement := OPUMLMetamodelTestParentElement new.
	namedElement := OPUMLMetamodelTestStereotypedElement new
		                name: 'Customer';
		                yourself.
	unnamedOutput := String streamContents: [ :stream | unnamedElement generateprintOn: stream ].
	namedOutput := String streamContents: [ :stream | namedElement generateprintOn: stream ].
	self assert: unnamedOutput equals: 'an OPUMLMetamodelTestParentElement'.
	self assert: namedOutput equals: 'an OPUMLMetamodelTestStereotypedElement(''Customer'')'
]

{ #category : 'tests' }
OPUMLMetamodelElementTemplateTest >> testIdentity [

	| childElement parentSlice |
	childElement := OPUMLMetamodelTestChildElement new.
	parentSlice := childElement oclAsType: 'MetamodelTestParentElement'.
	self assert: childElement identity identicalTo: childElement.
	self assert: parentSlice identity identicalTo: childElement
]

{ #category : 'tests' }
OPUMLMetamodelElementTemplateTest >> testInspectionPropertyAndGeneralizationPresentations [

	| builder childElement allPropsTable propsTable generalizationsTable |
	builder := SpPresenter new
		           application: SpApplication defaultApplication;
		           yourself.
	childElement := OPUMLMetamodelTestChildElement new.
	allPropsTable := childElement inspectionAllProperties: builder.
	propsTable := childElement inspectionProperties: builder.
	generalizationsTable := childElement inspectionGeneralizations: builder.
	self assert: allPropsTable class identicalTo: SpTablePresenter.
	self assert: (allPropsTable items collect: [ :each | each key -> each value ] as: Array) equals: {
			(#emptyValue -> #(  )).
			(#fromParent -> 12).
			(#nilValue -> nil).
			(#operation -> #operation) }.
	self assert: propsTable class identicalTo: SpTablePresenter.
	self assert: (propsTable items collect: [ :each | each key -> each value ] as: Array) equals: {
			(#fromParent -> 12).
			(#operation -> #operation) }.
	self assert: generalizationsTable class identicalTo: SpTablePresenter.
	self
		assert: (generalizationsTable items collect: #key as: Array)
		equals: #( #MetamodelTestChildElement #MetamodelTestParentElement )
]

{ #category : 'tests' }
OPUMLMetamodelElementTemplateTest >> testInspectionTagAndStereotypePresentations [

	| builder element firstStereotype secondStereotype tagsTable stereotypesList stereotypePropsTable |
	builder := SpPresenter new
		           application: SpApplication defaultApplication;
		           yourself.
	element := OPUMLMetamodelTestStereotypedElement new.
	element tagAt: 'zeta' put: 2.
	element tagAt: 'alpha' put: 1.
	firstStereotype := (self
		                    newStereotypeNamed: 'BetaStereo'
		                    extensionEndName: 'extension_BaseStereo'
		                    baseTypeName: 'MetamodelTestParentElement'
		                    extraAttributeNames: #( 'priority' ))
		                   priority: 9;
		                   yourself.
	secondStereotype := (self
		                     newStereotypeNamed: 'AlphaStereo'
		                     extensionEndName: 'extension_OtherStereo'
		                     baseTypeName: 'MetamodelTestChildElement'
		                     extraAttributeNames: #( 'label' ))
		                    label: 'Second';
		                    yourself.
	element applyStereotype: firstStereotype.
	element applyStereotype: secondStereotype.

	tagsTable := element inspectionTags: builder.
	stereotypesList := element inspectionStereotypes: builder.
	stereotypePropsTable := element inspectionStereotypeProperties: builder.

	self assert: tagsTable class identicalTo: SpTablePresenter.
	self assert: (tagsTable items collect: #key as: Array) equals: #( 'alpha' #appliedStereotypes 'zeta' ).
	self assert: stereotypesList class identicalTo: SpListPresenter.
	self assert: stereotypesList items asArray equals: {
			secondStereotype.
			firstStereotype }.
	self assert: stereotypePropsTable class identicalTo: SpTablePresenter.
	self assert: stereotypePropsTable items asArray equals: {
			{ 'label'. 'AlphaStereo'. 'Second' }.
			{ 'priority'. 'BetaStereo'. 9 } }
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
	self assert: (el oclAsType: 'MetamodelTestParentElement') class identicalTo: OPUMLMetamodelTestParentElement
]

{ #category : 'tests  - ocl-experimental' }
OPUMLMetamodelElementTemplateTest >> testOclClassifierNameFrom [

	| element anonymousSubclass |
	element := OPUMLMetamodelTestChildElement new.
	anonymousSubclass := metaElementClass newAnonymousSubclass.
	anonymousSubclass class compile: 'name ^ ''OPUMLSampleClass'''.
	anonymousSubclass compile: 'name ^ ''SampleInstance'''.
	self assert: (element oclClassifierNameFrom: 'Class') equals: 'Class'.
	self assert: (element oclClassifierNameFrom: anonymousSubclass) equals: 'SampleClass'.
	self assert: (element oclClassifierNameFrom: anonymousSubclass basicNew) equals: 'SampleInstance'.
	self should: [ element oclClassifierNameFrom: 123 ] raise: Error
]

{ #category : 'tests  - ocl-experimental' }
OPUMLMetamodelElementTemplateTest >> testOclIsKindOf [

	| element |
	element := OPUMLMetamodelTestChildElement new.
	self
		assert: (element oclIsKindOf: 'MetamodelTestChildElement')
		description: 'Element must satisfy oclIsKindOf: for its own classifier'.
	self assert: (element oclIsKindOf: #Element) description: 'Every metamodel element must satisfy oclIsKindOf: #Element'.
	self
		deny: (element oclIsKindOf: 'NonExistentElement')
		description: 'Element must not satisfy oclIsKindOf: for an unrelated classifier'
]

{ #category : 'tests  - ocl-experimental' }
OPUMLMetamodelElementTemplateTest >> testOclIsKindOfParent [

	| el |
	el := OPUMLMetamodelTestChildElement new.
	self
		assert: (el oclIsKindOf: 'MetamodelTestParentElement')
		description: 'Element must satisfy oclIsKindOf: for its parent classifier'
]

{ #category : 'tests  - ocl-experimental' }
OPUMLMetamodelElementTemplateTest >> testOclIsTypeOf [

	| element |
	element := OPUMLMetamodelTestChildElement new.
	self
		assert: (element oclIsTypeOf: 'MetamodelTestChildElement')
		description: 'Element must satisfy oclIsTypeOf: for its exact classifier'.
	self
		deny: (element oclIsTypeOf: 'MetamodelTestParentElement')
		description: 'Element must not satisfy oclIsTypeOf: for its parent classifier'.
	self deny: (element oclIsTypeOf: #Element) description: 'Element must not satisfy oclIsTypeOf: #Element'
]

{ #category : 'tests' }
OPUMLMetamodelElementTemplateTest >> testPresentedSelectors [

	self
		assert: OPUMLMetamodelTestChildElement new inspectorPropertiesSelectors
		equals: #( emptyValue fromParent nilValue operation )
]

{ #category : 'tests' }
OPUMLMetamodelElementTemplateTest >> testRemoveTag [

	| el |
	el := OPUMLMetamodelTestChildElement new.
	el tagAt: 'key' put: 12.
	el removeTagAt: 'key'.
	self deny: (el hasTagAt: 'key') description: 'Element must not have tag at #key after removeTagAt:'
]

{ #category : 'tests' }
OPUMLMetamodelElementTemplateTest >> testRetrieveTag [
	| el |
	el := OPUMLMetamodelTestChildElement new.
	el tagAt: 'key' put: 12.
	self assert: (el tagAt: 'key') equals: 12
]

{ #category : 'tests' }
OPUMLMetamodelElementTemplateTest >> testStereotypeProperties [

	| element firstStereotype secondStereotype |
	element := OPUMLMetamodelTestStereotypedElement new.
	firstStereotype := (self
		                    newStereotypeNamed: 'AlphaStereo'
		                    extensionEndName: 'extension_BaseStereo'
		                    baseTypeName: 'MetamodelTestParentElement'
		                    extraAttributeNames: #( 'label' 'priority' ))
		                   label: 'Primary';
		                   priority: 1;
		                   yourself.
	secondStereotype := (self
		                     newStereotypeNamed: 'BetaStereo'
		                     extensionEndName: 'extension_OtherStereo'
		                     baseTypeName: 'MetamodelTestChildElement'
		                     extraAttributeNames: #( 'label' ))
		                    label: 'Secondary';
		                    yourself.
	element applyStereotype: firstStereotype.
	element applyStereotype: secondStereotype.
	self assertCollection: element stereotypeProperties hasSameElements: {
			{ 'label'. 'AlphaStereo'. 'Primary' }.
			{ 'priority'. 'AlphaStereo'. 1 }.
			{ 'label'. 'BetaStereo'. 'Secondary' } }
]

{ #category : 'tests' }
OPUMLMetamodelElementTemplateTest >> testTagAtIfAbsent [

	| element |
	element := OPUMLMetamodelTestChildElement new.
	self assert: (element tagAt: 'missing' ifAbsent: [ #fallback ]) equals: #fallback.
	element tagAt: 'present' put: 42.
	self assert: (element tagAt: 'present' ifAbsent: [ #fallback ]) equals: 42
]

{ #category : 'tests' }
OPUMLMetamodelElementTemplateTest >> testTags [

	| element |
	element := OPUMLMetamodelTestChildElement new.
	self assertEmpty: element tags.
	element tagAt: 'key' put: 12.
	self assert: element tags equals: (OrderedDictionary with: 'key' -> 12)
]

{ #category : 'tests' }
OPUMLMetamodelElementTemplateTest >> testUmlClassName [

	self assert: OPUMLMetamodelTestChildElement new umlClassName equals: 'MetamodelTestChildElement'
]

{ #category : 'tests' }
OPUMLMetamodelElementTemplateTest >> testUuid [

	| element generatedUuid customUuid |
	element := OPUMLMetamodelTestChildElement new.
	generatedUuid := element uuid.
	self assert: generatedUuid class identicalTo: UUID.
	self assert: element uuid identicalTo: generatedUuid.
	customUuid := UUID new.
	element uuid: customUuid.
	self assert: element uuid identicalTo: customUuid
]
