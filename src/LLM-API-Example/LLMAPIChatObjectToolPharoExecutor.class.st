Class {
	#name : 'LLMAPIChatObjectToolPharoExecutor',
	#superclass : 'LLMAPIChatObjectTool',
	#category : 'LLM-API-Example',
	#package : 'LLM-API-Example'
}

{ #category : 'execution' }
LLMAPIChatObjectToolPharoExecutor >> executeWithArguments: arguments [
	"Implement this if you want to extend tools and use its default mecanism"

	(arguments isNil or: [ arguments isEmpty ]) ifTrue: [
		^ 'please provide the code to be executed' ].
	^ [ SmalltalkImage current compiler evaluate: arguments first value ]
		  on: Exception
		  do: [ :exce | exce message ]
]

{ #category : 'initialization' }
LLMAPIChatObjectToolPharoExecutor >> initialize [

	super initialize.
	description := 'I execute Pharo/SmallTalk code and return the result'.
	name := 'Pharo Code Executor'
]
