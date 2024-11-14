Class {
	#name : #LLMAPI,
	#superclass : #Object,
	#instVars : [
		'host',
		'port',
		'client',
		'apiKey'
	],
	#category : #'LLM-API'
}

{ #category : #'as yet unclassified' }
LLMAPI class >> chat [

	^ LLMAPIChat new
]

{ #category : #accessing }
LLMAPI >> apiKey [

	^ apiKey
]

{ #category : #accessing }
LLMAPI >> apiKey: anObject [

	apiKey := anObject
]

{ #category : #accessing }
LLMAPI >> client [

	^ client
]

{ #category : #accessing }
LLMAPI >> client: anObject [

	client := anObject
]

{ #category : #accessing }
LLMAPI >> host [

	^ host
]

{ #category : #accessing }
LLMAPI >> host: anObject [

	host := anObject
]

{ #category : #accessing }
LLMAPI >> initialize [

	super initialize.
	client := ZnClient new
]

{ #category : #accessing }
LLMAPI >> path [

	self subclassResponsibility
]

{ #category : #accessing }
LLMAPI >> performRequest [
	self subclassResponsibility
]

{ #category : #accessing }
LLMAPI >> port [

	^ port
]

{ #category : #accessing }
LLMAPI >> port: anObject [

	port := anObject
]

{ #category : #accessing }
LLMAPI >> prepareRequest [

	self apiKey ifNotNil: [ :_apiKey |
		client setBearerAuthentication: _apiKey ].
	client forJsonREST.
	client https.
	client host: self host.
	client path: self path
]
