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
GTCModel >> addConcept: aConcept [
	aConcept model: self.
	concepts add: aConcept 
]

{ #category : #adding }
GTCModel >> addParticipant: aParticipant [
	participants add: aParticipant 
]

{ #category : #accessing }
GTCModel >> concepts [
	^ concepts
]

{ #category : #'as yet unclassified' }
GTCModel >> export [

	| str |
	str := WriteStream on: String new.
	self concepts do: [ :c |
		c exportOn: str
	]. 
	^ str contents
]

{ #category : #inspector }
GTCModel >> gtInspectorConceptIn: composite [

	<gtInspectorPresentationOrder: -20>
	composite list 
		title: 'Concepts';
		display: #concepts;
		format: #conceptName
]

{ #category : #inspector }
GTCModel >> gtInspectorParticipantsIn: composite [

	<gtInspectorPresentationOrder: -20>
	composite list 
		title: 'Participants';
		display: #participants;
		format: #id
]

{ #category : #'as yet unclassified' }
GTCModel >> import: aString [
	| c p |
	c := nil.
	aString lines do: [ :aLine |
		(aLine beginsWith: 'new concept:') ifTrue: [ 
			c := GTCConcept new conceptName: (aLine copyAfter: $:). 
			self addConcept: c.
			c model: self.
		].
		(aLine beginsWith: 'concept to participant:') ifTrue: [
			p := GTCParticipant new id: (aLine copyAfter: $:).
			self addParticipant: p.
			c addParticipantIfNotPresent: p.
			p model: self.
			p addConcept: c.
		].
		(aLine beginsWith: 'concept to word:') ifTrue: [
			c addWord: (aLine copyAfter: $:).
		]
	]




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

{ #category : #accessing }
GTCModel >> participants [
	^ participants 
]

{ #category : #visualizations }
GTCModel >> visualizeConcepts [

	| v conceptElements |
	v := RSView new.
	
	conceptElements := RSShapeBuilder label
								interactionDo: [ :i | i popup ; draggable ];
								color: #color;
								text: #conceptName;
								elementsOn: self concepts.
	v addAll: conceptElements.
	RSForceBasedLayout new charge: -300; on: v elements.					
	v @ RSControlsView.
	
	RSNormalizer fontSize
		elements: conceptElements;
		normalize: #numberOfParticipants.
		
	RSNormalizer fontSize
		elements: conceptElements;
		normalize: #numberOfParticipants.
		
	v open
]

{ #category : #visualizations }
GTCModel >> visualizeConceptsOld [

	| v conceptElements |
	v := RSView new.
	
	conceptElements := RSShapeBuilder circle
								interactionDo: [ :i | i popup ; draggable ];
								elementsOn: self concepts.
	v addAll: conceptElements.
	RSForceBasedLayout on: v elements.					
	v @ RSControlsView.
	
	RSNormalizer size
		elements: conceptElements;
		normalize: #numberOfDifferentWords.
	v open
]
