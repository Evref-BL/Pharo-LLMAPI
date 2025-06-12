"
Adapting the API for gemini AI
"
Class {
	#name : 'LLMAPIChatGemini',
	#superclass : 'LLMAPIChat',
	#category : 'LLM-API',
	#package : 'LLM-API'
}

{ #category : 'accessing' }
LLMAPIChatGemini >> path [

	^ 'v1beta/openai/chat/completions'
]
