Object subclass: #Component
	instanceVariableNames: 'id container'
	classVariableNames: ''
	package: 'Modelisation'!

!Component methodsFor: 'accessing' stamp: 'LocLagadec 10/23/2024 12:03'!
position: aValue

^self subclassResponsibility ! !

!Component methodsFor: 'accessing' stamp: 'LocLagadec 10/23/2024 12:03'!
weight: aValue

^self subclassResponsibility ! !

!Component methodsFor: 'accessing' stamp: 'LocLagadec 10/23/2024 12:02'!
weight

^self subclassResponsibility ! !

!Component methodsFor: 'accessing' stamp: 'LocLagadec 10/23/2024 12:08'!
container

	^ container! !

!Component methodsFor: 'accessing' stamp: 'LocLagadec 10/23/2024 12:05'!
id: anObject

	id := anObject! !

!Component methodsFor: 'accessing' stamp: 'LocLagadec 10/23/2024 12:02'!
position

^self subclassResponsibility ! !

!Component methodsFor: 'accessing' stamp: 'LocLagadec 10/23/2024 12:17'!
allElements 

^self subclassResponsibility ! !

!Component methodsFor: 'accessing' stamp: 'LocLagadec 10/23/2024 12:08'!
container: anObject

	container := anObject! !

!Component methodsFor: 'accessing' stamp: 'LocLagadec 10/23/2024 12:05'!
id

	^ id! !


!Component methodsFor: 'moving' stamp: 'LocLagadec 10/23/2024 11:51'!
moveBy: a

"Explicit mandatory interface for subclasses.
This method cannot invoked except if not re-implemented in one instanciated subclass"
^self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Component class
	instanceVariableNames: ''!

!Component class methodsFor: 'accessing' stamp: 'LocLagadec 10/23/2024 12:34'!
id: anId
|eComponent|
eComponent := self new.
eComponent id: anId.
^eComponent! !


Component subclass: #Composite
	instanceVariableNames: 'elements'
	classVariableNames: ''
	package: 'Modelisation'!

!Composite methodsFor: 'building' stamp: 'LocLagadec 10/23/2024 12:06'!
add: aComponent

self elements add: aComponent.
aComponent container: self ! !

!Composite methodsFor: 'building' stamp: 'LocLagadec 10/23/2024 12:07'!
remove: aComponent

self elements remove: aComponent ifAbsent:[^self ].
aComponent container: nil ! !


!Composite methodsFor: 'moving' stamp: 'LocLagadec 10/23/2024 11:53'!
moveBy: aVector
self elements do:[:anElement "ie drone of subfleet" | anElement moveBy: aVector]! !


!Composite methodsFor: 'initialize' stamp: 'LocLagadec 10/23/2024 12:01'!
initialize 
elements := OrderedCollection new.
! !


!Composite methodsFor: 'accessing' stamp: 'LocLagadec 10/23/2024 12:05'!
elements: aCollection

^ self shouldNotImplement! !

!Composite methodsFor: 'accessing' stamp: 'LocLagadec 10/23/2024 11:59'!
position

"This value is computed based on sub elements weights"

^ (self elements inject:0 into:[:accumulate :anElement| accumulate + (anElement position * anElement weight)]) / self weight! !

!Composite methodsFor: 'accessing' stamp: 'LocLagadec 10/23/2024 11:57'!
weight

"This value is computed based on sub elements weights"

^ self elements inject:0 into:[:accumulate :anElement| accumulate + anElement]! !

!Composite methodsFor: 'accessing' stamp: 'LocLagadec 10/23/2024 11:57'!
weight: anInteger

"This value is computed; cannot be set"

^ self shouldNotImplement! !

!Composite methodsFor: 'accessing' stamp: 'LocLagadec 10/23/2024 12:16'!
allElements 

^self elements inject:OrderedCollection new into:[:anElement :anAccumulate| anAccumulate addAll: anElement allElements. anAccumulate]! !

!Composite methodsFor: 'accessing' stamp: 'LocLagadec 10/23/2024 12:00'!
position: a3DCoordinate

"This value is computed; cannot be set"

^ self shouldNotImplement! !

