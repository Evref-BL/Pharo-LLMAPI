Class {
	#name : 'LLMAPISpecTests',
	#superclass : 'TestCase',
	#instVars : [
		'presenter'
	],
	#category : 'LLM-Spec-Tests',
	#package : 'LLM-Spec-Tests'
}

{ #category : 'running' }
LLMAPISpecTests >> setUp [

   super setUp.
   presenter := LLMAPISpec new.
]

{ #category : 'running' }
LLMAPISpecTests >> tearDown [ 

    presenter window ifNotNil: [ :w | w close ].
    super tearDown
]

{ #category : 'running' }
LLMAPISpecTests >> testAddNewChat [ 

    presenter open.
    self assert: presenter notebook pages size equals: 1.

    presenter addNewChat.
    self assert: presenter notebook pages size equals: 2.
    self assert: presenter notebook selectedPage title equals: 'New Chat'
]
