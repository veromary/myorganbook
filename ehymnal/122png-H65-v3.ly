%%% 122png
%%% Hymn 65 The fast as taught by holy lore
%%% Version 3


\version "2.10.19"

\include "gregorian-init.ly"

\header {
  dedication = \markup { \center-align {  "THE CHRISTIAN YEAR - LENT"
		\hspace #0.1 }}	
  title = "65"
  arranger = \markup { \small { "Mode i." }}
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
	\clef "vaticana-fa2"
	\set fontSize = #3
        \key c \major 
	
  e8 g8 \[ g8 \pes a8 \] a8 \[ g8 \flexa f8 \] g8 g8 a8 \bar "|" g8 e8 f8 g8 \bar "" \break

  \[ f8 \flexa e8 \] d8 \[ c8 \pes e8 \] e8 \bar "|" e8 g8 \[ g8 \pes a8 \] \[ a8 \flexa g8 \] \[ e8 \flexa d8 \] f8 \bar "" \break 

  \[ e8 \flexa d8 \] \[ d8 \pes e8 \] \bar "|" c8 \[ f8 \flexa e8 \] \[ f8 \pes g8 \] \[ f8 \flexa e8 \] c8 \[ e8 \pes f8 \] d8 d8 \bar "||"
}
}

%%% SATB voices

global = {
  \key ees \major 
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
	\autoBeamOff

  g'8 bes8 bes8[ c8] c8 bes8[ aes8] bes8 bes8 c8 \bar "|" bes8 g8 aes8 bes8 \bar "" \break
  
  aes8[ g8] f8 ees8[ g8] g8  \bar "|" g8 bes8 bes8[ c8] c8[ bes8] g8[ f8] aes8 \bar "" \break
  
  g8[ f8] f8[ g8] \bar "|" ees8 aes8[ g8] aes8[ bes8] aes8[ g8] ees8 g8[ aes8] f8 f8 \bar "||"
}

alto = \relative c' {
	\autoBeamOff

  ees8 ees8 \ln ees4 ees8 ees8[ c8] \ln ees4 ~ ees8 \bar "|" ees8 ees8 ees8 d8 \bar "" \break
  
  \ln ees4 ~ c8 c8[ ees8] d8 \bar "|" ees8 ees8 ~ \ln ees4 ~ \ln ees4 ~ ees8[ d8] ees8 \bar "" \break
  
  ees8[ d8] \ln d4 \bar "|" c8 
      \once \override NoteHead #'duration-log = #-1  
      \once \override NoteColumn #'force-hshift = #1
      ees\breve*1/4
      ~ \ln ees4 bes8 \ln ees4 des8 c8 \bar "||"
}

tenor = \relative c { \clef bass
	\autoBeamOff

  bes'8 g8 \ln g4 aes8 g8[ f8] \ln g4 ~ g8 \bar "|" g8 bes8 aes8 f8 \bar "" \break
  
  \ln aes4 ~ aes8 aes8[ bes8] bes8 \bar "|" bes8 g8 ~ \ln g4 ~ \ln g4 \ln bes4 c8 \bar "" \break
  
  \ln bes4 \ln bes4 \bar "|" g8 
      \once \override NoteHead #'duration-log = #-1  
      \once \override NoteColumn #'force-hshift = #1
      ees\breve*1/4
      aes8[ bes8] g8 bes8[ c8] bes8 aes8 \bar "||" 
}

