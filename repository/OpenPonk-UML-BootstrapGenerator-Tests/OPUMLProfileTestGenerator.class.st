"
Test subclass of the profile code generator that stubs XMI serialization so profile factory generation can be tested without loading the UML XMI serializer package.
"
Class {
	#name : 'OPUMLProfileTestGenerator',
	#superclass : 'OPUMLProfileGenerator',
	#instVars : [
		'xmiStringValue'
	],
	#category : 'OpenPonk-UML-BootstrapGenerator-Tests-Profile-Generator',
	#package : 'OpenPonk-UML-BootstrapGenerator-Tests',
	#tag : 'Profile-Generator'
}

{ #category : 'generating' }
OPUMLProfileTestGenerator >> xmiString [

	^ xmiStringValue ifNil: [ '<xmi/>' ]
]

{ #category : 'accessing' }
OPUMLProfileTestGenerator >> xmiStringValue: aString [

	xmiStringValue := aString
]
