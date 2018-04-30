%%%% 313.png
%%%% Hymn 196 Mount Ephraim.  For all thy saints, O Lord.
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "SAINTS' DAYS: GENERAL - FOR ANY SAINT'S DAY"
	\hspace #0.1 }}	
	
  title = "196"   
  
  poet = \markup { \small {  \line { \sans { "MOUNT EPHRAIM."} \hspace #1 \roman {"(S. M.)"}} }}
  
  meter = \markup { \small { \italic {Slow} \general-align #Y #DOWN \note #"2" #0.5 = 69.} }
  
  arranger = \markup { \small \smallCaps "B. Milgrove, 1731-1810." }
  
  tagline = ""
}


%%%%%%%%%%%%%%%%%%Macros

%%generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01

%%% push a note slightly to the right	      
	      
push = \once \override NoteColumn #'force-hshift = #0.6

%%%%%%%%%%%%%%%%%End of Macro definitions

%%% SATB voices

global = {
  \time 3/2
  \key d \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 2 d2 | fis2 ( e2 ) d2 | a'4. ( g8 fis2 ) e2 | d1 \breathmark \bar "||" d'2 | cis2 ( b2 ) a2 | \break
  e'4. ( d8 cis2 ) b2 | a1 \breathmark \bar "||" g2 | fis4. ( e8 d2 ) b'2 | a4. ( g8 fis2 ) a2 | \break
  b4. ( a8 b2 ) cis2 | d1 ^\fermata \bar "||" b2 | a4. ( g8 fis4 e4 ) d4 ( g4 ) | fis1 e2 | d1 \bar "||" 
} 
   
alto = \relative c' {  
  d2 | d2 ( cis2 ) d2 | \push d1 cis2 | \merge d1 \bar "||" fis2 | a2 ( gis2 ) a2 | 
  e4. ( fis8 e2 ) d2 | cis1 \bar "||" e2 | \push d1 d2 | \push d1 d2 | 
  \push d1 g2 | fis1 \bar "||" g2 | d4. ( e8 d4 cis4 ) b4 ( e4 ) | d1 cis2 | \merge d1 \bar "||" 
}

tenor = \relative c {\clef bass 
  fis2 | a2 ( g2 ) fis2 | a4. ( b8 a2 ) g2 | fis1 \bar "||" a2 | e'2 ( d2 ) cis2 |  
  \push a1 gis2 | a1 \bar "||" a2 | a4. ( g8 fis2 ) g2 | fis4. ( e8 d2 ) d'2 | 
  \push d1 e2 | d1 \bar "||" d2 | a2. ( g4 ) fis4 ( b4 ) | a1 g2 | fis1 \bar "||" 
}

bass = \relative c {\clef bass 
  d2 | \push d1 d2 | fis4. ( g8 a2 ) a,2 | d1 \bar "||" d2 | \push e1 fis2 | 
  cis4. ( d8 e2 ) e2 | a,1 \bar "||" cis2 | \push d1 d2 | \push d1 fis2 | 
  g4. ( fis8 g2 ) e2 | b1 _\fermata \bar "||" g2 | fis2 ( a2 ) b4 ( g4 ) | a1 a2 | d1 \bar "||" 
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 69 2) }}      
  	
	
} %%% Score bracket

%%% Hymn Note markup

\markup {  \hspace #22 \smallCaps "Note" \hspace #-1.2 ".—" \hspace #-1 \italic "This hymn may also be sung to" \smallCaps "St. Michael (" \hspace #-1 \italic "No." "27)." }

\markup { "                 "  }  %%% force some blank space between score and lyrics

\markup { "                 "  }  %%% force some blank space between score and lyrics


%%% Lyric attributions and titles


\markup { \small { \hspace #60 \italic "Bishop R. Mant, 1776-1848." }}

%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #4.9 \column { \lower #2.4 \fontsize #8 "F" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "OR all thy Saints, O Lord,"
			                                "  Who strove in thee to live," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Who followed thee, obeyed, adored,"
					   "    Our grateful hymn receive."
					   "         " %%% adds blank spacing between verses
			  		}}
		      } 
	  } %%% end super column
}


%%fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
\score{
	{s4 }
\header { breakbefore = ##f piece = ##f opus = ##f tagline = ##f }
\layout{	
	\context { \Staff
		\remove Time_signature_engraver
		\remove Key_engraver
		\remove Clef_engraver
		\remove Staff_symbol_engraver
}}}

%%% Second page
%%% Continuation of lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
		  	\hspace #1  % adds vertical spacing between verses  
			   \line { "2  "
			   \column {	     
				   "    For all thy Saints, O Lord,"
				   "    Accept our thankful cry,"
				   "Who counted thee their great reward,"
				   "    And strove in thee to die."
				   "           " %%% adds vertical spacing between verses
			}}
			   \line { "3  "
			   \column {	     
				   "    They all in life and death,"
				   "    With thee their Lord in view,"
				   "Learned from thy Holy Spirit's breath"
				   "    To suffer and to do."
				   "           " %%% adds vertical spacing between verses
			}}
			   \line { "4  "
			   \column {	     
				   "    For this thy name we bless,"
				   "    And humbly beg that we"
				   "May follow them in holiness,"
				   "    And live and die in thee;"
				   "           " %%% adds vertical spacing between verses
			}}
			\line { "5. "
				\column {	     
				   "    With them the Father, Son,"
				   "    And Holy Ghost to praise,"
				   "As in the ancient days was done,"
				   "    And shall through endless days.     Amen."
     			}}

	  }
} %%% lyric markup bracket
  
       
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 69 2) }}  %%Amen midi       
       
}  


} %%% book bracket
