%%%% 237.png
%%%% Hymn 147. St. Magnus (Nottingham).  The head that once was crowned with thorns. 
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "THE CHRISTIAN YEAR - ASCENSIONTIDE"
	\hspace #0.1 }}	
	
	title = "147"   
  
  poet = \markup { \small {  \line { \sans { "ST. MAGNUS (NOTTINGHAM)."} \hspace #1 \roman {"(C. M.)"}} }}
  
  meter = \markup { \small { \italic {Moderately slow} \general-align #Y #DOWN \note #"2" #0.5 = 60.} }
  
  arranger = \markup { \small \smallCaps "J. Clarke, 1670-1707." }
  
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01

%%generates the breathmarks
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}	      

%%shortcut macro for small notes
smallnote = {  \once \set fontSize = #-3 
              \once \override Stem #'length = #5  }

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 2 d2 | g a fis d | g a b \breathmark \bar "||" a | b g b cis | d1. \bar "||" \break
  a2 | b a g fis | e a fis \breathmark \bar "||" d | d' d4( c) b2 a | g1. \bar "||"
} 
   
alto = \relative c' {  
  b2 | b e d d | d e4( fis) g2 \bar "||" fis | g d d g |  fis1. \bar "||"
  fis2 | g fis e d | c e d \bar "||" d | g g g fis | \merge g1. \bar "||"
}

tenor = \relative c {\clef bass 
  g'2 | g c a fis | g c b \bar "||" d | d d4( c4) b( a) g2 | a1. \bar "||"
  d2 | d d b b | g c a \bar "||" d | d e d2. c4 | b1. \bar "||"
}

bass = \relative c {\clef bass 
  g'2 | e c d2. c4 | b2 a g \bar "||" d' | g b4( a) g( fis) e2 | d1. \bar "||" \break
  d2 | g d e b | c a d \bar "||" d4( c) | b2 c d d |<< { g1. } 
      \new Voice = "org" { \voiceFour 
      \once \override NoteColumn #'force-hshift = #0.2
      \smallnote g,1. } >> \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 60 2) }}      
  	
	
} %%% Score bracket

%%% Lyric attributions and titles

\markup { \small { \hspace #84 \italic "T. Kelly, 1769-1854." }}

%%% Main lyric block
%%% To fit on one page, lyrics are in 3 columns: column 1 (verses ), column 2 (a dividing line), column 3 (verses)

\markup { \hspace #2  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HE head that once was crowned with thorns"
			                                 "  Is crowned with glory now:" } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "A royal diadem adorns"
					   "    The mighty Victor's brow."
			  		}} 
			         } %%% finish verse 1
		        \hspace #1  % adds vertical spacing between verses  
           		\line { "2  "
			   \column {	     
				   "The highest place that heaven affords"
				   "    Is his, is his by right,"
				   "The King of kings and Lord of lords,"
				   "    And heaven's eternal Light;"
			}}
			\hspace #1  % adds vertical spacing between verses  
           		\line { "3  "
			   \column {	     
				   "The joy of all who dwell above,"
				   "    The joy of all below,"
				   "To whom he manifests his love,"
				   "    And grants his name to know."
			}}
		}  %% finish Page column 1
		
	\hspace #2 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -36 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #2 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
			\line {"4  "
			   \column {	     
				   "To them the Cross, with all its shame,"
				   "    With all its grace is given:"
				   "Their name an everlasting name,"
				   "    Their joy the joy of heaven."
			}}
			\hspace #1 % adds vertical spacing between verses  
			\line {"5  "
			    \column {	     
				    "They suffer with their Lord below,"
				    "    They reign with him above,"
				    "Their profit and their joy to know"
				    "    The mystery of his love."
			}}
			\hspace #1 % adds vertical spacing between verses
			\line { "6. "
			     \column {	     
				     "The Cross he bore is life and health,"
				     "    Though shame and death to him;"
				     "His people's hope, his people's wealth,"
				     "    Their everlasting theme."
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
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne g'1 g1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo e1 d1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree c'1 b1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  c1 g1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 60 2) }}  %%Amen midi       
       
}  


} %%% book bracket
