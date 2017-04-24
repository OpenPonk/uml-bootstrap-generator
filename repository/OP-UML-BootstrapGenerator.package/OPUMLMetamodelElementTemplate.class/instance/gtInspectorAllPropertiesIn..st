GTInspector - extensions
gtInspectorAllPropertiesIn: aComposite
	<gtInspectorPresentationOrder: 6>
	aComposite fastTable
		title: 'Properties (All)';
		display: [ ((self class methods sorted: [ :a :b | a selector < b selector ])
				select: [ :each | each protocol beginsWith: 'accessing' ])
				select: [ :each | each numArgs = 0 ]
				thenCollect: [ :each | each selector -> (self perform: each selector) ] ];
		column: 'name' evaluated: [ :each | each key ];
		column: 'value' evaluated: [ :each | each value ];
		send: [ :selection | 
			selection isNil
				ifTrue: [ nil ]
				ifFalse: [ selection value ] ]