bass = \relative c { \clef bass
	\autoBeamOff
	
  ees8 ees8 ees8[ c8] aes8 ees'8[ f8] ees8 ees8 c8 \bar "|" ees8 ees8 c8 bes8 \bar "" \break
  
  \ln c4 f8 aes8[ ees8] g8 \bar "|" ees8 ees8 ees8[ c8] c8[ ees8] ees8[ bes8] aes8 \bar "" \break
  
  ees'8[ bes8] bes8[ g8] \bar "|" c8  
      \once \override NoteHead #'duration-log = #-1  
      \once \override NoteColumn #'force-hshift = #1
      c\breve*1/4
      ~ c8[ ees8] ees8 ees8[ aes,8] bes8 f'8 \bar "||" 
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


%%% Text markups - lyric titles

\markup { \small { \hspace #10 \smallCaps "Office Hymn." "  E." \italic "  Till Lent" "iii." \hspace #25  \italic "c. 6th cent.  Tr. J. M. Neale." } }
		                                                                                                     
\markup { \hspace #42 \small "Ex more docti mystico."} 

%%% Main lyrics markup block
  
\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.2   %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HE fast, as taught by holy lore,"  " We keep in solemn course once more:"} }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "The fast to all men known, and bound"
					   "In forty days of yearly round."
			  		}}
			       
			           } %% finish stanza 1	
		
		}  
}	  

%%%fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
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
%%% Continuation of lyrics

\markup { \hspace #30   %%add space as necc. to center the column
          \column { 
		 \hspace #1 
           	\line { "2  "
			   \column {	     
				   "The law and seers that were of old"
				   "In divers ways this Lent foretold,"
				   "Which Christ, all seasons' King and guide,"
				   "In after ages sanctified."
			}}
		  \hspace #1 
		  \line { "3  "
		    \column {	     
			    "More sparing therefore let us make"
			    "The words we speak, the food we take,"
			    "Our sleep and mirth,—and closer barred"
			    "Be every sense in holy guard."
			}}
		\hspace #1 % adds vertical spacing between verses  
           	\line {"4  "
		    \column {	     
			    "In prayer together let us fall,"
			    "And cry for mercy, one and all,"
			    "And weep before the Judge's feet,"
			    "And his avenging wrath entreat."
			}} 
		\hspace #1 % adds vertical spacing between verses  
           	\line {"5  "
		    \column {	     
			    "Thy grace have we offended sore,"
			    "By sins, O God, which we deplore;"
			    "But pour upon us from on high,"
			    "O pardoning One, thy clemency."
		}}
		\hspace #1 % adds vertical spacing between verses  
           	\line {"6  "
		    \column {	     
			    "Remember thou, though frail we be,"
			    "That yet thine handiwork are we;"
			    "Nor let the honour of thy name"
			    "Be by another put to shame."
		}}
		\hspace #1 % adds vertical spacing between verses  
           	\line {"7  "
		    \column {	     
			    "Forgive the sin that we have wrought;"
			    "Increase the good that we have sought;"
			    "That we at length, our wanderings o'er,"
			    "May please thee here and evermore."
		}}
		\hspace #1 % adds vertical spacing between verses  
		\line {"8. "
		    \column {	     
			    "We pray thee, Holy Trinity,"
			    "One God, unchanging Unity,"
			    "That we from this our abstinence"
			    "May reap the fruits of penitence.     Amen."
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
	\clef "vaticana-fa2"
	\set fontSize = #3
	\override Staff.StaffSymbol #'staff-space = #1.6
	 
        \[ d8 \pes e8 \]   \[  
	    \override NoteHead #'extra-offset = #'(0.0 . -0.15 ) d8 
            \override NoteHead #'extra-offset = #'(-0.38 . 0.0 ) \flexa  c8 \pes 
            \override NoteHead #'extra-offset = #'(0.02 . 0.0 ) d8 \] 
                    }} 
                    >>
  
 \new Lyrics = "lyrics" { s1 }
 \new ChoirStaff
   <<
   \context Staff = upper \with {  fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
	                                              \voiceOne f8[ g8] f8[ ees8 f8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo c8[ ees8] \ln c4 ~ c8 \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree aes'8[ bes8] aes8[ g8 aes8] \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour f8[ ees8] f8[ c8 f,8] \bar "||" }}
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
	                                              \voiceOne f8[ g8] f8[ ees8 f8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo c8[ ees8] \ln c4 ~ c8 \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree aes'8[ bes8] aes8[ g8 aes8] \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour f8[ ees8] f8[ c8 f,8] \bar "||" }}
			        >> 
   >>
		
\midi {  \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) }  }
}
	

} %%% book bracket