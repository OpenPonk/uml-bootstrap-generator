instance creation
umlMetamodel
	"Open an inspector on the UML metamodel itself"

	<script: 'self umlMetamodel inspect'>
	^ self metaModels
		at: #UML
		ifAbsentPut: [ | primitives uml mapping result xmi reader model |
			primitives := 'http://www.omg.org/spec/UML/20131001/PrimitiveTypes.xmi'.
			uml := 'http://www.omg.org/spec/UML/20131001/UML.xmi'.
			mapping := Dictionary
				with: primitives -> (ZnEasy get: primitives) entity readStream contents
				with: uml -> (ZnEasy get: uml) entity readStream contents.
			result := OPXMIReader readFromMapping: mapping.
			xmi := result at: uml.
			reader := OPUMLXMIReader new.
			reader classPrefix: 'OPUML'.
			model := (reader readXmi: xmi) first ]