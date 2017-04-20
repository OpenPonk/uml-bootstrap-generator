generating
generateAssociationsInPackage: aPackageElement
	(self associationsIn: aPackageElement) do: [ :each | self createAssociationFrom: each ]