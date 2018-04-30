%%%160png
%%%Hymn 93 University The God of Love my Shepherd is
%%%Version 2

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - REFRESHMENT SUNDAY"
		                         \hspace #0.1 }}	
  title = "93"
  
  meter = \markup { \small {\column {  \line { \sans {"UNIVERSITY."} \hspace #1 \roman {"(C. M.)"}}
                                       \line { \italic {Moderately fast} \fontsize #-5 \general-align #Y #DOWN \note #"4" #1 = 100.}
                                  }
                  }}
 
  arranger =  \markup { \small {\center-align {
		            \line{ \italic {"Probably by" } }
			    \line { \smallCaps { "J. Randall, 1715-99."}}
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

%% Macro for generating two augmentation dots for a notehead. 
%% When dotted notes from two vocal parts share a single notehead, 
%% Lilypond only inserts a single dot. In the image, two dots are used. 
%% This macro generates the two dots by replacing the normal dot glyph 
%% with a new glyph comprising a column of 2 dots one above the other.
 
augdots = { 
 \once \override Voice.Dots #'stencil = #ly:text-interface::print 
 \once \override Voice.Dots #'text = \markup {  \hspace #0 \raise #1 
                                                \line { \translate #(cons -0.2 0) 
                                                \override #'(baseline-skip . 1 )  
                                                   \column { 
                                                     \musicglyph #"dots.dot" 
                                                     \musicglyph #"dots.dot" } } }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

soprano = \relative c' { 
  \partial 4 g'4 | f8[ e8] d8[ c8] c'4 d8[ e8] | g,4 f4 e4. \bar "||" g8 | e8[ c8] a'8[ g8] f4 e4 | d2. \bar "||" \break
  g4 | c4 c8[ b8] a4 g4 | c,4 d8[ e8] f4. \breathmark \bar "||" g8 | a8[ c8] g8[ a8] e4  d4 | c2. \bar "||"
}

alto = \relative c' {
  c4 | c4 b8[ c8] g'4 f8[ e8] | d4 b4 c4. \bar "||" d8 | c4 c4 a8[ b8] c4 | b2. \bar "||"
  d4 | g4 e4 f4 c4 | c4 c4 c4. \bar "||" c8 | f4 c4 c4 b4 |  \augdots c2. \bar "||" 
}

tenor = \relative c { \clef bass
  e4 | a8[ g8] f8[ e8] g4 b8[ c8] | d4 g,4 g4. \bar "||" g8 | g4 f8[ g8] a8[ f8] g4 | g2.  \bar "||" 
  b4 | c4 g4 b4 c8[ b8] | a4 a8[ g8] f4. \bar "||" c'8 | a4 c8[ a8] g4. f8 | e2. \bar "||" 
}

bass = \relative c {\clef bass
  c4 | c4 c4 e4 d8[ c8] | b4 g4 c4. \bar "||" b8 | c8[ e8] f8[ e8] d4 c4 | g'2. \bar "||" 
  g8[ f8] | e4 c4 d4 e4 | a4 f8[ e8] d4. \bar "||" e8 | f4 e8[ f8]        
      \override Staff.NoteCollision
      #'merge-differently-dotted = ##t g4 g,4 | c2. \bar "||" 
}

global = {
  \time 4/4 
  \key c \major 
  \set Staff.midiInstrument = "church organ" 
}

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
%%annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##t
}

\book{

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
       tempoWholesPerMinute = #(ly:make-moment 100 4)
            }
       }
	
} %%score bracket

\markup { \hspace #4   %%add space as necc. to center the column
          \column { %% super column of everything
	    \hspace #0.2
	    \line { \small { \italic "Ps. 23. (Suitable also for general use.)" \hspace #36 \italic "George Herbert,  1593-1632."}}
	    \line { %% a master line of 3 columns    
		\column { %% column 1
	        \hspace #1 % adds vertical spacing between verses
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HE God of love my Shepherd is,"
			                                 "  And he that doth me feed;"} }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "While he is mine and I am his,"
					   "    What can I want or need?"
			  		}}
			       
			           } %% finish stanza 1
		\hspace #1 
           		\line { "2  "
			   \column {	     
				   "He leads me to the tender grass,"
				   "    Where I both feed and rest;"
				   "Then to the streams that gently pass:"
				   "    In both I have the best."
			}}
		}  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -24 . -1) #0 }       %%Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
 
	   \hspace #1 % adds vertical spacing between verses
           		\line { "3  "
			  \column {	     
				  "Or if I stray, he doth convert,"
				  "    And bring my mind in frame,"
				  "And all this not for my desert,"
				  "    But for his holy name."
			}}
		\hspace #1 
           		\line {"4  "
			  \column {	     
				  "Yea, in death's shady black abode"
				  "    Well may I walk, not fear;"
				  "For thou art with me, and thy rod"
				  "    To guard, thy staff to bear."
			}}


	    } %% end column 3
     } %% end master-line
    		\hspace #1 
           		\line { \hspace #26 "5. "
			  \column {	     
				  "Surely thy sweet and wondrous love"
				  "    Shall measure all my days;"
				  "And as it never shall remove"
				  "    So neither shall my praise." 
     			}}
}
}% stanza markup bracket

%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2)} 
	                    << 
	\context Voice = "sopranos" { \relative c' { \global
	                                             \voiceOne f1 e1 \bar "||" }}
	\context Voice = "altos"    { \relative c' { \global
	                                              \voiceTwo c1 c1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2)} 
	                       <<
	\context Voice = "tenors" { \relative c { \global \clef bass
	                                          \voiceThree a'1 g1 \bar "||" }}
	\context Voice = "basses" { \relative c { \global \clef bass 
	                                          \voiceFour  f,1 c'1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = ##f opus = ##f tagline = ##f }
\layout { 
	\context { \Score timing = ##f } 
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4) }}  %%Amen midi       
       
} %%end Amen block  

} %%book bracket
