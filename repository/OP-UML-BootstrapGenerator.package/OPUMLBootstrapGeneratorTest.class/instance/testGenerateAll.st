tests - selecting
testGenerateAll
	| result |
	self skip.
	result := generator generateAll.
	self assert: result isNotEmpty