reading
uniqueIdOf: anObject
	anObject xmiName = 'packageImport'
		ifTrue: [ ^ anObject xmiId , '-'
				, (anObject containedItems detect: [ :each | each xmiName = #importedPackage ]) referencedElement xmiId ].
	^ anObject xmiId