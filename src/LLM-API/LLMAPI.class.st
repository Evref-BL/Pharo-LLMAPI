Class {
	#name : 'LLMAPI',
	#superclass : 'Object',
	#instVars : [
		'host',
		'port',
		'client',
		'content',
		'apiKey',
		'https'
	],
	#classInstVars : [
		'apiKey',
		'host',
		'port',
		'https'
	],
	#category : 'LLM-API',
	#package : 'LLM-API'
}

{ #category : 'accessing' }
LLMAPI class >> apiKey [

	^ apiKey
]

{ #category : 'accessing' }
LLMAPI class >> apiKey: anObject [

	apiKey := anObject
]

{ #category : 'as yet unclassified' }
LLMAPI class >> chat [

	^ LLMAPIChat new
]

{ #category : 'as yet unclassified' }
LLMAPI class >> fim [

	^ LLMAPIFim new
]

{ #category : 'accessing' }
LLMAPI class >> host [

	^ host
]

{ #category : 'accessing' }
LLMAPI class >> host: anObject [

	host := anObject
]

{ #category : 'accessing' }
LLMAPI class >> https [

	^ https
]

{ #category : 'accessing' }
LLMAPI class >> https: aBoolean [

	https := aBoolean
]

{ #category : 'as yet unclassified' }
LLMAPI class >> llmSettingOn: aBuilder [

	<systemsettings>
	(aBuilder group: #LLMAPI)
		parent: #tools;
		name: self settingName;
		with: [
				(aBuilder setting: #apiKey)
					order: -100000;
					label: 'LLM API Key';
					target: self;
					default: '';
					ghostHelp: 'My key'.
				(aBuilder setting: #host)
					order: 0;
					label: 'LLM host';
					target: self;
					default: 'api.mistral.ai';
					ghostHelp: 'api.mistral.ai'.
				(aBuilder setting: #port)
					order: 0;
					label: 'LLM port';
					target: self;
					default: 443;
					ghostHelp: '443'.
				(aBuilder setting: #https)
					order: 0;
					label: 'LLM host uses ssl (https)';
					target: self;
					default: true ]
]

{ #category : 'accessing' }
LLMAPI class >> port [

	^ port
]

{ #category : 'accessing' }
LLMAPI class >> port: aPortNumber [

	port := aPortNumber
]

{ #category : 'as yet unclassified' }
LLMAPI class >> settingName [

	^ 'LLM API'
]

{ #category : 'accessing' }
LLMAPI >> apiKey [

	^ apiKey
]

{ #category : 'accessing' }
LLMAPI >> apiKey: anObject [

	apiKey := anObject
]

{ #category : 'accessing' }
LLMAPI >> client [

	^ client
]

{ #category : 'accessing' }
LLMAPI >> client: anObject [

	client := anObject
]

{ #category : 'accessing' }
LLMAPI >> content [

	^ content
]

{ #category : 'accessing' }
LLMAPI >> content: anObject [

	content := anObject
]

{ #category : 'accessing' }
LLMAPI >> host [

	^ host
]

{ #category : 'accessing' }
LLMAPI >> host: anObject [

	host := anObject
]

{ #category : 'accessing' }
LLMAPI >> https [

	^ https
]

{ #category : 'accessing' }
LLMAPI >> https: aBoolean [

	https := aBoolean
]

{ #category : 'initialization' }
LLMAPI >> initialize [

	super initialize.
	client := ZnClient new.
	self apiKey: LLMAPI apiKey.
	self host: LLMAPI host.
	self port: LLMAPI port.
	self https: LLMAPI https.
	
]

{ #category : 'accessing' }
LLMAPI >> path [

	self subclassResponsibility
]

{ #category : 'accessing' }
LLMAPI >> payload [
	"return the content or a new class for this type of API"

	^ self content ifNil: [
		  self content: self payloadClass new.
		  self content ]
]

{ #category : 'accessing' }
LLMAPI >> payloadClass [
	"return the class of the main  LLMAPIObject that one should use with this API. This API helps to prevent some bugs or usage issue"

	^ self subclassResponsibility
]

{ #category : 'api' }
LLMAPI >> performRequest [
	self subclassResponsibility
]

{ #category : 'accessing' }
LLMAPI >> port [

	^ port
]

{ #category : 'accessing' }
LLMAPI >> port: anObject [

	port := anObject
]

{ #category : 'accessing' }
LLMAPI >> prepareRequest [
	"check some properties"

	(self payload model isNil or: [ self payload model isEmpty ])
		ifTrue: [ LLMPayloadNoModelError signal ].
	"Prepare request"
	self apiKey ifNotNil: [ :_apiKey |
		client setBearerAuthentication: _apiKey ].
	client forJsonREST.
	(self https isNil or: [ self https ])
		ifTrue: [ client https ]
		ifFalse: [ client http ].
	client host: self host.
	client port: self port.
	client path: self path
]