!Composite methodsFor: 'accessing' stamp: 'LocLagadec 10/23/2024 11:53'!
elements

	^ elements! !


Component subclass: #Drone
	instanceVariableNames: 'position behavior weight'
	classVariableNames: ''
	package: 'Modelisation'!
!Drone commentStamp: 'LocLagadec 10/23/2024 11:47' prior: 0!
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, "I represent a paragraph of text".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them.

Public API and Key Messages

- message one
- message two
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.

Internal Representation and Key Implementation Points.

    Instance Variables
	behavior:		<Bloc>
	id:		<Integer>
	position:		<G3DCoordinates>
	weight:		<Integer>


    Implementation Points!


!Drone methodsFor: 'movement' stamp: 'LocLagadec 10/23/2024 14:16'!
moveBy: aVector
self position: (self position + aVector)
! !


!Drone methodsFor: 'accessing' stamp: 'LocLagadec 10/23/2024 11:41'!
position

	^ position! !

!Drone methodsFor: 'accessing' stamp: 'LocLagadec 10/23/2024 11:41'!
position: anObject

	position := anObject! !

!Drone methodsFor: 'accessing' stamp: 'LocLagadec 10/23/2024 12:41'!
weight

weight ifNil:[self weight: self defaultWeight "prohibit silent behavior such as setting value"].
	^ weight! !

!Drone methodsFor: 'accessing' stamp: 'LocLagadec 10/23/2024 11:41'!
behavior: anObject

	behavior := anObject! !

!Drone methodsFor: 'accessing' stamp: 'LocLagadec 10/23/2024 11:41'!
behavior

	^ behavior! !

!Drone methodsFor: 'accessing' stamp: 'LocLagadec 10/23/2024 11:41'!
weight: anObject

	weight := anObject! !

!Drone methodsFor: 'accessing' stamp: 'LocLagadec 10/23/2024 12:42'!
defaultWeight

"Use 'find references to' to ensure proper tracing"
^1! !

!Drone methodsFor: 'accessing' stamp: 'LocLagadec 10/23/2024 12:17'!
allElements 
^Array with: self! !


!Drone methodsFor: 'activation' stamp: 'LocLagadec 10/23/2024 12:25'!
execute
self behavior isNil ifFalse:[^self behavior value: self]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Drone class
	instanceVariableNames: ''!

!Drone class methodsFor: 'instance creation' stamp: 'LocLagadec 10/23/2024 11:49'!
id: anId position: a3DCordinate
|aDrone|
aDrone := self id: anId.
aDrone position: a3DCordinate.
^aDrone! !

!Drone class methodsFor: 'instance creation' stamp: 'LocLagadec 10/23/2024 12:10'!
new 
"super provides code, but self executes it"
^super new initialize! !


Composite subclass: #Fleet
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'Modelisation'!
!Fleet commentStamp: 'LocLagadec 10/23/2024 12:13' prior: 0!
Fleet implements a Singleton.
This ensures only one Fleet exists.!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Fleet class
	instanceVariableNames: 'singleton'!

!Fleet class methodsFor: 'new' stamp: 'LocLagadec 10/23/2024 12:14'!
buildSingleton
^super new! !

!Fleet class methodsFor: 'new' stamp: 'LocLagadec 10/23/2024 12:14'!
reset
singleton := nil! !

!Fleet class methodsFor: 'new' stamp: 'LocLagadec 10/23/2024 12:14'!
new

singleton isNil ifTrue:[self buildSingleton].
^singleton! !
TestCase subclass: #DroneTest
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'Modelisation-Testing'!

!DroneTest methodsFor: 'tests' stamp: 'LocLagadec 10/23/2024 14:12'!
testMove

| tmp1 tmp |
tmp := DroneExample example1.
tmp1 := DroneExample example1.
tmp moveBy: (G3DCoordinates x:10 y:10 z:10).
self deny:    tmp position equals: tmp1 position.
self assert: tmp position x  equals: tmp1 position x + 10.! !

!DroneTest methodsFor: 'tests' stamp: 'LoicLagadec 10/23/2024 14:53'!
testNamed 

self should: [ModelisationExample example2 ]  raise: MessageNotUnderstood! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

DroneTest class
	instanceVariableNames: ''!

