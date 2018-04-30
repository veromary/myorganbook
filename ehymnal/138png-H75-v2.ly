%%%138png
%%%Hymn 75 St. Raphael Jesu, Lord of life and glory
%%%Version 2

\version "2.10"

\header {
	dedication = \markup { \center-align { \line {  "THE CHRISTIAN YEAR - LENT" } 
					       \hspace #1
						} }	
  title = "75"
			       
  arranger = \markup { \small { \smallCaps "E. J. Hopkins, 1818-1901."} }
  poet = \markup { \small { \sans  "ST. RAPHAEL." \hspace #1 \roman { "(8 7. 8 7. 4 7.)"} } }
  meter = \markup { \small { \italic {In moderate time} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 69.} }
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%% Macros
	      
%% generates the breathmarks
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}

%% pushes a notehead slightly to the right
push = \once \override NoteHead #'X-offset = #1 


%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro definitions	   
	      
%%% SATB voices

global = {
  \time 4/2
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
  g'2 g fis g | e2. fis4 g2 d | e fis g c | a2. g4 g1 \bar "||" \break
  g2 g fis g | g a b fis | b2. b4 a2 d2 | cis2. d4 d1 \breathmark \bar "||" \break
  a2 g fis d | e fis g b | \push a1 a1 | g\breve \bar "||"
}

alto = \relative c' {
  b2 b c d | c c b b | c c b e | d c b1 \bar "||"
  b2 c d d | e e dis dis | e d! d fis | e2. d4 d1 \bar "||"
  c2 b a d | d c b d | \push c1 c1 | b\breve \bar "||"
}

tenor = \relative c { \clef bass
  d2 d d g | g a d, g | g a g g | g fis g1 \bar "||"
  g2 g a g | g e fis b | e, eis fis a | g2. fis4 fis1 \bar "||"
  fis2 g a b | b a g gis |  a2( e) fis1 | g\breve \bar "||"
}

bass = \relative c { \clef bass
  g2 g a b | c a g g | c a e' c | d2. d4 g,1 \bar "||"
  e'2 e d b | c c b b | gis gis a a | a2. d4 d1 \bar "||"
  d2 d d b | c d e e | \push a,1 d1 | g,\breve \bar "||"
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

\midi { 
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 69 2) }
       }	
} %%score bracket

%%% Lyrics titles

\markup { \small { \hspace #66 \italic "J. J. Cummins" "‡," \italic "1795-1867."} }

%%% Main block of lyrics

\markup { \hspace #30 %%add space as necc. to center the column
	      \column {  %%% a super column for the entire block of lyrics 
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "J" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ESU, Lord of life and glory,"
			                                "  Bend from heaven thy gracious ear;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "While our waiting souls adore thee,"
					   "    Friend of helpless sinners, hear:"
					   "        By thy mercy,"
					   "    O deliver us, good Lord."
			  		}}
			       
			           } %% finish verse 1	 
		  \hspace #1  % adds vertical spacing between verses  	
		  \line { "2  "
		    \column {	     
			    "* Taught by thine unerring Spirit"
			    "    Boldly we draw nigh to God,"
			    "Only in thy spotless merit,"
			    "    Only through thy precious Blood:"
			    "        By thy mercy,"
			    "    O deliver us, good Lord."
			}}
	      } %%% end super column			   
}	  
	

%%% fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
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

%%% second page
%%% continuation of  lyrics

\markup { \hspace #30   %%add space as necc. to center the column
          \column { 
		 \hspace #1  % adds vertical spacing between verses  	
		  \line { "3  "
		    \column {	     
			    "From the depth of nature's blindness,"
			    "    From the hardening power of sin,"
			    "From all malice and unkindness,"
			    "    From the pride that lurks within:"
			    "        By thy mercy,"
			    "    O deliver us, good Lord."
			}}
		\hspace #1  % adds vertical spacing between verses   
		\line { "4  "
		    \column {	     
			    "When temptation sorely presses,"
			    "    In the day of Satan's power,"
			    "In our times of deep distresses,"
			    "    In each dark and trying hour:"
			    "        By thy mercy,"
			    "    O deliver us, good Lord."
			}}
		\hspace #1  % adds vertical spacing between verses   
		\line { "5  "
		    \column {	     
			    "* In the weary hours of sickness,"
			    "    In the times of grief and pain,"
			    "When we feel our mortal weakness,"
			    "    When the creature's help is vain:"
			    "        By thy mercy,"
			    "    O deliver us, good Lord."
			}}		
		\hspace #1  % adds vertical spacing between verses   
		\line { "6  "
		    \column {	     
			    "In the solemn hour of dying,"
			    "    In the awful judgement day,"
			    "May our souls, on thee relying,"
			    "    Find thee still our rock and stay:"
			    "        By thy mercy,"
			    "    O deliver us, good Lord."
			}}
           	\hspace #1  % adds vertical spacing between verses  		  
           	\line { "7. "
		   \column {	     
			   "Jesu, may thy promised blessing"
			   "    Comfort to our souls afford;"
			   "May we now, thy love possessing,"
			   "    And at length our full reward,"
			   "        Ever praise thee,"
			   "    Thee, our ever-glorious Lord."
     			}}
	  }
}% lyric markup bracket

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

%%% Amen midi       
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 69 2) }}   
       
}  

} %%book bracket