as yet unclassified
rewriteApplicationContextName: aDialogue
	| acn |
	acn := aDialogue applicationContextName.

	"Upgrade from cap-gsmssf-to-gsmscf version1(0) to version2(1)"
	acn = '0.4.0.0.1.0.50.0' asAsn1Oid ifTrue: [
		acn := '0.4.0.0.1.0.50.1' asAsn1Oid].
	^acn