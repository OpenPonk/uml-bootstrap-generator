generating - classes
addCommentFrom: aClassModel to: aClass
	aClassModel ownedComments ifEmpty: [ ^ self ].
	aClass comment: aClassModel ownedComments first body