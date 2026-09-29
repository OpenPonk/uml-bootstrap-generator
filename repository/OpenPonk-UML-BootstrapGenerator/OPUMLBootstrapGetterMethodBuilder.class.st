"
I am a utility builder used during the UML bootstrap phase to construct and compile getter methods, managing selectors, comments, and default initializations for generated classes.
"
Class {
	#name : 'OPUMLBootstrapGetterMethodBuilder',
	#superclass : 'Object',
	#instVars : [
		'selector',
		'comment',
		'defaultValue'
	],
	#category : 'OpenPonk-UML-BootstrapGenerator-Utilities',
	#package : 'OpenPonk-UML-BootstrapGenerator',
	#tag : 'Utilities'
}

{ #category : 'building' }
OPUMLBootstrapGetterMethodBuilder >> build [

	| source |
	source := String streamContents: [ :stream |
			          stream
				          nextPutAll: selector;
				          cr.
			          comment ifNotNil: [
					          stream
						          tab;
						          nextPutAll: '"';
						          nextPutAll: (comment copyReplaceAll: '"' with: '""');
						          nextPutAll: '"';
						          cr ].
			          stream
				          tab;
				          nextPutAll: '^ ';
				          nextPutAll: selector.
			          defaultValue ifNotNil: [
					          stream
						          nextPutAll: ' ifNil: [ ';
						          nextPutAll: selector;
						          nextPutAll: ' := ';
						          nextPutAll: defaultValue asString;
						          nextPutAll: ' ]' ] ].
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
