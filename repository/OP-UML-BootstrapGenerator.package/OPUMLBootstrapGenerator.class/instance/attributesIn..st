selecting
attributesIn: aClassElement
	^ aClassElement containedItems select: [ :each | each xmiName = 'ownedAttribute' ]