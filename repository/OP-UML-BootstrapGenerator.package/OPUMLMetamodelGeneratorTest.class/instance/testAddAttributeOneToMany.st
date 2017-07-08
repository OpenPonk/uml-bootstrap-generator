tests - generating - attributes
testAddAttributeOneToMany
	| class attribute |
	class := CBClass new.
	attribute := self attribute: 'ownedAttribute' inClass: 'DataType'.
	generator addAttribute: attribute to: class.
	self assert: class instanceVariables equals: #(ownedAttributes).
	self assert: class selectors equals: #(ownedAttributes ownedAttributes:).
	self
		assertMethod: class methods first source
		equals:
			'ownedAttributes
	"The attributes owned by the DataType."
	^ ownedAttributes ifNil: [ ownedAttributes := OPUMLToManyLinks on: self identity opposite: #datatype: ]'.
	self
		assertMethod: class methods second source
		equals:
			'ownedAttributes: aProperty
	"The attributes owned by the DataType."
	self ownedAttributes removeAll; addAll: aProperty'