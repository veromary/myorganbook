%%%135.png
%%%Hymn 72 Gute baume Christian, dost thou see them
%%%Version 2

\version "2.10"

\header {
	dedication = \markup { \center-align { \line {  "THE CHRISTIAN YEAR - LENT" } 
					       \hspace #1
						} }	
  title = "72"
			       
  arranger = \markup { \small { \smallCaps "P. Sohren," \italic "d. c. 1692."} }
  poet = \markup { \small { \sans  "GUTE BÄUME BRINGEN." \hspace #1 \roman { "(6 5. 6. 5. D.)"} } }
  meter = \markup { \small { \italic {Moderately fast} \fontsize #-5 \general-align #Y #DOWN \note #"4" #1 = 108.} }
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%prints four dots in a column, This will be used by other macros to create repeat signs.. 	       
fdots = \markup { \override #'(baseline-skip . 1.0) 
        \column { \with-color #black { \fontsize #0 . \fontsize #0 . \fontsize #0 . \fontsize #0 .} }}	
	
%%Using the fdots macro above, positions 4 dots at beginning of a line of score thus mimicking a begin repeat sign.
%%The dots are placed as \mark objects rather than a normal bar glyph because Lilypond will not easily print a bar
%%glyph at the beginning of a line without upsetting the bar at the end of the previous line
%%Place \beginfdots before the first note of line you want it to begin.
beginfdots = { 	
	       \once \override Staff.RehearsalMark #'Y-offset = #'1.4
	       \once \override Staff.RehearsalMark #'X-offset = #'7.0
	       \mark \fdots
	       \once \override Score.SeparationItem #'padding = #1
}	
	
%%Prints a repeat sign glyph comprising 4 dots then two thin bars. This is used to end a repeat. 
%%This macro works by replacing the glyph used by the \bar "||" function. 
fdendrepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
	\once \override Staff.BarLine #'text = \markup  {  \line { \raise #1.4 \override #'(baseline-skip . 1.0)  
		                                                   \column { \with-color #black {  
								             \fontsize #2 . 
								             \fontsize #2 . 
								             \fontsize #2 . 
								             \fontsize #2 .} }
	                                                  \hspace #-1 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
							  \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
	
	} }	
        \bar "||"} 	      

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01
	
%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro definitions	   
	      
%%% SATB voices

global = {
  \time 4/4
  \key d \minor
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
  \tag #'repeated { \beginfdots d4 d8[ e8] f4 g | a2 a2 | c4 a d cis | d1 \fdendrepeat }
      \tag #'remainder { d4 d c c | b2 a2 | \break
  bes4 a g4. f8 | f1 \bar "||"
      c'4 a g a | f2 e | a4. g8 f4 e4 | d1  \bar "||" }
}

alto = \relative c' {
  \tag #'repeated { d4 d d d | e2 e | a4 f e e | f1 }
      \tag #'remainder { f4 f e e | gis2 e2  |       
  g4 f f e | \merge f1 \bar "||" 
      g4 f e e | d2 e | d4. e8 d4 cis4 | \merge d1 \bar "||" }
}

tenor = \relative c { \clef bass
  \tag #'repeated { \beginfdots f4 f8[ g8] a4 d | d2 cis | c!4 c bes a | a1 \fdendrepeat }
     \tag #'remainder { a4 a a a | e'4( d) c2 |
  d4 c d bes | a1 \bar "||" 
     g4 a c c | a( b) cis2 | d4. bes8 a4 g | f1 \bar "||" }
}

bass = \relative c { \clef bass
  \tag #'repeated { d4 d d bes | a2 a | f'4 a g a | d,1 }
     \tag #'remainder { d4 d a8[ b] c[ d] | e2 a2 |
  g,4 a bes c | f1 \bar "||"
     e4 f c a | d2 a2 | f4. g8 a4 a | d1 \bar "||" }
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
	
} %%score bracket

%%% separate score block to unfold repeats and generate midi

\score{
\new ChoirStaff	
 <<

	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \keepWithTag #'repeated \soprano \soprano }
	\context Voice = altos    {\voiceTwo \global \keepWithTag #'repeated \alto \alto }
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \keepWithTag #'repeated \tenor \tenor }
	\context Voice = basses { \voiceTwo \global \keepWithTag #'repeated \bass \bass }
			        >> 
 >>

\midi { 
	\context { \Score tempoWholesPerMinute = #(ly:make-moment 108 4) }
       }
       
}

%%% Lyrics titles

\markup { \small { \hspace #68 \italic "J. M. Neale, 1818-66.  From the Greek."} }

%%% Lyrics in 3 columns,  column 1 (verses), column 2 (a dividing line), column 3 (verses)

\markup { \hspace #10  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
		  \line { \hspace #1 } %%% blank line, need some space between this block and the lyric attribution in this case	  
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "C" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HRISTIAN, dost thou see them"
			                               "  On the holy ground," } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "How the troops of Midian"
					   "    Prowl and prowl around?"
					   "Christian, up and smite them,"
					   "    Counting gain but loss;"
					   "Smite them by the merit"
					   "    Of the holy Cross."
			  		}}
			       
			           } %%% finish verse 1
		        \hspace #1 
           		\line { "2  "
			   \column {	     
				   "Christian, dost thou feel them,"
				   "    How they work within,"
				   "Striving, tempting, luring,"
				   "    Goading into sin?"
				   "Christian, never tremble;"
				   "    Never be down-cast;"
				   "Smite them by the virtue"
				   "    Of the Lenten fast."
			}}
		}  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -46 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
 
           		\line { "3  "
			  \column {	     
				  "Christian, dost thou hear them,"
				  "    How they speak thee fair?"
				  "'Always fast and vigil?"
				  "    Always watch and prayer?'"
				  "Christian, answer boldly,"
				  "    'While I breathe, I pray:'"
				  "Peace shall follow battle,"
				  "    Night shall end in day."	
			}}
		        \hspace #1 
           		\line {"4. "
			  \column {	     
				  "'Well I know thy trouble,"
				  "    O my servant true;"
				  "Thou art very weary,—"
				  "    I was weary too;"
				  "But that toil shall make thee"
				  "    Some day all mine own,—"
				  "But the end of sorrow"
				  "    Shall be near my throne.'"
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
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 108 4) }}   
       
}  

} %%book bracket