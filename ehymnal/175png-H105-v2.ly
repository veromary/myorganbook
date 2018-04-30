%%%% 175.png
%%%% Hymn 105. Batty. "Sweet the moments, rich in blessing"
%%%% Rev 2.

\version "2.10"

\header {

  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - PASSIONTIDE"

	\hspace #0.1 }}	

  title = "105"

  meter = \markup { \small {\column {  \line { \sans {"BATTY."} \hspace #1 \roman {"(8 7. 8 7.)" }}
                                       \line { \italic {Moderately slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 60.}
                                  }
                  }}  

  arranger = \markup { \small {\center-align {\line { \italic { "Adapted from Chorale ‘Ringe recht’ in"  } } 
		                              \line { \italic { "‘Erbaulicher musikalischen Christenschatz,’ 1745."}}
  } } }

  tagline =""

}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 8/4
  \key ees \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 1 ees2 f \bar "|" g f g aes \bar "|" bes g \breathmark \bar "||" c bes \bar "|" aes g f f \bar "|" g1 \bar "||" 
  bes2 bes \bar "|" bes f g aes \bar "|" g f \breathmark \bar "||" ees f \bar "|" g aes g f \bar "|" ees1 \bar "||" 
}

alto = \relative c' { 
  \partial 1 bes2 c4(d) \bar "|" ees2 f ees ees \bar "|" d ees \bar "||" c d \bar "|" ees4(f) ees2 ees d \bar "|" ees1 \bar "||" 
  ees2 ees \bar "|" f d ees ees \bar "|" ees d \bar "||" c d \bar "|" ees ees ees d \bar "|" \once \override NoteColumn #'force-hshift = #-0.01 ees1 \bar "||" 
}

tenor = \relative c { \clef bass 
  \partial 1 bes'2 aes \bar "|" bes bes bes aes \bar "|" f ees \bar "||" aes f \bar "|" c'4(bes) bes2 bes bes \bar "|" bes1 \bar "||"
  g2 g \bar "|" bes bes bes c \bar "|" bes bes \bar "||" g bes \bar "|" bes c bes bes \bar "|" g1 \bar "||" 
}

bass = \relative c { \clef bass 
  \partial 1 g'2 f \bar "|" ees d ees c \bar "|" bes ees \bar "||" aes, bes \bar "|" c4(d) ees2 bes bes ees1 \bar "||"
  ees2 ees \bar "|" d bes ees aes, \bar "|" bes bes \bar "||" c bes \bar "|" ees aes, bes bes \bar "|" ees1 \bar "||" 
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

%%% Hymn Midi	

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 60 2)}} 

} %%% Score bracket

%%% Lyrics titles

\markup { \small { \hspace #74 \italic "W. Shirley, 1725-86, and others." } }

%%% Main lyrics markup block
%%% Lyrics in 3 columns,  column 1 (verses), column 2 (a dividing line), column 3 (verses)

\markup { \hspace #4 %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "S" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "WEET the moments, rich in blessing,"
			                                 "  Which before the Cross I spend," } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Life, and health, and peace possessing"
					   "    From the sinner's dying Friend."
			  		}}
			       
			           } %%% finish verse 1
		        \hspace #1 
           		\line { "2  "
			   \column {	     
				   "Here I stay, for ever viewing"
				   "    Mercy streaming in his Blood;"
				   "Precious drops, my soul bedewing,"
				   "    Plead and claim my peace with God."
			}}
		}  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -22 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
 
           		\line { "3  "
			  \column {	     
				  "Truly blessèd is this station,"
				  "    Low before his Cross to lie,"
				  "While I see divine compassion"
				  "    Floating in his languid eye."
			}}
		        \hspace #1 
           		\line {"4. "
			  \column {	     
				  "Lord, in ceaseless contemplation"
				  "    Fix our hearts and eyes on thee,"
				  "Till we taste thy full salvation,"
				  "    And unveiled thy glories see."
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
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne ees1 ees  \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo c1 bes \bar "||" }}
	                      >>

	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }

	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree aes'1 g \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  aes1 ees'1 \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 60 2) }} 

}

} %%% book bracket