\header {
	title = "Adoremus in Aeternum"
	composer = "Trad"
	copyright = "Public Domain"
	style = "Hymn"
	lastupdated = "2016/05/15"
}
\version "2.12.0"

global = {
    \time 4/4 
    \key f \major 
}

Soprano = \relative c' { f4 g a8.( g16) f4 
a bes c8.( bes16) a4
g a8. g16 g4( f)
bes8( a) g4 a8( g) f4 \bar "||"
s2 f8 g8( a) a8 a\breve g8 a f4
a\breve f8 g8( a) g8 f4
\bar "|." } }

Alto = \relative c' { c4 e f8. e16 f4 
f f e f
e e e d d d f f 
c1 f\breve d4 c f\breve s8 d4. c4 } }

Tenor = \relative c' { a4 c c8. bes16 a4
f f g c c a a2 g8 fis g4 c8 bes a4
s2 a4 bes c\breve bes4 a4 a\breve s8 bes4. a4
\bar "|." } }

Bass = \relative c { f4 c f f
d d c f c cis d2 g,8 a bes4 c f 
f1 f\breve f4 e4 d\breve s8 bes4. f'4 } }

verseone = \lyricmode {
Ad -- o -- re -- mus in ae -- ter -- num
san -- ctis -- si -- mum Sac -- ra -- men -- tum. 
Lau -- da -- te
\once \override LyricText.self-alignment-X = #-1 
"Dominum o - " mnes gen -- tes
\once \override LyricText.self-alignment-X = #-1 
"Laudate eum," om -- nes po -- puli.
 }



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

