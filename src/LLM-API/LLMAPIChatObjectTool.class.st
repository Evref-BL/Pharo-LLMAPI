Class {
	#name : 'LLMAPIChatObjectTool',
	#superclass : 'LLMAPIObject',
	#instVars : [
		'name',
		'description',
		'strict',
		'parameters'
	],
	#category : 'LLM-API',
	#package : 'LLM-API'
}

{ #category : 'as yet unclassified' }
LLMAPIChatObjectTool class >> name: aName description: aDescription [

	^ self new
		  name: aName;
		  description: aDescription;
		  yourself
]

{ #category : 'converting' }
LLMAPIChatObjectTool >> asJsonableObject [

	| dic function |
	dic := Dictionary new.
	dic at: #type put: 'function'.
	function := Dictionary new.
	function at: #name put: self name.
	function at: #description put: self description.
	function at: #strict put: false.
	function at: #parameters put: {  } asDictionary.
	dic at: #function put: function.
	^ dic
]

{ #category : 'accessing' }
LLMAPIChatObjectTool >> description [

	^ description
]

{ #category : 'accessing' }
LLMAPIChatObjectTool >> description: anObject [

	description := anObject
]

{ #category : 'accessing' }
LLMAPIChatObjectTool >> name [

	^ name
]

{ #category : 'accessing' }
LLMAPIChatObjectTool >> name: anObject [

	name := anObject
]

{ #category : 'accessing' }
LLMAPIChatObjectTool >> parameters [

	^ parameters
]

{ #category : 'accessing' }
LLMAPIChatObjectTool >> parameters: anObject [

	parameters := anObject
]

{ #category : 'accessing' }
LLMAPIChatObjectTool >> strict [

	^ strict
]

{ #category : 'accessing' }
LLMAPIChatObjectTool >> strict: anObject [

	strict := anObject
]
