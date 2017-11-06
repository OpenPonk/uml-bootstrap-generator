GTInspector - extensions
gtInspectorStereotypePropertiesIn: aComposite
	<gtInspectorPresentationOrder: 7>
	aComposite fastTable
		title: 'Tagged Values';
		display: [ self stereotypeProperties ];
		column: 'name' evaluated: [ :each | each first ] width: 120;
		column: 'stereotype' evaluated: [ :each | each second ] width: 120;
		column: 'value' evaluated: [ :each | each third ];
		send: [ :selection | 
			selection isNil
				ifTrue: [ nil ]
				ifFalse: [ selection value ] ]