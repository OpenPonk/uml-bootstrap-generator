initialization
initialize
	super initialize.
	instanceCache := Dictionary new.
	classPrefix := self defaultClassPrefix