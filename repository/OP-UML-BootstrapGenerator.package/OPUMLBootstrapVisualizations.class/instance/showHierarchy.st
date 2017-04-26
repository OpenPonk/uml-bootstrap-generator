accessing
showHierarchy
| xmi reader model cls element classifier parents nodes b layers subclasses generalizations |
xmi := OPUMLBootstrapGeneratorTest umlSpecs.

reader := OPUMLXMIReader new.
reader classPrefix: 'OPUML'.
model := (reader readXmi: xmi) first.

cls := (model packagedElements flatCollect: #packagedElements) select: [ :each | each isKindOf: OPUMLClass ].

element := cls detect: [ :each | each name = 'Element' ].
classifier := cls detect: [ :each | each name = 'Class' ].

layers := OrderedCollection new.
subclasses := OrderedCollection with: classifier.
[ subclasses isNotEmpty ]
	whileTrue: [ |layer|
		layer := (subclasses select: [ :each | each generalizations isNotNil ])
			flatCollect: [ :each | each generalizations collect: #general ].
		layers add: layer asArray.
		subclasses := layer ].

generalizations := OrderedCollection new.
(layers reversed asArray)
	do: [ :layer | layer do: [ :each | generalizations addIfNotPresent: each ] ].
generalizations removeAllSuchThat: [ :each | each name = 'Element' ].
parents := generalizations asArray.

nodes := { element . classifier }, parents.

b := RTMondrian new.
b shape text text: #name.
b nodes: nodes.

b edges shape arrowedLine head: RTFilledNarrowArrow asHead; color: Color gray.
b edges connectToAll: [ :each | each generalizations ifNil: [ #() ] ifNotNil: [ :g | g collect: #general ] ].

b layout dominanceTree verticallyReverse verticalGap: 50.

^ b