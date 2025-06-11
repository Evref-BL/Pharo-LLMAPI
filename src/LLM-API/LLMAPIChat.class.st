"
# Example with ollama

```st
api := LLMAPI chat.
api host: '127.0.0.1'.
api port: 11434.
api apiKey: nil.

api payload
	temperature: 0.5;
	model: 'devstral';
	top_p: 1;
	max_tokens: 250;
	messages: {
		LLMAPIChatObjectMessage role: 'system' content: 'You are a usefull assistant'.
		LLMAPIChatObjectMessage role: 'user' content: 'How to write hello world in Pharo?'.
		 }.

result := api performRequest.
```
"
Class {
	#name : 'LLMAPIChat',
	#superclass : 'LLMAPI',
	#classInstVars : [
		'chatModel'
	],
	#category : 'LLM-API',
	#package : 'LLM-API'
}

{ #category : 'accessing' }
LLMAPIChat class >> chatModel [

	^ chatModel
]

{ #category : 'accessing' }
LLMAPIChat class >> chatModel: anObject [

	chatModel := anObject
]

{ #category : 'as yet unclassified' }
LLMAPIChat class >> llmSettingOn: aBuilder [

	<systemsettings>
	(aBuilder group: #LLMChat)
		parent: super settingName;
		name: 'LLM Chat';
		with: [
				(aBuilder setting: #chatModel)
					order: 0;
					label: 'LLM Chat default model';
					target: self;
					default: 'devstral:latest';
					ghostHelp: 'devstral:latest' ]
]

{ #category : 'initialization' }
LLMAPIChat >> initialize [

	super initialize.
	self payload model: self class chatModel
]

{ #category : 'accessing' }
LLMAPIChat >> path [
	^ 'v1/chat/completions'
]

{ #category : 'accessing' }
LLMAPIChat >> payloadClass [

	^ LLMAPIChatObjectPayload
]

{ #category : 'api' }
LLMAPIChat >> performRequest [

	| intermediateResult |
	self prepareRequest.
	self client entity: (ZnEntity json:
			 (NeoJSONWriter toString: self content asJsonableObject)).
	intermediateResult := self client post.
	^ self processIntermediateResult: intermediateResult
]

{ #category : 'accessing' }
LLMAPIChat >> processIntermediateResult: intermediateResult [

	| message messages |
	message := intermediateResult choices anyOne message.
	messages := self payload messages asOrderedCollection.
	messages addLast: (LLMAPIChatObjectMessage fromMessage: message).
	message at: #tool_calls ifPresent: [ :tool_calls |
		tool_calls ifNotNil: [
			tool_calls do: [ :tool_call |
				| tool answer |
				tool := self payload tools detect: [ :t |
					        t name = tool_call function name ].
				answer := tool executeWithArguments:
					          (NeoJSONReader fromString: tool_call function arguments)
						          asArray.
				messages addLast:
					((LLMAPIChatObjectMessage role: 'tool' content: answer asString)
						 name: tool name;
						 tool_call_id: tool_call id;
						 yourself).
				self payload messages: messages asArray ].
			^ self performRequest ] ].
	^ message content
]
