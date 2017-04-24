tests - generating - attributes
testAddAttributeNamedClass
	| class attribute |
	class := CBClass new.
	attribute := self attribute: 'class' inClass: 'Property'.
	self assert: attribute name equals: 'class'.
	generator addAttribute: attribute to: class.
	self assert: class instanceVariables equals: #(owningClass).
	self assert: class selectors equals: #(owningClass owningClass:)