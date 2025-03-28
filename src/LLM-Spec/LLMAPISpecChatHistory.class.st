"
Maintains and displays the history of chat messages.

•	from:: Factory method to create a history panel from a collection of messages.
•	addMessage:: Adds a message to the history and updates the display.
•	defaultLayout: Defines the scrolling layout for the history.
•	initializePresenters: Initializes the panel that will hold the chat bubbles.
"
Class {
	#name : 'LLMAPISpecChatHistory',
	#superclass : 'SpPresenterWithModel',
	#instVars : [
		'panel'
	],
	#category : 'LLM-Spec',
	#package : 'LLM-Spec'
}

{ #category : 'instance creation' }
LLMAPISpecChatHistory class >> from: messages [

	^ self basicNew
		setModelBeforeInitialization: messages;
		initialize;
		yourself
]

{ #category : 'initialization' }
LLMAPISpecChatHistory >> addMessage: aMessage [

	self model add: aMessage.
	aMessage role = 'system' ifFalse: [
		panel add: (LLMAPISpecChatBubble from: aMessage) ]
]

{ #category : 'layout' }
LLMAPISpecChatHistory >> defaultLayout [

	^ SpScrollableLayout with: panel
]

{ #category : 'initialization' }
LLMAPISpecChatHistory >> initializePresenters [

	panel := SpBoxLayout newTopToBottom.

	self model do: [ :message |
		message role = 'system' ifFalse: [
			panel add: (LLMAPISpecChatBubble from: message) expand: true ] ]
]
