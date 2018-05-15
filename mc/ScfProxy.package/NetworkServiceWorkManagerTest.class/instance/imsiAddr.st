as yet unclassified
imsiAddr
	"Use the IMSI to the Address the HLR.."
	| gt |
	gt := SCCPGlobalTitleTranslation new
			translation: 0;
			plan: 6;
			nature: 4;
			addr: '1234567';
			asByteArray.
	^self scfAddr
		globalTitle: gt indicator: 4.