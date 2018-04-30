%%%% 254.png
%%%% Hymn 157. St. Cuthbert.  Our blest redeemer, ere he breathed
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "THE CHRISTIAN YEAR - WHITSUNTIDE"
	\hspace #0.1 }}	
	
	title = "157"   
  
  poet = \markup { \small {  \line { \sans { "ST. CUTHBERT."} \hspace #1 \roman {"(8 6. 8 4.)"}} }}
  
  meter = \markup { \small { \italic {Slow} \general-align #Y #DOWN \note #"2" #0.5 = 58. } }
  
  arranger = \markup { \small \smallCaps "J. B. Dykes, 1823-76." }
  
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%generates the breathmarks
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}	      
	      	      
%% Used to pull an upstem note left. Used when a slurred note pair straddles a longer note below and when notecolumn force-hshift does not work 
topstraddle = { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.5 
              \once \override Stem #'X-offset = #-0.2 }	      
	      
	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key d \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 2 d2 | d2. d4 e2 fis | g2. g4 fis2 \breathmark \bar "||" a2 | d fis, fis gis | a1. \bar "||" \break
  g2 | fis2. fis4 g2 a | b b a \breathmark \bar "||"  fis | a1. g2 | fis1. \bar "||"
} 
   
alto = \relative c' {  
  a2 | a2. d4 d2 d | d2. d4 d2 \bar "||" d4( cis) | d2 d d d | cis1. \bar "||"
  cis2 | a2. d4 d2 c | b cis! d \bar "||" d | d1 cis | d1. \bar "||"
}

tenor = \relative c {\clef bass 
  fis2 | fis2. fis4 g2 a | b b a \bar "||" fis4( g) | a2 a b b | a1. \bar "||"
  e2 | fis2. a4 b2 fis | g g a \bar "||" a | fis1 \topstraddle e2( a) | a1. \bar "||"
}

bass = \relative c {\clef bass 
  d2 | d2. d4 d2 d | g, g d' \bar "||" d4( e) | fis2 d b e | a,1. \bar "||"
  a2 | d2. d4 d2 d | g e fis \bar "||" d | a1 a | d1. \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 58 2) }}      
  	
	
} %%% Score bracket

%%% Lyric attributions and titles

\markup { \hspace #70 \small \italic "Harriet Auber, 1773-1862."}  


%%% Main lyric block
%%% To fit on one page, lyrics are in 3 columns: column 1 (verses ), column 2 (a dividing line), column 3 (verses)

\markup { \hspace #4  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "UR blest Redeemer, ere he breathed"
			                                 "  His tender last farewell," } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "A Guide, a Comforter, bequeathed"
					   "            With us to dwell."
					   "               " %%% add vertical spacing between verses
			  		}} 
			         } %%% finish verse 1
           		\line { "2  "
			   \column {	     
				   "He came in tongues of living flame,"
				   "    To teach, convince, subdue;"
				   "All-powerful as the wind he came,"
				   "            As viewless too."
				   "               " %%% add vertical spacing between verses
			}}
           		\line { "3  "
			   \column {	     
				   "He came sweet influence to impart,"
				   "    A gracious, willing Guest,"
				   "While he can find one humble heart"
				   "            Wherein to rest."
			}}
		}  %% finish Page column 1
		
	\hspace #2 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -36 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #2 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
			\line {"4  "
			   \column {	     
				   "And his that gentle voice we hear,"
				   "    Soft as the breath of even,"
				   "That checks each fault, that calms each fear,"
				   "            And speaks of heaven."
				   "               " %%% add vertical spacing between verses
			}}
			\line {"5  "
			    \column {	     
				    "And every virtue we possess,"
				    "    And every victory won,"
				    "And every thought of holiness,"
				    "            Are his alone."
				    "               " %%% add vertical spacing between verses
			}}
			\line { "6. "
			     \column {	     
				     "Spirit of purity and grace,"
				     "    Our weakness, pitying, see:"
				     "O make our hearts thy dwelling-place,"
				     "            And worthier thee."
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
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo b1 a1 \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 58 2) }}  %%Amen midi       
       
}  


} %%% book bracket
