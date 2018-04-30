%%%% 240.png
%%%% Hymn 150. Modern Tune.  Monte Cassino. When Christ our Lord had passed once more.
%%%% Rev 3.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "THE CHRISTIAN YEAR - WHITSUNTIDE"
	\hspace #0.1 }}	
	
	title = \markup { "150 " \large \smallCaps "(Modern Tune)" }   
  
  poet = \markup { \small {  \line { \sans { "MONTE CASSINO."} \hspace #1 \roman {"(L. M.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"2" #0.5 = 72.} }
  
  arranger = \markup { \small \italic "Italian Hymn Melody." }
  
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

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 2/2
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  g'2 d4 d | g2 a | b2. a4 | g2 ^\fermata \bar "||" d'2 | a2. b4 | c2 b | a2. g4 | g1 \breathmark \bar "||" \break
  g2 g4 g | fis2 g | e2. d4 | d2 ^\fermata \bar "||" d'2 | a2. b4 | c2 b | a2. g4 | g1 \bar "||"
} 
   
alto = \relative c' {  
  d2 d4 d | b2 e | d2. fis4 | g2 \bar "||" g2 | a2. g4 | g2 g | g fis | d1 \bar "||"
  e2 b4 cis | dis2 e4( d) | cis2 cis | d2 \bar "||" fis | f e | e4( fis!) g2 | g fis | d1 \bar "||"
}

tenor = \relative c {\clef bass 
  b'2 b4 a4 | g2 g | g fis4( c') | b2 \bar "||" d | d d | c d | e c | b1 \bar "||"
  b2 g4 g | b2 b | a g | fis \bar "||" a | d e4( d) | c2 d | e c | b1 \bar "||"
}

bass = \relative c {\clef bass 
  g'2 g4 fis | e2 c | d d | g _\fermata \bar "||" b | fis f | e d | c d | g1 \bar "||"
  e2 e4 e | b2 e | a, a | d _\fermata \bar "||" d | d c4( b) | a2 b | c d | g,1 \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 72 2) }}      
  	
	
} %%% Score bracket


%%% Hymn Note markup

\markup { \hspace #16 \smallCaps "Note" \hspace #-1.2 ".—" \italic "This hymn may also be sung to the Grenoble Melody at Hymn" "141."  }

\markup { "           " } %%% force some blank space


%%% Lyric titles and attributions

\markup {
\hspace #6 \column {                            
	    \line { \small { \hspace #6 \smallCaps  "Office Hymn." \italic " Whitsun Eve,"  } }
            \line { \small { \hspace #8 "E.:" \italic "and daily till Trinity" \hspace #40 \italic "c. 4th cent.  Tr. P. D." } }   
            \line { \small { \hspace #8 \italic "Sunday." "M." } }
	    \line { \small { \hspace #34 "Jam Christus astra ascenderat." } }
} }
  

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "W" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HEN Christ our Lord had passed once more"
			                                 "  Into the heaven he left before," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "He sent a Comforter below"
					   "The Father's promise to bestow."
					   "      " %%% add vertical spacing between verses
			  		}}
		      } 
           		\line { "2  "
			   \column {	     
				   "The solemn time was soon to fall"
				   "Which told the number mystical;"
				   "For since the Resurrection day"
				   "A week of weeks had passed away."
				   "      " %%% add vertical spacing between verses
			}}
			\line { "3  "
				\column {	     
					"At the third hour a rushing noise"
					"Came like the tempest's sudden voice,"
					"And mingled with the Apostles' prayer,"
					"Proclaiming loud that God was there."
			}}
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

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
			\hspace #1 % adds vertical spacing between verses  
			\line {"4  "
				\column {	     
					"From out the Father's light it came,"
					"That beautiful and kindly flame,"
					"To kindle every Christian heart,"
					"And fervour of the Word impart."
					"      " %%% add vertical spacing between verses
			}}  
			\line {"5  "
				\column {	     
					"As then, O Lord, thou didst fulfil,"
					"Each holy heart to do thy will,"
					"So now do thou our sins forgive"
					"And make the world in peace to live."
					"      " %%% add vertical spacing between verses
			}}
			\line { "6. "
				\column {	     
					"To God the Father, God the Son,"
					"And God the Spirit, praise be done;"
					"May Christ the Lord upon us pour"
					"The Spirit's gift for evermore.     Amen."
     			}}
	  }
} %%% lyric markup bracket


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne g'1 g1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo c1 b1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree e1 d1 \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 72 2) }}  %%Amen midi       
       
}  

%%% Markup for "See also:" line
\markup {\hspace #38 \column {
	\line{ \hspace #8 \italic "See also:"}
	\hspace #1 
	\small {
	"630  Hail thee, Festival Day."
	"631  Spirit of mercy, truth, and love."
}}}      
 
} %%% book bracket
