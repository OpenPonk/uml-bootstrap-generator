utility
determineRequiredClasses
	| file doc |
	file := 'pathTo/UML.xmi'.
	doc := XMLDOMParser parse: file readStream.
	((doc allElementsCollect: [ :each | each attributeAt: #xmi:type ]) asSet
		select: [ :each | each beginsWith: 'uml:' ]) sorted
		collect: [ :each | (each splitOn: ':') second asSymbol ]