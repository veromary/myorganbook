%%% 146png
%%% Hymn 82 Stockton O For a heart to praise my God
%%% Version 1

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - LENT"
		\hspace #0.1 }}	
  title = "82"
  meter = \markup { \small {\column {  \line { \sans {"STOCKTON."} \hspace #1 \roman {"(C. M.)"}}
                                       \line { \italic {In moderate time} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 76.}
                                  }
                  }}
 
  arranger =  \markup { \small {\center-align {
		            \line{ \italic "Original version of tune by" }
			    \line { \smallCaps "T. Wright, 1763-1829."  }
  		} } }
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro Definitions


%%% SATB Voices

global = {
  \time 4/2
  \key d \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 2 d2 | fis g a d | g, fis e \breathmark \bar "||" e | fis gis a gis | a1. \bar "||" \break
  d2 | fis, b a d, | e g fis \breathmark \bar "||" a | b4( cis) d2 fis, e | \once \override Dots #'transparent = ##t d1. \bar "||"
}

alto = \relative c' { 
  a2 | d2 d4( cis4) d2 d | e d cis \bar "||" cis | d d e e4( d4) | cis1. \bar "||"
  d2 | d d d d | d cis d \bar "||" d | d d d cis | \once \override NoteColumn #'force-hshift = #-0.02 d1. \bar "||" 
}

tenor = \relative c { \clef bass
        \override Staff.NoteCollision #'merge-differently-dotted = ##t	
  fis2 | a g fis b | a a a \bar "||" a | a b a b | a1. \bar "||"
  a2 | a g a a | b a a \bar "||" a | g a4( b4) a2. g4 | fis1. \bar "||"
}

bass = \relative c { \clef bass
  d2 | d e fis b, | cis d a \bar "||" a | d b cis e | a,1. \bar "||"
  fis'2 | d g fis fis, | g a d \bar "||" fis | g fis4( g) a2 a, | d1. \bar "||" 
}

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##t
}


\book {

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
	} %%% close layout

%%% Hymn Midi	

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 76 2)}} 

} %%% Score bracket

%%% Lyrics titles

\markup { \small {  \hspace #78 \italic {"C. Wesley, 1707-88."} } }  

%%% Lyrics, in 2 columns with separator line, 3 verses per column

\markup { \hspace #4   %%add space as necc. to center the entire block of lyrics
          \column { %%% super column comprising 3 columns and separator line
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "  FOR a heart to praise my God,"
			                                "  A heart from sin set free;" } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "A heart that always feels thy Blood"
					   "    So freely spilt for me:"
			  		}}
			       
			           } %%% finish verse 1
		        \hspace #1 
           		\line { "2  "
			   \column {	     
				   "A heart resigned, submissive, meek,"
				   "    My dear Redeemer's throne;"
				   "Where only Christ is heard to speak,"
				   "    Where Jesus reigns alone:"
			}}
			\hspace #1 
           		\line { "3  "
			   \column {	     
				   "A humble, lowly, contrite heart,"
				   "    Believing, true, and clean,"
				   "Which neither life nor death can part"
				   "    From him that dwells within:"
			}}
		}  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -36 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
 
           		\line { "4  "
			  \column {	     
				  "A heart in every thought renewed,"
				  "    And full of love divine;"
				  "Perfect, and right, and pure, and good,"
				  "    A copy, Lord, of thine."
			}}
		        \hspace #1 
           		\line {"5  "
			  \column {	     
				  "My heart, thou know'st, can never rest"
				  "    Till thou create my peace;"
				  "Till of mine Eden repossest,"
				  "    From self, and sin, I cease."
			}}
			\hspace #1 
           		\line {"6. "
			  \column {	     
				  "Thy nature, gracious Lord, impart,"
				  "    Come quickly from above;"
				  "Write thy new name upon my heart,"
				  "    Thy new best name of love."
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
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne d1 d1  \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo b1 a1 \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
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

       } %%% close layout

%%% Amen Midi
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 76 2) }} 

}


} %%% book bracket