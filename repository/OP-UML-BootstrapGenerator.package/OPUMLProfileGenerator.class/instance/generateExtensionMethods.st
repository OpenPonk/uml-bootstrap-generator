generating
generateExtensionMethods
	| extensions metaClass cls extensionGetter extensionSetter |
	extensions := self sourceModel packagedElements
		select: [ :each | each oclIsKindOf: #Extension ].
	extensions
		do: [ :ext | 
			metaClass := self class environment
				at: ('OPUML' , ext ownedEnd opposite type name) asSymbol.
			cls := CBClass fromClass: metaClass.
			classes at: cls name put: cls.
			extensionGetter := CBMethod new
				source:
					('<1s>
		^ self tagAt: #<1s> ifAbsent: [ nil ]' expandMacrosWith: ext ownedEnd name);
				protocol: '*' , self sourceModel implementationPackage.
			extensionSetter := CBMethod new
				source:
					('<1s>: a<2s>
	| old<2s> |
	old<2s> := self <1s>.
	self tagAt: #<1s> put: a<2s>.
	OPUMLToOneLink
		on: self
		thisSelector: #<1s>
		otherSelector: #<3s>
		updateFrom: old<2s>
		to: a<2s>'
						expandMacrosWith: ext ownedEnd name
						with: ext ownedEnd type name
						with: ext ownedEnd opposite name);
				protocol: '*' , self sourceModel implementationPackage.
			cls addMethod: extensionGetter.
			cls addMethod: extensionSetter ]