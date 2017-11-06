retrieving
allClassesInModel
	^ self sourceModel packagedElements select: [ :each | each oclIsKindOf: #Stereotype ]