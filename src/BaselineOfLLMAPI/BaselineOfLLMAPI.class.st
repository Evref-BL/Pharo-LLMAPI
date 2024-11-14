Class {
	#name : #BaselineOfLLMAPI,
	#superclass : #BaselineOf,
	#category : #BaselineOfLLMAPI
}

{ #category : #baselines }
BaselineOfLLMAPI >> baseline: spec [

	<baseline>
	spec for: #common do: [
		self defineDependencies: spec.
		self definePackages: spec.
		self defineGroups: spec ]
]

{ #category : #baselines }
BaselineOfLLMAPI >> defineDependencies: spec [

	spec
		baseline: 'NeoJSON'
		with: [ spec repository: 'github://svenvc/NeoJSON/repository' ]
]

{ #category : #baselines }
BaselineOfLLMAPI >> defineGroups: spec [
]

{ #category : #baselines }
BaselineOfLLMAPI >> definePackages: spec [

	spec package: 'LLM-API' with: [ spec requires: #( 'NeoJSON' ) ]
]
