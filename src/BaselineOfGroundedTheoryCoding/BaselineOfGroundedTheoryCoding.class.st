Class {
	#name : #BaselineOfGroundedTheoryCoding,
	#superclass : #BaselineOf,
	#category : #BaselineOfGroundedTheoryCoding
}

{ #category : #baselines }
BaselineOfGroundedTheoryCoding >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			spec baseline: 'Roassal3' with: [ spec repository: 'github://ObjectProfile/Roassal3/src' ].
			spec baseline: 'NeoCSV' with: [ spec repository: 'github://svenvc/NeoCSV/repository' ].
			
			spec
				package: #'GroundedTheoryCoding' with: [ 
					spec requires: #('Roassal3' 'NeoCSV') ].
					
			spec 
				group: 'Core' with: #('Roassal3' 'NeoCSV' 'GroundedTheoryCoding');
				group: 'default' with: #('Core') ].

		
	







]
