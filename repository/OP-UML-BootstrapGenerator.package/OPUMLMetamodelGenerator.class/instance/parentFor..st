retrieving
parentFor: aClassName
	^ aClassName = 'Element'
		ifTrue: [ 'Object' ]
		ifFalse: [ self classPrefix , 'Element' ]