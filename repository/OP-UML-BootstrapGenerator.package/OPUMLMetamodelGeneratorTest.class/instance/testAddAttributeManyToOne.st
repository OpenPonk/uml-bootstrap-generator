tests - generating - attributes
testAddAttributeManyToOne
	| class attribute |
	class := CBClass new.
	attribute := self attribute: 'datatype' inClass: 'Property'.
	generator addAttribute: attribute to: class.
	self assert: class instanceVariables equals: #(datatype).
	self assert: class selectors equals: #(datatype datatype:).
	self
		assertMethod: class methods first source
		equals:
			'datatype
	"The DataType that owns this Property, if any."
	^ datatype'.
	self
		assertMethod: class methods second source
		equals:
			'datatype: aDataType
	"The DataType that owns this Property, if any."
	datatype := OPUMLToOneLink on: self identity update: #ownedAttributes from: datatype to: aDataType'