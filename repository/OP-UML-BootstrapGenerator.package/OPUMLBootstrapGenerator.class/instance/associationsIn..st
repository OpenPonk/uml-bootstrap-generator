selecting
associationsIn: aPackageElement
	^ aPackageElement containedItems
		select: [ :each | each xmiName = 'packagedElement' and: [ each xmiType = 'uml:Association' ] ]