Class {
	#name : 'TestPersonne',
	#superclass : 'TestCase',
	#instVars : [
		'personne1',
		'personne2'
	],
	#category : 'Cours',
	#package : 'Cours'
}

{ #category : 'testing' }
TestPersonne >> testRajeunit [

self assert: (Personne example1 rajeunitDe:2) age equals: (Personne example1 age - 2)
]

{ #category : 'testing' }
TestPersonne >> testVieillit [

self assert: (Personne example1 vieillitDe:2) age equals: (Personne example1 age + 2)
]
