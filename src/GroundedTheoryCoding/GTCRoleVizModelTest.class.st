Class {
	#name : #GTCRoleVizModelTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'GroundedTheoryCoding-RoleViz'
}

{ #category : #running }
GTCRoleVizModelTest >> setUp [

	model := GTCRoleVizModel new importFromCSV: GTCRoleVizData new fullTranscriptAsCSV; yourself
]

{ #category : #running }
GTCRoleVizModelTest >> testBasic [

	self assert: model numberOfParticipants equals: 16
]
