\version "2.12.3"

\paper {
        #(set-paper-size "a4")
        ragged-last = ##t
	#(define fonts
	 (make-pango-font-tree "LinuxLibertineO"
	 		       "Lucida Sans"
			       "Nimbus Mono"
			       (/ 20 20 )))
}


#(set-global-staff-size 20)

\header {
        title = "Soul of my Saviour"
        poet = "Attrib Pope John XXII (1240-1334) tr. anonymous"
        meter = \markup \tiny "10.10.10.10"
        composer = "W J Maher, S.J. (1823-77)"
        arranger = "arr. V Brandt (1979-)"
        piece = \markup \tiny "ANIMA CHRISTI"
        copyright = \markup { \char ##x00A9 "2011 V Brandt, some rights reserved." }
        tagline = "Please make copies.  http://www.brandt.id.au"
}

global = {
       \key d \major
       \time 4/4
       \set Staff.midiInstrument = "reed organ"
}

melody = \transpose f d \relative c' {
	\clef treble
        \tempo 4 = 100
        c2 f4 f f2 e f4 f g g a1
        a2 g4 a f2 e e4 f e d c1
        c'2 bes4 c a2 g c4 c bes c a1
        g4( bes) a g f2 bes a4 a g g f1
}

bass = \transpose f d \relative c {
       \clef bass
       f4( e) d c bes( g) c( bes) a d bes c f,1
       f'2 e4 c d( g,) c2 f4 d g g, c1
       e4( c) d e f( a) c( bes) a d, g c, f2( a2)
       c,2 c4 c d2 g, a4 d bes c f,1
       }

firstVerse = \lyricmode {
      Soul of my Sav -- iour, sanc -- ti -- fy my breast
      Bo -- dy of Christ, be Thou my sav -- ing guest
      Blood of my Sav -- iour, bathe me in Thy tide
      Wash me with wa -- ter flow -- ing from Thy side.
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

