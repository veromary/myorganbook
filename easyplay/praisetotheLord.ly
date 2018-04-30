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
        title = "Praise to the Lord"
        poet = "J Neander tr Catherine Winkworth"
        composer = "Stralsund Gesangbuch 1665"
        arranger = \markup \tiny "Later form in Choral Book for England 1863"
}

global = {
       \key d \major
       \time 3/4
}

melody = \transpose f d \relative c' {
	\clef treble
        \tempo 4 = 90
        f4 f c'4 a4. g8 f4 e d c d e f g2. f2.
        f4 f c' a4. g8 f4 e d c d e f g2. f2.
        c'4 c c d2. a4 bes c c bes a g2.
        c,4 d e f g a g2. f2.
        } 	

bass = \transpose f d \relative c {
       \clef bass
       f4 d e f4. c8 d4 a bes f bes g d' bes( c2) f,2.
       f'4 d e f4. c8 d4 a bes f bes g d' bes( c2) f,2.
       f'4 e f bes,2. f'4 d e f g a8 f c2. 
       a4 bes g d' bes a bes2( c4) f,2.
       }

bachsbass = \transpose bes d \relative c' {
       bes4 bes a bes4. a8 g4 f f ees d c bes f'2. bes2.
       bes4 bes a bes4. a8 g4 f c ees d c bes f'2. bes2.
       bes4 c d ees2. bes4 a8 g f ees d4 d ees f2.
       d4 e fis g a bes f2. bes2.
}

bachsten = \transpose bes d \relative c' {
       d4 d c bes4. c8 d e f4 f ees d ees f f2 ees4 d2.
       d4 d c bes4. c8 d e f4 f ees d ees f f2 ees4 d2.
       d4 ees f bes2. f4 g c, c bes bes f'2. bes,4 a8 g ees'4 d c bes bes2 a4 f'2.
}

firstVerse = \lyricmode {
     Praise to the Lord the Al -- might -- y the King of cre -- a -- tion
     O my soul praise Him for He is thy health and sal -- va -- tion
     All you who hear, now to His al -- tar draw near
     Join in pro -- found ad -- or -- a -- tion.
}

\score {
	\new GrandStaff <<
	\new Staff = melody { \new Voice = "singer" \autoBeamOff \global \melody }
	\new Lyrics \lyricsto "singer" \firstVerse
	\new Staff = bass { \global \clef bass << \bachsten 
                                                  \bachsbass >>}
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

