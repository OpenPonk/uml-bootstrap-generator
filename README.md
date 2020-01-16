# UML Bootstrap Generator
[![Build Status](https://travis-ci.com/OpenPonk/uml-bootstrap-generator.svg?branch=master)](https://travis-ci.com/OpenPonk/uml-bootstrap-generator) [![Coverage Status](https://coveralls.io/repos/github/OpenPonk/uml-bootstrap-generator/badge.svg?branch=master)](https://coveralls.io/github/OpenPonk/uml-bootstrap-generator?branch=master)

Utility to bootstrap UML implementation.
The generated code is available here https://github.com/OpenPonk/uml-metamodel

## Usage

### 1. Get XMI representation of Specs.

```smalltalk
primitives := 'http://www.omg.org/spec/UML/20131001/PrimitiveTypes.xmi'.
uml := 'http://www.omg.org/spec/UML/20131001/UML.xmi'.
mapping := Dictionary
	with: primitives -> (ZnEasy get: primitives) entity readStream contents
	with: uml -> (ZnEasy get: uml) entity readStream contents.
result := OPXMIReader readFromMapping: mapping.
xmi := result at: uml.
"or xmi := OPUMLBootstrapGeneratorTest umlSpecs"
```

### 2. Generate code

```smalltalk
generator := OPUMLBootstrapGenerator new.
generator sourceXmi: xmi.
generator classPrefix: 'BootUML'.
generator packageName: 'OP-UML-Bootstrap'.
(CBChangesBrowser changes: generator generateAll) open
```

### 3. Read XMI into the bootstrap UML

```smalltalk
reader := OPUMLXMIBootstrapReader new.
reader classPrefix: 'BootUML'.
model := (reader readXmi: xmi) first
```

### 4. Generate the actual UML

```smalltalk
generator := OPUMLMetamodelGenerator new.
generator sourceModel: model.
generator classPrefix: 'OPUML'.
generator packageName: 'OP-UML-Metamodel'.
(CBChangesBrowser changes: generator generateAll) open
```

## Installation
 
```smalltalk
Metacello new
	baseline: 'UMLBootstrapGenerator';
	repository: 'github://OpenPonk/uml-bootstrap-generator/repository';
	load.
```

