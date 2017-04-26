building
build
	| source |
	source := String
		streamContents: [ :stream | 
			stream nextPutAll: selector , String cr.
			comment
				ifNotNil: [ stream
						nextPutAll: String tab , '"' , (comment copyReplaceAll: '"' with: '""') , '"' , String cr ].
			stream nextPutAll: String tab , '^ ' , selector.
			defaultValue
				ifNotNil: [ stream nextPutAll: ' ifNil: [ ' , selector , ' := ' , defaultValue , ']' ] ].
	^ CBMethod new
		protocol: 'accessing';
		source: source