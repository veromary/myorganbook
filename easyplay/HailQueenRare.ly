\version "2.12.3"

% This is the unusual version that fits the Sojourners verse

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
        title = "Hail Queen of Heaven"
        poet = "Dr Lingard"
        composer = "Anon"
}

global = {
       \key c \major
       \time 3/4
       \set Staff.midiInstrument = "reed organ"
}

melody = \transpose d c \relative c'' {
	\clef treble
        \tempo 4 = 116
        \partial 4 a4 a( fis) g a2 b8( cis) d4( cis) b
        a2 a4 a( g) fis e( fis) g fis( a) fis
        e2 a4 a( fis) g a2 b8( cis) d4( cis) b
        a2 a4 a( g) fis e( fis) g fis2 e4
        d2. e4 fis g fis2. a4 fis b
        a2. b4 d b a4.( g8) fis4 g2 e4 d2 \bar "||"
}

bass = \transpose d c \relative c' {
       \clef bass
       d4 d,2 e4 fis2 e4 d2 d4 
       d2 d4 cis2 d4 g fis e d2 d4 
       a2 g'4 fis d e fis2 e4 b e e
       a, a' g fis e d g fis e a a, a
       d2. a'4 a cis, d cis b cis fis e
       a,2. g4 g gis a a b e a, a d2
       }

firstVerse = \lyricmode {
      Hail Queen of heav'n the o -- cean star,
      Our guide so gen -- tle here be -- low,
      From this life's surge we beg thy care;
      Save us from per -- il and from woe.
      Mo -- ther of Christ,
      Star of the sea,
      Pray for the wan -- d'rer, 
      pray for me!
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

