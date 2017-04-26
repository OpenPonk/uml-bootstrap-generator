tests - generating - attributes
testAddAttributeWithEnumDefaultValue
	| class attribute |
	class := CBClass new.
	attribute := self attribute: 'direction' inClass: 'Parameter'.
	generator addAttribute: attribute to: class.
	self assertMethod: (class methodNamed: #direction) source equals: 'direction
	"Indicates whether a parameter is being sent into or out of a behavioral element."

	^ direction ifNil: [ direction := MBUTParameterDirectionKind new in ]'