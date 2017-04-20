accessing
umlSpecs
	"umlSpecs := nil"

	<script: 'self umlSpecs inspect'>
	^ umlSpecs ifNil: [ umlSpecs := self retrieveUmlSpecs ]