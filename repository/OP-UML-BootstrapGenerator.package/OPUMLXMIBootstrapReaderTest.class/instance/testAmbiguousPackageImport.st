tests
testAmbiguousPackageImport
	"xmi:id of <packageImport> elements are not valid and should be ignored (they are not unique). Test that we can load correctly despite that"

	| masterPkg activitiesPkg classificationPkg |
	masterPkg := reader readItem: self packageImportPackage.
	self assert: masterPkg name equals: 'UML'.
	self assert: masterPkg packageImport size equals: 2.
	activitiesPkg := masterPkg packageImport first importedPackage.
	classificationPkg := masterPkg packageImport second importedPackage.
	self assert: classificationPkg name equals: 'Classification'.
	self assert: classificationPkg packageImport equals: nil.
	self assert: activitiesPkg name equals: 'Activities'.
	self assert: activitiesPkg packageImport first importedPackage equals: classificationPkg