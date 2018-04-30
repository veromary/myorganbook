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
        title = "Salve Regina"
        poet = "Bl Herman Contractus"
%        composer = "arr Percy Jones"
}

\include "gregorian.ly"

chant = \relative c' {
	\clef treble
        \time 100/2
        \times 2/3 { c8 e g } a g4 \divisioMinima
        a8 c \times 2/3 { b a g } a g g4 \divisioMaior
        c8 g4 a8 f( f) d4 \divisioMaior
        e8 f g e e( d) c4 \finalis
        g'8 a b c g4 \divisioMaior
        } 	

ten = \relative c' {
       g4 a4.( a2) b4 c
       g4. a4. g4( g2) f4 e
       g4 c2
       }

bass = \relative c {
       c4( c4. c2 c4 c) 
       e4. f4. g4 c,1
       c4 e2
       }

verba = \lyricmode {
       Sal -- ve Re -- gi -- na,
       Ma -- ter mi -- se -- ri -- cor -- di -- ae,
       Vi -- ta, dul -- ce -- do, 
       et spes nos -- tra sal -- ve.
       Ad te cla -- ma -- mus,
}

\score {
	\new GrandStaff <<
	\new Staff = "plainchant" << 
          \new Voice = "melody" \chant
	  \new Lyrics \lyricsto "melody" \verba
                   >>
	\new Staff = bass <<
            \clef bass
            \new Voice = "tenors" << \ten >> 
            \new Voice = "bass" << \bass >>
	  >>
        >>
	\midi { }
	\layout{
            \context {
               \Staff
               \remove "Time_signature_engraver"
               \remove "Bar_engraver"
               \override BarLine #'X-extent = #'(-1 . 1)
               \override Beam #'transparent = ##t
               \override Stem #'transparent = ##t
               \override BarLine #'transparent = ##t
               \override TupletNumber #'transparent = ##t
             }
            \context {
               \Lyrics
               \consists "Bar_engraver"
             }
	}
}

