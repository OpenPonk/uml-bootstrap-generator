generating - classes
ensureCreateClass: aName in: aTagName
	^ classes
		at: aName
		ifAbsentPut: [ CBClass
				name: (self classNameFor: aName)
				parent: self rootClassName
				package: self packageName , '-' , aTagName ]