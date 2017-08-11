generating - operations
addRealOperation: anOperationModel to: aClass
	| name comment methodBuilder |
	name := self operationNameFor: anOperationModel.
	comment := self commentIn: anOperationModel.
	methodBuilder := CBMethodBuilder new selector: name.
	methodBuilder addComment: comment.
	methodBuilder addLine: ''.
	anOperationModel precondition
		ifNotNil: [ anOperationModel precondition
				do: [ :pre | 
					methodBuilder
						addComment: pre name , ': {' , pre specification language first , '} ' , pre specification body first ] ].
	anOperationModel bodyCondition
		ifNotNil: [ :bodyCond | 
			| spec |
			spec := bodyCond specification.
			spec body
				withIndexDo: [ :each :i | methodBuilder addComment: '{' , (spec language at: i) , '} ' , each ] ].
	methodBuilder addLine: ''.
	methodBuilder
		addLine: (self prefixClassNamesInText: anOperationModel method first body first).
	aClass compile: methodBuilder source classified: 'operations'