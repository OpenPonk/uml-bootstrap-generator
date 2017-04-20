tests
testCreateAccessors
	| class |
	class := CBClass new.
	generator createAccessorsFrom: self xmiClassAttribute in: class.
	self assert: class instanceVariables equals: #(body).
	self assert: class selectors equals: #(body body:)