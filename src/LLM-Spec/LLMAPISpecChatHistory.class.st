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
	panel
		add: (LLMAPISpecChatBubble from: aMessage)
		at: 0 @ panel children size + 1
]

{ #category : 'layout' }
LLMAPISpecChatHistory >> defaultLayout [

	^ SpScrollableLayout with: (SpBoxLayout newTopToBottom
			   add: panel;
			   yourself)
]

{ #category : 'initialization' }
LLMAPISpecChatHistory >> initializePresenters [

	panel := (SpGridLayout build: [ :builder |
			          builder beRowNotHomogeneous.
			          self model
				          do: [ :message |
					          builder add: (LLMAPISpecChatBubble from: message) ]
				          separatedBy: [ builder nextRow ] ])
		         columnSpacing: 0;
		         borderWidth: 0;
		         rowSpacing: 0;
		         beRowNotHomogeneous;
		         column: 0 expand: true;
		         yourself
]
