Class {
	#name : #GTCProgramComprehensionModel,
	#superclass : #GTCModel,
	#instVars : [
		'articles'
	],
	#category : #'GroundedTheoryCoding-ProgramComprehensionTasks'
}

{ #category : #accessing }
GTCProgramComprehensionModel >> articles [
	^ articles
]

{ #category : #'as yet unclassified' }
GTCProgramComprehensionModel >> data [
	^ '# Using Information Fragments to Answer the Questions Developers Ask
Who is working on what? 
What are they [coworkers] working on right now? 
How much work [have] people done? 
Who changed this [code], focused on person? 
Who to assign a code review to? / Who has the knowledge to do the code review? 
What have people been working on?
Which code reviews have been assigned to which person?
What is the evolution of the code?
Why were they [these changes] introduced?
Who made a particular change and why?
What classes has my team been working on?
What are the changes on newly resolved work items related to me?
Who is working on the same classes as I am and for which work item?
What has changed between two builds [and] who has changed it?
Who has made changes to my classes?
Who is using that API [that I am about to change]?
Who created the API [that I am about to change]?
Who owns this piece of code? / Who modified it the latest?
Who owns this piece of code? / Who modified it most?
Who to talk to if you have to work with packages you haven’t worked with?
What classes have been changed?
[Which] API has changed (to see which methods are not supported any more)?
What’s the most popular class? [Which class has been changed most?]
Which other code that I worked on uses this code pattern / utility function?
Which code has recently changed that is related to me?
How do recently delivered changes affect changes that I am working on?
What code is related to a change?
What is the recent activity on a plan item?
Which features and functions have been changing?
Has progress been made on blockers (blocking work items) in your milestone?
Is progress (changes) being made on plan items?
What caused this build to break? (Which change caused the stack trace?)
Who caused this build to break? (Who owns the broken tests?)
Who changed the test case most recently that caused the build to fail?
Which changes caused the tests to fail and thus the build to break?
Who owns a test case? (Who resolved the last work item that fixed the test case?)
How do test cases relate to packages/classes?
Which API has changed (check on web site)?
[Is an entry] in newsgroup forum addressed to me because of the class mentioned?
What is coming up next week [for my team]? [What is my team doing?]
What am I supposed to work on [plan on wiki]?
How is the team organized?
Who has made changes to [a] defect?
Who has made comments in defect?
[What is] the collaboration tree around a feature?
Which conversations in work items have I been mentioned?
----
#Information Needs in Collocated Software Development Teams
What data structures or functions can be used to  implement this behavior?
How do I use this data structure of function? 
How can I coordinate this code with this other data structure or function? 
Did I make any mistakes in my new code? 
Did I follow my team’s conventions? 
Which changes are part of this submission? 
Is this a legitimate problem? 
How difficult will this problem be to fix? 
Is the problem worth fixing? 
What does the failure look like? 
In what situations does this failure occur? 
What code could have caused this behavior? 
What’s statically related to this code? 
What code caused this program state? 
What is the purpose of this code? 
What is the program supposed to do?  
Why was this code implemented this way?  
What are the implications of this change? 
How have resources I depend on changed? 
What have my coworkers been doing? 
What information was relevant to my task? 
----
#Questions Programmers Ask During Software Evolution Tasks
Which type represents this domain concept or this UI element or action?
Where in the code is the text in this error message or UI element?
Where is there any code involved in the implementation of this behavior?
Is there a precedent or exemplar for this?
Is there an entity named something like this in that unit (for example in a project, package or class)?
What are the parts of this type?
Which types is this type a part of?
Where does this type fit in the type hierarchy?
Does this type have any siblings in the type hierarchy?
Where is this field declared in the type hierarchy?
Who implements this interface or these abstract methods?
Where is this method called or type referenced?
When during the execution is this method called?
Where are instances of this class created?
Where is this variable or data structure being accessed?
What data can we access from this object?
What does the declaration or definition of this look like?
What are the arguments to this function?
What are the values of these arguments at runtime?
What data is being modified in this code?
How are instances of these types created and assembled?
How are these types or objects related? (whole-part)
How is this feature or concern (object ownership, UI control, etc) implemented?
What in this structure distinguishes these cases?
What is the behavior these types provide together and how is it distributed over the types?
What is the “correct” way to use or access this data structure?
How does this data structure look at runtime?
How can data be passed to (or accessed at) this point in the code?
How is control getting (from here to) here?
Why isn’t control reaching this point in the code?
Which execution path is being taken in this case?
Under what circumstances is this method called or exception thrown?
What parts of this data structure are accessed in this code?
How does the system behavior vary over these types or cases?
What are the differences between these files or types?
What is the difference between these similar parts of the code (e.g., between sets of methods)?
What is the mapping between these UI types and these model types?
Where should this branch be inserted or how should this case be handled?
Where in the UI should this functionality be added?
To move this feature into this code what else needs to be moved?
How can we know this object has been created and initialized correctly?
What will be (or has been) the direct impact of this change?
What will be the total impact of this change?
Will this completely solve the problem or provide the enhancement?
'
]

{ #category : #example }
GTCProgramComprehensionModel >> example [
	<script: 'self new example inspect'>
	^ self importFromText: self data
]

{ #category : #visualization }
GTCProgramComprehensionModel >> gtInspectorViewIn: composite [
	<gtInspectorPresentationOrder: -10>
	composite roassal3
		title: 'MainView';
		initializeCanvas: [ self visualize ]
]

{ #category : #'as yet unclassified' }
GTCProgramComprehensionModel >> importFromText: aBigString [
	| currentArticle |
	currentArticle := nil.
	aBigString lines do: [ :line |
		(line beginsWith: '#') 
		ifTrue: [ 
			currentArticle := GTCPCArticle new.
			currentArticle name: (line allButFirst trimBoth).
			articles add: currentArticle ]
		ifFalse: [ currentArticle addTaskFromString: line ]

	]
]

{ #category : #initialization }
GTCProgramComprehensionModel >> initialize [
	super initialize.
	articles := OrderedCollection new
]

{ #category : #'as yet unclassified' }
GTCProgramComprehensionModel >> numberOfArticles [
	^ articles size
]

{ #category : #visualization }
GTCProgramComprehensionModel >> visualize [
	| c g |
	c := RSCanvas new.
	c @ RSCanvasController.
	self articles do: [ :a |
		a tasks do: [ :t |
			g := RSGroup new.
			t words do: [ :w | 
				g add: (RSLabel new text: w; model: w) ].
			RSHorizontalLineLayout on: g.
			c add: g asShape.
		]
	].
	RSVerticalLineLayout on: c shapes.
	^ c
]
