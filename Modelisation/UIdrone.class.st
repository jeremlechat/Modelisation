SpPresenter subclass: #UIDrone

	instanceVariableNames: 'model rsCanvas carte'

	classVariableNames: ''

	package: 'Cours-UI'!


!UIDrone methodsFor: 'accessing' stamp: '2025-11-25T10:37:36.496468+01:00'!

model


	^ model! !


!UIDrone methodsFor: 'accessing' stamp: '2025-11-25T10:37:36.506476+01:00'!

model: anObject


	model := anObject! !


!UIDrone methodsFor: 'accessing' stamp: '2025-11-25T11:13:41.57172+01:00'!

rsCanvas


	 

	^rsCanvas! !


!UIDrone methodsFor: 'accessing' stamp: '2025-11-25T10:42:42.473041+01:00'!

rsCanvas: anObject


	rsCanvas := anObject! !


!UIDrone methodsFor: 'accessing' stamp: '2025-11-25T11:26:29.149637+01:00'!

carte


	^ carte! !


!UIDrone methodsFor: 'accessing' stamp: '2025-11-25T11:30:38.954967+01:00'!

carte: a


	carte := a.

	carte properties at: #position put: 0 @ 0! !



!UIDrone methodsFor: 'layout' stamp: '2025-11-25T11:34:03.872918+01:00'!

defaultLayout


	^ SpBoxLayout newTopToBottom

		 add: (SpRoassalPresenter new

				  canvas: self rsCanvas;

				  yourself);

		 yourself! !



!UIDrone methodsFor: 'defaults' stamp: '2025-11-25T11:22:14.391129+01:00'!

defaultBitmap

^ (RSBitmap newFrom: (ImageReadWriter formFromFileNamed: 'Brest.png'))



 ! !



!UIDrone methodsFor: 'initialize' stamp: '2025-11-25T11:42:35.781519+01:00'!

initialize


	super initialize.

	rsCanvas := RSCanvas new.

	self configureCanvas.

	self carte: self defaultBitmap.

	rsCanvas add: self carte.


 ! !


!UIDrone methodsFor: 'initialize' stamp: '2025-11-25T11:43:11.5848+01:00'!

configureCanvas

"	self rsCanvas

		when: RSMouseClick

		do: [ :evt |

				 evt position.]"! !


!UIDrone methodsFor: 'initialize' stamp: '2025-11-25T11:45:46.185751+01:00'!

generateForms


"			dot @ (RSMenuActivable new menuDo: [ :aMenuMorph :aRSNode |

					aMenuMorph   addLine; 

						add: 'Inspect'

						target: aRSNode

						selector: #inspect 

						argument: #(  ).

					 "

	! !
