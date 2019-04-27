Class {
	#name : #GTCConcept,
	#superclass : #Object,
	#instVars : [
		'conceptName',
		'words',
		'participants',
		'model',
		'color'
	],
	#category : #'GroundedTheoryCoding-Core'
}

{ #category : #adding }
GTCConcept >> addParticipantIfNotPresent: aParticipant [
	self assert: [ aParticipant class == GTCParticipant ].
	(participants includes: aParticipant) ifTrue: [ ^ self ].
	participants add: aParticipant 
]

{ #category : #adding }
GTCConcept >> addWord: aWord [
	self assert: [ aWord isKindOf: String ].
	words add: aWord.

]

{ #category : #accessing }
GTCConcept >> color [
	^ color
]

{ #category : #accessing }
GTCConcept >> color: anObject [
	color := anObject
]

{ #category : #accessing }
GTCConcept >> conceptName [
	^ conceptName
]

{ #category : #accessing }
GTCConcept >> conceptName: anObject [
	conceptName := anObject
]

{ #category : #'as yet unclassified' }
GTCConcept >> exportOn: str [
	str nextPutAll: 'new concept:'.
	str nextPutAll: self conceptName.
	str cr.
	
	self participants do: [ :p |
		str nextPutAll: 'concept to participant:'.
		str nextPutAll: p id.
		str cr.
	].
	self words do: [ :w |
		str nextPutAll: 'concept to word:'.
		str nextPutAll: w.
		str cr.
	]
]

{ #category : #initialization }
GTCConcept >> initialize [
	super initialize.
	conceptName := 'Unkown concept'.
	words := OrderedCollection new.
	participants := OrderedCollection new.
	color := Color random
]

{ #category : #accessing }
GTCConcept >> model [
	^ model
]

{ #category : #accessing }
GTCConcept >> model: anObject [
	model := anObject
]

{ #category : #'as yet unclassified' }
GTCConcept >> numberOfDifferentWords [
	^ words asSet size
]

{ #category : #'as yet unclassified' }
GTCConcept >> numberOfParticipants [
	^ participants size
]

{ #category : #accessing }
GTCConcept >> participants [
	^ participants
]

{ #category : #accessing }
GTCConcept >> participants: anObject [
	participants := anObject
]

{ #category : #printing }
GTCConcept >> printOn: str [
	super printOn: str.
	str nextPut: $<.
	str nextPutAll: conceptName.
	str nextPut: $>
]

{ #category : #accessing }
GTCConcept >> words [
	^ words
]

{ #category : #accessing }
GTCConcept >> words: anObject [
	words := anObject
]
