"
Handles the specific chat functionalities in the application.

•	askLLM: Sends the chat input to a remote language model and processes the response.
•	defaultLayout: Sets up the layout for the chat interface including the history and input field.
•	initializePresenters: Sets up the chat interface components like the input field and submit button.
"
Class {
	#name : 'LLMAPISpecChat',
	#superclass : 'SpPresenter',
	#instVars : [
		'history',
		'inputField',
		'submitButton'
	],
	#category : 'LLM-Spec',
	#package : 'LLM-Spec'
}

{ #category : 'initialization' }
LLMAPISpecChat >> askLLM [

	| api result resultContent |
	history addMessage:
		(LLMAPIChatObjectMessage role: 'user' content: inputField text).
	api := LLMAPI chat.
	api host: 'api.mistral.ai'.
	api payload
		temperature: 0.5;
		model: 'mistral-small-latest';
		top_p: 1;
		max_tokens: 250;
		tools:
			(LLMAPIChatObjectTool allSubclasses collect: [ :clazz | clazz new ]);
		messages: history model.

	result := api performRequest.
	resultContent := result.
	history addMessage:
		(LLMAPIChatObjectMessage role: 'assistant' content: resultContent).

	inputField text: ''
]

{ #category : 'layout' }
LLMAPISpecChat >> defaultLayout [

	| submitRow |
	submitRow := SpBoxLayout newLeftToRight
		             add: inputField;
		             spacing: 5;
		             add: submitButton withConstraints: [ :constraints |
			             constraints height: 27.
			             constraints width: 70 ];
		             yourself.

	^ SpBoxLayout newTopToBottom
		  add: history;
		  spacing: 5;
		  add: submitRow expand: false;
		  yourself
]

{ #category : 'initialization' }
LLMAPISpecChat >> initializePresenters [

	submitButton := self newButton
		                label: 'Submit';
		                icon: (self iconNamed: #glamorousGo);
		                help: 'Submit prompt to LLM';
		                action: [ self askLLM ];
		                yourself.

	inputField := self newTextInput.
	inputField whenSubmitDo: [ :text | self askLLM ].
	history := LLMAPISpecChatHistory from: { (LLMAPIChatObjectMessage
			            role: 'system'
			            content: 'You are a usefull assistant') } asOrderedCollection
]
