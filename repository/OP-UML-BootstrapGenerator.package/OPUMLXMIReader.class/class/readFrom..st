reading
readFrom: aStream
	^ (self new readXmi: (OPXMIReader readFrom: aStream)) first