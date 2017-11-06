generating - classes
ensureCreateClass: aName in: aTagName
	^ classes
		at: aName
		ifAbsentPut: [ CBClass
				name: (self classNameFor: aName)
				parent: (self parentFor: aName)
				package: self packageName , '-' , aTagName ]