reading
readXmi: anXmi
	^ anXmi containedItems
		select: [ :each | each isObjectElement and: [ each xmiType beginsWith: 'uml:' ] ]
		thenCollect: [ :each | self readItem: each ]