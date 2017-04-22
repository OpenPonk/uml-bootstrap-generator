generating - classes
addCommentFrom: aClassModel to: aClass
	aClassModel ownedComment ifNil: [ ^ self ].
	aClass comment: aClassModel ownedComment first body