testing
isLiteralSpecification: anElement
	^ anElement isNotNil and: [ (anElement instVarNamed: #sharedGeneralizations) includesKey: #LiteralSpecification ]