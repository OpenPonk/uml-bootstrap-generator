tests
testIsCollectionAttribute
	self deny: (reader isCollectionAttribute: #name inClass: BootUMLProperty).
	self deny: (reader isCollectionAttribute: #body inClass: BootUMLComment).
	self deny: (reader isCollectionAttribute: #general inClass: BootUMLGeneralization).
	self deny: (reader isCollectionAttribute: #type inClass: BootUMLProperty).
	self deny: (reader isCollectionAttribute: #importedPackage inClass: BootUMLPackageImport).
	self deny: (reader isCollectionAttribute: #defaultValue inClass: BootUMLProperty).
	self deny: (reader isCollectionAttribute: #instance inClass: BootUMLInstanceValue)