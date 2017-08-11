implementation
metaclassEnd
	^ (self memberEnds reject: [ :each | self ownedEnds includes: each ]) anyOne