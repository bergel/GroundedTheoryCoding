Class {
	#name : #GTCModelTest,
	#superclass : #TestCase,
	#category : #'GroundedTheoryCoding-Core'
}

{ #category : #tests }
GTCModelTest >> exampleImport [
	<script: 'GTCModel new import: GTCModelTest new exampleImport; inspect'>
	^ 'new concept:Like
concept to participant:p2_manuel
concept to word:liked
new concept:Search
concept to participant:p2_manuel
concept to word:search
new concept:Accuracy
concept to participant:p2_manuel
concept to word:only
new concept:Like package interaction view
concept to participant:p2_manuel
concept to word:(Package
new concept:Dependency
concept to participant:p2_manuel
concept to word:lines
new concept:Bad source code rendeing
concept to participant:p2_manuel
concept to word:source
new concept:Bad source code structured
concept to participant:p2_manuel
concept to word:structured
'
]

{ #category : #tests }
GTCModelTest >> testImport [

	| model |
	model := GTCModel new.
	self assert: model numberOfParticipants equals: 0.
	model import: self exampleImport.
	self assert: model numberOfParticipants equals: 7.
]
