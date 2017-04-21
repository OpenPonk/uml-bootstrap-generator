generating
createAssociationFrom: anAssociationElement
	| oneEnd otherEnd oneClass otherClass oneClassName otherClassName |
	oneEnd := (anAssociationElement elementNamed: 'memberEnd') referencedElements first.
	otherEnd := (anAssociationElement elementNamed: 'memberEnd') referencedElements second.
	oneClassName := (otherEnd elementNamed: 'type') referencedElement nameValue.
	otherClassName := (oneEnd elementNamed: 'type') referencedElement nameValue.
	oneClass := classes at: oneClassName ifAbsent: [ ^ self ].
	otherClass := classes at: otherClassName ifAbsent: [ ^ self ].
	self createAccessorsFrom: oneEnd in: oneClass.
	self createAccessorsFrom: otherEnd in: otherClass