translating
generate
| xmi reader model generator cs cb |
xmi := OPUMLBootstrapGeneratorTest umlSpecs.

reader := OPUMLXMIBootstrapReader new.
reader classPrefix: 'BootUML'.
model := (reader readXmi: xmi) first.

generator := OPUMLMetamodelGenerator new.
generator sourceModel: model.
generator rootClassName: 'OPUMLBootstrapObject'.
generator classPrefix: 'OPUML'.
generator packageName: 'OP-UML-Metamodel'.

cs := generator generateAll.

cb := (CBChangesBrowser changes: cs).
cb open.