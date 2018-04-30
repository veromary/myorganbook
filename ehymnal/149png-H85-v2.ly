%%%149.png
%%%Hymn 85 Harington (Retirement) O Thou from whom all goodness flows
%%%Version 2

\version "2.10"

\header {

  dedication = \markup { \center-align { \line {  "THE CHRISTIAN YEAR - LENT" } 
					       \hspace #1
						} }	
  title = "85"
			       
  arranger = \markup { \small { \smallCaps "H. Harington, 1727-1816."} }
  poet = \markup { \small { \sans  "HARINGTON" \smallCaps "(Retirement)." \hspace #1 \roman { "(C. M.)"} } }
  meter = \markup { \small { \italic {Moderately slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 80.} }
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% Macro to specify restart of a new measure in the middle of a piece.
%%% Needed to restart a new measure after a partial measure.
%%% In this case, the macro specifies that 0 1/2 notes in a 4/2 measure have past,
%%% hence we are at the beginning of a new measure

startmeasure =  \set Score.measurePosition = #(ly:make-moment 0 2)

%%% generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01		      

push = \once \override NoteColumn #'force-hshift = #0.6

%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.0
              \once \override Stem #'X-offset = #-2.0 }


%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro definitions	   
	      
%%% SATB voices

global = {
  \time 3/2
  \key d \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
  \partial 2 a'2 | d( cis) b | a2.( g4) fis2 | g( a) b | b( a) \breathmark \bar "||" 
      a | a( gis) a | fis4( b4 a2) gis2 | a1 \breathmark \bar "||" \break
  e4( a4) | a2( g) fis | fis( e) d | e4.( fis8 g2) fis2 | b1 \breathmark \bar "||"
      a4( d4) | d2( cis) d2 | e,4( g fis2) e | d1 \bar "||" 
}

alto = \relative c' {
  fis2 | d( e) fis | e( cis) d | d( fis) g | g( fis) \bar "||"
      e | e( d) e | fis( e) e4( d) | cis1 \bar "||"
  cis4( fis) | fis2( e) d | d( cis) d | cis( e) d | d1 \bar "||"
      d2 | \push g1 fis2 | b,4( e d2) cis | \merge d1 \bar "||" 
}

tenor = \relative c { \clef bass
  d'2 | a( g) fis | \push a1 a2 | d1 d2 | d1 \bar "||"
      a2 | a2( b) cis | d( cis) b | a1 \bar "||"
  a2 | a1 a2 | \once \override NoteHead #'X-offset = #1.4 a1 a2 | g( a) a | g1 \bar "||"
      a2 | \push a1 a2 | b2( a) a | fis1 \bar "||"
}

bass = \relative c { \clef bass
  d2 | fis( e) d | cis( a) d | b( a) g | d'1 \bar "||"
      cis2 | cis( b) a | d \push e1 | a,1 \bar "||"
  a2 | a1 d4( a') |  \straddle a2( g) fis | e( cis) d | \merge g1 \bar "||" 
      fis2 | e( a,) d |  g( a) a, | d1 \bar "||"    
}


#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##t
}

\book{

%%% Score block	
	
\score{
\new ChoirStaff	
 <<

	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \soprano }
	\context Voice = altos    {\voiceTwo \global \alto }
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \tenor }
	\context Voice = basses { \voiceTwo \global \bass }
			        >> 
 >>
\layout {
		indent=0
%		\context { \Score timing = ##f }
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	}

\midi { 
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 2) }
       }	
} %%score bracket

%%% Lyrics titles

\markup { \small { \hspace #74 \italic "T. Haweis, 1732-1820, and others." } }

%%% Main lyrics markup block
%%% Lyrics in 3 columns,  column 1 (verses), column 2 (a dividing line), column 3 (verses)

\markup { \hspace #4 %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
				  \hspace #-1.6    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "  THOU from whom all goodness flows,"
			                                 "  I lift my heart to thee;" } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "In all my sorrows, conflicts, woes,"
					   "    Dear Lord, remember me."
			  		}}
			       
			           } %%% finish verse 1
		        \hspace #1 
           		\line { "2  "
			   \column {	     
				   "When on my poor distressèd heart"
				   "    My sins lie heavily,"
				   "Thy pardon grant, new peace impart:"
				   "    Dear Lord, remember me."
			}}
			\hspace #1 
           		\line { "3  "
			   \column {	     
				   "When trials sore obstruct my way,"
				   "    And ills I cannot flee,"
				   "O let my strength be as my day:"
				   "    Dear Lord, remember me."
			}}
		}  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -36 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
 
           		\line { "4  "
			  \column {	     
				  "If, for thy sake, upon my name"
				  "    Shame and reproaches be,"
				  "All hail reproach and welcome shame:"
				  "    Dear Lord, remember me."
			}}
		        \hspace #1 
           		\line {"5  "
			  \column {	     
				  "If worn with pain, disease, or grief"
				  "    This feeble spirit be;"
				  "Grant patience, rest, and kind relief:"
				  "    Dear Lord, remember me."
			}}
			\hspace #1 
           		\line {"6. "
			  \column {	     
				  "And O, when in the hour of death"
				  "    I wait thy just decree,"
				  "Be this the prayer of my last breath:"
				  "    Dear Lord, remember me."
			}}
	    } %%% end column 3
     } %%% end master-line
   } %%% super column bracket
} %%% lyrics markup bracket

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne d1 d1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo b1 a1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree g'1 fis1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  g1 d'1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

%%% Amen midi       
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 2) }}   
       
}  

} %%book bracket