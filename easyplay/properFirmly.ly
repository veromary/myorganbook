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
        composer = "David G Corner (17th Century)"
        arranger = \markup \tiny "OMNI DIE 87.87"
}

global = {
        \key c \major
        \time 4/4
        }

melody = \transpose f c \relative c' {
	\clef treble
        \partial 2
        f4 f g2 f a4 c bes2 a f4 g a c c2 
        \set Score.measureLength = #(ly:make-moment 6 4)
        b c1 
        \set Score.measureLength = #(ly:make-moment 4 4)
        c4 c d2 c bes4 a g2 a f4 g a bes g2. f4 f1
        } 	

alto = \transpose e c \relative c' {
       b4 cis dis2 e e4 e fis2 dis cis4 dis e dis8( e) fis2. e8 dis1
       e4 e e2 e dis4 e dis2 dis cis4 dis e e e2. dis4 e1
}

tenor = \transpose e c \relative c' {
       gis4 gis b2 gis b4 b cis2 bis gis4 b b b cis2 cis b1
       gis4 b a2 b b4 b b2 b gis4 b b a cis2 b4 a gis1
}

bass = \transpose f c \relative c {
       \clef bass
       \partial 2
       f4 d c2 f f4 f g2 f f4 c f e f e d2 c1
       f4 e d2 f2 bes,4 f'4 c bes a2 d4 c f bes, c2 c f,1
       }

WMbass = \transpose e c \relative c {
       \clef bass
       \partial 2
       e4 cis4 b2 e e4 gis, fis2 gis cis4 b e gis fis2 fis b,1
       e4 gis a2 gis fis4 e b2 gis cis4 b e cis a2 b e1
       }

firstVerse = \lyricmode {
    Firm -- ly I be -- lieve and tru -- ly
    God is Three and God is One
    And I next ac -- know -- ledge du -- ly
    Man -- hood ta -- ken by the Son.
}

\score {
	\new ChoirStaff <<
	\new Staff = melody <<
                               \new Voice = "singer" \voiceOne \autoBeamOff \global \melody 
                               \new Voice \voiceTwo \global \alto
                            >>
	\new Lyrics \lyricsto "singer" \firstVerse
	\new Staff = bass << 
                             \new Voice \voiceThree \global \tenor
                             \new Voice \voiceFour \global \WMbass 
                          >>
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

