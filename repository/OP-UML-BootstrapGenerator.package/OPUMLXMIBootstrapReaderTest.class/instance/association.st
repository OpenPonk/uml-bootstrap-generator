instance creation
association
	| assoc ownedAttr ownedEnd |
	ownedAttr := OPXMIObjectElement new.
	ownedEnd := OPXMIObjectElement new.
	assoc := OPXMIObjectElement new.
	assoc
		xmiName: 'packagedElement';
		containedItems:
			{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:Association'.
			OPXMIValueAttribute xmiName: 'xmi:id' value: 'A_annotatedElement_comment'.
			OPXMIValueAttribute xmiName: 'name' value: 'A_annotatedElement_comment'.
			OPXMIReferenceAttribute
				xmiName: 'memberEnd'
				referencedElements:
					{ownedAttr.
					ownedEnd}.
			ownedEnd}.
	ownedAttr
		xmiName: 'ownedAttribute';
		containedItems:
			{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:Property'.
			OPXMIValueAttribute xmiName: 'xmi:id' value: 'Comment-annotatedElement'.
			OPXMIValueAttribute xmiName: 'name' value: 'annotatedElement'.
			OPXMIReferenceAttribute xmiName: 'association' referencedElements: {assoc}}.
	ownedEnd
		xmiName: 'ownedEnd';
		containedItems:
			{OPXMIValueAttribute xmiName: 'xmi:type' value: 'uml:Property'.
			OPXMIValueAttribute xmiName: 'xmi:id' value: 'A_annotatedElement_comment-comment'.
			OPXMIValueAttribute xmiName: 'name' value: 'comment'.
			OPXMIReferenceAttribute xmiName: 'association' referencedElements: {assoc}}.
	^ assoc