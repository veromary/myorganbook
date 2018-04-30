%%%% 314a.png
%%%% Hymn 197 Song 67. Give me wings of faith to rise.
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "SAINTS' DAYS: GENERAL - FOR ANY SAINTS' DAY"
	\hspace #0.1 }}	
	
  title = "190"   
  
  poet = \markup { \small {  \line { \sans { "SONG 67."} \hspace #1 \roman {"(C. M.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"2" #0.5 = 72.} }
  
  arranger = \markup { \small \smallCaps "O. Gibbons, 1588-1625." }
  
  tagline = ""
}


%%%%%%%%%%%%%%%%%%Macros

%%generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01

%%%%%%%%%%%%%%%%%End of Macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key d \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 1 d1 | a'2 fis2 g2 a2 | b2 b2 a2 \breathmark \bar "||" a2 | d2 b2 cis2 cis2 | b1. \bar "||" \break
  d2 | cis2 b2 a2 a2 | g2 fis2 e2 \breathmark \bar "||" a2 | a2 d,2 fis2 e2 | d1 \bar "||" 
} 
   
alto = \relative c' {  
  \merge d1 \bar "|" e2 d2 d2 fis2 \bar "|" fis2 e2 fis2 \bar "||" d2 \bar "|" d2 fis2 fis2. e4 \bar "|" d1. \bar "||" 
  d4 ( e4 ) \bar "|" fis2 g2 fis2 d2 \bar "|" b4 ( cis4 ) d2 cis2 \bar "||" cis2 \bar "|" e2 d2 d2 cis2 \bar "|" \merge d1 \bar "||"  
}

tenor = \relative c {\clef bass 
  fis1 | a2 a2 d2 cis2 | b2 cis2 d2 \bar "||" fis,2 | fis2 b2 b2 ais2 | b1. \bar "||" 
  fis4 ( g4 ) | a2 b4 ( cis4 ) d2 fis,2 | g2 a2 a2 \bar "||" a2 | a4 ( g4 ) fis2 a2. g4 | fis1 \bar "||" 
}

bass = \relative c {\clef bass 
  d1 | cis2 d2 b2 a2 | g2 g2 d'2 \bar "||" d2 | b2 d2 fis2 fis2 | b,1. \bar "||" 
  b2 | a2 g2 d'2 fis2 | e2 d2 a2 \bar "||" a4 ( b4 ) | cis2 d2 a2 a2 | d1 \bar "||"
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
	\context Voice = altos    { \voiceTwo \global \alto }
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \tenor }
	\context Voice = basses { \voiceTwo \global \bass }
			        >>
>>
\layout {
		indent=0
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %% close layout

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 72 2) }}      
  	
	
} %%% Score bracket

%%% Lyric titles and attributions

\markup { \small { \hspace #80 \italic "I. Watts, 1674-1748." } }


%%% Main lyric block
%%% To fit on one page, lyrics are in 3 columns: column 1 (verses ), column 2 (a dividing line), column 3 (verses); centred last (fifth) verse.

\markup { \hspace #6  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "G" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "IVE me the wings of faith to rise"
			                                 "  Within the veil, and see" } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "The Saints above, how great their joys,"
					   "    How bright their glories be."
					   "                  " %%% blank space before next verse
			  		}} 
			         } %%% finish verse 1 
           		\line { "2  "
			   \column {	     
				  "Once they were mourning here below,"
				  "    And wet their couch with tears;"
				  "They wrestled hard, as we do now,"
				  "    With sins and doubts and fears."
				  "                  " %%% blank space before next verse
			}}
		}  %% finish Page column 1
		
	\hspace #2 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -22 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #2 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
			\line {"3  "
			   \column {	     
				   "I ask them whence their victory came;"
				   "    They, with united breath,"
				   "Ascribe their conquest to the Lamb,"
				   "    Their triumph to his death."
                                   "                  " %%% blank space before next verse
			}} 
			\line {"4  "
			    \column {
				    "They marked the footsteps that he trod,"
				    "    His zeal inspired their breast,"
				    "And, following their incarnate God,"
				    "    Possess the promised rest."
				    "                  " %%% blank space before next verse
			}}
	    } %%% end column 3
     } %%% end master-line
     			\line { \hspace #24 "5. "
			     \column {	     
				     "Our glorious Leader claims our praise"
				     "    For his own pattern given"
				     "While the long cloud of witnesses"
				     "    Show the same path to heaven."				                                   
     			}}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 72 2) }}  %%Amen midi       
       
}  


} %%% book bracket

