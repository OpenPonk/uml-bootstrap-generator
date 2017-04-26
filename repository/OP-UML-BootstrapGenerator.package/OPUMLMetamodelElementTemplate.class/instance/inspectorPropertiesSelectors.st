GTInspector - extensions
inspectorPropertiesSelectors
	| classes class |
	classes := Set new.
	class := self class.
	[ class name = 'Object' ]
		whileFalse: [ classes add: class.
			class := class superclass ].
	^ ((((classes flatCollect: #methods) select: [ :each | each numArgs = 0 ])
		select: [ :each | each protocol beginsWith: 'accessing' ]) collect: #selector) sorted