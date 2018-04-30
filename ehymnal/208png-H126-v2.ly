%%% 208png
%%% Hymn 126 Hun Lasst Uns Gott Dem Herren. A brighter dawn is breaking.
%%% Version 2

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - EASTERTIDE"
		\hspace #0.1 }}	
  title = "126"
  meter = \markup { \small {\column { 
	                               \line { \sans {"NUN LASST UNS GOTT DEM HERREN."} \hspace #1 \roman {"(7 7. 7 7.)"}}
                                       \line { \italic {In moderate time} \general-align #Y #DOWN \note #"4" #0.5 = 120.}
				       \line { "         " }  %%% force a blank line to create spacing from music staff
                                  }
                  }}
 
  arranger =  \markup { \small {\center-align { 
		                                \line { \italic "Later form of melody in" }
			                        \line { \italic "Selneccer's ‘Christliche Psalmen,’ 1587." }
						 \line { "         " }
  		} } }
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% MacrosAccidental_engraver

%%% generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro Definitions


%%% SATB Voices

global = {
  \time 3/2
  \key a \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 4 a'4 | a2 gis4 fis( gis) a | b2. a2 a4 | \break
  a2 b4 gis( fis) e | a2. gis2 \breathmark \bar "||" gis4 | a2 a4 b2 cis4 | \break 
  b2. b2 cis4 | d2 cis4 b2 a4 | b2. a2^\fermata \bar "||"
}

alto = \relative c' { 
  e4 | e2 e4 d2 e4 | e2. cis2 cis4 |
  e2 fis4 e2 b4 | cis2( dis4) e2 \bar "||" eis4 | fis2 fis4 d2 cis4 |
  dis4.( cis8 dis4) e2 gis4 | a2 a4 fis2 a4 | e2( d4) cis2 \bar "||"
}

tenor = \relative c { \clef bass
  cis'4 | cis2 cis4 a2 a4 | a2( gis4)  a2 a4 |
  a2 fis4 b2 b4 | a2. b2 \bar "||" cis4 | cis2 fis,4 fis4( gis) a |
  a2. gis2 e'4 | d2 e4 d2 cis4 | gis2. a2 \bar "||"
}

bass = \relative c { \clef bass
  a4 | a2 cis4 d2 cis4 | e2. a,2 a4 |
  cis2 dis4 e2 gis4 | fis2. e2 \bar "||" cis4 | fis2 d4 b2 a4 |
  b2. e2 e4 | fis2 a4 d,4.( e8 fis4) | e2. a,2_\fermata \bar "||"
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
} %%% Score bracket

%%% A separte score block to unfold the repeat and generate the Hymn Midi	

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \keepWithTag #'repeatpart \soprano \soprano }
	\context Voice = altos    { \voiceTwo \global \keepWithTag #'repeatpart \alto \alto }
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \keepWithTag #'repeatpart \tenor \tenor }
	\context Voice = basses { \voiceTwo \global \keepWithTag #'repeatpart \bass \bass }
			        >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4)}} 

}

%%% Lyric attribution

\markup { \hspace #90 \small \italic "P. D." }

\markup { \hspace #1 } %%% need a bit of space before lyrics begin.

%%% Lyrics in 3 columns,  column 1 (verses), column 2 (a dividing line), column 3 (verses); 

\markup { \hspace #6   %%add space as necc. to center the entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
                      \column { %%% verse 1 is a column of 2 lines  
                          \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "A" }   %%Drop Cap goes here
                                  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
                                  \column  { \raise #0.0 " BRIGHTER dawn is breaking,"
                                                         "  And earth with praise is waking;" } }          
                          \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
                                   \lower  #1.56  %%adjust this until the line spacing looks right
                                   \column {   
					   "For thou, O King most highest,"
					   "The power of death defiest;"
                                        }}
		      		} %% finish verse 1 
		        \hspace #1 
           		\line { "2  "
			   \column {	     
				"And thou hast come victorious,"
				"With risen Body glorious,"
				"Who now for ever livest,"
				"And life abundant givest."
			}}
		}  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -22 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
           		\line { "3  "
			  \column {	     
				  "O free the world from blindness,"
				  "And fill the world with kindness,"
				  "Give sinners resurrection,"
				  "Bring striving to perfection;"
			}}
		        \hspace #1 
           		\line {"4. "
			  \column {	     
				  "In sickness give us healing,"
				  "In doubt thy clear revealing,"
				  "That praise to thee be given"
				  "In earth as in thy heaven."
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
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne a'1 a1  \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo d1 cis1 \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree fis1 e1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  d1 a1 \bar "||" }}
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
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4) }} 

}


} %%% book bracket
