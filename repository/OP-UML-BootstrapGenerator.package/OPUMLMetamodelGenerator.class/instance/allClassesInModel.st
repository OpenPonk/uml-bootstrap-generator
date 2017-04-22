retrieving
allClassesInModel
	^ self sourceModel packagedElement
		flatCollect: [ :pkg | pkg packagedElement select: [ :each | each isKindOf: BootUMLClass ] ]