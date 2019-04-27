Class {
	#name : #GTCParticipant,
	#superclass : #Object,
	#instVars : [
		'id',
		'concepts',
		'texts',
		'model'
	],
	#category : #'GroundedTheoryCoding-Core'
}

{ #category : #accessing }
GTCParticipant >> addConcept: aConcept [
	concepts add: aConcept
]

{ #category : #'as yet unclassified' }
GTCParticipant >> addConceptForWord: aWordElement participant: participant concept: newConcept [
	| aWord |
	aWord := aWordElement text.
	newConcept addParticipantIfNotPresent: participant.
	newConcept addWord: aWord.
	aWordElement color: newConcept color 
]

{ #category : #'as yet unclassified' }
GTCParticipant >> addNewConceptForWord: aWordElement participant: participant [
	| aName newConcept aWord |
	aWord := aWordElement text.
	aName := UIManager default request: 'Enter a concept name'.
	aName ifNil: [ ^ self ].
	newConcept := GTCConcept new.
	newConcept conceptName: aName.
	self model addConcept: newConcept.
	self addConceptForWord: aWordElement participant: participant concept: newConcept
]

{ #category : #adding }
GTCParticipant >> addText: textAsString [

	texts add: textAsString 
]

{ #category : #accessing }
GTCParticipant >> concepts [
	^ concepts
]

{ #category : #accessing }
GTCParticipant >> concepts: anObject [
	concepts := anObject
]

{ #category : #'as yet unclassified' }
GTCParticipant >> defineMenuOn: aWordElement [
	
	aWordElement
		@
			(RSMenuActivable new
				menuDo: [ :menu | 
					
					menu
							add: 'ADD NEW CONCEPT'
							target: self
							selector: #addNewConceptForWord:participant:
							argumentList: (Array with: aWordElement with: self).
							
					(self model concepts sorted: [ :c1 :c2 | c1 conceptName < c2 conceptName ]) do: [ :c |
						menu
							add: c conceptName
							target: self
							selector: #addConceptForWord:participant:concept:
							argumentList: (Array with: aWordElement with: self with: c)
					]
					 ])
]

{ #category : #accessing }
GTCParticipant >> id [
	^ id
]

{ #category : #accessing }
GTCParticipant >> id: anObject [
	id := anObject
]

{ #category : #initialization }
GTCParticipant >> initialize [
	super initialize.
	id := 'UNKNOWN'.
	texts := OrderedCollection new.
	concepts := OrderedCollection new
]

{ #category : #accessing }
GTCParticipant >> model [
	^ model
]

{ #category : #accessing }
GTCParticipant >> model: anObject [
	model := anObject
]

{ #category : #printing }
GTCParticipant >> printOn: str [
	str nextPutAll: '<#'.
	id ifNotEmpty: [ str nextPutAll: id ].
	str nextPutAll: '>'.
]

{ #category : #accessing }
GTCParticipant >> texts [
	^ texts
]

{ #category : #accessing }
GTCParticipant >> texts: anObject [
	texts := anObject
]

{ #category : #'as yet unclassified' }
GTCParticipant >> visualizeText [

	| v wordBuilder textElements |
	v := RSView new.
	
	wordBuilder := RSShapeBuilder label.
	textElements := RSShapeBuilder composite
							color: (Color r: 0.95 g: 0.95 b: 1.0);
							shapes: [ :aText |
								| g |
								g := wordBuilder elementsOn: aText substrings.
								g @ RSMenuActivable.
								g do: [ :aWordElement | self defineMenuOn: aWordElement ].
								RSGridLayout new lineItemsCount: 20; on: g.
								g 
							]; elementsOn: texts.
	RSVerticalLineLayout new gapSize: 20; on: textElements.
	v addAll: textElements.
	v @ RSControlsView.
	v open
]
