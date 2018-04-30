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
        title = "Firmly I Believe"
        poet = "Cardinal Newman"
        composer = "Sir Edward Elgar (1857-1934)"
        arranger = \markup \tiny "DRAKES BROUGHTON 87.87"
}

global = {
        \key c \major
        \time 4/4
        }

melody = \transpose d c \relative c' {
	\clef treble
        \tempo 2 = 100
        fis2  fis a fis fis2. e4 e2 fis
        g2 g b g fis e fis1
        a2 a b b cis b4( a) d2 a
        g fis4( e) a2 d,2 fis2. e4 d1
        } 	

bass = \transpose d c \relative c {
       \clef bass
       d2 d fis d g2. g4 g2 fis
       e2 e g e a a, d1
       d2 fis e e a g fis fis 
       e2 g fis g a a, d1
       }

firstVerse = \lyricmode {
    Firm -- ly I be -- lieve and tru -- ly
    God is Three and God is One
    And I next ac -- know -- ledge du -- ly
    Man -- hood ta -- ken by the Son.
}

\score {
	\new GrandStaff <<
	\new Staff = melody { \new Voice = "singer" \autoBeamOff \global \melody }
	\new Lyrics \lyricsto "singer" \firstVerse
	\new Staff = bass { \global \bass }
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

