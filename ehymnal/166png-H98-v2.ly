%%%166.png
%%%Hymn 98 Song 46. Drop, drop, slow tears.
%%%Version 2

\version "2.10"

\header {

  dedication = \markup { \center-align { \line {  "THE CHRISTIAN YEAR - PASSIONTIDE" } 
					       \hspace #1
						} }	
  title = "98"
			       
  meter = \markup { \small {\column {  \line { \sans {"SONG 46."} \hspace #1 \roman {"(10. 10.)"}}
                                       \line { \italic {Slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 60.}
                                  }
                  }}
 
  arranger =  \markup { \small {\center-align {
		            \line{ \italic "First strain of Song 46" }
			    \line { \smallCaps "O. Gibbons," "1583-1625." }
  		} } }
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01		      

%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-3.0
              \once \override Stem #'X-offset = #-3.0 }


%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro definitions	   
	      
%%% SATB voices

global = {
  \time 4/2
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
  f1 a2 f2 | c'1. f,2 | bes2. bes4 bes2 a2 | \break
  g1. \bar "||" g2 | e2 f2 d2 c2 | f2 a2 g2 g2 | f1 \bar "||"
}

alto = \relative c' {
  c1 f2 c2 | c1. f2 | f2. f4 g2 f2 | \break
  e1. \bar "||" d2 | c2 c2 bes2 a2 | d2 f2 f2 e2 | \merge f1 \bar "||"
}

tenor = \relative c { \clef bass
  a'1 c2 a2 | g1. a2 | bes2. bes4 ees2 c2 | \break
  c1. \bar "||" bes2 | g2 f2 f2 f2 | a2 c2 c2. bes4 | a1 \bar "||"
}

bass = \relative c { \clef bass
  f1 f2 f2 | \straddle f2( e1) f2 | d2. d4 ees2 f2 | \break
  c1. \bar "||" g2 | c2 a2 bes2 f'2 | d2 a2 c2 c2 | f1 \bar "||"
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
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 60 2) }
       }	
} %%score bracket

%%% Lyrics titles

\markup { \small { \hspace #64 \italic "Phineas Fletcher, 1582-1650." } }

\markup { \hspace #32 %%add space as necc. to center the column
	          \column {  %%% a super column for entire block of lyrics  
                      \column { %%% verse 1 is a column of 2 lines  
                          \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "D" }   %%Drop Cap goes here
                                  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
                                  \column  { \raise #0.0  "ROP, drop, slow tears,"
                                                         "  And bathe those beauteous feet," } }          
                          \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
                                   \lower  #1.56  %%adjust this until the line spacing looks right
                                   \column {   
					   "Which brought from heaven"
					   "    The news and Prince of peace."
                                        }}
                               
                                   } %% finish verse 1   
				                 \hspace #1 
                \line { "2  "
                           \column {         
				   "Cease not, wet eyes,"
				   "    His mercies to entreat;"
				   "To cry for vengeance"
				   "    Sin doth never cease."
                        }}
		 \hspace #1 
                \line { "3. "
                           \column {         
				   "In your deep floods"
				   "    Drown all my faults and fears;"
				   "Nor let his eye"
				   "    See sin, but through my tears."
                        }}
		  } %%% end super column		
}         

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f1 f1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo d1 c1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree bes'1 a1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour bes1 f1 \bar "||" }}
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
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 60 2) }}   
       
}  

} %%book bracket