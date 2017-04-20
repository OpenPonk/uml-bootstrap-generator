selecting
collectGeneralizationsInPackages: aCollectionOfPackages
	^ aCollectionOfPackages
		flatCollect: [ :each | self collectGeneralizationsInPackage: each ]