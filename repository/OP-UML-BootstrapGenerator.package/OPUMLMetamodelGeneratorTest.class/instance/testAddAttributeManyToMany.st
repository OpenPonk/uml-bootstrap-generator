tests - generating - attributes
testAddAttributeManyToMany
	| class attribute |
	class := CBClass new.
	attribute := self attribute: 'generalization' inClass: 'GeneralizationSet'.
	generator addAttribute: attribute to: class.
	self assert: class instanceVariables equals: #(generalizations).
	self assert: class selectors equals: #(generalizations generalizations:).
	self
		assertMethod: class methods first source
		equals:
			'generalizations
	"Designates the instances of Generalization that are members of this GeneralizationSet."
	^ generalizations ifNil: [ generalizations := OPUMLManyToManyLinks on: self identity opposite: #generalizationSets ]'.
	self
		assertMethod: class methods second source
		equals:
			'generalizations: aGeneralization
	"Designates the instances of Generalization that are members of this GeneralizationSet."
	self generalizations removeAll; addAll: aGeneralization'