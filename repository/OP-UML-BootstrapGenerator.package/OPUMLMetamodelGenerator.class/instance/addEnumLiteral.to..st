generating - enums
addEnumLiteral: anEnumLiteral to: aClass
	| builder prohibitedClassSideSelectors |
	builder := CBMethodBuilder new.
	builder selector: anEnumLiteral name.
	anEnumLiteral ownedComment
		ifNotNil:
			[ :comments | builder addLine: '"' , (comments first body copyReplaceAll: '"' with: '""') , '"' ].
	builder addLine: '^ #' , anEnumLiteral name.
	aClass
		addMethod:
			(CBMethod new
				protocol: 'accessing';
				source: builder source).
	prohibitedClassSideSelectors := #(package).
	(prohibitedClassSideSelectors includes: anEnumLiteral name)
		ifFalse: [ aClass
				addMetaMethod:
					(CBMethod new
						protocol: 'accessing - enum';
						source: builder source) ]