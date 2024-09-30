Class {
	#name : 'OPUMLBootstrapVisualizations',
	#superclass : 'Object',
	#category : 'OP-UML-BootstrapGenerator-Utilities',
	#package : 'OP-UML-BootstrapGenerator',
	#tag : 'Utilities'
}

{ #category : 'accessing' }
OPUMLBootstrapVisualizations >> showHierarchy [

	| xmi reader model cls element classifier parents nodes b layers subclasses generalizations |
	xmi := OPUMLBootstrapGenerator umlSpecs.

	reader := OPUMLXMIReader new.
	model := (reader readXmi: xmi) first.

	cls := (model packagedElements flatCollect: #packagedElements)
		       select: [ :each | each isKindOf: OPUMLClass ].

	element := cls detect: [ :each | each name = 'Element' ].
	classifier := cls detect: [ :each | each name = 'Class' ].

	layers := OrderedCollection new.
	subclasses := OrderedCollection with: classifier.
	[ subclasses isNotEmpty ] whileTrue: [
		| layer |
		layer := (subclasses select: [ :each |
			          each generalizations isNotNil ]) flatCollect: [ :each |
			         each generalizations collect: #general ].
		layers add: layer asArray.
		subclasses := layer ].

	generalizations := OrderedCollection new.
	layers reversed asArray do: [ :layer |
		layer do: [ :each | generalizations addIfNotPresent: each ] ].
	generalizations removeAllSuchThat: [ :each | each name = 'Element' ].
	parents := generalizations asArray.

	nodes := {
		         element.
		         classifier } , parents.

	b := RSMondrian new.
	b shape text text: #name.
	b nodes: nodes.

	b edges shape
		arrowedLine;
		color: Color gray.
	b edges connectToAll: [ :each |
		each generalizations
			ifNil: [ #(  ) ]
			ifNotNil: [ :g | g collect: #general ] ].

	b layout tree verticallyReverse verticalGap: 50.

	^ b
]
