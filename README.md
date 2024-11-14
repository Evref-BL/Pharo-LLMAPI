# Pharo LLM API

## Installation

```st
Metacello new
  githubUser: 'Evref-BL' project: 'Pharo-LLMAPI' commitish: 'main' path: 'src';
  baseline: 'LLMAPI';
  load
```


## Example

```st
api := LLMAPI chat.
api host: 'api.mistral.ai'.
api apiKey: '<apikey>'.

api content: (LLMAPIChatObjectPayload new
	temperature: 1.5;
	model: 'mistral-small-latest';
	top_p: 1;
	max_tokens: 250;
	messages: {
		LLMAPIChatObjectMessage role: 'system' content: 'You are a usefull assistant'.
		LLMAPIChatObjectMessage role: 'user' content: 'How to write hello world in Pharo?'.
		 };
	yourself
	).

api performRequest
```
