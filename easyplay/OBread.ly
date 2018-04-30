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
        title = "O Bread of Heaven"
        poet = "St Alphonsus (1696-1787)"
        meter = "tr. E Vaughan C.SS.R.(1827-1908)"
        composer = "H F Hemy (1818-88)"
        arranger = \markup \tiny "TYNEMOUTH 88.88.88"
}

global = {
       \key f \major
       \time 3/4
       \set Staff.midiInstrument = "reed organ"
}

melody = \transpose g f \relative c'' {
	\clef treble
        \tempo 4 = 100
        b4 a g g( fis) g a( e) fis g2.
        g4 fis e d2 g4 g( fis) g a2.
        b4 a g g( fis) g a( e) fis g2.
        g4 fis e d2 b'4 a( b) a g2.
        c4 c c b2 b4 a2 a4 b2.
        b4 a g e2 g4 a2 a4 g2.
}

bass = \transpose g f \relative c {
       \clef bass
       g4 a b d( c) b c2 d4 g,2.
       c4 d e fis( g) e a2 a,4 d2.
       g,4 a b d( c) b a2 d4 e2.
       c4 c e g2 b,4 c2 d4 g2.
       c,4 c e g2 g4 a2 d,4 g2.
       g,4 a b c2 e4 d2 d4 g2.
       }

firstVerse = \lyricmode {
      O Bread of heav'n, be -- neath this veil
      Thou dost my ve -- ry God con -- ceal
      My Je -- sus, dear -- est trea -- sure hail;
      I love Thee and ad -- or -- ing kneel;
      Each lov -- ing soul by Thee is fed
      With Thy own self in form of bread.
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

