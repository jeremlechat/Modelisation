"
nom: monNom prenom: monPrenom age: monAge

| tmp |
tmp := self new.
tmp nom: monNom .
tmp prenom: monPrenom.
tmp age: monAge.
^tmp
"
Class {
	#name : 'Personne',
	#superclass : 'Object',
	#instVars : [
		'nom',
		'prenom',
		'age'
	],
	#category : 'Modelisation',
	#package : 'Modelisation'
}

{ #category : 'instance creation' }
Personne class >> nom: monNom prenom: monPrenom age: monAge [

| tmp |
tmp := self new.
tmp nom: monNom .
tmp prenom: monPrenom.
tmp age: monAge.
^tmp
]

{ #category : 'accessing' }
Personne >> age [

	^ age
]

{ #category : 'accessing' }
Personne >> age: anObject [

	age := anObject
]

{ #category : 'accessing' }
Personne >> nom [

	^ nom
]

{ #category : 'accessing' }
Personne >> nom: anObject [

	nom := anObject
]

{ #category : 'instance creation' }
Personne >> nom: monNom prenom: monPrenom age: monAge [

| tmp |
tmp := self new.
tmp nom: monNom .
tmp prenom: monPrenom.
tmp age: monAge.
^tmp
]

{ #category : 'accessing' }
Personne >> prenom [

	^ prenom
]

{ #category : 'accessing' }
Personne >> prenom: anObject [

	prenom := anObject
]

{ #category : 'printing' }
Personne >> printOn: aStream [
aStream nextPutAll: 'je suis'.
aStream nextPutAll: self nom.
aStream space.
aStream nextPutAll: self prenom.
aStream cr.
aStream nextPutAll: 'J ai'.
aStream nextPutAll: self age.
aStream nextPutAll: 'ans'.
aStream cr.
]
