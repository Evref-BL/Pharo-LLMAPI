Class {
	#name : 'LLMAPIFimTest',
	#superclass : 'TestCase',
	#instVars : [
		'api'
	],
	#category : 'LLM-API-Tests',
	#package : 'LLM-API-Tests'
}

{ #category : 'running' }
LLMAPIFimTest >> setUp [

	super setUp.

	api := LLMAPI fim
]

{ #category : 'running' }
LLMAPIFimTest >> testCorrectInstance [

	self assert: api class equals: LLMAPIFim
]
