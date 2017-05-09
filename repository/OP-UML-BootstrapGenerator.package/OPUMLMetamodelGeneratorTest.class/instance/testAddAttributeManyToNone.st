tests - generating - attributes
testAddAttributeManyToNone
	| class attribute |
	class := CBClass new.
	attribute := self attribute: 'ownedComment' inClass: 'Element'.
	generator addAttribute: attribute to: class.
	self assert: class instanceVariables equals: #(ownedComments).
	self assert: class selectors equals: #(ownedComments ownedComments:).
	self assertMethod: class methods first source equals: 'ownedComments
	"The Comments owned by this Element."
	^ ownedComments ifNil: [ ownedComments := OrderedCollection new ]'.
self assertMethod: class methods second source equals: 'ownedComments: aComment
	"The Comments owned by this Element."
	ownedComments := aComment'