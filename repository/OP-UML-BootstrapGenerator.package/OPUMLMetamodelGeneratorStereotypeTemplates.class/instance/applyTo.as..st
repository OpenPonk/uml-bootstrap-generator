implementation
"protocol: reflective operations"
applyTo: anElement as: aName
	anElement applyStereotype: self.
	(self tags at: #base ifAbsentPut: [ OrderedDictionary new ]) at: aName put: anElement