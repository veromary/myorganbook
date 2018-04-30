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
        title = "For God"
        poet = "Fr J P O'Daly with John O'Brien"
        composer = "Noi Vogliam Iddio"
        arranger = "Percy Jones"
}

global = {
       \key d \major
       \time 4/4
}

melody = \transpose f d \relative c' {
	\clef treble
        \tempo 4 = 108
        \partial 2 r8 c8 d e f2 a4 f8. c16 a'4 f4. f8 g a bes4 a g f g2( g8) 
        c,8 d e f2 a4 f8. c16 a'4 f4. f8 e f g4. g8 a4 b c1
        a4 a8. g16 a4 c c2 bes2
        bes4 bes8. a16 bes4 d8. c16 a2( a8) 
        a8 a8 bes c4. bes8 a4 c c bes( bes8) 
        g8 a bes a4. a8 g4 f c'2( c8)
        a8 bes c d2( d8) g,8 a bes d4 c4.
        f,8 g a c4. c8 c4 c f,2. \bar "||"
        } 	

bass = \transpose f d \relative c {
       \clef bass
       r8 c8 bes g f2 f' f2. bes,4 g a bes b c2. bes4
       a4 g f a d2. f4 e2 d4 g c,1 f2. a4 g1
       g4 f e c f e d bes a2 d g2. d4 bes2 b
       c4 d8 e f2 e4 d c bes a2 d4 bes c2 c f2.
       }

firstVerse = \lyricmode {
      We stand for God! and for His glo -- ry
      the Lord su -- preme and God of all
      a -- gainst His foes we raise His stan -- dard
      a -- round the Cross we hear His call
      Streng -- then our faith Re -- deem -- er
      guard us when dan -- ger is nigh
      to Thee we pledge our lives and ser -- vice
      for God we live, for God we'll die
      to Thee we pledge our lives and ser -- vice
      for God we live, for God we'll die.
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

