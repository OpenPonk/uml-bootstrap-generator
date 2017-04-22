reading
groupedChildrenIn: anObjectElement
	^ (anObjectElement containedItems reject: [ :each | each xmiName beginsWith: 'xmi:' ])
		groupedBy: #xmiName