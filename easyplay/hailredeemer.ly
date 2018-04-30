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
        title = "Hail Redeemer"
        poet = "Patrick Brennan (1877-1951)"
        composer = "Gratan Flood (1859-1928)"
}

% can lower it to bes \major (2 flats)

global = {
       \key c \major
}

melody = \relative c' {
	\clef treble
	\time 4/4
        e4. e8 f4 e d4. a'8 a4 r4 g4 f e c e4. d8 d4 r4
        e4. e8 f4 e d4. a'8 a4 r4 g c, d e d4. c8 c4 r4
        g'4. g8 c4 b b4. a8 a4 r4 a4. a8 d4 b a4. g8 g4 r4 
        c4. b8 a4 a d4. c8 b4 r4 g4. g8 a4 c c b c2 
        } 	

bass = \relative c {
       \clef bass
       c4. c8 c4 c f4. f8 f4 r4 e d c a g4. g8 g4 r4
       c4. c8 c4 c f4. f8 f4 r4 e e d c f, g c r4
       c4. c8 e4 e f4. f8 f4 r4 d2 b'4 g c, d g r4
       c,4 e f e d fis g f e4. c8 f4 a g g c,2
       }

firstVerse = \lyricmode {
   Hail Re -- deem -- er, King Di -- vine!
   Priest and Lamb the throne is Thine,
   King whose reign shall ne -- ver cease,
   Prince of e -- ver -- last -- ing peace.
   An -- gels Saints and Na -- tions sing;
   Praised be Je -- sus Christ our King;
   Lord of life, earth, sky and sea,
   King of Love on Cal -- va -- ry.
}

\score {
	\new GrandStaff <<
	\new Staff = melody { \new Voice = "singer" \autoBeamOff \global \melody }
	\new Lyrics \lyricsto "singer" \firstVerse
	\new Staff = bass { \global \bass }
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

