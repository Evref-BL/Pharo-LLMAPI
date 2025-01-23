Class {
	#name : 'LLMAPIChatObjectMessage',
	#superclass : 'LLMAPIObject',
	#instVars : [
		'role',
		'content',
		'tool_call_id',
		'name',
		'tool_calls'
	],
	#category : 'LLM-API',
	#package : 'LLM-API'
}

{ #category : 'instance creation' }
LLMAPIChatObjectMessage class >> fromMessage: aMessage [

	| message |
	message := self new
		           role: aMessage role;
		           content: aMessage content;
		           yourself.
	aMessage tool_calls ifNotNil: [
		message tool_calls: (aMessage tool_calls collect: [ :tool_call |
				 LLMAPIChatObjectToolCall fromToolCall: tool_call ]) asArray ].
	^ message
]

{ #category : 'as yet unclassified' }
LLMAPIChatObjectMessage class >> role: aRole content: aContent [

	^ self new
		  role: aRole;
		  content: aContent;
		  yourself
]

{ #category : 'accessing' }
LLMAPIChatObjectMessage >> asJsonableObject [

	| dic |
	dic := Dictionary new
		       at: #content put: self content;
		       at: #role put: self role;
		       yourself.
	self tool_call_id ifNotNil: [
		dic at: #tool_call_id put: self tool_call_id ].
	self name ifNotNil: [ dic at: #name put: self name ].
	self tool_calls ifNotNil: [ dic at: #tool_calls put: (self tool_calls collect: #asJsonableObject) ].
	^ dic
]

{ #category : 'accessing' }
LLMAPIChatObjectMessage >> content [

	^ content
]

{ #category : 'accessing' }
LLMAPIChatObjectMessage >> content: anObject [

	content := anObject
]

{ #category : 'accessing' }
LLMAPIChatObjectMessage >> name [

	^ name
]

{ #category : 'accessing' }
LLMAPIChatObjectMessage >> name: anObject [

	name := anObject
]

{ #category : 'accessing' }
LLMAPIChatObjectMessage >> role [

	^ role
]

{ #category : 'accessing' }
LLMAPIChatObjectMessage >> role: anObject [

	role := anObject
]

{ #category : 'accessing' }
LLMAPIChatObjectMessage >> tool_call_id [

	^ tool_call_id
]

{ #category : 'accessing' }
LLMAPIChatObjectMessage >> tool_call_id: anObject [

	tool_call_id := anObject
]

{ #category : 'accessing' }
LLMAPIChatObjectMessage >> tool_calls [

	^ tool_calls
]

{ #category : 'accessing' }
LLMAPIChatObjectMessage >> tool_calls: anObject [

	tool_calls := anObject
]
