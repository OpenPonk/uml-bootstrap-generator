# OpenPonk: UML Bootstrap & Profile Generator

[![Nightly](https://github.com/OpenPonk/uml-bootstrap-generator/actions/workflows/nightly.yml/badge.svg)](https://github.com/OpenPonk/uml-bootstrap-generator/actions/workflows/nightly.yml) [![Coverage Status](https://coveralls.io/repos/github/OpenPonk/uml-bootstrap-generator/badge.svg?branch=master)](https://coveralls.io/github/OpenPonk/uml-bootstrap-generator?branch=master)

UML profile code generator (`default` group) and OMG UML 2.5 metamodel bootstrap generator (`dev` group) for the [OpenPonk](https://openponk.org) UML ecosystem. The generated UML 2.5 metamodel is published in [`uml-metamodel`](https://github.com/OpenPonk/uml-metamodel).

## Installation

See [openponk.org/#direct-installation](https://openponk.org/#direct-installation) for the supported Pharo version.

To load only the UML profile generator (`default` group):

```smalltalk
Metacello new
	baseline: 'OpenPonkUMLBootstrapGenerator';
	repository: 'github://OpenPonk/uml-bootstrap-generator';
	load.
```

To also load the UML bootstrap metamodel and metamodel generator (`dev` group):

```smalltalk
Metacello new
	baseline: 'OpenPonkUMLBootstrapGenerator';
	repository: 'github://OpenPonk/uml-bootstrap-generator';
	load: 'dev'.
```

## Usage (Metamodel Regeneration)

### 1. Read XMI specifications

```smalltalk
primitives := 'http://www.omg.org/spec/UML/20131001/PrimitiveTypes.xmi'.
uml := 'http://www.omg.org/spec/UML/20131001/UML.xmi'.
mapping := Dictionary
	with: primitives -> (ZnEasy get: primitives) entity readStream contents
	with: uml -> (ZnEasy get: uml) entity readStream contents.
result := OPXMIReader readFromMapping: mapping.
xmi := result at: uml.
"or: xmi := OPUMLBootstrapGeneratorTest umlSpecs"
```

### 2. Generate the bootstrap metamodel

```smalltalk
generator := OPUMLBootstrapGenerator new.
generator sourceXmi: xmi.
generator classPrefix: 'BootUML'.
generator packageName: 'OpenPonk-UML-Bootstrap'.
(CBChangesBrowser changes: generator generateAll) open
```

### 3. Read XMI into the bootstrap UML model

```smalltalk
reader := OPUMLXMIBootstrapReader new.
reader classPrefix: 'BootUML'.
model := (reader readXmi: xmi) first
```

### 4. Generate `OpenPonk-UML-Metamodel`

```smalltalk
generator := OPUMLMetamodelGenerator new.
generator sourceModel: model.
generator classPrefix: 'OPUML'.
generator packageName: 'OpenPonk-UML-Metamodel'.
(CBChangesBrowser changes: generator generateAll) open
```

## Documentation

Part of the [OpenPonk](https://openponk.org) platform. For architecture, the repository catalog, and contributing guidelines, see [`OpenPonk/.github`](https://github.com/OpenPonk/.github/blob/main/profile/README.md).
