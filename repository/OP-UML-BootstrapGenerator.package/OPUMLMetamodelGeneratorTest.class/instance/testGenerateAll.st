tests - generating
testGenerateAll
	| result |
	result := generator generateAll.
	self assert: result isNotEmpty