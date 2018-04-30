\version "2.12.3"

\paper {
        #(set-paper-size "a4")
        ragged-last = ##t
	#(define fonts
	 (make-pango-font-tree "LinuxLibertineO"
	 		       "Lucida Sans"
			       "Nimbus Mono"
			       (/ 20 20 )))
        oddFooterMarkup = \markup {
          \fill-line { 
              \line { \smaller A simplified arrangement by Veronica Brandt 2011 }
              \line { \italic http://brandt.id.au }
        }}
}


#(set-global-staff-size 20)

\header {
        title = "O Purest of Creatures"
        poet = "Fr F Faber"
        composer = "Paderborn Gesangbuch 1765"
}

global = {
       \key d \major
       \time 3/4
       \set Staff.midiInstrument = "reed organ"
}

melody = \transpose f d \relative c' {
	\clef treble
        \tempo 4 = 116
        \partial 4 c4 f f g a a bes8( d) c( bes) a4 g f2
        c4 f f g a a bes8( d) c( bes) a4 g f2
        a8( bes) c4 a c bes8( a) g4 bes a f a g2
        c,4 f f g a a bes8( d) c( bes) a4 g f2 \bar "||"  
        } 	

bass = \transpose f d \relative c {
       \clef bass
       c4 a f c' f f d8( bes8) a(bes) c4 c f,2
       c'4 a f c' f f d8( bes) a( bes) c4 c f,2
       f'8( g) a4 f a g c, e f a f c2
       e4 f a, c f f d8( bes) a( bes) c4 c f,2
       }

firstVerse = \lyricmode {
       O pur -- est of crea -- tures, sweet Mo -- ther, sweet maid!
       The one spot -- less womb where -- in Je -- sus was laid!
       Dark night hath come down on us Mo -- ther and we
       Look our for thy shin -- ing Sweet Star of the Sea!
}

\score {
	\new GrandStaff <<
	\new Staff = melody { \new Voice = "singer" \autoBeamOff \global \melody }
	\new Lyrics \lyricsto "singer" \firstVerse
	\new Staff = bass { \global \bass }
	>>
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
	\midi { 
               }

}

