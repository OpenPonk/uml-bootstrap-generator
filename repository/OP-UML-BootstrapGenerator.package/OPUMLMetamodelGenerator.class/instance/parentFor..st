retrieving
parentFor: aClassName
	aClassName = 'MetaElement'
		ifTrue: [ ^ 'Object' ].
	aClassName = 'Element'
		ifTrue: [ ^ self classPrefix , 'MetaElement' ].
	^ self classPrefix , 'Element'