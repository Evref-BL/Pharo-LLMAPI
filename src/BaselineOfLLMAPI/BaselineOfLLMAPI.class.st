Class {
	#name : 'BaselineOfLLMAPI',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfLLMAPI',
	#package : 'BaselineOfLLMAPI'
}

{ #category : 'baselines' }
BaselineOfLLMAPI >> baseline: spec [

	<baseline>
	spec for: #common do: [
		self defineDependencies: spec.
		self definePackages: spec.
		self defineGroups: spec ]
]

{ #category : 'baselines' }
BaselineOfLLMAPI >> defineDependencies: spec [

	spec
		baseline: 'NeoJSON'
		with: [ spec repository: 'github://svenvc/NeoJSON/repository' ].

	spec
		baseline: 'Mocketry'
		with: [ spec repository: 'github://dionisiydk/Mocketry' ]
]

{ #category : 'baselines' }
BaselineOfLLMAPI >> defineGroups: spec [
]

{ #category : 'baselines' }
BaselineOfLLMAPI >> definePackages: spec [

	spec package: 'LLM-API' with: [ spec requires: #( 'NeoJSON' ) ].
	spec package: 'LLM-API-Tests' with: [ spec requires: #( 'LLM-API' 'Mocketry' ) ].
	spec package: 'LLM-API-Example' with: [ spec requires: #( 'LLM-API' ) ].
	spec package: 'LLM-Spec' with: [ spec requires: #( 'LLM-API' ) ].
	spec package: 'LLM-Spec-Tests' with: [ spec requires: #( 'LLM-Spec' ) ]
]
