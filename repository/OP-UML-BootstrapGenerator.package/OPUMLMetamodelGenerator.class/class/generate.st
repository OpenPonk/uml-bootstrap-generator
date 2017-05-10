translating
generate
<script>
| generator model |
model := OPUMLMetamodelGeneratorTest umlBootstrapModel. 
generator := OPUMLMetamodelGenerator new.
generator sourceModel: model.
generator classPrefix: 'OPUML'.
generator packageName: 'OP-UML-Metamodel'.
(CBChangesBrowser changes: generator generateAll) open