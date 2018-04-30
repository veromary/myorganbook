
\version "2.12.3"

\paper {
        #(set-paper-size "a5")
  myStaffSize = #26
	#(define fonts
	 (make-pango-font-tree "LinuxLibertineO"
	 		       "Lucida Sans"
			       "Nimbus Mono"
			       (/ myStaffSize 26)))
        oddFooterMarkup = \markup {
          \fill-line { 
              \line { \smaller A simplified arrangement by Veronica Brandt 2011 }
              \line { \italic http://brandt.id.au }
        }}
}


\header {
        title = "Help of Christians"
        poet = "James McAuley"
        composer = "Richard Connolly"
}

global = {
      \key bes \major
}

melody = \transpose c bes \relative c {
	\clef treble
	\time 4/4
        d4. c8 d4 a' g e d2 \break
        a'4. g8 a4 c d c8[ b] a2 \break
        d4. d8 c[ a] f4 a f d2 \break
        d4. c8 d4 a' g e8[ f] d2
        } 	

bass = \transpose c bes \relative c, {
       \clef bass
       d4 a d f, g a d2
       d4 a d e f g a2
       d,4 d a d f, g8 a bes4 c
       d4 a d f, g a d2
       }

firstVerse = \lyricmode {
   Help of Christ -- ians guard this land,
   from as -- sault or in -- ward stain.
   Let it be what Christ has planned
   His new E -- den where you reign.
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

