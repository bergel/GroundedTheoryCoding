Class {
	#name : #GTCModel,
	#superclass : #Object,
	#instVars : [
		'participants',
		'concepts',
		'conceptCategories'
	],
	#category : #'GroundedTheoryCoding-Core'
}

{ #category : #adding }
GTCModel >> addParticipant: aParticipant [
	participants add: aParticipant 
]

{ #category : #accessing }
GTCModel >> concepts [
	^ concepts
]

{ #category : #initialization }
GTCModel >> initialize [
	super initialize.
	
	participants := OrderedCollection new.
	concepts := OrderedCollection new.
	conceptCategories := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
GTCModel >> numberOfParticipants [
	^ participants size
]
