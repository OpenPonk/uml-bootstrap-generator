retrieving
attributeNameFor: anAttributeModel
	| name |
	name := anAttributeModel name.
	"class is a prohibited method name (it accesses the class-side)"
	name = 'class'
		ifTrue: [ name := 'owningClass' ].
	anAttributeModel isMultivalued
		ifTrue: [ ^ name asEnglishPlural ].
	^ name