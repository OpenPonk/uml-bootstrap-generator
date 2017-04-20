selecting
collectGeneralizationsInPackage: aPackage
	^ (self classesIn: aPackage)
		flatCollect: [ :each | self collectGeneralizationsInClass: each ]