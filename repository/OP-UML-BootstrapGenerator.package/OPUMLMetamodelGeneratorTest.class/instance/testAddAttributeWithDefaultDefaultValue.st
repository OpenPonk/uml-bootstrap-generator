tests - generating - attributes
testAddAttributeWithDefaultDefaultValue
	| class attribute |
	class := CBClass new.
	attribute := self attribute: 'isReadOnly' inClass: 'Activity'.
	generator addAttribute: attribute to: class.
	self assertMethod: (class methodNamed: #isReadOnly) source equals: 'isReadOnly
"If true, this Activity must not make any changes to objects. The default is false (an Activity may make nonlocal changes). (This is an assertion, not an executable property. It may be used by an execution engine to optimize model execution. If the assertion is violated by the Activity, then the model is ill-formed.) "

	^ isReadOnly ifNil: [ isReadOnly := false ]'