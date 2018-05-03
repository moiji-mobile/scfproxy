forwarding
newInvocationOn: aDialogue source: sourceInvocation
	"This will add the ROSInvocation to the invocation list. In case of initialDPVx (or many
	other camel calls) there is no returnLast and this means the invocation (and the invokeId)
	will not be release."
	^aDialogue newInvocationForName: sourceInvocation operationName parameters: sourceInvocation argument.