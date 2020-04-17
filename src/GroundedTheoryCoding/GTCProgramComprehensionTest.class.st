Class {
	#name : #GTCProgramComprehensionTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'GroundedTheoryCoding-ProgramComprehensionTasks'
}

{ #category : #running }
GTCProgramComprehensionTest >> setUp [
	model := GTCProgramComprehensionModel new.
	model importFromText: GTCProgramComprehensionModel new data
]

{ #category : #tests }
GTCProgramComprehensionTest >> testBasic [

	self assert: model numberOfArticles equals: 3.
	self assert: model articles first numberOfTasks equals: 47.
	self assert: model articles first tasks first wordsAsString equals: 'Who is working on what?'
]
