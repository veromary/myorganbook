\version "2.12"

\paper {
        #(set-paper-size "a4")
        ragged-last = ##t
	#(define fonts
	 (make-pango-font-tree "Linux Libertine O"
	 		       "Lucida Sans"
			       "Nimbus Mono"
			       (/ 18 18)))
}

#(set-global-staff-size 23)

\header {
        title = \markup "Receive, O Father"
	composer = "Tomas Tallis (c1505-85)"
	poet = "Fr David Coffey (1934-)"
	tagline = \markup { \fill-line { 
	                       \line { VB 2011 } 
			       \line { \italic brandt.id.au } } }
}

global = {
    \key f \major
    \time 4/4
}

sop = \transpose g f \relative c'' {
       \partial 4
       g4 g fis g g a a b
       g c c b b a a g
       d' c a b b a a g
       d e fis g b a a g2 \bar "||"

       }
      
ten = \transpose g f \relative c {
       
       b4 e e g g g fis g
       g a a b g c c b
       b a a g d' c a b
       b a a g d e fis g2

       }

bass = \transpose g f \relative c {
       \partial 4
       g4 d' d e b c d g, b a a g g' g fis g
       g a fis g g, c d g, b c d e b c d g,2

}


verseA = \lyricmode {
      Re -- ceive O Fa -- ther, God of might
      This host un -- ble -- mished in Your sight
      Un -- worth -- y ser -- vants though we be
      We come be -- fore You trust -- ing -- ly
}

verseB = \lyricmode {
     This sav -- ing cha -- lice too we bring
     Re -- ceive it gra -- cious -- ly O King
     With fra -- grant o -- dour may it rise
     To Your high throne a -- bove the skies.
}

verseC = \lyricmode {
      For all the liv -- ing and the dead
      For our poor lives so bad -- ly led,
      We raise these gifts to You a -- bove
      And join to them our -- selves in love.
}

verseD = \lyricmode {
      And be -- ing pleased Your gift be -- stow
      The life of grace on us be -- low
      Not just to us this bless -- ing send,
      To all the world let it ex -- tend.
}


\score {
  \new ChoirStaff <<
  \new Staff = "RH"
     <<
     \new Voice = "sopranos" {
     \voiceOne
     << \global \sop >>
     }
     >>
   \new Lyrics = sopranos \lyricsto sopranos \verseA
  \new Lyrics = sopranos \lyricsto sopranos \verseB
  \new Lyrics = sopranos \lyricsto sopranos \verseC
 \new Lyrics = sopranos \lyricsto sopranos \verseD
  \new Staff = "LH"
  <<
     \clef bass
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
