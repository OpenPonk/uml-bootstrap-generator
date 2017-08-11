implementation
isNavigable
	^ owningClass isNotNil or: [ association navigableOwnedEnds includes: self ]