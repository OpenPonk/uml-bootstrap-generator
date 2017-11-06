retrieving
commentIn: anElement
	^ (anElement ownedComments isNil or: [ anElement ownedComments isEmpty ])
		ifTrue: [ '' ]
		ifFalse: [ anElement ownedComments first body ]