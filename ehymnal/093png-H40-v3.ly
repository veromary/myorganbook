%%%093png
%%%Hymn 40 Stuttgart "Bethlehem, of noblest cities"
%%%Version 3

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - THE EPIPHANY"
		                         \hspace #0.1 }}	
  title = "40"
  
  meter = \markup { \small {\column {  \line { \sans {"STUTTGART."} \hspace #1 \roman {"(8 7. 8 7.)"}}
                                       \line { \italic {Moderately slow, majestically} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 66.}
                                  }
                  }}
 
  arranger =  \markup { \small {\center-align {
		            \line{ \italic {"Adapted from a melody in" } }
			    \line { \italic { "‘Psalmodia Sacra,’ Gotha, 1715."}}
		                }			    
                      }}
  tagline =""
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% macros

%%generates the breathmarks
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}	      

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2 
  \key g \major 
  \set Staff.midiInstrument = "church organ" 
}

soprano = \relative c' { 
 d2 d2 g2 g2 | a2 a2 b2 g2 \breathmark \bar "||" d'2 d2 e2 c2 | a2 d2 b1 \breathmark \bar "||" \break
 b2 b2 a2 b2 | g2 a2 g2 fis2 \breathmark \bar "||" g2 e2 d2 g2 | g2 fis2 g1^\fermata \bar "||"
}

alto = \relative c' {
 d2 d2 d2 b2 | e2 d2 d2 d2 \bar "||" a'2 g2 g2 g2 | g2 fis2 g1 | \bar "||"
 d2 d2 d2 fis2 | g2 e2 d2 d2 \bar "||" d2 c2 d2 d2 | d2 d2 d1 \bar "||" 
}

tenor = \relative c { \clef bass
 d2 fis2 g2 g2 | g2 fis2 g2 b2 \bar "||" d2 b2 c2 c2 | d2 d2 d1 \bar "||" 
 g,2 g2 a2 d4( c4) | b2 c2 b2 a2 \bar "||" g2 g4( a4) b2 b2 | a2 a2 b1 \bar "||" 
}

bass = \relative c {\clef bass
 d2 d4( c4) b4( a4) g2 | c2 d2 g,2 g'2 \bar "||" fis2 g2 c,2 e2 | d2 d2 g,1 \bar "||" 
 g2 g'2 fis2 d2 | e2 c2 d2 d2 \bar "||" b2 c2 g4( a4) b4( c4) | d2 d2 g,1_\fermata \bar "||" 
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
%%		\context { \Score timing = ##f }
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	}
	
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 66 2)
            }
       }
	
} %%score bracket

%%% Lyric attributions and titles

\markup { \hspace #66 \small \italic "Prudentius, b. 348.   Tr. E. Caswall."}

\markup { \hspace #40 \small "O sola magnarum urbium." }


%%% Main lyric block
%%% To fit on one page, lyrics are in 3 columns: column 1 (verses ), column 2 (a dividing line), column 3 (verses); centred verse 5

\markup { \hspace #4   %%add space as necc. to center the column
          \column { %% super column of everything
	    \line { %% a master line of 3 columns    
		\column { %% column 1
	        \hspace #1 % adds vertical spacing between verses
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "B" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ETHLEHEM, of noblest cities" "  None can once with thee compare;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Thou alone the Lord from heaven"
					   "    Didst for us incarnate bear."
			  		}}
			       
			           } %% finish verse 1
		\hspace #1 
           		\line { "2  "
			   \column {	     
				   "Fairer than the sun at morning"
				   "    Was the star that told his birth;"
				   "To the lands their God announcing,"
				   "    Hid beneath a form of earth."
			}}
		}  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -25 . -2) #0 }   %%%Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
 
	   \hspace #1 % adds vertical spacing between verses
           		\line { "3  "
			  \column {	     
				  "By its lambent beauty guided"
				  "    See the eastern kings appear;"
				  "See them bend, their gifts to offer,"
				  "    Gifts of incense, gold and myrrh."
			}}
		\hspace #1 
           		\line {"4  "
			  \column {	     
				  "Solemn things of mystic meaning:"
				  "    Incense doth the God disclose,"
				  "Gold a royal child proclaimeth,"
				  "    Myrrh a future tomb foreshows."
			}}


	    } %% end column 3
     } %%% end master-line 
     %%% centred last verse
    		\hspace #1 
           		\line { \hspace #20  \italic "Unison."  "  5. "
			  \column {	     
				  "Holy Jesu, in thy brightness"
				  "    To the Gentile world displayed,"
				  "With the Father and the Spirit"
				  "    Endless praise to thee be paid.     Amen." 
     			}}
}
} %%% markup bracket

%%% Amen score block

\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2)} 
	                    << 
	\context Voice = "sopranos" { \relative c' { \global
	                                             \voiceOne g'1 g1 \bar "||" }}
	\context Voice = "altos"    { \relative c' { \global
	                                              \voiceTwo e1 d1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2)} 
	                       <<
	\context Voice = "tenors" { \relative c { \global \clef bass
	                                          \voiceThree c'1 b1 \bar "||" }}
	\context Voice = "basses" { \relative c { \global \clef bass 
	                                          \voiceFour  c1 g1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = ##f opus = ##f tagline = ##f }
\layout { 
	\context { \Score timing = ##f } 
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2) }}  %%% Amen midi       
       
} %%% end Amen block  


} %%book bracket
