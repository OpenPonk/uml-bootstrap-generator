tests
testCreateAccessorsForClassAttribute
	| class attribute |
	"'class' is a prohibited attribute/method name, make sure we don't generate it"
	attribute := OPXMIObjectElement new
		xmiName: 'ownedAttribute';
		containedItems:
			{OPXMIValueElement xmiName: 'name' value: 'class'.
			OPXMIObjectElement new
				xmiName: 'type';
				containedItems:
					{OPXMIValueElement xmiName: 'xmi:type' value: 'uml:PrimitiveType'.
					OPXMIValueElement
						xmiName: 'href'
						value: 'http://www.omg.org/spec/UML/20131001/PrimitiveTypes.xmi#String'}}.
	class := CBClass new.
	generator createAccessorsFrom: attribute in: class.
	self assert: class instanceVariables equals: #(owningClass).
	self assert: class selectors equals: #(owningClass owningClass:)