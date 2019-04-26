Class {
	#name : #GTCRoleVizModel,
	#superclass : #GTCModel,
	#category : #'GroundedTheoryCoding-RoleViz'
}

{ #category : #'as yet unclassified' }
GTCRoleVizModel >> importFromCSV: csvText [
	"Argument is a CSV file"

	<script: 'self new importFromCSV: GTCRoleVizData new fullTranscriptAsCSV; inspect'>

	| entries |
	entries := (NeoCSVReader on: csvText readStream) skipHeader; upToEnd.
	entries do: [ :entry |
		| p |
		p := GTCParticipant new.
		p id: entry second.
		p addText: entry third.
		p addText: entry fourth.
		p addText: entry fifth.
		p addText: entry sixth.
		p model: self.
		self addParticipant: p
	].

]
