


\version "2.12.3"

\paper {
        #(set-paper-size "a4")
	#(define fonts
	 (make-pango-font-tree "LinuxLibertineO"
	 		       "Lucida Sans"
			       "Nimbus Mono"
			       (/ 20 20)))
        oddFooterMarkup = \markup {
          \fill-line { 
              \line { \smaller A simplified arrangement by Veronica Brandt 2011 }
              \line { \italic http://brandt.id.au }
        }}
}

#(set-global-staff-size 23)


\header {
        title = "The Canticle of the Sun"
        poet = "St Francis of Assisi, tr W H Draper"
        composer = "From Geistliche Kirchengesang, harm R V Williams"
}

global = {
        \key c \major
        \time 3/2
        }

melody = \transpose d c \relative c' {
	\clef treble
        \time 3/2
        \tempo 4 = 105
        \partial 2
        d2 d4 e fis d fis g a1 d,2 d4 e fis d fis g a1 
        d4 cis b2 a2 d4 cis b2 a\fermata 
        d2 d4 a a g fis g a1 d2 d4 a a g fis g a1 
        g4( fis) e2 d g4( fis) e2 d d'4 cis b2 a d4 cis b2 a g4 fis e1. d1 \bar "||"
        } 	

alto = \transpose d c \relative c' {
        a2 d1 d2 d cis d a4 cis d2 d d cis
        a'4 a a( g) fis2 d4 e fis( e) cis2
        a'4 g fis2( fis4) e d2 cis d4 e d cis d d2. d4 cis fis e
        d4 d d( cis) d2 d4 d d( cis) b2 fis'4 e fis( e) cis2 fis2( fis4) e( e) b b d d2 cis4 a1
}

bass = \transpose d c \relative c {
       \clef bass
       d2 d2( d4) d8[ cis] b4 e4 a,2 a'4 g fis g fis e d cis b e a,2 a'4 g
       fis4 fis g2 d b4 cis d( e) a,2\fermata
       fis'4 e d cis b cis d b a2 a'4 g fis g fis e d b' a g fis e d cis
       b4 a g2 fis e4 fis g( a) b2 b4 cis d( e) a,2 b4 cis d e cis dis e fis g2 a a, d,1 
       }

firstVerse = \lyricmode {
\set stanza = "1. " 
      All crea -- tures of our God and King
      Lift up your voice and with us sing
      Al -- le -- lu -- ia, al -- le -- lu -- ia!
      Thou burn -- ing sun with gold -- en beam,
      Thou sil -- ver moon with soft -- er gleam:
      O praise Him, O praise Him,
      Al -- le -- lu -- ia, al -- le -- lu -- ia,
      al -- le -- lu -- ia!
}

secondVerse = \lyricmode {
\set stanza = "2. " 
Thou flow -- ing wa -- ter, pure and clear,
Make mu -- sic for thy Lord to hear,
Al -- le -- lu -- ia, Al -- le -- lu -- ia!
Thou fire so mas -- ter -- ful and bright,
That giv -- est man both warmth and light:
O praise him, O praise him,
Al -- le -- lu -- ia, al -- le -- lu -- ia, al -- le -- lu -- ia.
}

thirdVerse = \lyricmode {
\set stanza = "3. " 
Dear mo -- ther earth, who day by day
Un -- fold -- est bless -- ings on our way,
O _ praise him, al -- le -- lu -- ia!
The flowers and fruits that in thee grow,
Let them his glo -- ry al -- so show:
O praise him, O praise him,
Al -- le -- lu -- ia, al -- le -- lu -- ia, al -- le -- lu -- ia.
}

fourthVerse = \lyricmode {
\set stanza = "4. " 
And all ye men of ten -- der heart,
For -- giv -- ing oth -- ers, take your part,
O _ praise him, al -- le -- lu -- ia!
Ye who long pain and sor -- row bear,
Praise God and on him cast your care:
O praise him, O praise him,
Al -- le -- lu -- ia, al -- le -- lu -- ia, al -- le -- lu -- ia.
}

fifthVerse = \lyricmode {
\set stanza = "5. " 
Let all things their Cre -- a -- tor bless,
And wor -- ship him in hum -- ble -- ness,
O _ praise him, al -- le -- lu -- ia!
Praise, praise the Fa -- ther, praise the Son,
And praise the Spi -- rit, three in One:
O praise him, O praise him,
Al -- le -- lu -- ia, al -- le -- lu -- ia, al -- le -- lu -- ia.
}

\score {
	\new GrandStaff <<
	\new Staff << \new Voice = "singer" \autoBeamOff \voiceOne \melody 
 	\new Lyrics \lyricsto "singer" \firstVerse
        \new Lyrics \lyricsto "singer" \secondVerse
	\new Lyrics \lyricsto "singer" \thirdVerse
        \new Lyrics \lyricsto "singer" \fourthVerse
        \new Lyrics \lyricsto "singer" \fifthVerse
                      \new Voice = "harm" << \voiceTwo \alto >>
>>
	\new Staff = bass { \bass }
	>>
	\midi { }
	\layout{
            \context {
               \GrandStaff
               \accepts "Lyrics"
             }
            \context {
               \Lyrics
               \consists "Bar_engraver"
             }
	}
}

