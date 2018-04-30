%%%052.png
%%%Forest Green
%%%Version 3 Fonts reset

\version "2.10.19"


\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - CHRISTMAS EVE"
		\hspace #0.1
	                                     }}
  arranger = \markup { \small \italic "English Traditional Melody."}
  title="15"
  poet = \markup { \small { \sans  "FOREST GREEN."  \hspace #1 \roman  "(D. C. M. Words irreg.)" } }
  meter = \markup { \small { \italic {In moderate time} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 80.} }
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%macros

%%generates the breathmarks which are placed on top of barlines
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}	      

%%prints a repeat sign glyph comprising 4 dots and two thin bars
fdendrepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
	\once \override Staff.BarLine #'text = \markup  {  \line { \raise #1.4 \override #'(baseline-skip . 1.0)  \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
	                                                  \hspace #-1 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
							  \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
	
	} }	
        \bar "||"} 

%%prints a repeat sign glyph comprising 4 dots. Used only to begin a repeat at the start of a piece where \bar ":" does not work	
fdstartrepeat =  {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
	          \once \override Staff.BarLine #'text = \markup  { \line { \hspace #0 \override #'(baseline-skip . 1.0) 
	                                                 \raise #1.4 \column { \with-color #black { 
							                \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
	          } }	
                 \bar "|:"}
	
%%%%%%%%%%%%%%%%%%%%%%%%%%end of macro definitions

global = {
  \time 4/2 
  \key f \major 
  \set Staff.midiInstrument = "church organ"
}

soprano =  \relative c' { 
  \fdstartrepeat
  \partial 2 c2 | f2 f2 f2 g2 | a4 \( ( g4) a4(  bes4) \) c2 \breathmark \bar "||" a2 | bes2 a4( f4) g2 g2 | \once \override Dots #'transparent = ##t f1. \breathmark \fdendrepeat \break
  f4( a4) | c2. d4 c4 ( bes4) a4( g4) | f4( g4 a4 bes4) c2 \breathmark \bar "||" c,2 | f2 a2 g2 f2 | c1 \breathmark \bar "||" \break
  c1 | f2 f2 f2 g2 | a4( g4 -) a4( bes4) c2 \breathmark \bar "||" a2 | bes2 a4( f4 ) g2 g2 | \once \override Dots #'transparent = ##t f1. \bar "||"
}  

alto = \relative c' { 
  \fdstartrepeat c2 | c2 d2 c2 d4( e4) | f2 f2 e2 \bar "||" d2 | d2 f2 f2 e2 | \once \override NoteColumn #'force-hshift = #0.1 f1. \fdendrepeat
  f2 | e2. d4 e2 c2 | c2( f2) e2 \bar "||" c2 | c2 c2 bes2 a4( bes4) | \once \override NoteColumn #'force-hshift = #0.1 c1 \bar "||" 
  \once \override NoteColumn #'force-hshift = #0.1 c1 | c2 d2 c2 d4( e4) | f2 f2 e2 \bar "||" d2 | d2 f2 f2 e2 | 
    \once \override NoteColumn #'force-hshift = #0.1 f1. \bar "||"
}

tenor = \relative c { \clef bass
  \fdstartrepeat g'2 | a2 bes2 c2 bes2 | c2 f,2 g2 \bar "||" f2 | bes2 c2 d2 c4( bes4) | a1. \fdendrepeat
  a2 | a2. f4 c'2 c4( bes4) | a2( f2) g2 \bar "||" e2 | f2 f2 d4( e4) f2 | e1 \bar "||"
  f2( g2) | a2 bes2 c2 bes2 | c2 f,2 g2 \bar "||" f2 | bes2 c4( a4) c2 c4( bes4) | a1. \bar "||"
}

