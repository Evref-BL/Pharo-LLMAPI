"
A tool that can be called by LLM. 

When called, it uses `symbol` and `receiver` to perform the call with the parameters
"
Class {
	#name : 'LLMAPIChatObjectTool',
	#superclass : 'LLMAPIObject',
	#instVars : [
		'name',
		'description',
		'strict',
		'parameters',
		'receiver',
		'symbol'
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

{ #category : 'as yet unclassified' }
LLMAPIChatObjectTool class >> name: aName description: aDescription receiver: aReceiver symbol: anotherSymbol [

	^ self new
		  name: aName;
		  description: aDescription;
		  receiver: aReceiver;
		  symbol: anotherSymbol;
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
LLMAPIChatObjectTool >> executeWithArguments: arguments [
	"Implement this if you want to extend tools and use its default mecanism"

	^ self receiver perform: self symbol withArguments: arguments
]

{ #category : 'initialization' }
LLMAPIChatObjectTool >> initialize [

	receiver := self.
	symbol := #execute
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
LLMAPIChatObjectTool >> receiver [

	^ receiver
]

{ #category : 'accessing' }
LLMAPIChatObjectTool >> receiver: anObject [

	receiver := anObject
]

{ #category : 'accessing' }
LLMAPIChatObjectTool >> strict [

	^ strict
]

{ #category : 'accessing' }
LLMAPIChatObjectTool >> strict: anObject [

	strict := anObject
]

{ #category : 'accessing' }
LLMAPIChatObjectTool >> symbol [

	^ symbol
]

{ #category : 'accessing' }
LLMAPIChatObjectTool >> symbol: anObject [

	symbol := anObject
]
