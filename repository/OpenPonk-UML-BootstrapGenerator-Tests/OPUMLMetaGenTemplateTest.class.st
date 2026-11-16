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

{ #category : 'instance creation' }
OPUMLMetaGenTemplateTest >> newAnonymousTemplateSubclassFor: aTemplateClass withAccessors: slotNames [

	| subclass existingSlotNames |
	subclass := aTemplateClass newAnonymousSubclass.
	existingSlotNames := aTemplateClass allInstVarNames.
	slotNames do: [ :slotName |
			(existingSlotNames includes: slotName) ifFalse: [ subclass addInstVarNamed: slotName ].
			subclass compile: (String streamContents: [ :stream |
						 stream << slotName.
						 stream cr.
						 stream tab.
						 stream << '^ '.
						 stream << slotName ]).
			subclass compile: (String streamContents: [ :stream |
						 stream << slotName << ': aValue'.
						 stream cr.
						 stream tab.
						 stream << slotName << ' := aValue' ]) ].
	^ subclass
]

{ #category : 'tests' }
OPUMLMetaGenTemplateTest >> testClassifierTemplate [

	| classifierClass root parentA parentB child singleChild genRoot genA genB genSingle classSlice |
	classifierClass := self
		                   newAnonymousTemplateSubclassFor: OPUMLMetaGenClassifierTemplate
		                   withAccessors: #( #attributes #generalizations #sharedGeneralizations ).
	root := classifierClass new
		        attributes: #( #rootAttr );
		        generalizations: #(  );
		        sharedGeneralizations: OrderedDictionary new;
		        yourself.
	genRoot := OPUMLMetaGenTestDouble new
		           general: root;
		           yourself.
	parentA := classifierClass new
		           attributes: #( #parentAAttr #sharedAttr );
		           generalizations: { genRoot };
		           sharedGeneralizations: OrderedDictionary new;
		           yourself.
	parentB := classifierClass new
		           attributes: #( #parentBAttr #sharedAttr );
		           generalizations: { genRoot };
		           sharedGeneralizations: OrderedDictionary new;
		           yourself.
	genA := OPUMLMetaGenTestDouble new
		        general: parentA;
		        yourself.
	genB := OPUMLMetaGenTestDouble new
		        general: parentB;
		        yourself.
	classSlice := OPUMLMetaGenTestDouble new
		              ownedAttributes: #( #classOwnedAttr );
		              yourself.
	child := classifierClass new
		         attributes: #( #ownAttr );
		         generalizations: {
				         genA.
				         genB };
		         sharedGeneralizations: (OrderedDictionary with: #Class -> classSlice);
		         yourself.
	genSingle := OPUMLMetaGenTestDouble new
		             general: parentA;
		             yourself.
	singleChild := classifierClass new
		               attributes: #( #singleAttr );
		               generalizations: { genSingle };
		               sharedGeneralizations: OrderedDictionary new;
		               yourself.

	self assertCollection: child parents hasSameElements: {
			parentA.
			parentB }.
	self assertCollection: child general hasSameElements: {
			parentA.
			parentB }.
	self assertCollection: child allParents hasSameElements: {
			parentA.
			parentB.
			root }.
	self assert: root allAttributes equals: #( #rootAttr ).
	self assert: (child allAttributes first: 2) equals: #( #ownAttr #classOwnedAttr ).
	self assert: child allAttributes size equals: 6.
	self
		assertCollection: child allAttributes
		hasSameElements: #( #ownAttr #classOwnedAttr #parentAAttr #parentBAttr #sharedAttr #rootAttr ).
	self assert: singleChild allAttributes equals: #( #singleAttr #parentAAttr #sharedAttr #rootAttr )
]

{ #category : 'tests' }
OPUMLMetaGenTemplateTest >> testExtensionEndTemplate [

	| extensionEndClass extensionEnd |
	extensionEndClass := self newAnonymousTemplateSubclassFor: OPUMLMetaGenExtensionEndTemplate withAccessors: #( #lowerValue ).
	extensionEnd := extensionEndClass new.
	self assert: extensionEnd lowerBound equals: 0.
	extensionEnd lowerValue: (OPUMLMetaGenTestDouble new
			 integerValue: 1;
			 yourself).
	self assert: extensionEnd lowerBound equals: 1
]

{ #category : 'tests' }
OPUMLMetaGenTemplateTest >> testExtensionTemplate [

	| extensionClass extensionEndClass ownedEnd metaclass metaclassEnd extension |
	extensionClass := self
		                  newAnonymousTemplateSubclassFor: OPUMLMetaGenExtensionTemplate
		                  withAccessors: #( #ownedEnd #ownedEnds #memberEnds ).
	extensionEndClass := self newAnonymousTemplateSubclassFor: OPUMLMetaGenExtensionEndTemplate withAccessors: #( #lowerValue ).
	ownedEnd := extensionEndClass new.
	metaclass := OPUMLMetaGenTestDouble new.
	metaclassEnd := OPUMLMetaGenTestDouble new
		                type: metaclass;
		                yourself.
	extension := extensionClass new
		             ownedEnd: ownedEnd;
		             ownedEnds: { ownedEnd };
		             memberEnds: {
				             ownedEnd.
				             metaclassEnd };
		             yourself.

	self assert: extension metaclassEnd identicalTo: metaclassEnd.
	self assert: extension metaclass identicalTo: metaclass.
	self deny: extension isRequired description: 'Extension with lowerValue = nil must not be required'.

	ownedEnd lowerValue: (OPUMLMetaGenTestDouble new
			 integerValue: 1;
			 yourself).
	self assert: extension isRequired description: 'Extension with lowerBound = 1 must be required'
]

{ #category : 'tests' }
OPUMLMetaGenTemplateTest >> testImplementedMethods [

	self
		assertCollection: (OPUMLMetaGenClassifierTemplate new implementedMethods collect: #key)
		hasSameElements: #( #allAttributes #allParents #general #parents ).
	self
		assertCollection: (OPUMLMetaGenExtensionTemplate new implementedMethods collect: #key)
		hasSameElements: #( #isRequired #metaclass #metaclassEnd ).
	self assertCollection: (OPUMLMetaGenExtensionEndTemplate new implementedMethods collect: #key) hasSameElements: #( #lowerBound ).
	self
		assertCollection: (OPUMLMetaGenMultiplicityElementTemplate new implementedMethods collect: #key)
		hasSameElements: #( #isMultivalued #lower #lowerBound #upper #upperBound ).
	self
		assertCollection: (OPUMLMetaGenPackageTemplate new implementedMethods collect: #key)
		hasSameElements: #( #mustBeOwned #nestedPackage #ownedStereotype #ownedType ).
	self
		assertCollection: (OPUMLMetaGenPropertyTemplate new implementedMethods collect: #key)
		hasSameElements: #( #isComposite #isNavigable #opposite )
]

{ #category : 'tests' }
OPUMLMetaGenTemplateTest >> testMethodsForInClassNamed [

	| valuesTemplate propertyTemplate operation missingOperation result |
	valuesTemplate := OPUMLMetamodelGeneratorValuesTemplates new.
	propertyTemplate := OPUMLMetaGenPropertyTemplate new.
	operation := OPUMLProfileTestElement new
		             name: 'isNull';
		             yourself.
	missingOperation := OPUMLProfileTestElement new
		                    name: 'nonExistent';
		                    yourself.

	self assertEmpty: (valuesTemplate methodsFor: operation inClassNamed: 'Class').
	self assertEmpty: (valuesTemplate methodsFor: missingOperation inClassNamed: 'ValueSpecification').
	result := valuesTemplate methodsFor: operation inClassNamed: 'ValueSpecification'.
	self assert: result size equals: 1.
	self assert: result first body equals: #( '^ false' ).
	self assert: result first language equals: #( #Pharo ).

	self assertEmpty: (propertyTemplate methodsFor: missingOperation inClassNamed: 'Class').
	self assertEmpty: (propertyTemplate methodsFor: missingOperation inClassNamed: 'Property').
	result := propertyTemplate
		          methodsFor: (OPUMLProfileTestElement new
				           name: 'opposite';
				           yourself)
		          inClassNamed: 'Property'.
	self assert: result size equals: 1.
	self assert: result first language equals: #( #Pharo )
]

{ #category : 'tests' }
OPUMLMetaGenTemplateTest >> testMultiplicityElementTemplate [

	| multiplicityClass element |
	multiplicityClass := self
		                     newAnonymousTemplateSubclassFor: OPUMLMetaGenMultiplicityElementTemplate
		                     withAccessors: #( #lowerValue #upperValue ).
	element := multiplicityClass new.
	self assert: element lowerBound equals: 1.
	self assert: element lower equals: 1.
	self assert: element upperBound equals: 1.
	self assert: element upper equals: 1.
	self deny: element isMultivalued description: 'Default multiplicity 1..1 must not be multivalued'.

	element lowerValue: OPUMLMetaGenTestDouble new.
	element upperValue: OPUMLMetaGenTestDouble new.
	self assert: element lowerBound equals: 1.
	self assert: element upperBound equals: 1.

	element lowerValue: (OPUMLMetaGenTestDouble new
			 integerValue: 0;
			 yourself).
	element upperValue: (OPUMLMetaGenTestDouble new
			 unlimitedValue: 2;
			 yourself).
	self assert: element lowerBound equals: 0.
	self assert: element upperBound equals: 2.
	self assert: element isMultivalued description: 'Multiplicity with upperBound = 2 must be multivalued'.

	element upperValue: (OPUMLMetaGenTestDouble new
			 unlimitedValue: '*';
			 yourself).
	self assert: element upperBound equals: '*'.
	self assert: element isMultivalued description: 'Multiplicity with upperBound = ''*'' must be multivalued'
]

{ #category : 'tests' }
OPUMLMetaGenTemplateTest >> testPackageTemplate [

	| packageClass umlPackage nestedPackage stereotype typeOnly comment castPackage castStereotype castType |
	packageClass := self newAnonymousTemplateSubclassFor: OPUMLMetaGenPackageTemplate withAccessors: #( #packagedElements ).
	castPackage := OPUMLMetaGenTestDouble new.
	castStereotype := OPUMLMetaGenTestDouble new.
	castType := OPUMLMetaGenTestDouble new.
	nestedPackage := OPUMLMetaGenTestDouble new
		                 kinds: #( #Package );
		                 castTarget: castPackage;
		                 yourself.
	stereotype := OPUMLMetaGenTestDouble new
		              kinds: #( #Stereotype #Type );
		              castTarget: castStereotype;
		              yourself.
	typeOnly := OPUMLMetaGenTestDouble new
		            kinds: #( #Type );
		            castTarget: castType;
		            yourself.
	comment := OPUMLMetaGenTestDouble new
		           kinds: #( #Comment );
		           yourself.
	umlPackage := packageClass new
		              packagedElements: {
				              nestedPackage.
				              stereotype.
				              typeOnly.
				              comment };
		              yourself.

	self deny: umlPackage mustBeOwned description: 'Package mustBeOwned must return false'.
	self assertCollection: umlPackage nestedPackage hasSameElements: { castPackage }.
	self assertCollection: umlPackage ownedStereotype hasSameElements: { castStereotype }.
	self assertCollection: umlPackage ownedType hasSameElements: {
			castStereotype.
			castType }
]

{ #category : 'tests' }
OPUMLMetaGenTemplateTest >> testPropertyTemplate [

	| propertyClass property otherProperty thirdProperty association generator isCompositeBody cbClass operation |
	propertyClass := self newAnonymousTemplateSubclassFor: OPUMLMetaGenPropertyTemplate withAccessors: #( #owningClass #association ).
	property := propertyClass new.
	otherProperty := propertyClass new.
	thirdProperty := propertyClass new.

	self assert: property opposite identicalTo: nil.
	association := OPUMLMetaGenTestDouble new
		               memberEnds: { property };
		               navigableOwnedEnds: #(  );
		               yourself.
	property association: association.
	self assert: property opposite identicalTo: nil.
	self deny: property isNavigable description: 'Property without owningClass and not in navigableOwnedEnds must not be navigable'.

	association memberEnds: {
			property.
			otherProperty.
			thirdProperty }.
	self assert: property opposite identicalTo: nil.

	association memberEnds: {
			property.
			otherProperty }.
	association navigableOwnedEnds: { property }.
	self assert: property opposite identicalTo: otherProperty.
	self assert: property isNavigable description: 'Property in association navigableOwnedEnds must be navigable'.

	property association: nil.
	property owningClass: OPUMLMetaGenTestDouble new.
	self assert: property isNavigable description: 'Property with non-nil owningClass must be navigable'.

	isCompositeBody := OPUMLMetaGenPropertyTemplate new implementedMethods asDictionary at: #isComposite.
	generator := OPUMLMetamodelGenerator new
		             classPrefix: 'MBUT';
		             yourself.
	self assert: (generator prefixClassNamesInText: isCompositeBody) equals: '^ self aggregation = MBUTAggregationKind composite'.
	cbClass := CBClass new.
	operation := BootUMLOperation new
		             name: 'isComposite';
		             method: { (BootUMLOpaqueExpression new
				              body: { isCompositeBody };
				              language: #( #Pharo );
				              yourself) };
		             yourself.
	generator addRealOperation: operation to: cbClass.
	self assert: (OCParser parseMethod: (cbClass methodNamed: #isComposite) source) selector equals: #isComposite
]

{ #category : 'tests' }
OPUMLMetaGenTemplateTest >> testSupportedClasses [

	self assert: OPUMLMetaGenClassifierTemplate new supportedClasses equals: #( #Classifier ).
	self assert: OPUMLMetaGenExtensionTemplate new supportedClasses equals: #( #Extension ).
	self assert: OPUMLMetaGenExtensionEndTemplate new supportedClasses equals: #( #ExtensionEnd ).
	self assert: OPUMLMetaGenMultiplicityElementTemplate new supportedClasses equals: #( #MultiplicityElement ).
	self assert: OPUMLMetaGenPackageTemplate new supportedClasses equals: #( #Package ).
	self assert: OPUMLMetaGenPropertyTemplate new supportedClasses equals: #( #Property ).
	self
		assertCollection: OPUMLMetamodelGeneratorValuesTemplates new supportedClasses
		hasSameElements:
		#( #LiteralBoolean #LiteralInteger #LiteralNull #LiteralReal #LiteralString #LiteralUnlimitedNatural #ValueSpecification )
]

{ #category : 'tests' }
OPUMLMetaGenTemplateTest >> testSupports [

	self
		assert: (OPUMLMetaGenPropertyTemplate new supportsClass: 'Property')
		description: 'OPUMLMetaGenPropertyTemplate must support Property class'.
	self
		deny: (OPUMLMetaGenPropertyTemplate new supportsClass: 'Class')
		description: 'OPUMLMetaGenPropertyTemplate must not support Class'.
	self
		assert: (OPUMLMetaGenClassifierTemplate new supportsClass: 'Classifier')
		description: 'OPUMLMetaGenClassifierTemplate must support Classifier class'.
	self
		assert: (OPUMLMetamodelGeneratorValuesTemplates new supportsClass: 'LiteralString')
		description: 'OPUMLMetamodelGeneratorValuesTemplates must support LiteralString'.
	self
		deny: (OPUMLMetamodelGeneratorValuesTemplates new supportsClass: 'UseMethodPerAccessor')
		description: 'OPUMLMetamodelGeneratorValuesTemplates must not support deleted UseMethodPerAccessor'
]
