reading
read: anXmlStream pathmap: aPathmap
	| xmi pathmap xmiResult reader |
	pathmap := aPathmap copy.
	pathmap at: 'result' put: anXmlStream.
	xmiResult := OPXMIReader readFromMapping: pathmap.
	xmi := xmiResult at: 'result'.
	reader := self new.
	reader classPrefix: 'OPUML'.
	^ (reader readXmi: xmi) first