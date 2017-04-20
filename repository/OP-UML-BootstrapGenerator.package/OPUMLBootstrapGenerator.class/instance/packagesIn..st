selecting
packagesIn: anXmi
	^ (anXmi elementNamed: 'Package') containedItems
		select: [ :each | each xmiName = 'packagedElement' and: [ each xmiType = 'uml:Package' ] ]