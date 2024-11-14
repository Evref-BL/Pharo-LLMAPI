Class {
	#name : #LLMAPIChat,
	#superclass : #LLMAPI,
	#instVars : [
		'content'
	],
	#category : #'LLM-API'
}

{ #category : #accessing }
LLMAPIChat >> content [

	^ content
]

{ #category : #accessing }
LLMAPIChat >> content: anObject [

	content := anObject
]

{ #category : #accessing }
LLMAPIChat >> path [
	^ 'v1/chat/completions'
]

{ #category : #accessing }
LLMAPIChat >> performRequest [

	self prepareRequest.
	self client entity: (ZnEntity json:
			 (NeoJSONWriter toString: self content asJsonableObject)).
	^ self client post
]
