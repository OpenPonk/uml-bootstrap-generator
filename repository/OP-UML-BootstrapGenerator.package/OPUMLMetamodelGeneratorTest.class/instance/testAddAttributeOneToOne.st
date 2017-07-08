tests - generating - attributes
testAddAttributeOneToOne
	| class attribute |
	class := CBClass new.
	attribute := self attribute: 'parameteredElement' inClass: 'TemplateParameter'.
	generator addAttribute: attribute to: class.
	self assert: class instanceVariables equals: #(parameteredElement).
	self assert: class selectors equals: #(parameteredElement parameteredElement:).
	self
		assertMethod: class methods first source
		equals:
			'parameteredElement
	"The ParameterableElement exposed by this TemplateParameter."
	^ parameteredElement'.
	self
		assertMethod: class methods second source
		equals:
			'parameteredElement: aParameterableElement
	"The ParameterableElement exposed by this TemplateParameter."
	|anOldParameteredElement|
	anOldParameteredElement := parameteredElement.
	parameteredElement := aParameterableElement.
	OPUMLToOneLink on: self identity thisSelector: #parameteredElement otherSelector: #templateParameter from: anOldParameteredElement to: parameteredElement'