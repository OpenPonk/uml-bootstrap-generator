accessing
requiredRealClasses
	"An EMOF metamodel is restricted to use the following concrete metaclasses from UML’s Kernel
	(see MOF2.5. specs)
	
	Also see class-side
	"

	^ #(Association Class Comment Constraint Enumeration EnumerationLiteral Generalization InstanceValue LiteralBoolean LiteralInteger LiteralUnlimitedNatural OpaqueExpression Operation Package PackageImport Parameter PrimitiveType Property)
	"	^ #(Association Class Comment DataType Enumeration EnumerationLiteral Generalization InstanceSpecification InstanceValue LiteralBoolean LiteralInteger LiteralNull LiteralReal LiteralString LiteralUnlimitedNatural Operation Package Parameter PrimitiveType Property Slot)"