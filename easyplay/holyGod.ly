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


#(set-global-staff-size 23)

\header {
        title = "Holy God we praise Thy Name"
        poet = "C A Walworth (1820-1900)"
        composer = "Katholisches Gesangbuch 1774"
        arranger = "Percy Jones"
}

global = {
       \key c \major
       \time 3/4
}

melody = \transpose f c \relative c' {
	\clef treble
        \tempo 4 = 112
        f2 f4 f( e) f g( a) g f2. a2 a4 a( g) f c'( bes) a a g r4
        f2 f4 f( e) f g( a) g f2. a2 a4 a( g) f c'( bes) a a g r4
        g2 a4 bes( a) g a2 bes4 c2. d2 d4 c( bes) a bes( a) g f2. \bar "||"
        } 	

bass = \transpose f c \relative c {
       \clef bass
       f2 e4 d2 a4 bes2 c4 f2. f2.( f) a,2 bes4 c2 r4
       d4 c bes a2 d4 bes2 c4 f2. f2 e4 d2. a2 bes4 c2 r4
       c'4 bes a g f e f2 g4 a2. bes2 bes4 a g f bes, c c f2.
       }

firstVerse = \lyricmode {
   Ho -- ly God we praise Thy Name
   Lord of all we bow be -- fore Thee
   All on earth Thy scep -- tre claim
   All in heaven a -- bove a -- dore Thee
   In -- fi -- nite Thy vast do -- main
   E -- ver -- last -- ing is Thy reign.
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

