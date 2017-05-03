tests - meta
testCreateElementMetaComment
	| cls |
	cls := generator createElementMeta.
	self assert: cls comment isNotNil