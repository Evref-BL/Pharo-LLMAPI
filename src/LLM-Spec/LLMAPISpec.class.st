"
Represents a GUI presenter for a chat application.

•	open: Opens a new instance of the chat presenter.
•	defaultLayout: Defines the vertical layout for the chat including toolbar and notebook.
•	initialExtent: Calculates the initial size of the window based on font size and row height.
•	initializePresenters: Initializes the components like the notebook and toolbar.
•	title: Provides the title for the chat window.
"
Class {
	#name : 'LLMAPISpec',
	#superclass : 'SpPresenter',
	#instVars : [
		'toolbar',
		'notebook'
	],
	#category : 'LLM-Spec',
	#package : 'LLM-Spec'
}

{ #category : 'examples' }
LLMAPISpec class >> open [
	<example>
	
	^ self new open
]

{ #category : 'layout' }
LLMAPISpec >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: toolbar expand: false;
		  add: notebook;
		  yourself
]

{ #category : 'specs' }
LLMAPISpec >> initialExtent [

	| fontWidth rowHeight |
	fontWidth := (StandardFonts defaultFont widthOfString: 'M').
	rowHeight := self class inputTextHeight.

	^ (40@25) * (fontWidth @ rowHeight)
	
]

{ #category : 'initialization' }
LLMAPISpec >> initializePresenters [

	notebook := self newNotebook.
	toolbar := self newMenuBar.
	notebook addPage: (SpNotebookPage
			 title: 'Chat'
			 icon: (self iconNamed: #announcement)
			 provider: [ LLMAPISpecChat new ])
]

{ #category : 'specs' }
LLMAPISpec >> title [
	
	^ 'LLM Chat'
]
