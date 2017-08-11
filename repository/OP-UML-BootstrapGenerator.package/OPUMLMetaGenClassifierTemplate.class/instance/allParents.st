implementation
allParents
	^ self parents union: (self parents flatCollect: #allParents)