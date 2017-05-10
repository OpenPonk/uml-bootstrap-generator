retrieving
commentIn: anElement
	^ (anElement ownedComment isNil or: [ anElement ownedComment isEmpty ])
		ifTrue: [ '' ]
		ifFalse: [ anElement ownedComment first body ]