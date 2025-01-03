Class {
	#name : 'LLMAPISpecChatBubble',
	#superclass : 'SpPresenterWithModel',
	#instVars : [
		'roleText',
		'contentArea'
	],
	#category : 'LLM-Spec',
	#package : 'LLM-Spec'
}

{ #category : 'instance creation' }
LLMAPISpecChatBubble class >> from: aMessage [

	^ self basicNew
		setModelBeforeInitialization: aMessage;
		initialize;
		yourself
]

{ #category : 'layout' }
LLMAPISpecChatBubble >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: self model role;
		  "add: roleText expand: false;"add: contentArea expand: false fill: true;
		  yourself
]

{ #category : 'initialization' }
LLMAPISpecChatBubble >> initializePresenters [

	"roleText := self newText .
	roleText text: self model role.
	roleText editable: false."
	
	contentArea  := self newText.
	contentArea beWrapWord.
	contentArea text: self model content.
	contentArea editable: false.
	
]
