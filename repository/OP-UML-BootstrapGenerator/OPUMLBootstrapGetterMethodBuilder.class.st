Class {
	#name : 'OPUMLBootstrapGetterMethodBuilder',
	#superclass : 'Object',
	#instVars : [
		'selector',
		'comment',
		'defaultValue'
	],
	#category : 'OP-UML-BootstrapGenerator-Utilities',
	#package : 'OP-UML-BootstrapGenerator',
	#tag : 'Utilities'
}

{ #category : 'building' }
OPUMLBootstrapGetterMethodBuilder >> build [
	| source |
	source := String
		streamContents: [ :stream | 
			stream nextPutAll: selector , String cr.
			comment
				ifNotNil: [ stream
						nextPutAll: String tab , '"' , (comment copyReplaceAll: '"' with: '""') , '"' , String cr ].
			stream nextPutAll: String tab , '^ ' , selector.
			defaultValue
				ifNotNil: [ stream nextPutAll: ' ifNil: [ ' , selector , ' := ' , defaultValue asString , ' ]' ] ].
	^ CBMethod new
		protocolName: 'accessing';
		source: source
]

{ #category : 'accessing' }
OPUMLBootstrapGetterMethodBuilder >> comment: anObject [
	comment := anObject
]

{ #category : 'accessing' }
OPUMLBootstrapGetterMethodBuilder >> defaultValue: anObject [
	defaultValue := anObject
]

{ #category : 'accessing' }
OPUMLBootstrapGetterMethodBuilder >> selector: anObject [
	selector := anObject
]
