%%%148.png
%%%Hymn 84 St. Mary O Lord, turn not away thy face
%%%Version 1

\version "2.10"

\header {

  dedication = \markup { \center-align { \line {  "THE CHRISTIAN YEAR - LENT" } 
					       \hspace #1
						} }	
  title = "84"
			       
  meter = \markup { \small {\column {  \line { \sans {"ST. MARY."} \hspace #1 \roman {"(C. M.)"}}
                                       \line { \italic {Slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 56.}
                                  }
                  }}
 
  arranger =  \markup { \small {\center-align {
		            \line{ \italic "Prys' Psalter, 1621" }
			    \line { "(" \hspace #-1 \italic "as given in Playford's" "‘" \hspace #-1 \italic "Psalms," \hspace #-1 "’" \italic "1677" \hspace #-1 ")."  }
  		} } }  
		
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
	      
%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro definitions	   
	      
%%% SATB voices

global = {
  \time 4/2
  \key d \minor
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
  d1 f2 e | d d' c bes | a1 \breathmark \bar "||" a1 | c2 f, a g |  f1 ^\fermata \bar "||" \break
  \startmeasure a1 c2 d | e a, g f | c'1 \breathmark \bar "||" g1 | a2 d, f e | d1 ^\fermata \bar "||"
}

alto = \relative c' {
  \merge d1 d2 c | bes f' f d | d1 \bar "||" c1 | c2 d f e | \merge f1 \bar "||"
  f1 g2 f | e f c f | e1 \bar "||" c1 | c2 d d cis | \merge d1 \bar "||" 
}

tenor = \relative c { \clef bass
  f1 a2 a | f bes a g | f1 \bar "||" f1 | g2 a c2. bes4 | a1 \bar "||"
  c1 c2. b4 | c2 c g a4( b) | c1 \bar "||" e,1 | f2 f4( g) a2 a4( g) | f1 \bar "||" 
}

bass = \relative c { \clef bass
  d1 d2 a | bes bes f' g | d1 \bar "||" \merge f1 | e2 d a4( bes) c2 | f1 _\fermata \bar "||"
  f1 e2 d | c f e d | c1 \bar "||" c1 | f2 bes, a a | d1 _\fermata \bar "||"
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
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 56 2) }
       }	
} %%score bracket

%%% Lyrics titles

\markup { \small { \hspace #74 \italic "J. Marckant" "(" \hspace #-1 \italic "Old Version, 1560" \hspace #-1 ")." } }

%%% Main lyrics markup block
%%% Lyrics in 3 columns,  column 1 (verses), column 2 (a dividing line), column 3 (verses); centred last verse

\markup { \hspace #10 %%add space as necc. to center the entire block of lyrics
          \column { %%% super column comprising 3 columns and separator line
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
				  \hspace #-1.6    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "  LORD, turn not away thy face"
			                                 "  From him that lies prostrate," } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					  "Lamenting sore his sinful life"
					  "    Before thy mercy-gate;"
			  		}}
			       
			           } %%% finish verse 1
		        \hspace #1 
           		\line { "2  "
			   \column {	     
				   "Which gate thou openest wide to those"
				   "    That do lament their sin:"
				   "Shut not that gate against me, Lord,"
				   "    But let me enter in."
			}}
		}  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -22 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
 
           		\line { "3  "
			  \column {	     
				  "And call me not to mine account"
				  "    How I have livèd here;"
				  "For then I know right well, O Lord,"
				  "    How vile I shall appear."
			}}
		        \hspace #1 
           		\line {"4  "
			  \column {	     
				  "So come I to thy mercy-gate,"
				  "    Where mercy doth abound,"
				  "Requiring mercy for my sin"
				  "    To heal my deadly wound."
			}}
	    } %%% end column 3
     } %%% end master-line
		%%% centred last verse
		        \hspace #1 
           		\line { \hspace #30  "5. "
			  \column {	     
				  "Mercy, good Lord, mercy I ask,"
				  "    This is the total sum;"
				  "For mercy, Lord, is all my suit:"
				  "    Lord, let thy mercy come."
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
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo bes1 a1 \bar "||" }}
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
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 56 2) }}   
       
}  

} %%book bracket