instance creation
newOnShared: aDictionary
	^ self basicNew
		initializeWithShared: aDictionary;
		yourself