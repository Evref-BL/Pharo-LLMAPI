Class {
	#name : 'LLMAPIChatObjectToolCountClasses',
	#superclass : 'LLMAPIChatObjectTool',
	#category : 'LLM-API-Example',
	#package : 'LLM-API-Example'
}

{ #category : 'execution' }
LLMAPIChatObjectToolCountClasses >> executeWithArguments: arguments [
	"Implement this if you want to extend tools and use its default mecanism"

	^  Smalltalk image allClasses size asString
]

{ #category : 'initialization' }
LLMAPIChatObjectToolCountClasses >> initialize [
	super initialize.
	description := 'I count the number of classes in the system'.
	name := 'classCounter'
]
