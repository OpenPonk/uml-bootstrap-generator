tests - generating - attributes
testAddAttributeOneToNone
	| class attribute |
	class := CBClass new.
	attribute := self attribute: 'instance' inClass: 'InstanceValue'.
	generator addAttribute: attribute to: class.
	self assert: class instanceVariables equals: #(instance).
	self assert: class selectors equals: #(instance instance:).
	self assertMethod: class methods first source equals: 'instance
	"The InstanceSpecification that represents the specified value."
	^ instance'.
self assertMethod: class methods second source equals: 'instance: anInstanceSpecification
	"The InstanceSpecification that represents the specified value."
	instance := anInstanceSpecification'