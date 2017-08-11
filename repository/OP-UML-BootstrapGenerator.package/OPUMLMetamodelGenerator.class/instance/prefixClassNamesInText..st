generating - operations
prefixClassNamesInText: aString
	^ aString
		copyWithRegex: '''%\w+%'''
		matchesTranslatedUsing: [ :each | self classPrefix , (each copyFrom: 3 to: each size - 2) ]