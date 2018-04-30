\version "2.12.3"

% This is the usual version that doesn't fit the Sojourners verse
% Taken from Dr Percy Jone's Pius X Hymnal
% credited to Henri Freidrich Hemy (1818--88) STELLA
% Which tune did Hemy really write???


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
        composer = "H F Hemy (1818-88)"
}

global = {
       \key bes \major
       \time 3/4
       \set Staff.midiInstrument = "reed organ"
}

melody = \transpose d bes \relative c' {
	\clef treble
        \tempo 4 = 116
        \partial 4 a4 a( fis) a a2 d4 d4( cis) b
        a2. a4 g fis e( fis) g fis( a) fis
        e2 a4 a( fis) a a2 d4 d4( cis) b
        a2. a4 g4 fis e( fis) g fis2 e4
        d2. e4. fis8 g4 fis2. a4 fis b
        a2. b4 d b a4.( g8) fis4 g2 e4 d2. \bar "||"
}

bass = \transpose ees bes \relative c, {
       \clef bass
       ees4 ees2 ees4 ees2 ees4 ees2 ees4 ees2. ees4 f g aes( g) f
       ees4( g) ees bes2 d4 ees2 ees4 ees2 ees4 ees2 ees4 ees2.
       ees4 f g aes4( g) f bes2 bes,4 ees2. bes4. bes8 bes4 ees2.
       ees4 ees aes g2. aes4 aes aes ees4 d ees aes,2 bes4 ees2.
       }

firstVerse = \lyricmode {
      Hail Queen of heav'n the o -- cean star,
      Guide of the wan -- d'rer here be -- low,
      Thrown on life's surge we claim thy care;
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

