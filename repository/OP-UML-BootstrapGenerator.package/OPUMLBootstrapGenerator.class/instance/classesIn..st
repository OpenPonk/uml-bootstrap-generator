selecting
classesIn: aPackageElement
	^ aPackageElement containedItems
		select: [ :each | each xmiName = 'packagedElement' and: [ each xmiType = 'uml:Class' ] ]