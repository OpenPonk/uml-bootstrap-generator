templates
property
	^ (self class methodsInProtocol: #implementation)
		collect: [ :method | 
			| body |
			body := method ast body.
			method selector -> (body source copyFrom: body start to: body stop) ]