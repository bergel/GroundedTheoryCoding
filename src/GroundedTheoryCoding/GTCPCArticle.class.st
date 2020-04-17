Class {
	#name : #GTCPCArticle,
	#superclass : #Object,
	#instVars : [
		'tasks',
		'name'
	],
	#category : #'GroundedTheoryCoding-ProgramComprehensionTasks'
}

{ #category : #adding }
GTCPCArticle >> addTaskFromString: aString [
	tasks add: (GTCPCTask new fromString: aString)
]

{ #category : #initialization }
GTCPCArticle >> initialize [
	super initialize.
	tasks := OrderedCollection new
]

{ #category : #accessing }
GTCPCArticle >> name [
	^ name
]

{ #category : #accessing }
GTCPCArticle >> name: anObject [
	name := anObject
]

{ #category : #'as yet unclassified' }
GTCPCArticle >> numberOfTasks [
	^ tasks size
]

{ #category : #accessing }
GTCPCArticle >> tasks [
	^ tasks
]
