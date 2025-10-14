Class {
	#name : 'Personne',
	#superclass : 'Object',
	#instVars : [
		'nom',
		'age',
		'prenom'
	],
	#category : 'Cours',
	#package : 'Cours'
}

{ #category : 'examples' }
Personne class >> example1 [

^self nom: 'Yann' prenom:'Solo' age:30
]

{ #category : 'instance creation' }
Personne class >> nom: a prenom: b age: c [

|tmp|
tmp := self new nom:a;prenom:b;age:c.
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
"un texte"
aStream nextPutAll:'Je suis uen personne, et je m''apelle '.
"des valeurs textuelles"
aStream nextPutAll: self prenom; space;nextPutAll: self prenom;space.
"une variable numérique. On lui délégue le fait de s'inscrire dans le stream"
aStream nextPutAll: 'J''ai '. self age printOn: aStream.
aStream nextPutAll:' ans';cr.

]

{ #category : 'age changing' }
Personne >> vieillitDe: années [
self age: self age + années
]
