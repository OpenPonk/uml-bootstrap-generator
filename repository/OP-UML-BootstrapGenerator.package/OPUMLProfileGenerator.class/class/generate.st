translating
generate
	<script>
	| generator model |
	Smalltalk globals
		at: #OntoUMLProfileFactory
		ifPresent: [ :factory | 
			model := factory profile.
			generator := self new.
			generator sourceModel: model.
			generator classPrefix: model implementationPrefix.
			generator packageName: model implementationPackage.
			(CBChangesBrowser changes: generator generateAll) open ]