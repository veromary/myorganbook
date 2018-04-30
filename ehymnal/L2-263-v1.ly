%%% 409png
%%% Hymn 263 Alfreton Blest are the moments, doubly blest
%%% Version 1

\version "2.10"

\header {
	
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—NOON"
	                                        \hspace #0.1 }}	
	
  title = "263"

  
  poet = \markup {  \small { \sans {"ALFRETON."}   \hspace #1 \roman {"(L. M.)"}} }
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"2" #0.5 = 72.} }
  
  arranger =  \markup { \small { "‘" \hspace #-1 \italic "Supplement to the" \smallCaps "New Version," \hspace #-1.2 "’"  "1708." }}
  
  tagline =""
}

%%% SATB Voices

global = {
  \time 4/2
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 1 g'1 | b2 c a b | g a fis^\fermata \bar "||" a | b cis d a | b a4( g4) fis2^\fermata \bar "||" \break
  a2 | d b c b | a g fis^\fermata \bar "||" a | b c d g, | g2. fis4 g1^\fermata \bar "||"
}

alto = \relative c' { 
  d1 | g2 g d fis | e cis d \bar "||" fis g e d d | d cis d \bar "||"
  d | d e e g4( fis) | e2 e d \bar "||" d | g fis4( e4) d2 e | d d d1 \bar "||" 
}

tenor = \relative c { \clef bass
  b'1 | d2 c d d | b a a \bar "||" d | d a a fis | e a a \bar "||"
  fis | fis gis a d | c c a \bar "||" d | d c g c4( b4) | a2 a b1 \bar "||"
}

bass = \relative c { \clef bass
  g1 | g'2 e fis d | e a, d _\fermata \bar "||" d g g fis d | g, a d _\fermata \bar "||"
  d | b e a, b | c a d _\fermata \bar "||" fis, g a b c | d d g,1 _\fermata \bar "||" 
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

%%% Hymn Midi	

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 72 2)}} 

} %%% Score bracket


%%% Lyric attributions and titles

\markup { "               "}


\markup { \small { \hspace #72 \italic "William Wordsworth, 1770-1850." }}


%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.3 \column { \lower #2.4 \fontsize #8 "B" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "LEST are the moments, doubly blest,"
			                                 "  That, drawn from this one hour of rest," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					  "Are with a ready heart bestowed"
					  "Upon the service of our God!"
					   "      " %%% adds vertical spacing between verses
			  		}}
		      } 

		      	\line {"2*" \hspace #-0.4
			   \column {	     
                                     "Each field is then a hallowed spot,"
				     "An altar is in each man's cot,"
				     "A church in every grove that spreads"
				     "Its living roof above our heads."
				   "               " %%% add vertical spacing between verses
			}}
			\line {"3  "
			   \column {	     
                                     "Look up to heaven! the industrious sun"
				     "Already half his race hath run;"
				     "He cannot halt or go astray,"
				     "But our immortal spirits may."
				   "               " %%% add vertical spacing between verses
			}}
			\line {"4  "
			   \column {	     
				   "Lord, since his rising in the east,"
				   "If we have faltered or transgressed,"
				   "Guide, from thy love's abundant source,"
				   "What yet remains of this day's course;"
				   "               " %%% add vertical spacing between verses
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

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
		  	\hspace #1  % adds vertical spacing between verses  
           		\line { "5. "
			     \column {	     
				     "Help with thy grace, through life's short day,"
				     "Our upward and our downward way;"
				     "And glorify for us the west,"
				     "When we shall sink to final rest."
			}}

	  }
} %%% lyric markup bracket



%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne g'1 g1  \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo e1 d1 \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
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

       } %%% close layout

%%% Amen Midi
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 72 2) }} 

}

%%% alternative hymns also suitable

\markup { \italic { \hspace #54 \center-align { \line {"The following is also suitable for Mid-day Services:"}
	                            \line {"259  Forth in thy name, O Lord, I go."}
				    \line { "            " }
	                            \line {"Also many of the simpler Hymns."}
}}}				    


} %%% book bracket