!DroneTest class methodsFor: 'tests' stamp: 'LocLagadec 10/23/2024 12:54'!
testMove

| tmp1 tmp |
tmp := DroneExample example1.
tmp1 := DroneExample example1.
tmp moveBy: (G3DCoordinates x:10 y:10 z:10).
self deny:    tmp position equals: tmp1 position .! !

!DroneTest class methodsFor: 'tests' stamp: 'LoicLagadec 10/23/2024 14:41'!
testNamed 
ModelisationExample example2! !
Object subclass: #CompositeExample
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'Modelisation-Example'!
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

CompositeExample class
	instanceVariableNames: ''!

!CompositeExample class methodsFor: 'examples' stamp: 'LocLagadec 10/23/2024 12:35'!
example2
"self example2"
 
|aComposite|
aComposite := Composite id:10.
aComposite add: DroneExample example1 .
aComposite add: DroneExample example2 .
^aComposite ! !

!CompositeExample class methodsFor: 'examples' stamp: 'LocLagadec 10/23/2024 12:36'!
example3
"self example3"
"Hierarchical example"

|aComposite|
aComposite := Composite id:100.
aComposite add: DroneExample example3 .
aComposite add: self example2 .
^aComposite ! !

!CompositeExample class methodsFor: 'examples' stamp: 'LocLagadec 10/23/2024 12:34'!
example1
"self example1"
 
|aComposite|
aComposite := Composite id:10.
aComposite add: DroneExample example1 .
^aComposite ! !


Object subclass: #DroneExample
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'Modelisation-Example'!
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

DroneExample class
	instanceVariableNames: ''!

!DroneExample class methodsFor: 'examples' stamp: 'LocLagadec 10/23/2024 12:26'!
example1

 
|aDrone|
aDrone := Drone id:1 position: (G3DCoordinates x:1 y:1 z:1).
aDrone behavior:[:element| Transcript show: element position].
^aDrone
! !

!DroneExample class methodsFor: 'examples' stamp: 'LocLagadec 10/23/2024 12:27'!
example2

 
|aDrone|
aDrone := Drone id:2 position: (G3DCoordinates x:10 y:1 z:0).
aDrone behavior:[:element| Transcript show: element name].
^aDrone
! !

!DroneExample class methodsFor: 'examples' stamp: 'LocLagadec 10/23/2024 14:15'!
example4

 "self example4"
|aDrone|
aDrone :=self example1. 
aDrone moveBy:(G3DCoordinates x:10 y:10 z:10).
^aDrone
! !

!DroneExample class methodsFor: 'examples' stamp: 'LocLagadec 10/23/2024 12:28'!
example3

 
|aDrone|
aDrone := Drone id:25 position: (G3DCoordinates x:10 y:10 z:40).
aDrone behavior:[:element| element inspect].
^aDrone
! !


Object subclass: #ModelisationExample
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'Modelisation-Example'!
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

ModelisationExample class
	instanceVariableNames: ''!

!ModelisationExample class methodsFor: 'examples' stamp: 'LocLagadec 10/23/2024 12:43'!
example2

"Should generate an error as #name is not implemented"
DroneExample example2 execute! !

!ModelisationExample class methodsFor: 'examples' stamp: 'LocLagadec 10/23/2024 12:43'!
example3

"Should generate an error as #name is not implemented"
DroneExample example3 execute! !

!ModelisationExample class methodsFor: 'examples' stamp: 'LocLagadec 10/23/2024 12:38'!
example1

DroneExample example1 execute! !
PackageManifest subclass: #ManifestModelisationExample
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'Modelisation-Example-Manifest'!
!ManifestModelisationExample commentStamp: '<historical>' prior: 0!
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

ManifestModelisationExample class
	instanceVariableNames: ''!

!ManifestModelisationExample class methodsFor: 'code-critics' stamp: 'LocLagadec 10/23/2024 12:26'!
ruleCodeCruftLeftInMethodsRuleV1FalsePositive

	<ignoreForCoverage>
	^ #(#(#(#RGMetaclassDefinition #(#'DroneExample class' #DroneExample)) #'2024-10-23T12:26:57.160133+02:00') )! !
