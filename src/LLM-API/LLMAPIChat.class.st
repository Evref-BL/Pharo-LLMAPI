Class {
	#name : 'LLMAPIChat',
	#superclass : 'LLMAPI',
	#category : 'LLM-API',
	#package : 'LLM-API'
}

{ #category : 'accessing' }
LLMAPIChat >> path [
	^ 'v1/chat/completions'
]

{ #category : 'accessing' }
LLMAPIChat >> payloadClass [

	^ LLMAPIChatObjectPayload
]

{ #category : 'accessing' }
LLMAPIChat >> performRequest [

	self prepareRequest.
	self client entity: (ZnEntity json:
			 (NeoJSONWriter toString: self content asJsonableObject)).
	^ self client post
]
