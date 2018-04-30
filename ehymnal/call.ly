%%% The Missionary Call
%%% 


\version "2.10"

\header {

  title = \markup { \smallCaps  "The Missionary Call" }

  subtitle = "1st Verse" 
}
	
%%% SATB voices

global = {
  \key bes \major 
  \set Staff.midiInstrument = "acoustic grand"
  \time 4/4
}


soprano = \relative c' {
	\autoBeamOff
	
	\unfoldRepeats { \repeat volta 17 {d8} } \bar "|" 
	ees4 ees4 	\bar "|" 
	\unfoldRepeats { \repeat volta 4 {e8} } \bar "|" 
	f1 \bar "|" 
	\unfoldRepeats { \repeat volta 7 {f8} } \bar "|" 
	g2 e!2 \bar "|" 
	f1 \bar "||"

}

alto = \relative c' {
	\autoBeamOff	

	\unfoldRepeats { \repeat volta 17 {bes8} } \bar "|" 
	bes4 bes4 	\bar "|" 
	\unfoldRepeats { \repeat volta 4 {c8} } \bar "|" 
	c1 \bar "|" 
	\unfoldRepeats { \repeat volta 7 {d8} } \bar "|" 
	d2 c2 \bar "|" 
	c1 \bar "||"

}

tenor = \relative c { \clef bass
	\autoBeamOff

	\unfoldRepeats { \repeat volta 17 {f8} } \bar "|" 
	g4 g4 	\bar "|" 
	\unfoldRepeats { \repeat volta 4 {g8} } \bar "|" 
	a1 \bar "|" 
	\unfoldRepeats { \repeat volta 7 {a8} } \bar "|" 
	bes2 bes2 \bar "|" 
	a1 \bar "||"

}


bass = \relative c { \clef bass
	\autoBeamOff

	\unfoldRepeats { \repeat volta 17 {bes8} } \bar "|" 
	ees4 ees4 	\bar "|" 
	\unfoldRepeats { \repeat volta 4 {c8} } \bar "|" 
	a1 \bar "|" 
	\unfoldRepeats { \repeat volta 7 {d8} } \bar "|" 
	bes2 c2 \bar "|" 
	f1 \bar "||"
}


#(ly:set-option 'point-and-click #f)

\paper {
 #(set-paper-size "a4")
%% annotate-spacing = ##t
 print-page-number = ##f
 ragged-last-bottom = ##t
 ragged-bottom = ##t
}

\score {	
  <<
   \new Staff = "upper" <<
      \context Voice = sopranos {\voiceOne \global \soprano }
      \context Voice = altos {\voiceTwo \global \alto }
                      >> 
   \new Staff = "lower" <<
      \context Voice = tenors {\voiceOne \global \tenor }
      \context Voice = bass {\voiceTwo \global \bass }
	             >> 
  >>

\layout {
  indent=0	
  ragged-right = ##f
  ragged-last = ##f
  \context { \Score timing = ##f }
%  \context { \Score \override TimeSignature #'transparent = ##t }
   \context { \Score \remove "Mark_engraver" }
   \context { \Staff \consists "Mark_engraver" }
  
     }

\midi { 
  \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 4) }
       }      
     
} %%% score bracket 


