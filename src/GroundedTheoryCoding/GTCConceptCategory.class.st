Class {
	#name : #GTCConceptCategory,
	#superclass : #Object,
	#instVars : [
		'concepts'
	],
	#category : #'GroundedTheoryCoding-Core'
}

{ #category : #adding }
GTCConceptCategory >> addConcept: aConcept [
	concepts add: aConcept 
]
