
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
        title = \markup "Sweet Sacrament"
	composer = "Fr F Stanfield"
	poet = "Fr F Stanfield"
	tagline = \markup { \fill-line { 
	                       \line { VB 2011 } 
			       \line { \italic brandt.id.au } } }
}

global = {
    \key c \major
    \time 3/2
}

sop = \transpose d c \relative c' {
       
       \partial 2 fis2 a2. g4 e fis d1 fis2 b,2. cis4 d e fis2( e)
       fis2 a2. g4 e fis d1 fis2 g2. g4 fis e d1
       d2 d'2. d4 cis b a4. g8 fis2.
       fis4 b2. b4 a fis e d e2
       fis2 a2. g4 e fis d1 fis2 g2. g4 fis e d1 \bar "||" 
       
       }
      
bass = \transpose d c \relative c {

       \partial 2 d2 d2. g,4 a a b1 a2 g2. g4 fis g a1
       d2 cis2. b4 g a b1 b2 g'2. e4 a,4 a d1 
       d2 b2. b'4 a g fis4. e8 d2.
       d4 g2. g4 fis b, e e a,2 
       d2 cis2. b4 g a b1 b2 g'2. e4 a,4 a d1
       }


verseA = \lyricmode {
   Sweet Sa -- cra -- ment di -- vine, hid in Thy earth -- ly home,
   Lo! round Thy low -- ly shrine, with sup -- pliant hearts we come.
   Je -- sus, to Thee our voice we raise, In songs of love and heart -- felt praise,
   Sweet  Sa -- cra -- ment di -- vine, sweet Sa -- cra -- ment di -- vine.  
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
