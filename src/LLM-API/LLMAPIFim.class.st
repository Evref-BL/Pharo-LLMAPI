Class {
	#name : #LLMAPIFim,
	#superclass : #LLMAPI,
	#category : #'LLM-API'
}

{ #category : #accessing }
LLMAPIFim >> path [
	^ 'v1/fim/completions'
]

{ #category : #accessing }
LLMAPIFim >> payloadClass [

	^ LLMAPIFimObjectPayload
]

{ #category : #accessing }
LLMAPIFim >> performRequest [

	self prepareRequest.
	self client entity: (ZnEntity json:
			 (NeoJSONWriter toString: self content asJsonableObject)).
	^ self client post
]