accessing
showHierarchy
| xmi reader model cls element classifier parents nodes b |
xmi := OPUMLBootstrapGeneratorTest umlSpecs.

reader := OPUMLXMIBootstrapReader new.
reader classPrefix: 'OPUML'.
model := (reader readXmi: xmi) first.

cls := (model packagedElement flatCollect: #packagedElement) select: [ :each | each isKindOf: OPUMLClass ].

element := cls detect: [ :each | each name = 'Element' ].
classifier := cls detect: [ :each | each name = 'Class' ].

parents := OPUMLMetamodelGenerator new allSuperclassesOf: classifier.

nodes := { element . classifier }, parents.

b := RTMondrian new.
b shape text text: #name.
b nodes: nodes.

b edges shape arrowedLine head: RTFilledNarrowArrow asHead; color: Color gray.
b edges connectToAll: [ :each | each generalization ifNil: [ #() ] ifNotNil: [ :g | g collect: #general ] ].

b layout dominanceTree verticallyReverse verticalGap: 50.

^ b