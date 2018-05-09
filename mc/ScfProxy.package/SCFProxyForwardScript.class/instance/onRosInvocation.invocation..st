script
onRosInvocation: aDialogue invocation: anInvocation
	"anInvocation arrived and should be forwarded to aDialogue."
	self invoke: anInvocation operationName parameters: anInvocation argument original: anInvocation