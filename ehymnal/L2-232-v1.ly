%%%% 363.png
%%%% Hymn 232. Lord, who shall sit beside thee.
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup { \center-align { "SAINTS' DAYS: ST. JAMES" \hspace #0.1 } }
	
  title = \markup { "232" }   
  
   meter = \markup { \small { \column {  
	                             \line { \sans { \smallCaps "CHRISTUS DER IST MEIN"}} 
		                     \line { \hspace #2 \sans { \smallCaps "LEBEN"} \hspace #1 "(7 6. 7 6.)"  }                
				     \line { \italic {Slow} \general-align #Y #DOWN \note #"2" #0.5 = 50.   } 
                   }}}				
		   
		                        
	
  arranger = \markup { \small  { \center-align { \line {\italic "Melody by" \smallCaps "Melchior Vulpius" }  
		                  \line {  "1560-1616."  \italic "Adapted and" } 
				  \line {  \italic "harmonized by" \smallCaps "J. S. Bach." }
                     }}}
  
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%% Macro to pull notes leftwards, used to create those merged semibreves

merge = { \once \override NoteColumn #'force-hshift = #-0.01 }

%% music function to allow lyrics to skip

skips = #(define-music-function (parser location times) (number?)
     #{
	     \repeat unfold $times { \skip 1}
     #})

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key ees \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \tag #'Tune { \partial 2 ees2 | g2 f2 g2 aes2 | bes1 g2^\fermata \bar "||" c2 | bes2 aes2 g2 f2 | g1.^\fermata \bar "||" \break
  bes2 | c2 d2 ees2 d2 | c1 bes2^\fermata \bar "||" g2 | aes2 g2 f2 f2 | ees1.^\fermata \bar "||"
  }
      \tag #'Amen { \cadenzaOn ees1 ees1 \bar "||" }
} 
   
alto = \relative c' {  
  \tag #'Tune { bes2 | ees2 f2 ees2 ees2 | d4 ( ees4 f4 d4 -) ees2 \bar "||" ees2 | ees2. d4 ees2. d4 | ees1. \bar "||" 
  g2 | g4 ( f4 -) f4 ( bes4 -) g2 g2 | g2 ( f2 -) f2 \bar "||" ees2 | ees4 ( d4 -) ees2 ees2 d2 |\merge ees1. \bar "||"
  }
      \tag #'Amen { c1 bes1 \bar "||"} 
}

tenor = \relative c {\clef bass 
  \tag #'Tune { g'2 | bes2 bes2 bes2 c2 | f,2 ( bes2 -) bes2 \bar "||" aes2 | bes2 c4 ( aes4 -) bes2 bes2 | bes1. \bar "||" 
  ees2 | ees2 d2 d4 ( c4 -) bes2 | bes2 ( a2 -) d2 \bar "||" bes2 | aes!2 bes2 c2 bes2 | g1. \bar "||" 
  }
      \tag #'Amen { aes1 g1 \bar "||" }
}

bass = \relative c {\clef bass 
  \tag #'Tune { ees2 | ees2 d2 des2 c2 | bes4 ( c4 d4 bes4 -) ees2_\fermata \bar "||" aes2 | g2 f2 ees4 ( g4 -) bes2 | ees,1._\fermata \bar "||" 
  ees2 | a,2 bes2 c4 ( ees4 -) g4 ( f4 -) | ees4 ( c4 -) f2 bes,2_\fermata \bar "||" ees2 | f2 g2 aes2 bes2 | ees,1._\fermata \bar "||" 
  }
      \tag #'Amen { aes,1 ees'1 \bar "||"} 
}

wordsAmen = \lyricmode {  \skips #26 \override LyricText #' font-size = #-1  A -- men. }

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

	\new Lyrics \lyricsto altos \wordsAmen
		      
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
	
} %%% Score bracket


%%% A separate score block to generate the midi for the Main tune without the Amen

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \removeWithTag #'Amen \soprano }
	\context Voice = altos    { \voiceTwo \global \removeWithTag #'Amen \alto }
	                      >>		      
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \removeWithTag #'Amen \tenor }
	\context Voice = basses { \voiceTwo \global \removeWithTag #'Amen \bass }
			        >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 50 2) }}      
  		
} %%% end score bracket


%%% A separate score block to generate the midi for the Amen only

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \keepWithTag #'Amen \soprano }
	\context Voice = altos    { \voiceTwo \global \keepWithTag #'Amen \alto }
	                      >>		      
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \keepWithTag #'Amen \tenor }
	\context Voice = basses { \voiceTwo \global \keepWithTag #'Amen \bass }
			        >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 50 2) }}      
  	
	
} %%% Score bracket
%%% Hymn Note markup

\markup { \hspace #10 \smallCaps "Note" \hspace #-1.2 ".—" \italic "Another harmonization of this tune, in a lower key, will be found at Hymn" "360."  }

\markup { "                      " } %%%force some blank space before start of lyrics

\markup { "                      " }

%%% Lyric titles and attributions

\markup { \hspace #10 \small {  "(" \italic "O. H.," "174-6.)" \hspace #52 \italic "W. Romanis, 1824-99." } }


%%% Main lyric block
%%% To fit on one page, lyrics are in 3 columns: column 1 (verses ), column 2 (a dividing line), column 3 (verses); centred last verse

\markup { \hspace #12  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "L" }   %%Drop Cap goes here
				  \hspace #-1.6    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ORD, who shall sit beside thee,"
			                                "    Enthroned on either hand," } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "When clouds no longer hide thee,"
					   "    'Mid all thy faithful band?"
					   "             " %%% adds vertical spacing between verse
			  		}} 
			         } %%% finish verse 1
           		\line { "2  "
			   \column {	     
				   "Who drinks the cup of sorrow"
				   "    Thy Father gave to thee"
				   "'Neath shadows of the morrow"
				   "    In dark Gethsemane;"
				   "             " %%% adds vertical spacing between verse
			}}
		}  %% finish Page column 1
		
	\hspace #2 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -22 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #2 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
			\line {"3  "
			   \column {	     
					"Who on thy Passion thinking"
					"    Can find in loss a gain,"
					"And dare to meet unshrinking"
					"    Thy baptism of pain."
				   "             " %%% adds vertical spacing between verse
			}}
			\line {"4  "
			    \column {	     
					"O Jesu, form within us"
					"    Thy likeness clear and true;"
					"By thine example win us"
					"    To suffer or to do."
				    "             " %%% adds vertical spacing between verse
			}}
	    } %%% end column 3
     } %%% end master-line
     %%% centred last verse
			\line { \hspace #24 "5. "
			     \column {	     
					"This law itself fulfilleth,—"
					"    Christlike to Christ is nigh."
					"And, where the Father willeth,"
					"    Shall sit with Christ on high."
			}}
   } %%% super column bracket
} %%% lyrics markup bracket


} %%% book bracket
