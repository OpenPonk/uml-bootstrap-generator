tests
testAddEnumLiteral
	| class enumModel literal |
	class := CBClass new.
	class name: 'AggregationKind'.
	enumModel := self findElement: 'AggregationKind'.
	literal := enumModel ownedLiteral detect: [ :each | each name = 'composite' ].
	generator addEnumLiteral: literal to: class.
	self assert: class selectors equals: #(composite).
	self assert: class methods first protocol equals: 'accessing'.
	self assertMethod: class methods first source equals: 'composite
		"Indicates that the Property is aggregated compositely, i.e., the composite object has responsibility for the existence and storage of the composed objects (parts)."
		^ #composite'.
	self assert: class metaMethods isNotEmpty.
	self assert: class metaMethods first protocol equals: 'accessing - enum'.
	self assertMethod: class metaMethods first source equals: 'composite
		"Indicates that the Property is aggregated compositely, i.e., the composite object has responsibility for the existence and storage of the composed objects (parts)."
		^ #composite'.