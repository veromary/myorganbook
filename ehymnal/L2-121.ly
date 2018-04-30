%%%% 193.png
%%%% Hymn 121. O Mensch sieh By Jesus' grave on either hand
%%%% Rev 1.

\version "2.10"
\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - GOOD FRIDAY AND EASTER EVEN"
	\hspace #0.1 }}	
	
  title = "121"
  
    meter = \markup { \small {\column {  \line { \sans { \smallCaps "O MENSCH SIEH."} \hspace #1 \roman {"(8 8 8.)"}}
                                       \line { \italic {Very slow}  \general-align #Y #DOWN \note #"2" #0.5 = 66.}
                                  }
        }}
 
  arranger =  \markup { \small {\center-align {
		            \line{ \italic "Bohemian Brethren" }
			    \line { \italic "‘Gesangbuch,’ 1566."  }
  	}}}

  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% generates the breathmarks

breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.05		  

%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-3.6
              \once \override Stem #'X-offset = #-3.6 }
	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions
%%% SATB voices

global = {
  \time 3/1
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {  
  \partial 2*3 a'2 a a | g1. f2 g bes | a1. \bar "||" c2 d a | \break
  c1. a2 g a | f1. \breathmark \bar "||" a2 a a | g1. f2 d e | d1. \bar "||"
} 
   
alto = \relative c' {  
  f2 f f | e1. f2 e d | c1. \bar "||" f2 f f |
  e1. e2 d e | \straddle e1( d2) \bar "||" c f2. e4 | d1. c2 d cis | \merge d1. \bar "||"
}

tenor = \relative c {\clef bass  
  c'2 c c | c1. c2 c f, | f1. \bar "||" a2 bes a | 
  a1. a2 d c | a1. \bar "||" a2 c c | bes1. c2 f, a | f1. \bar "||"
}

bass = \relative c {\clef bass  
  f2 f f | c1. a2 c bes | \merge f'1. \bar "||" f2 bes, d |
  a1. c2 bes c | d1. \bar "||" f2 f f, | g1. a2 bes a | d1.  \bar "||"
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
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %% close layout
	
%%% Hymn Midi	

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2)}} 

} %%% Score bracket

%%% Lyrics titles

\markup { \small { \hspace #78 \italic "Isaac Gregory Smith." } }

\markup { ""}

%%% Main lyrics markup block
%%% Lyrics in 3 columns,  column 1 (verses), column 2 (a dividing line), column 3 (verses); 

\markup { \hspace #2 %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "B" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "Y Jesus' grave on either hand,"
			                                 "  While night is brooding o'er the land," } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "The sad and silent mourners stand."
			  		}}
			       
			           } %%% finish verse 1
		        \hspace #1 
           		\line { "2  "
			   \column {	     
				   "At last the weary life is o'er,"
				   "The agony and conflict sore"
				   "Of him who all our sufferings bore."
			}}
		}  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -16 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
 
           		\line { "3  "
			  \column {	     
				  "Deep in the rock's sepulchral shade"
				  "The Lord, by whom the world was made,"
				  "The Saviour of mankind, is laid."
			}}
		        \hspace #1 
           		\line {"4. "
			  \column {	     
				  "O hearts bereaved and sore distrest,"
				  "Here is for you a place of rest;"
				  "Here leave your griefs on Jesus' breast."
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
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne d1 d \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo bes1 a \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree g'1 fis \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  g1 d' \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
      \context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       } %% close layout

%%% Amen Midi

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2) }} 

}

%%% Markups of hymns for Easter

\markup { \hspace #48 "EASTER" }

\markup {""}

\markup { \small { \line { \hspace #30 \italic "See also:" \hspace #1 \column { "624  Hail thee, Festival Day."
	            					        "625  The strife is o'er, the battle done."
		     						"626  Ye sons and daughters of the King."
								"627  The Lord is risen indeed." }}}}

\markup { \hspace #52 \center-align { \hspace #1
	\line { \italic "There is no Office Hymn till Low Sunday, but 738" "This is the Day" \italic "may be sung in the" } 
\line { \italic "place of the Office Hymn at Evensong on Easter-Day and till the Saturday following." }
}}
	  


} %%% book bracket
