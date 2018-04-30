%%%% 439.png
%%%% Hymn 290. SELMA.  Fair waved the golden corn
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—HARVEST"
	\hspace #0.1 }}	
	
	title = "290"   
  
  meter = \markup { \small { \column { \line { \sans "SELMA." \hspace #1 \roman "(S. M.)" } 
  \line { { \italic "In moderate time" \general-align #Y #DOWN \note #"2" #0.5 "= 80."  }}}}}
 
  arranger = \markup { \small { \center-align { 
		 \line { \italic  "Adapted by" \smallCaps "R. A. Smith" "(1780-1829)" }
		 \line { \italic "from a traditional melody" }
		 \line { \italic "of the Isle of Arran." } }} }
 
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

merge = \once \override NoteColumn #'force-hshift = #-0.01		      

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key ees \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 2 ees2 | g2 f2 ees2 f4 ( g4 -) | bes1. \bar "||" bes2 | c2 bes2 g2 bes4. ( c8 -) | c1. \bar "||" \break
  c2 | bes2 c4 (  ees4 -) ees2 bes2 | c2 g2 f2^\fermata \bar "||" ees2 | f4 ( g4 -) bes2 f2 f2 | ees1. \bar "||"
}
   
alto = \relative c' { 
  bes2 | ees2 d2 ees2 d2 | d1. \bar "||" ees2 | ees2 ees2 ees2 d4. ( c8 -) | c1. \bar "||" 
  ees2 | bes'2 aes4 ( g4 -) g2 bes2 | ees,2 ees2 bes2 \bar "||" c2 | d2 ees2 ees2 d2 | \merge ees1. \bar "||" 
}

tenor = \relative c {\clef bass 
  g'2 | bes2 bes2 g2 bes2 | bes1. \bar "||" bes2 | aes2 bes2 bes2 bes4. ( aes8 -) | aes1. \bar "||" 
  c2 | ees2 ees4 ( c4 -) c2 ees2 | c2 c2 f,2 \bar "||" g2 | bes2 bes2 c2 bes2 | g1. \bar "||"
}

bass = \relative c {\clef bass 
  ees2 | ees2 bes2 c2 bes2 | g1. \bar "||" g'2 | aes2 g2 ees2 g4. ( aes8 -) | \merge aes1. \bar "||"
  aes2 | g2 aes4 ( c4 -) c2 g2 | aes2 ees2 d2_\fermata \bar "||" c2 | bes2 g2 aes2 bes2 ees1. \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 2) }}      
  		
	
} %%% Score bracket

%%% Lyric titles and attributions

\markup { "                " }


\markup {  \small {  \hspace #76 \italic "J. Hampden Gurney, 1802-62." }} 

\markup { "                " }


%%% Lyrics

%%% Main lyric block
%%% To fit on one page, lyrics are in 3 columns: column 1 (verses ), column 2 (a dividing line), column 3 (verses)

\markup { \hspace #8  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #4.8 \column { \lower #2.4 \fontsize #8 "F" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "AIR waved the golden corn"
			                                 "  In Canaan's pleasant land." } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "When full of joy, some shining morn,"
					   "    Went forth the reaper-hand."
					   "      " %%% adds vertical spacing between verses
			  		}}
		      } 
		      	\line {  "2   "
				 \column {
				"    To God so good and great"
				"    Their cheerful thanks they pour;"
				"Then carry to his temple-gate"
				"    The choicest of their store."
				    "      " %%% adds vertical spacing between verses
		       }}

		}  %% finish Page column 1
		
	\hspace #2 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -22 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #2 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
			\line {"3  "
			   \column {	     
				   "    Like Israel, Lord, we give"
				   "    Our earliest fruits to thee,"
				   "And pray that, long as we shall live;"
				   "    We may thy children be."
				   "               " %%% add vertical spacing between verses
			}}
			\line {"4  "
			    \column {	     
				    "Thine is our youthful prime,"
				    "    And life and all its powers;"
				    "Be with us in our morning time,"
				    "    And bless our evening hours."
				    "               " %%% add vertical spacing between verses
			}}
	    } %%% end column 3
	} %%% end master-line
	%%% centred last verse
			\line { \hspace #24 "5. "
			     \column {	     
				     "    In wisdom let us grow,"
				     "    As years and strength are given,"
				     "That we may serve thy Church below."
				     "    And join thy Saints in heaven."
			}}   
   } %%% super column bracket
} %%% lyrics markup bracket


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne  ees1 ees1  \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo c1 bes1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree aes'1 g1   \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  aes1 ees'1  \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 2) }}  %%Amen midi       
       
}  


} %%% book bracket

