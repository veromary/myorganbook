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
        title = "Star of Ocean"
        poet = "Tr. Ronald Knox"
        composer = "C. Ett, Cantica Sacra, 1840 (A.G.M)"
%        arranger = \markup \tiny "DRAKES BROUGHTON 87.87"
}

global = {
        \key c \major
        \time 4/4
        }

melody = \transpose d c \relative c'' {
	\clef treble
        \tempo 4 = 100
        a4 fis g fis e2 d
        d4 fis a a b2 a
        b4 cis d cis b2 a
        a4 b g fis e2 d \bar "||"
        } 	

bass = \transpose d c \relative c {
       \clef bass
       d4 cis b d a2 b
       d4 b cis d g,2 d'
       g4 e d a e'2  a,4( g)
       fis4 g e fis a2 d
       }

altbass = \transpose ees c \relative c{
       \clef bass
       ees4 ees aes, ees' bes2 ees
       ees4 ees d g f2 bes,
       f'4 d c d ees( f) g2
       ees4 c d ees aes,( bes) ees2
}

firstVerse = \lyricmode {
       Star of o -- cean, lead us;
       God for mo -- ther claims thee,
       E -- ver Vir -- gin names thee;
       Gate of hea -- ven, speed us.
}

\score {
	\new GrandStaff <<
	\new Staff = melody { \new Voice = "singer" \autoBeamOff \global \melody }
	\new Lyrics \lyricsto "singer" \firstVerse
	\new Staff = bass { \global \altbass }
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
}

