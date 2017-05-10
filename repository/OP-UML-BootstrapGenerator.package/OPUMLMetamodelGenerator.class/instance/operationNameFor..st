retrieving
operationNameFor: anOperationName
	| name |
	name := anOperationName name.
	"class is a prohibited method name (it accesses the class-side)"
	name = 'class'
		ifTrue: [ name := 'owningClass' ].
	^ name