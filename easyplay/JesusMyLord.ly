
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
        title = \markup "Jesus, my Lord, my God, my all"
	composer = "German Melody arr P Jones"
	poet = "F W Faber (1814-63)"
	tagline = \markup { \fill-line { 
	                       \line { VB 2011 } 
			       \line { \italic brandt.id.au } } }
}

global = {
    \key c \major
    \time 3/4
}

sop = \transpose d c \relative c'' {
       
       a4 fis d d( cis) d e( a) g g( fis2)
       fis4 e d g2 e4 d2 cis4 d2. 
       a'4 fis d d( cis) d e( a) g g( fis2)
       fis4 e d g2 e4 d2 cis4 d2. 
       a'4 a a b2 b4 cis2 cis4 d2.
       a4 g fis b2 g4 e( a) g g( fis2)
       fis4 e d g2 e4 d2 cis4 d2. \bar "||"

       }
      
SRbass = \transpose d c \relative c {
       
       fis4 d fis e2 d4 cis( a) cis d2.
       d4 a b e,2 g4 a2 a4 d2.
       fis4 d fis e2 d4 cis( a) cis d2.
       d4 a b e,2 g4 a2 a4 d2.
       d4 e fis e( fis) e a,( a') g fis2.
       d4 e fis g2 e4 a( a,) cis d2.
       d4 a b e,2 g4 a2 a4 d,2.

       }

bass = \transpose ees c \relative c {
   
       ees2. f2 ees4 bes2. ees2. 
       ees2. c2 aes4 bes2 bes4 ees2.
       ees2 c4 bes4( aes) g bes( c) d4 ees2.
       ees4 b c aes2 aes4 bes2 bes4 ees2.
       g,2. aes2. bes c
       g'4 f ees aes,2 aes4 bes( c) d ees2.
       ees2. c2 aes4 bes2 bes4 ees2.

}


verseA = \lyricmode {
        
      Je -- sus, my Lord, my God, my all,
      How can I love Thee as I ought?
      And how re -- vere this won -- drous gift,
      So far sur -- pass -- ing hope or thought?
      Sweet Sa -- cra -- ment, we Thee a -- dore;
      Oh, make us love Thee more and more.
      Oh, make us love Thee more and more.

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
