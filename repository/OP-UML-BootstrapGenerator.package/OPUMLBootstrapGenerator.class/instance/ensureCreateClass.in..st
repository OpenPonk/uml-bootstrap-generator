generating
ensureCreateClass: aName in: aCategoryName
	^ classes
		at: aName
		ifAbsentPut: [ CBClass name: aName parent: self rootClassName package: aCategoryName ]