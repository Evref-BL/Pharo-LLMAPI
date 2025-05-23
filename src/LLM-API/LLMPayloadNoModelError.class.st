Class {
	#name : 'LLMPayloadNoModelError',
	#superclass : 'Error',
	#category : 'LLM-API',
	#package : 'LLM-API'
}

{ #category : 'default' }
LLMPayloadNoModelError >> defaultDescription [
	"Return a textual description of the exception."

	^ 'No model set in the payload. Add a model before calling the API.'
]
