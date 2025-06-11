"
A LLMAPIChatTest is a test class for testing the behavior of LLMAPIChat
"
Class {
	#name : 'LLMAPIChatTest',
	#superclass : 'TestCase',
	#instVars : [
		'api'
	],
	#category : 'LLM-API-Tests',
	#package : 'LLM-API-Tests'
}

{ #category : 'running' }
LLMAPIChatTest >> setUp [

	super setUp.

	api := LLMAPI chat
]

{ #category : 'running' }
LLMAPIChatTest >> testCheckModelExist [
	api payload model: nil.
	self should: [ api performRequest ] raise: LLMPayloadNoModelError
]

{ #category : 'running' }
LLMAPIChatTest >> testCorrectInstance [

	self assert: api class equals: LLMAPIChat
]
