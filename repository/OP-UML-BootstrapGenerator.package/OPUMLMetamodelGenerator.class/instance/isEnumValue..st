testing
isEnumValue: anElement
	^ (anElement className endsWith: 'InstanceValue') and: [ anElement type className endsWith: 'Enumeration' ]