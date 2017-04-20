selecting
generalizationsIn: aClassElement
	^ aClassElement containedItems select: [ :each | each xmiName = 'generalization' ]