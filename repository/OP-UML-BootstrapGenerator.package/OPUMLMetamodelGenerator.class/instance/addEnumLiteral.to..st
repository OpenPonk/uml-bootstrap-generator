generating - enums
addEnumLiteral: anEnumLiteral to: aClass
	| builder |
	builder := CBMethodBuilder new.
	builder selector: anEnumLiteral name.
	anEnumLiteral ownedComment
		ifNotNil:
			[ :comments | builder addLine: '"' , (comments first body copyReplaceAll: '"' with: '""') , '"' ].
	builder
		addLine: '^ #' , (aClass name withoutPrefix: self classPrefix) , '::' , anEnumLiteral name.
	aClass
		addMethod:
			(CBMethod new
				protocol: 'accessing';
				source: builder source)