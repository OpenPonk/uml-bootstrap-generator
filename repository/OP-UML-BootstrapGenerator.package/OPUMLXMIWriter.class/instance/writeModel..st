writing
writeModel: aModel
	| xmiElement objectElement |
	objectElement := self writeElement: aModel.
	objectElement xmiName: 'uml:' , (self elementNameFor: aModel).
	xmiElement := OPXMIObjectElement new.
	xmiElement xmiName: 'xmi:XMI'.
	xmiElement containedItems: {objectElement}.
	^ xmiElement