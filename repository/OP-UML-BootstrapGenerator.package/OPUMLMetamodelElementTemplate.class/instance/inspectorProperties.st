GTInspector - extensions
inspectorProperties
	^ self inspectorPropertiesSelectors collect: [ :each | each -> (self perform: each) ]