%%% The Missionary Call Chorus of Verse 1-4
%%% 


\version "2.10"

\header {

  title = \markup { \smallCaps  "The Missionary Call" }
  subtitle = "Chorus for Verses 1 to 4"
  
}
	
%%% SATB voices

global = {
  \key bes \major 
  \set Staff.midiInstrument = "acoustic grand"
  \time 2/2
}


soprano = \relative c' {
	\autoBeamOff
	
  \partial 8 bes'8 \bar "|" bes4. f8 f4 f4 \bar "|" f4 bes4 bes4^\fermata bes4\rest \bar "|" bes2\< a4 bes4 \bar "|" bes8 bes4.\!^\fermata bes2\rest \bar "|" \break
  bes2\pp bes4 bes4 a4 a4 bes4 bes4 \bar "|" bes2 f2 \bar "|" f2. bes4\rest \bar "||"
}

trebleA = \relative c' { \clef treble
	\autoBeamOff	

  bes'8 \bar "|" bes4. bes8 bes4 a4 \bar "|" bes4 c4 d4^\fermata bes4\rest \bar "|" bes2 c4 d4 \bar "|" ees8 ees4.^\fermata bes2\rest \bar "|"
  d2 d4 d4 \bar "|" c4 c4 bes4 bes4 \bar "|" ees2 a,2 \bar "|" bes2. bes4\rest \bar "||"  
}

trebleB = \relative c' { \clef treble
	\autoBeamOff

  d8 \bar "|" d4. d8 d4 c4 \bar "|" d4 ees4 f4 s4 \bar "|" f2 f4 f4 \bar "|" g8 g4. s2 \bar "|"
  f2 f4 f4 \bar "|" f4 f4 d4 d4 \bar "|" g2 f4( ees4) \bar "|" d2. s4 \bar "||" 
}


bass = \relative c { \clef bass
	\autoBeamOff

  bes8 \bar "|" bes4. bes8 bes4 bes4 \bar "|" bes4 bes4 bes4^\fermata ees4\rest \bar "|" d2 f4 bes4 \bar "|" ees,8 ees4.^\fermata ees2\rest \bar "|"
  bes2 bes4 bes4 \bar "|" f'4 f4 g4 g4 \bar "|" ees2 f2 \bar "|" bes,2. ees4\rest \bar "||"	
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
   \new Staff = "soprano" <<
      \context Voice = sopranos {\voiceOne \global \soprano }
                      >> 
   \new Staff = "treble" <<
      \context Voice = trebleA {\voiceOne \global \trebleA }
      \context Voice = trebleB {\voiceTwo \global \trebleB }
	             >> 		      
   \new Staff = "bass" <<
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
  \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4) }
       }      
     
} %%% score bracket 


