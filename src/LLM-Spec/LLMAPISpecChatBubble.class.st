"
Visual presentation for individual chat messages as bubbles.

•	from: Factory method to create a chat bubble from a message.
•	defaultLayout: Arranges the content within the bubble.
•	initializePresenters: Sets up the text display inside the bubble.
"
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
		  add: self model role expand: false;
		  "add: roleText expand: false;"add: contentArea
		  withConstraints: [ :constraints | 
			constraints height: (self class inputTextHeight) * 4 ];
		  yourself
]

{ #category : 'initialization' }
LLMAPISpecChatBubble >> initializePresenters [
	"roleText := self newText .
	roleText text: self model role.
	roleText editable: false."

	contentArea := MicrodownPresenter new.
	contentArea document: (Microdown parse: self model content)
]
