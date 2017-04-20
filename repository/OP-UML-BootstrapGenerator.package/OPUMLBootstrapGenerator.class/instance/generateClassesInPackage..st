generating
generateClassesInPackage: aPackageElement
	self packageName asPackage addClassTag: aPackageElement nameValue.
	(self classesIn: aPackageElement)
		select: [ :clsElement | self requiredClasses includes: clsElement nameValue ]
		thenDo: [ :clsElement | 
			| cls |
			cls := self createClassFrom: clsElement in: aPackageElement nameValue.
			(self attributesIn: clsElement)
				do: [ :attribElement | self createAccessorsFrom: attribElement in: cls ] ]