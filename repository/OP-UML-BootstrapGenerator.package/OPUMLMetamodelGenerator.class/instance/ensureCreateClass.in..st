generating
ensureCreateClass: aName in: aCategoryName
	^ classes
		at: aName
		ifAbsentPut: [ CBClass
				name: (self classNameFor: aName)
				parent: self rootClassName
				package: self packageName , '-' , aCategoryName ]