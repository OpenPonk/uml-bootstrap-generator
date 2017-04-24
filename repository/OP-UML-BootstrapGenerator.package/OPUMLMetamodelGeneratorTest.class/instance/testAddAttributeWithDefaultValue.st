tests - generating - attributes
testAddAttributeWithDefaultValue
	| class attribute |
	class := CBClass new.
	attribute := self attribute: 'value' inClass: 'LiteralInteger'.
	generator addAttribute: attribute to: class.
	self assertMethod: (class methodNamed: #value) source equals: 'value
	"The specified Integer value."
	^ value ifNil: [ value := 0 ]'