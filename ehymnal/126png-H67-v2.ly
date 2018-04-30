%%% 126png
%%% Hymn 67 Now is the healing time decreed
%%% Version 2


\version "2.10.19"

\include "gregorian-init.ly"

\header {
  dedication = \markup { \center-align {  "THE CHRISTIAN YEAR - LENT"
		\hspace #0.1 }}	
  title = "67"
  arranger = \markup { \small { "Mode iii." }}
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% macro settings for stemless long note which is 2x duration of regular white note    
ln = {\once \override NoteHead #'duration-log = #0 
           \once \override Stem #'stencil = ##f
           \once \override NoteColumn #'force-hshift = #'0.4 }	   
	   
%%%%%%%%%%%%%%%%%%%%%%%% End of Macro Definitions

%%% plainsong voice
	   
plainsong = \context VaticanaVoice  {  \relative c { 
	\clef "vaticana-do3"
	\set fontSize = #3
        \key c \major 
	
  g'8 \[ a8 \pes b8 \] \[ b8 \flexa a8 \] c8 \[ b8 \flexa a8 \] g8 a8 b8  \bar "|" g8 b8 \bar "" \break
      
  g8 a8 e8 f8 e8 d8 \bar "|" g8 b8 a8 c8 d8 \[ c8 \flexa b8 \] \bar "" \break 
  
  a8 g8 \bar "|" \[ a8 \pes c8 \] g8 a8 f8 \[ g8 \pes a8 \] g8 \[ f8 \flexa e8 \] e8 \bar "||"
	}
}

%%% SATB voices

global = {
  \key c \major 
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
	\autoBeamOff

  g'8 a8[ b8] b8[ a8] c8 b8[ a8] g8 a8 b8 \bar "|" g8 b8 

  g8 a8 e8 f8 e8 d8 \bar "|" g8 b8 a8 c8 d8 c8[ b8] 
  
  a8 g8 \bar "|" a8[ c8] g8 a8 f8 g8[ a8] g8 f8[ e8] e8 \bar "||"
}

alto = \relative c' {
	\autoBeamOff

  e8 e8[ g8] g8[ e8] g8 g8[ f8] e8 ~ e8 g8 \bar "|" d8 d8 
  
  e8 e8 c8 c8 ~ c8 b8 \bar "|" d8 g8 e8 g8 f8 \ln g4 
  
  f8 e8 \bar "|" \ln c4 e8 e8 d8 \ln e4 ~ e8 \ln c4 b8 \bar "||" 
}

tenor = \relative c { \clef bass
	\autoBeamOff

  c'8 c8[ d8] d8[ c8] c8 ~ \ln c4 c8 ~ c8 d8 \bar "|" b8 g8 
  
  b8 c8 g8 f8 g8 g8 \bar "|" b8 d8 c8 c8 a8 g8[ e'8] 
  
  c8 c8 \bar "|" \ln a4 b8 c8 a8 \ln c4 ~ c8 f,8[ g8] g8 \bar "||" 
}

bass = \relative c { \clef bass
	\autoBeamOff
	
  c'8 a8[ g8] g8[ a8] e8 ~ e8[ f8] c8 a8 g8 \bar "|" g'8 g8 
  
  e8 a,8 c8 a8 c8 g8 \bar "|" g8 g'8 a8 e8 d8 \ln e4 
  
  f8 c8 \bar "|" \ln f4 e8 a,8 d8 \ln c4 ~ c8 a8[ c8] e8 \bar "||" 
}

#(ly:set-option 'point-and-click #f)

\book {

\paper {
 #(set-paper-size "a4")
%% annotate-spacing = ##t
 print-page-number = ##f
 ragged-last-bottom = ##t
 ragged-bottom = ##t
}

%%% Score block

\score {	
  <<
  \new VaticanaStaff {\plainsong }
  \new ChoirStaff <<
   \new Staff = "upper" <<
      \context Voice = sopranos {\voiceOne \global \soprano }
      \context Voice = altos {\voiceTwo \global \alto }
                      >> 
   \new Staff = "lower" <<
      \context Voice = tenors {\voiceOne \global \tenor }
      \context Voice = bass {\voiceTwo \global \bass }
	             >> 
		 >>  
  >>

\layout {
	
  ragged-right = ##f
  ragged-last = ##f
  \context { \Score timing = ##f }
  \context { \Score \override TimeSignature #'transparent = ##t }
  \context { \Score \remove "Mark_engraver" }
  \context { \Staff \consists "Mark_engraver" }
  
  % *** Needed to produce beamed minims - which are quavers in disguise
  \context { \Staff \override NoteHead #'duration-log = #1 }
  \context { \Staff \override Stem #'flag-style = #'no-flag }
  
  \context { \VaticanaStaff
           % *** Increases distance between lines of staff  
           \override StaffSymbol #'staff-space = #1.6            
           % *** Changes staff to black instead of default red
           \revert StaffSymbol #'color
           % *** Makes clef bigger       
           \override Clef #'font-size = #3
           % *** Would make ledger lines black, if there were any
           \revert LedgerLineSpanner #'color
           % *** Makes terminal barline visible 
           \override BarLine #'transparent = ##f 
  	   % *** Remove custos
	   \remove Custos_engraver
	   % needed for certain tweaks
	   \consists "Mark_engraver"
           }
 }  %%% close layout
 
} %%% close score bracket
 
%%% A separate score block to generate the hymn midi minus the plainsong voice
%%% As the minims are quavers in disguise, the tempo has to be adjusted accodingly. Tempo is set for 2=80

\score {	
  \new ChoirStaff 
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
   
\midi { 
  \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) }
       } 
}


%%% Lyric titles

\markup { \small { \hspace #10 \smallCaps "Office Hymn." "  E." \italic "  Lent" "iii." \italic "till Passion Sunday." \hspace #12  \italic "Before 12th cent.  Tr. T. A. L." } }
	
\markup { \small { \hspace #42 \small "Ecce tempus idoneum."} }

%%% Main block of lyrics

\markup { \hspace #32 %%add space as necc. to center the column
	              \column { %%% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "N" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "OW is the healing time decreed"
                                                         "  For sins of heart, of word or deed," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "When we in humble fear record"
					   "The wrong that we have done the Lord;"
			  		}}
			           } %% finish verse 1	 
}				   
				   
%%% fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
\score{
	{s4 }
\header { breakbefore = ##f piece = ##f opus = ##f tagline = ##f }
\layout{	
	\context { \Staff
		\remove Time_signature_engraver
		\remove Key_engraver
		\remove Clef_engraver
		\remove Staff_symbol_engraver
}}}				   

%%% second page
%%% continuation of  lyrics

\markup { \hspace #32   %%add space as necc. to center the column
          \column { 
		 \hspace #1  % adds vertical spacing between verses  	
		  \line { "2  "
		    \column {	     
			    "Who, alway merciful and good,"
			    "Has borne so long our wayward mood,"
			    "Nor cut us off unsparingly"
			    "In our so great iniquity."
			}}  
		\hspace #1  % adds vertical spacing between verses   
		\line { "3  "
		    \column {	     
			    "Therefore with fasting and with prayer,"
			    "Our secret sorrow we declare;"
			    "With all good striving seek his face,"
			    "And lowly hearted plead for grace."
		}}
                 \hspace #1  % adds vertical spacing between verses 
		  \line { "4  "
		    \column {	     
			    "Cleanse us, O Lord, from every stain,"
			    "Help us the meed of praise to gain,"
			    "Till with the Angels linked in love"
			    "Joyful we tread thy courts above."
			}}
		 \hspace #1  % adds vertical spacing between verses  	
		  \line { "5. "
		    \column {	     
			    "Father and Son and Spirit blest,"
			    "To thee be every prayer addrest,"
			    "Who art in threefold Name adored,"
			    "From age to age, the only Lord.     Amen."
			}}
	  }
} %%% lyric markup bracket


%%% Amen score block

\score { 	
  <<
    <<
  \new VaticanaStaff <<
  \context VaticanaVoice = "plainsongamen"  {  \relative c { 	  
	\set Score.timing = ##f
	\override Staff.Clef #'#'font-size = #3
	\clef "vaticana-do3"
	\set fontSize = #3
	\override Staff.StaffSymbol #'staff-space = #1.6
	 
        \[ e8 \pes f8 \]   \[  
	    \override NoteHead #'extra-offset = #'(0.0 . -0.15 ) e8 
            \override NoteHead #'extra-offset = #'(-0.38 . 0.0 ) \flexa  d8 \pes 
            \override NoteHead #'extra-offset = #'(0.02 . 0.0 ) e8 \] 
                    }} 
                    >>
  
 \new Lyrics = "lyrics" { s1 }
 \new ChoirStaff
   <<
   \context Staff = upper \with {  fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
	                                              \voiceOne e8[ f8] e8[ d8 e8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo \ln c4 c8[ a8 b8] \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree g'8[ f8] g8[ f8 g8] \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour c8[ a8] c8[ f,8 e8] \bar "||" }}
			        >> 
   >>
  \context Lyrics = "lyrics" \lyricsto "altos" { \override LyricText #'font-size = #-1  \override LyricText #'self-alignment-X = #-1 A --  men. }
  >>
>>

\header { breakbefore = ##f piece = " " opus = " " }

\layout {
     indent = 13\cm
     raggedright = ##t
     packed = ##f
     \context { \Score \override TimeSignature #'transparent = ##t }
     \context { \Score \override SeparationItem #'padding = #2 }
     \context { \Staff \override VerticalAxisGroup #'minimum-Y-extent = #'( -5 . 4) }
     \context { \Score \remove "Bar_number_engraver"
		timing = ##f 
              }
     \context { \Staff \override NoteHead #'duration-log = #1 }
     \context { \Staff \override Stem #'flag-style = #'no-flag }
     \context { \VaticanaStaff %%customize vaticana staff context 
	          \revert StaffSymbol #'color
		  \revert LedgerLineSpanner #'color
		  \override BarLine #'transparent = ##f 
		  \remove Custos_engraver
 	} 
} 

} %%% close Amen score block

%%% A separate score block for the Amen midi minus the plainsong voice
%%% Score comprises 1/8 notes masquerading as 1/2 notes, so tempo has to be adjusted accordingly

\score { 	
 \new ChoirStaff
   <<
   \context Staff = upper \with {  fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                                << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
	                                              \voiceOne e8[ f8] e8[ d8 e8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo \ln c4 c8[ a8 b8] \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree g'8[ f8] g8[ f8 g8] \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour c8[ a8] c8[ f,8 e8] \bar "||" }}
			        >> 
   >>
		
\midi {  \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) }  }
}
	

} %%% book bracket