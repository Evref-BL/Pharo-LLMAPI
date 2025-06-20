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

{ #category : 'initialization' }
LLMAPISpecChatBubble >> contentArea [

	^ contentArea
]

{ #category : 'layout' }
LLMAPISpecChatBubble >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  beNotHomogeneous;
		  add: self model role expand: false;
		  add: contentArea withConstraints: [ :constraints |
				  self contentArea build.
				  constraints
					  height:
						  ((self contentArea text lineHeightsWrappingAtWidth:
								   self extent x) sum) + (self class inputTextHeight * 1.5) ];
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
