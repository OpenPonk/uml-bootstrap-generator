implementation
opposite
	^ (association isNotNil and: [ association memberEnds size = 2 ])
		ifTrue: [ association memberEnds detect: [ :each | (each = self) not ] ]