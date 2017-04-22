tests
testReadSimpleObject
	| element result |
	element := OPXMIObjectElement new
		containedItems:
			{OPXMIValueAttribute xmiName: 'xmi:id' value: 'Comment'.
			OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:Comment'.
			OPXMIValueElement xmiName: 'body' value: 'CONTENT'}.
	result := reader readItem: element.
	self assert: result className equals: #BootUMLComment.
	self assert: result body equals: 'CONTENT'