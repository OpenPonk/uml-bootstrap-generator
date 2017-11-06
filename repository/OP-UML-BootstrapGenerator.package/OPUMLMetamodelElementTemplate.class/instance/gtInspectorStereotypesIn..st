GTInspector - extensions
gtInspectorStereotypesIn: aComposite
	<gtInspectorPresentationOrder: 6>
	^ aComposite fastList
		title: 'Stereotypes';
		display: [ self appliedStereotypes ]