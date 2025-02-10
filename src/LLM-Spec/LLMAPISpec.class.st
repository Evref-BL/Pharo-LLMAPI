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
LLMAPISpec >> addNewChat [

    | newPage |
    newPage := SpNotebookPage
        title: 'New Chat'
        icon: (self iconNamed: #announcement)
        provider: [ LLMAPISpecChat new ].
    notebook addPage: newPage.
    notebook selectPage: newPage
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
    toolbar := self newToolbar.
    
    toolbar add: (SpToolbarButtonPresenter new
        label: 'New Chat';
        icon: (self iconNamed: #add);
        help: 'Create a new chat';
        action: [ self addNewChat ];
        yourself).

    notebook addPage: (SpNotebookPage
        title: 'Chat'
        icon: (self iconNamed: #announcement)
        provider: [ LLMAPISpecChat new ])
]

{ #category : 'accessing' }
LLMAPISpec >> notebook [

	^ notebook
]

{ #category : 'accessing' }
LLMAPISpec >> notebook: anObject [

	notebook := anObject
]

{ #category : 'specs' }
LLMAPISpec >> title [
	
	^ 'LLM Chat'
]

{ #category : 'accessing' }
LLMAPISpec >> toolbar [

	^ toolbar
]

{ #category : 'accessing' }
LLMAPISpec >> toolbar: anObject [

	toolbar := anObject
]
