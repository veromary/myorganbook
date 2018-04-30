%%% 141png
%%% Hymn 77 Southwell Lord Jesus, think on me.
%%% Version 1

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - LENT"
		\hspace #0.1 }}	
  title = "77"
  meter = \markup { \small {\column {  \line { \sans {"SOUTHWELL."} \hspace #1 \roman {"(S. M.)"}}
                                       \line { \italic {Slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 60.}
                                  }
                  }}
 
  arranger =  \markup { \small {\center-align {
		            \line{ \italic "Damon's Psalter, 1579" }
			    \line { \italic "(later form of third line)."  }
  		} } }
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% macro to specify a partial measure in the middle of a piece.
%%% Manual does not recommend using \partial in the middle of a piece.
%%% In this case, the macro specifies that 2 1/2 notes in a 4/2 measure have past,
%%% hence we are halfway through the measure
halfmeasure =  \set Score.measurePosition = #(ly:make-moment 2 2)

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro Definitions


%%% SATB Voices

global = {
  \time 4/2
  \key e \minor
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 1 e1 | g2 g fis fis | e1 \bar "||" e1 | g2 g a a | b1 \bar "||"  b1 | \break
  d2 d c c | b b a1 ^\fermata \bar "||" \halfmeasure b1 | a2 g fis fis | e1 \bar "||"
}

alto = \relative c' { 
  \merge e1 | e2 e e dis | \merge e1 \bar "||" \merge e1 | e2 g g fis | g1 \bar "||" g1 | 
  g2 fis e d | d d d1 \bar "||" g1 | fis2 e e dis | \merge e1 \bar "||" 
}

tenor = \relative c { \clef bass
  g'1 | b2 b b b | g1 \bar "||" g1 | b2 b d d | d1 \bar "||" b1 |
  a2 a g a | g g fis1 \bar "||" d'1 | d2 b b b | g1 \bar "||" 
}

bass = \relative c { \clef bass
  e1 | e2 e b b | e1 \bar "||" e1 | e2 e d d | g1 \bar "||" g1 |
  d2 d e fis | g b, d1 _\fermata \bar "||" g,1 | d'2 e b b | e1 \bar "||" 
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 60 2)}} 

} %%% Score bracket

%%% Lyrics titles

\markup { \small {  \hspace #60 \italic {"Bp. Synesius, 375-430.  Tr. A. W. Chatfield."} } }  

\markup { \small {\hspace #43 "Μνώεο Χριστέ.  [Mnôeo Christe.]"} }

%%% Lyrics, in 2 columns with separator line, 3 verses per column

\markup { \hspace #4   %%add space as necc. to center the entire block of lyrics
          \column { %%% super column comprising 3 columns and separator line
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #5.0 \column { \lower #2.4 \fontsize #8 "L" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ORD Jesus, think on me,"
			                               "   And purge away my sin;" } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
"From earthborn passions set me free,"
"    And make me pure within."
			  		}}
			       
			           } %%% finish verse 1
		        \hspace #1 
           		\line { "2  "
			   \column {	     
"    Lord Jesus, think on me,"
"    With care and woe opprest;"
"Let me thy loving servant be,"
"    And taste thy promised rest."
			}}
			\hspace #1 
           		\line { "3  "
			   \column {	     
"    Lord Jesus, think on me,"
"    Amid the battle's strife;"
"In all my pain and misery"
"    Be thou my health and life."
			}}
		}  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -36 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
 
           		\line { "4  "
			  \column {	     
"    Lord Jesus, think on me,"
"    Nor let me go astray;"
"Through darkness and perplexity"
"    Point thou the heavenly way."
			}}
		        \hspace #1 
           		\line {"5  "
			  \column {	     
"    Lord Jesus, think on me,"
"    When flows the tempest high:"
"When on doth rush the enemy"
"    O Saviour, be thou nigh."
			}}
			\hspace #1 
           		\line {"6. "
			  \column {	     
"    Lord Jesus, think on me,"
"    That, when the flood is past,"
"I may the eternal brightness see,"
"    And share thy joy at last."
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
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne e1 e1  \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo c1 b1 \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree a'1 gis1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  a1 e'1 \bar "||" }}
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
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 60 2) }} 

}


} %%% book bracket