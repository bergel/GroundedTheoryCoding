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
					self model concepts do: [ :c |
						menu
							add: c conceptName
							target: self
							selector: #addConceptForWord: 
							argument: (Array with: aWordElement text with: self)
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
							color: (Color blue alpha: 0.1);
							shapes: [ :aText |
								| g |
								g := wordBuilder elementsOn: aText substrings.
								g @ RSMenuActivable.
								g do: [ :aWordElement | self defineMenuOn: aWordElement ].
								RSGridLayout new lineItemsCount: 20; on: g.
								g 
							]; elementsOn: texts.
	RSVerticalLineLayout on: textElements.
	v addAll: textElements.
	v @ RSControlsView.
	v open
]
