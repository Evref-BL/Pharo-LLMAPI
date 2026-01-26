Class {
	#name : 'LLMAPIChatObjectResponseFormat',
	#superclass : 'LLMAPIObject',
	#instVars : [
		'type',
		'jsonSchema'
	],
	#category : 'LLM-API',
	#package : 'LLM-API'
}

{ #category : 'converting' }
LLMAPIChatObjectResponseFormat >> asJsonableObject [

	| dic |
	dic := Dictionary new
		       at: #type put: self type;
		       yourself.

	self type = #json_schema ifTrue: [
		self jsonSchema ifNil: [
			Error signal:
				'jsonSchema variable cannot be nil with type json_schema' ].
		dic at: #json_schema put: self jsonSchema ].

	^ dic
]

{ #category : 'accessing' }
LLMAPIChatObjectResponseFormat >> jsonSchema [

	^ jsonSchema
]

{ #category : 'accessing' }
LLMAPIChatObjectResponseFormat >> jsonSchema: anObject [

	jsonSchema := anObject
]

{ #category : 'accessing' }
LLMAPIChatObjectResponseFormat >> type [

	^ type
]

{ #category : 'accessing' }
LLMAPIChatObjectResponseFormat >> type: anObject [

	type := anObject
]
