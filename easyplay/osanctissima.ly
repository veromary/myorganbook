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
        title = "O Sanctissima"
        poet = "Anon"
        composer = "Sicilian Air"
}

global = {
      \key c \major
}

melody = \transpose d c \relative c'' {
	\clef treble
	\time 4/4
        a2 b a4. g8 fis4( g) 
        a2 b a4. g8 fis4( g)
        a2 a b cis4 d cis2( b) a2( a4) r4
        e4.( fis8) e4 fis g4.( a8) g2
        fis4.( g8) fis4 g a4.( b8) a2
        d4( cis) b( a) d( b) a g fis2( e) d r2 \bar "||"
        } 	

bass = \transpose d c \relative c {
       \clef bass
       d2 d d4. d8 d2
       d2 g a4.( a8) d,2
       d cis e2 a4 fis e2( e) a,2( a4) r4
       a2 a4 a a2 a2
       d d4 d d2 d d4( fis) g( d) g( b) d b a2( a,) d2 r2
       }

firstVerse = \lyricmode {
     O sanc -- tis -- si -- ma,
     O pi -- is -- si -- ma,
     dul -- cis Vir -- go Ma -- ri -- a,
     Ma -- ter a -- ma -- ta
     in -- ter -- me -- ra -- ta,
     O -- ra, o -- ra pro no -- bis.
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

