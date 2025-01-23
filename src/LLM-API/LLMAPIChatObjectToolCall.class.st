Class {
	#name : 'LLMAPIChatObjectToolCall',
	#superclass : 'LLMAPIObject',
	#instVars : [
		'id',
		'type',
		'function',
		'index'
	],
	#category : 'LLM-API',
	#package : 'LLM-API'
}

{ #category : 'instance creation' }
LLMAPIChatObjectToolCall class >> fromToolCall: aToolCall [

	^ self new
		  id: aToolCall id;
		  index: aToolCall index;
		  type: 'function';
		  function: {
				  (#name -> aToolCall function name).
				  (#arguments -> aToolCall function arguments) } asDictionary;
		  yourself
]

{ #category : 'accessing' }
LLMAPIChatObjectToolCall >> asJsonableObject [

	| dic |
	dic := Dictionary new.
	dic at: #id put: self id.
	dic at: #index put: self index.
	dic at: #type put: self type.
	dic at: #function put: self function.

	^ dic
]

{ #category : 'accessing' }
LLMAPIChatObjectToolCall >> function [

	^ function
]

{ #category : 'accessing' }
LLMAPIChatObjectToolCall >> function: anObject [

	function := anObject
]

{ #category : 'accessing' }
LLMAPIChatObjectToolCall >> id [

	^ id
]

{ #category : 'accessing' }
LLMAPIChatObjectToolCall >> id: anObject [

	id := anObject
]

{ #category : 'accessing' }
LLMAPIChatObjectToolCall >> index [

	^ index
]

{ #category : 'accessing' }
LLMAPIChatObjectToolCall >> index: anObject [

	index := anObject
]

{ #category : 'accessing' }
LLMAPIChatObjectToolCall >> type [

	^ type
]

{ #category : 'accessing' }
LLMAPIChatObjectToolCall >> type: anObject [

	type := anObject
]
