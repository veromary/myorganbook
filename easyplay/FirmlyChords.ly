\version "2.12.3"

\paper {
        #(set-paper-size "a4")
	#(define fonts
	 (make-pango-font-tree "LinuxLibertineO"
	 		       "Lucida Sans"
			       "Nimbus Mono"
			       (/ 18 18)))
        oddFooterMarkup = \markup {
          \fill-line { 
              \line { \smaller A simplified arrangement by Veronica Brandt 2011 }
              \line { \italic http://brandt.id.au }
        }}
}

#(set-global-staff-size 18)


\header {
        title = "Firmly I Believe"
        poet = "Cardinal Newman"
        composer = "David G Corner (17th Century)"
        arranger = \markup \tiny "OMNI DIE 87.87"
}

global = {
        \key c \major
        \time 4/4
        }

melody = \transpose f c \relative c' {
	\clef treble
        \tempo 4=120
        \partial 2
        f4 f g2 f a4 c bes2 a f4 g a c c2 
        \set Score.measureLength = #(ly:make-moment 6 4)
        b c1 
        \set Score.measureLength = #(ly:make-moment 4 4)
        c4 c d2 c bes4 a g2 a f4 g a bes g2. f4 f1
        } 	



bass = \relative c {
       \clef bass
       \partial 2
       <c e g>4 <c e g> <b d g>2 <c e g> <c e g>4 <c e g> <d f a>2 <c e a>
       <c e g>4 <b d g> <c e g> <b e g> <d a>1 <b d g>1
       <c e g>4 <c e g> <c f a>2 <c e g> <b d f>4 <c e g> <b d g>2 <b e g>
       <c e g>4 <b d g> <c e g> <c f a> <b d g>2 <b d f g> <c e g>1
       }

lightbass = \transpose f c \relative c {
       \clef bass
       \partial 2
       f4 d c2 f f4 f g2 f f4 c f e f e d2 c1
       f4 e d2 f2 bes,4 f'4 c bes a2 d4 c f bes, c2 c f,1
       }

WMbass = \transpose e c \relative c {
       \clef bass
       \partial 2
       e4 cis4 b2 e e4 gis, fis2 gis cis4 b e gis fis2 fis b,1
       e4 gis a2 gis fis4 e b2 gis cis4 b e cis a2 b e1
       }



firstVerse = \lyricmode {
    Firm -- ly I be -- lieve and tru -- ly
    God is Three and God is One
    And I next ac -- know -- ledge du -- ly
    Man -- hood ta -- ken by the Son.
}

secondVerse = \lyricmode {
    \set stanza = "2. " And I trust and hope most ful -- ly
                       In that Man -- hood cru -- ci -- fied
                       And each thought and deed un -- ru -- ly
                       Do to death as He has died.
}

sopWordsThree = \lyricmode
{
    \set stanza = "3. " Simp -- ly to His grace and whol -- ly
                       Light and life and strength be -- long
                      And I love su -- preme -- ly, sole -- ly
                     Him the ho -- ly, Him the strong.
}
sopWordsFour = \lyricmode
{
    \set stanza = "4. " And I hold in ve -- ne -- ra -- tion,
                       For the love of Him a -- lone,
                      Ho -- ly Church as His cre -- a -- tion,
                     And her teach -- ings, as His own.
}
sopWordsFive = \lyricmode
{
    \set stanza = "5. " Ad -- o -- ra -- tion aye be giv -- en,
                       With and through th'an -- gel -- ic host,
                      To the God of earth and heav -- en
                     Fa -- ther, Son and Ho -- ly Ghost.
}

\score {
	\new ChoirStaff <<
	\new Staff = melody { \new Voice = "singer" \autoBeamOff \global \melody }
                           
	\new Lyrics \lyricsto "singer" \firstVerse
	\new Lyrics \lyricsto "singer" \sopWordsThree
	\new Lyrics \lyricsto "singer" \sopWordsFive
	\new Staff = bass << 
                             \new Voice \global \bass 
                          >>
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

\score {
	\new ChoirStaff <<
	\new Staff = melody { \new Voice = "singer" \autoBeamOff \global \melody }
                           
	\new Lyrics \lyricsto "singer" \secondVerse
	\new Lyrics \lyricsto "singer" \sopWordsFour
	\new Staff = bass << 
                             \new Voice \global \lightbass 
                          >>
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

