\version "2.12.0"


\paper {
        #(set-paper-size "a4")
	#(define fonts
	 (make-pango-font-tree "LinuxLibertineO"
	 		       "Lucida Sans"
			       "Nimbus Mono"
			       (/ 23 23)))
        ragged-last-bottom = ##t
}

#(set-global-staff-size 23)

\header {
  title = "Hymn to St. Mary of the Cross"
  subtitle = "Easy version"
  poet = "Veronica Brandt (1979-)"
  meter = \markup \tiny "L.M."
  composer = "Edward Miller (1731-1807)"
  arranger = \markup \tiny "ROCKINGHAM"
  copyright = \markup \center-column {
    \line {
      Copyright © 2011
      \with-url #"http://www.brandt.id.au/"
      {
        Veronica Brandt
        (http://www.brandt.id.au/)
      }
    }
    \line {
      This edition may be freely distributed,
      edited, performed or recorded.
    }
  }
  tagline = \markup {
    Engraved at
    \simple #(strftime "%d-%m-%Y" (localtime (current-time)))
    with \with-url #"http://lilypond.org/web/"
    { LilyPond \simple #(lilypond-version) (http://lilypond.org/) }
  }
}

\layout {
  indent = #10
  \context {
    \Score
    \remove "Bar_number_engraver"
  }
}

stanzaOne = \lyricmode {
  \set stanza = "1."
  O Mo -- ther Ma -- ry of the Cross
  The first Aus -- tra -- lian saint, we hail
  Thy work to lead the poor to truth
  A -- wak -- ing mer -- cy in thy trail.
}

stanzaTwo = \lyricmode {
  \set stanza = "2."
  To Jo -- seph's aid thou e -- ver turned
  Strong in the faith that he would be
  An ad -- vo -- cate to that dear heart
  That bled and died u -- pon the Tree
}

stanzaThree = \lyricmode {
  \set stanza = "3."
  The Tree of Life, the Cross of death
  To which thy name and life were bound
  The pa -- ra -- dox that pain and strife
  To e -- ver -- last -- ing joy re -- dound.
}

stanzaFour = \lyricmode {
  \set stanza = "4."
  O Ma -- ry! in -- ter -- cede for us
  And form us to His ho -- ly Will
  With Fa -- ther and the Ho -- ly Ghost
  And Heart of Je -- sus burn -- ing still.
}

global = {
  \key c \major
  \time 3/4
  \partial 4
  #(set-accidental-style 'modern)
}

mel = \transpose d c \relative c' {
  d4 fis( g) e d2 fis4 a2 b4 a2
  a4 d2 cis4 b2 a4 a( g) fis fis( e)\fermata
  e a2 b4 cis2 a4 d( fis,) gis a2
  d,4 g2 fis4 e2 d4 d8( e8 fis4) e d2\fermata
}


% EEN
sop = {
  \mel
  \bar "||"
}

alt = \relative c' {
  d4 d2 cis4 d2 d4 d2 d8( e) fis2
  fis4 d2 fis4 g2 d4 e2 d4 d( cis)
  cis e2 e4 e2 cis4 d2 d4 cis2
  d4 d( cis) d b2 d4 d2 cis4 d2
}

ten = \relative c {
  fis4 a( b) a fis2 a4 a( d) b8( cis) d2
  d4 a2 a4 b2 d4 a2 a4 a2
  a4 a2 gis4 a2 a4 a2 e4 e2
  a4 g2 a4 b2 a4 fis( a4.) g8 fis2
}

wilbertbas = \transpose d c \relative c {
  d4 d( g,) a d2 d4 fis2 g4 d2
  d4 fis2 d4 g2 fis4 cis2 d4 a2
  a4 cis2 e4 a2 g4 fis( d) e a,2
  fis'4 e2 d4 g,2 fis4 a2 a4 d2\fermata
}


bas = \transpose ees c \relative c {
   ees4 g( aes,) bes ees2 c4 g2 aes4 ees'2
   d4 ees( f) g aes2 g4 d2 ees4 
   bes2 bes4 bes( d) f bes2 aes4 g ees f bes,2 g'4 f2 ees4
   bes2 c4 bes( bes) bes ees2 \bar "||"
}

scoreOne = \new ChoirStaff <<
  \new Staff = "RH"
  << 
    \new Voice = "sop" { << \global \sop >> }
  >>
  \new Lyrics \lyricsto "sop" \stanzaOne
  \new Lyrics \lyricsto "sop" \stanzaTwo
  \new Lyrics \lyricsto "sop" \stanzaThree
  \new Lyrics \lyricsto "sop" \stanzaFour
  \new Staff = "LH"
  <<
    \clef bass
    \global \bas 
  >>
>>


\score { \scoreOne 
\midi { } }


