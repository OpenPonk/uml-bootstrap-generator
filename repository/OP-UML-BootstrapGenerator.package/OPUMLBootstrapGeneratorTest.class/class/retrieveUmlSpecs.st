accessing
retrieveUmlSpecs
	| primitives uml mapping result |
	primitives := 'http://www.omg.org/spec/UML/20131001/PrimitiveTypes.xmi'.
	uml := 'http://www.omg.org/spec/UML/20131001/UML.xmi'.
	mapping := Dictionary
		with: primitives -> (ZnEasy get: primitives) entity readStream contents
		with: uml -> (ZnEasy get: uml) entity readStream contents.
	result := OPXMIReader readFromMapping: mapping.
	^ result at: uml