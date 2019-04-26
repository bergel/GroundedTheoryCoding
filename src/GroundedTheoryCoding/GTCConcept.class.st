Class {
	#name : #GTCConcept,
	#superclass : #Object,
	#instVars : [
		'conceptName',
		'words',
		'participants'
	],
	#category : #'GroundedTheoryCoding-Core'
}

{ #category : #initialization }
GTCConcept >> initialize [
	super initialize.
	conceptName := 'Unkown concept'.
	words := OrderedCollection new.
	participants := OrderedCollection new.
]
