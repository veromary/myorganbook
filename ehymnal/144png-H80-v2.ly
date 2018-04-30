%%% 144png
%%% Hymn 80 Solomon My God I love thee; not because
%%% Version 2

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - LENT"
		\hspace #0.1 }}	
  title = "80"
  meter = \markup { \small {\column {  \line { \sans {"SOLOMON."} \hspace #1 \roman {"(C. M.)"}}
                                       \line { \italic {In moderate time} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 72.}
                                  }
                  }}
 
  arranger =  \markup { \small {\center-align {
		            \line{ \italic "Adapted from the Air ‘What tho' I trace.’" }
			    \line { \smallCaps "G. F. Handel, 1685-1759."  }
  		} } }
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% macro to specify a partial measure in the middle of a piece.
%%% Manual does not recommend using \partial in the middle of a piece.
%%% In this case, the macro specifies that 1 1/2 note in a 4/4 measure has past,
%%% hence we are halfway through the measure
halfmeasure =  \set Score.measurePosition = #(ly:make-moment 1 2)

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01

%%generates the breathmarks
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro Definitions


%%% SATB Voices

global = {
  \time 4/4
  \key ees \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 2 ees2 | g aes | bes bes | c c | bes \breathmark \bar "||" bes | c bes | d ees | \cadenzaOn f,1.  \cadenzaOff \breathmark \bar "||" \break
  \halfmeasure bes2 | c c | bes bes | aes aes | g \breathmark \bar "||" f | bes ees, | f ees4( d) | \cadenzaOn ees1. \bar "||" 
}

alto = \relative c' { 
  bes2 | ees ees4( d4) | ees2 g | ees ees | ees \bar "||" g | aes bes | aes g | d1. \bar "||"
  f2 | g f | f ees | ees f | bes, \bar "||" d | ees ees | c bes | bes1. \bar "||"   
}

tenor = \relative c { \clef bass
  g'2 | bes f | g bes | aes aes | g \bar "||" ees' | ees ees | aes, bes | bes1. \bar "||"
  d2 | ees c | d bes | c d | ees \bar "||" bes | bes g | aes f | g1. \bar "||"
}

bass = \relative c { \clef bass
  ees2 | ees ees | ees ees | aes aes, | ees' \bar "||" ees | aes g | f ees | bes1. \bar "||"
  bes'2 | bes aes | aes g | f bes, | ees \bar "||" aes, | g c | aes bes | ees1. \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 72 2)}} 

} %%% Score bracket

%%% Lyrics titles

\markup { \small {  \hspace #88 \center-align { \line {\italic "St. Francis Xavier, 1506-52." }                  
	                                        \line {\italic "Tr. E. Caswall" "†." }
} } }  

\markup { \hspace #1 } %%% need to force a blank line because space is rather tight.

\markup { \small {\hspace #43 "O Deus, ego amo te."} }

\markup { \hspace #1 } %%% need to force a blank line because space is rather tight.

%%% Lyrics in 3 columns,  column 1 (verses), column 2 (a dividing line), column 3 (verses); 

\markup { \hspace #6   %%add space as necc. to center the entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "M" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "Y God, I love thee; not because"
			                                 "  I hope for heaven thereby," } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Nor yet because who love thee not"
					   "    Are lost eternally."
			  		}}
			       
			           } %%% finish verse 1
		        \hspace #1 
           		\line { "2  "
			   \column {	     
				   "Thou, O my Jesus, thou didst me"
				   "    Upon the Cross embrace;"
				   "For me didst bear the nails and spear,"
				   "    And manifold disgrace,"
			}}
			\hspace #1 
           		\line { "3  "
			   \column {	     
				   "And griefs and torments numberless,"
				   "    And sweat of agony;"
				   "E'en death itself; and all for one"
				   "    Who was thine enemy."
			}}
		}  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -36 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
 
           		\line { "4  "
			  \column {	     
				  "Then why, O blessèd Jesu Christ,"
				  "    Should I not love thee well,"
				  "Not for the sake of winning heaven,"
				  "    Or of escaping hell;"
			}}
		        \hspace #1 
           		\line {"5  "
			  \column {	     
				  "Not with the hope of gaining aught,"
				  "    Not seeking a reward;"
				  "But as thyself hast lovèd me,"
				  "    O ever-loving Lord!"
			}}
			\hspace #1 
           		\line {"6. "
			  \column {	     
				  "E'en so I love thee, and will love,"
				  "    And in thy praise will sing,"
				  "Solely because thou art my God,"
				  "    And my eternal King."
			}}
	    } %%% end column 3
     } %%% end master-line
} %%% lyrics markup bracket

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne ees1 ees1  \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo c1 bes1 \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree aes'1 g1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  aes1 ees'1 \bar "||" }}
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
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 72 2) }} 

}


} %%% book bracket