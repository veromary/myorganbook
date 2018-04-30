\version "2.12"

\paper {
        #(set-paper-size "a4")
	#(define fonts
	 (make-pango-font-tree "Linux Libertine O"
	 		       "Lucida Sans"
			       "Nimbus Mono"
			       (/ 18 18)))
}

#(set-global-staff-size 23)

\header {
        title = \markup "O salutaris Hostia"
	composer = "Webbe"
%	poet = ""
%	instrument = "organ"
	tagline = \markup { \fill-line { 
	                       \line { VB 2010 } 
			       \line { \italic brandt.id.au } } }
}

global = {
    \key c \major
    \time 4/4
}

sop = \transpose ees c \relative c'' {
       
       \partial 4 bes4 bes aes g f ees c' bes\fermata
       bes ees d c bes \break bes a4 bes4\fermata
       g g aes bes g f4. g8 aes4\fermata
       aes4 \break g f bes aes g f4 ees2\fermata
       ees2 ees
       
       }

alto = \transpose ees c \relative c' {
       
       \partial 4 ees4 bes c8( d) ees4 d c ees ees
       f ees f f d c c d4
       ees4 ees d8( c) bes4 ees d4. ees8 f4
       f4 ees d ees ees ees d4 ees2
       c2 bes2
       
       }
       
tenor = \transpose ees c \relative c' {
       
       \partial 4 g4 g aes bes bes g aes g
       bes4 a bes a bes g f f
       g4 bes aes g bes bes4. bes8 c4
       bes4 bes bes bes c bes4. aes8 g2 
       aes2 g
       }
       
bass = \transpose ees c \relative c {

       \partial 4 ees4 g f ees bes c aes ees'\fermata
       d4 c d8( ees) f4 g ees f bes,4\fermata
       ees4 ees f g ees bes'4. g8 f4\fermata
       d4 ees bes4 g4 aes bes bes ees2\fermata
       aes, ees'
       }


verseA = \lyricmode {
  O sa -- lu -- ta -- ris Hos -- ti -- a,
  Quae cae -- li pan -- dis os -- ti -- um:
  Bel -- la pre -- munt hos -- ti -- li -- a,
  Da ro -- bur, fer aux -- i -- li -- um.
  }
verseB = \lyricmode {
  U -- ni tri -- no -- que Do -- mi -- num,
  Sit sem -- pi -- ter -- na glo -- ri -- a!
  Qui vi -- tam si -- ne ter -- mi -- no
  No -- bis do -- net in pa -- tri -- a.
  A -- men.
  }



\score {
  \new ChoirStaff <<
  \new Staff = "RH"
     <<
     \new Voice = "sopranos" {
     \voiceOne
     << \global \sop >>
     }
     \\
     \global \alto
     >>
  \new Lyrics = sopranos \lyricsto sopranos \verseA
  \new Lyrics = sopranos \lyricsto sopranos \verseB
  \new Staff = "LH"
  <<
     \clef bass
     \global \tenor
     \\
     \global \bass
  >>
 >>
 \layout {
    \context {
      \Staff
    }
  }				      
 \midi {
     \context {
       \Score
       tempoWholesPerMinute = #(ly:make-moment 88 4)
    }
}
}		       
