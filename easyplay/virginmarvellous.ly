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
        title = "Virgin wholly marvellous"
        poet = "Tr. J W Atkinson SJ 1866-1921"
        composer = "P. De Corbeil, d 1222 Mediaeval French Melody"
        arranger = \markup \tiny "ORIENTIS PARTIBUS 77.77"
%        arranger = \markup \tiny "Harm R V Williams 1872-1958, adapted"
}

global = {
        \key c \major
        \time 3/4
        }

melody = \transpose f c \relative c' {
	\clef treble
        \tempo 4 = 144
        f2 g4 a2 f4 g2 e4 f2.
        c'2 c4 d2 bes4 c2 c4 a2.
        a2 g4 bes2 a4 g2 f4 a2.
        c2 bes4 a2 f4 g2 e4 f2. \bar "||"
        } 	

bass = \transpose f c \relative c {
       \clef bass
       f2 c4 a2 d4 bes2 c4 f2.
       a,2 f'4 d2 g4 c,2 c4 f2.
       f2 c4 bes2 f4 g2 d'4 a2.
       f2 g4 a2 d4 bes2 c4 f,2.
       }

firstVerse = \lyricmode {
       Vir -- gin, whol -- ly mar -- vel -- lous,
       Who didst bear God's Son for us,
       Worth -- less is my tongue and weak
       Of thy pu -- ri -- ty to speak.
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

