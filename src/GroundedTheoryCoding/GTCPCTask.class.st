Class {
	#name : #GTCPCTask,
	#superclass : #Object,
	#instVars : [
		'words'
	],
	#category : #'GroundedTheoryCoding-ProgramComprehensionTasks'
}

{ #category : #'instance creation' }
GTCPCTask >> fromString: aString [
	words addAll: aString trimBoth substrings
]

{ #category : #initialization }
GTCPCTask >> initialize [
	super initialize.
	words := OrderedCollection new
]

{ #category : #accessing }
GTCPCTask >> words [
	^ words
]

{ #category : #'as yet unclassified' }
GTCPCTask >> wordsAsString [
	^ ' ' join: words
]
