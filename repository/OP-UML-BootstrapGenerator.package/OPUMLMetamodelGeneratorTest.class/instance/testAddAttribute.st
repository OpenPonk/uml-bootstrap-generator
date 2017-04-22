tests - generating - attributes
testAddAttribute
	| class attribute |
	class := CBClass new.
	attribute := self attribute: 'ownedComment' inClass: 'Element'.
	generator addAttribute: attribute to: class.
	self assert: class instanceVariables equals: #(ownedComment).
	self assert: class selectors equals: #(ownedComment ownedComment:).
	self assert: class methods first source equals: 'ownedComment
	"The Comments owned by this Element."
	^ ownedComment'