\header {
	title = "O Sacrament Most Holy"
	composer = "Trad"
	copyright = "Public Domain"
	style = "Hymn"
	lastupdated = "2008/1/12"
}
\version "2.12.0"

global = {
    \time 4/4 
    \partial 4  
    \key ees \major 
}

Soprano = \relative c' { bes4 g'4. f8 g4 aes bes4.( c8 ) bes4 
ees c4. c8 bes4 g f2.
bes,4 g'4. f8 g4 aes bes4.( c8) bes4 aes g g f f bes2. 
aes4 g g f f ees2.
 \bar "|." }

Alto = \relative c' { s4 ees1 ees2. bes'4 bes4. aes8 g4 ees8d c2
d4 bes4 ees1 ees1
ees2 d f2. 
ees4 f4 ees ees d ees2. }

Tenor = \relative c' { bes4 bes1 bes2. ees4 ees1 a,2 bes4 
bes4 bes1 bes2. c4 bes2 bes aes2.
c4 bes2 c4 bes8 aes g2. \bar "|." }

Bass = \relative c' { s4 ees,4. d8 ees4 f g4. aes8 g4 g aes4. f8 g4 ees ees f8 ees d4
bes4 ees4. d8 ees4 f g4. aes8 g4 
f4 ees2 d2 d2.
c4 bes c aes bes ees2. }

verseone = \lyricmode {
O Sac -- ra -- ment most Ho -- ly,
O Sac -- ra -- ment Di -- vine,
All praise and all thanks -- giv -- ing be ev -- ery mo -- ment Thine,
be ev -- ery mo -- ment Thine. }



Words = \context Lyrics = "Soprano" <<
        \context Lyrics = "Sop1" {
                \verseone
       }

>>

upper = \context Staff = "upper" <<
        \clef "treble"
        \global
        \context Voice = "Sop" {\voiceOne \Soprano}
        \lyricsto Sop \Words
        \context Voice = "Alto" {\voiceTwo \Alto}
>>

lower = \context Staff = "lower" <<
        \clef "bass"
        \global
        \context Voice = "Tenor" {\voiceOne \Tenor}
        \context Voice = "Bass" {\voiceTwo \Bass}
>>


\score {
    \context ChoirStaff <<
            \upper
            \lower
      >>  
	\midi { }
\layout {
  \context {
    \Score
  }
  }
}