bass = \relative c { \clef bass 
  \fdstartrepeat e2 | f2 bes2 a2 g2 | f2 d2 c2 \bar "||" d2 | g,2 a2 bes2 c2 | f1.\fdendrepeat
  d2 | a2. bes4 c2 d4( e4) | f2( d2) c2 \bar "||" c4( bes4) | a2 f2 bes2 d2 | c1 \bar "||" 
  d2( e2) | f2 bes2 a2 g2 | f2 d2 c2 \bar "||" d2 | g,2 a4( d4) c2 c2 | <<  { \voiceTwo f1. } 
    \new Voice {\once \override NoteColumn #'force-hshift = #0.1 \voiceFour \set fontSize = #-3 f,1. _\markup {\italic "Org."} }  >> \bar "||"
}

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
  top-margin = 0
  bottom-margin = 0
  print-page-number = ##f
  between-system-padding = 3\mm
}


\book{
	
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
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	}
}

\markup {   \hspace #6  %% use \hspace or \halign to centre the 3-column group
	\column {   %%super column for the whole page
	     \line {  \small { \italic { \hspace #2.5 "Suitable till Candlemas." \hspace #40  "Bp. Phillips Brooks, 1835-93." } } }
	     \line { " " }
	     \line { %% Master Line - of 3 page columns 
	                \column { %%start page column 1
			    
			   
			    
			    \column { %% stanza 1 is a column of 2 lines. Redundant if only 1 stanza
			    	\line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
					 \hspace #0    %% adjust this if other letters are too far from Drop Cap
				         \column  { \raise #0.0 "LITTLE town of Bethlehem,"  "How still we see thee lie!" } }          
			       
				\line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
					 \lower  #1.56  %%adjust this until the line spacing looks right
					\column {   
						"Above thy deep and dreamless sleep"
						"    The silent stars go by."
						"Yet in thy dark streets shineth"
						"    The everlasting light;"
						"The hopes and fears of all the years"
						"    Are met in thee to-night." }	}
			       
			           } %% finish stanza 1
				   
			   \hspace #0.5 % adds vertical spacing between verses
			    \line { "2  "
				    \column {
					    "O morning stars, together"
					    "    Proclaim the holy birth,"
					    "And praises sing to God the King,"
					    "    And peace to men on earth;"
					    "For Christ is born of Mary;"
					    "    And, gathered all above,"
					    "While mortals sleep, the angels keep"
					    "    Their watch of wondering love."
				    	    }
			    		}  
				   
			           } %%finish page column 1
		           
	                   \hspace #4 %%adds horizontal space columns 1 and 2   
			   
			   \column { \filled-box #'(0.0 . 0.1) #'( -45 . 1) #0 }       %%Column 2. This is the line dviding the columns 1 and 3. 
			   	   
			   \hspace #4 %%adds horizontal space between columns 2 and 3
			   
			\column { %%start page column 3
			      
				
	%  \hspace #0.5 % adds vertical spacing
          
			  \line {  "3  "
				  \column {
					  "How silently, how silently,"
					  "    The wondrous gift is given!"
					  "So God imparts to human hearts"
					  "    The blessings of his heaven."
					  "No ear may hear his coming;"
					  "    But in this world of sin, "
					  "Where meek souls will receive him still,"
					  "    The dear Christ enters in."
				  	}
			  		}
					
			\hspace #0.5 % adds vertical spacing between verses
           
			\line { "4  "
				\column {
					"Where children pure and happy"
					"    Pray to the blessèd Child,"
					"Where misery cries out to thee,"
					"    Son of the mother mild;"
					"Where charity stands watching"
					"    And faith holds wide the door,"
					"The dark night wakes, the glory breaks,"
					"    And Christmas comes once more."
					}
				}
			        } %% end page column 3 
	} % end master line
   } %% end super column	
} %% end markup

%%fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
\score{
{ s4 }
\header { breakbefore = ##f piece = " " opus = " " }
\layout{
\context { \Staff
\remove Time_signature_engraver
\remove Key_engraver
\remove Clef_engraver
\remove Staff_symbol_engraver
}}
}     

\markup {
       \fill-line {
          \column {
           \line { "5. "
             \column {
		"O holy Child of Bethlehem,"
		"    Descend to us, we pray;"
		"Cast out our sin, and enter in,"
		"    Be born in us to-day."
		"We hear the Christmas Angels"
		"    The great glad tidings tell:"
		"O come to us, abide with us,"
		"    Our Lord Emmanuel."
             }
           }
          }
     }    
 }


%%%%%%%%%%%%%%%% This next score section is only for unfolding the repeats and generating the midi. 
%%%%%%%%%%%%%%%% Not necessary for the layout
 
\score { 
\new ChoirStaff 
<<

\new Staff = "soprano" {\relative c' {\clef treble \global  
  \unfoldRepeats { \repeat volta 2 { 
  \partial 2 c2 | f2 f2 f2 g2 | a4 \( ( g4) a4(  bes4) \) c2  \bar "||" a2 | bes2 a4( f4) g2 g2 |  f1. }   } \break
  f4( a4) | c2. d4 c4 ( bes4) a4( g4) | f4( g4 a4 bes4) c2  \bar "||" c,2 | f2 a2 g2 f2 | c1  \bar "||" \break
  c1 | f2 f2 f2 g2 | a4( g4) a4( bes4) c2  \bar "||" a2 | bes2 a4( f4 ) g2 g2 | f1. \bar "||" 
}
}

\new Staff = "alto" {\relative c' {\clef treble \global  
  \unfoldRepeats { \repeat volta 2 { 
  c2 | c2 d2 c2 d4( e4) | f2 f2 e2 \bar "||" d2 | d2 f2 f2 e2 |  f1. } }
  f2 | e2. d4 e2 c2 | c2( f2) e2 \bar "||" c2 | c2 c2 bes2 a4( bes4) |  c1 \bar "||" 
  c1 | c2 d2 c2 d4( e4) | f2 f2 e2 \bar "||" d2 | d2 f2 f2 e2 |  f1. \bar "||" 
}	
}

\new Staff = "tenor" { \relative c {\clef bass \global  
  \unfoldRepeats { \repeat volta 2 { 
  g'2 | a2 bes2 c2 bes2 | c2 f,2 g2 \bar "||" f2 | bes2 c2 d2 c4( bes4) | a1. } }
  a2 | a2. f4 c'2 c4( bes4) | a2( f2) g2 \bar "||" e2 | f2 f2 d4( e4) f2 | e1 \bar "||"
  f2( g2) | a2 bes2 c2 bes2 | c2 f,2 g2 \bar "||" f2 | bes2 c4( a4) c2 c4( bes4) | a1. \bar "||" 
} 
}


\new Staff = "bass" { \relative c { \clef bass \global  
  \unfoldRepeats { \repeat volta 2 { 
  e2 | f2 bes2 a2 g2 | f2 d2 c2 \bar "||" d2 | g,2 a2 bes2 c2 | f1. } }
  d2 | a2. bes4 c2 d4( e4) | f2( d2) c2 \bar "||" c4( bes4) | a2 f2 bes2 d2 | c1 \bar "||" 
  d2( e2) | f2 bes2 a2 g2 | f2 d2 c2 \bar "||" d2 | g,2 a4( d4) c2 c2 | < f  f, >1.  \bar "||" 
}
}


>>

\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 80 2)
            }
       }
}
       
   
%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                    << 
	\context Voice = "sopranos" { \relative c' {  \set Staff.midiInstrument = "church organ" 
	                              \clef treble \time 4/2 \key f \major \voiceOne f1 f1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \set Staff.midiInstrument = "church organ" 
	                               \clef treble \key f \major \voiceTwo d1 c1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c {  \set Staff.midiInstrument = "church organ" 
	                            \clef bass \key f \major \voiceThree bes'1 a1 \bar "||" }}
	\context Voice = "basses" { \relative c {  \set Staff.midiInstrument = "church organ" 
	                            \clef bass \key f \major \voiceFour  bes1 f1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
  
\layout { 
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 2) }}  %%Amen midi

       
 } % close Amen block
       
} %%close book bracket  




