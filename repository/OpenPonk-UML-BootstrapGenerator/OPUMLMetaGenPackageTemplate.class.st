Class {
	#name : 'OPUMLMetaGenPackageTemplate',
	#superclass : 'OPUMLMetaGenTemplate',
	#category : 'OpenPonk-UML-BootstrapGenerator-Templates',
	#package : 'OpenPonk-UML-BootstrapGenerator',
	#tag : 'Templates'
}

{ #category : 'implementation' }
OPUMLMetaGenPackageTemplate >> mustBeOwned [
	^ false
]

{ #category : 'implementation' }
OPUMLMetaGenPackageTemplate >> nestedPackage [
	^ (self packagedElements
		select: [ :each | each oclIsKindOf: #Package ]
		thenCollect: [ :each | each oclAsType: #Package ]) asSet
]

{ #category : 'implementation' }
OPUMLMetaGenPackageTemplate >> ownedStereotype [
	^ (self packagedElements
		select: [ :each | each oclIsKindOf: #Stereotype ]
		thenCollect: [ :each | each oclAsType: #Stereotype ]) asSet
]

{ #category : 'implementation' }
OPUMLMetaGenPackageTemplate >> ownedType [
	^ (self packagedElements
		select: [ :each | each oclIsKindOf: #Type ]
		thenCollect: [ :each | each oclAsType: #Type ]) asSet
]
