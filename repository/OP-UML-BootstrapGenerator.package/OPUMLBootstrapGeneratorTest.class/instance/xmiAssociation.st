instance creation
xmiAssociation
	| s |
	s := '<xmi>
	<packagedElement xmi:type="uml:Class" xmi:id="Comment">
		<name>Comment</name>
	</packagedElement>
	<packagedElement xmi:type="uml:Class" xmi:id="Element">
		<name>Element</name>
	</packagedElement>
	<packagedElement xmi:type="uml:Association" xmi:id="Assoc" name="Assoc" memberEnd="Assoc_attrib Assoc_end">
		<ownedEnd xmi:type="uml:Property" xmi:id="Assoc_end" name="comment" type="Comment" association="Assoc">
		</ownedEnd>
	</packagedElement>
	<ownedAttribute xmi:type="uml:Property" xmi:id="Assoc_attrib" name="annotatedElement" type="Element" association="Assoc">
	</ownedAttribute>
</xmi>'.
	^ OPXMIReader readFrom: s readStream