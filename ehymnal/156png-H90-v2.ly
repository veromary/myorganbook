%%%156.png
%%%Hymn 90 De Profundis To my humble supplication
%%%Version 2

\version "2.10"

\header {

  dedication = \markup { \center-align { \line {  "THE CHRISTIAN YEAR - LENT" } 
					       \hspace #1
						} }	
  title = "90"
			       
  meter = \markup { \small {\column {  \line { \sans {"DE PROFUNDIS."} \hspace #1 \roman {"(8 8. 7 7.)"}}
                                       \line { \italic {Slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 72.}
                                  }
                  }}
 
  arranger =  \markup { \small {\center-align {
		            \line{ \italic "Adapted from an" }
			    \line { \italic "English Traditional Melody."  }
  		} } }  
		
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01		      

%%% pushes notecolumn slightly to the right

push = \once \override NoteColumn #'force-hshift = #0.4


%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro definitions	   
	      
%%% SATB voices

global = {
  \time 3/2
  \key f \minor
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
  f1 g2 | aes1 aes2 | bes1 bes2 | aes1 aes2 \breathmark \bar "||" 
      f1 g2 | aes2.( bes4) c2 | des1 bes2 | c1 c2 \breathmark \bar "||" \break
  f,2.( g4) aes2 bes1 aes2 | g1 f2 | e1. \breathmark \bar "||" 
      g2.( aes4) bes2 | aes1 g2 | \push f1 e2 | f1. \bar "||"
}

alto = \relative c' {
  c1 e2 | f1 f2 | f1 f2 | f1 f2 \bar "||" 
      c1 ees2 | ees2.( des4) c2 | f1 ees2 | ees1 ees2 \bar "||"
  \push des1 ees2 | f1 f2 | ees1 c2 | c1. \bar "||" 
      bes2.( c4) des2 | ees1 ees2 | c2 c1 | c1. \bar "||"
}

tenor = \relative c { \clef bass
  aes'1 c2 | c1 c2 | des1 des2 | c1 c2 \bar "||" 
      aes1 bes2 | aes2.( g4) aes2 | aes1 g2 | aes1 aes2 \bar "||"
  aes2.( bes4) aes2 | des1 des2 | bes1 aes2 | g1. \bar "||" 
      ees1 f2 | aes1 bes2 | aes2 g1 | aes1. \bar "||"
}

bass = \relative c { \clef bass
  f1 c2 | f1 f2 | bes,1 bes2 | f'1 f2 \bar "||" 
      f1 ees4( des4) | c2.( bes4) aes2 | des1 ees2 | aes,1 aes2 \bar "||"
  \push des1 c2 | bes2.( c4) des2 | ees1 f2 | c1. \bar "||" 
      \merge ees1 bes2 | c1 ees2 | f2 c1 | f1. \bar "||"
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
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 72 2) }
       }	
} %%score bracket

%%% Lyrics titles

\markup { \small { \hspace #6 \italic "Ps. 86." \hspace #64 \italic "Joseph Bryan" "(" \hspace #-1 \italic "c. 1620" \hspace #-1 ")." } }

%%% Main lyrics markup block
%%% Lyrics in 3 columns,  column 1 (verses), column 2 (a dividing line), column 3 (verses); centred last verse

\markup { \hspace #6 %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "O my humble supplication,"
			                                 "  Lord, give ear and acceptation;" } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Save thy servant, that hath none"
					   "Help nor hope but thee alone."
			  		}}
			       
			           } %%% finish verse 1
		        \hspace #1 
           		\line { "2  "
			   \column {	     
				   "Send, O send, relieving gladness"
				   "To my soul opprest with sadness,"
				   "Which, from clog of earth set free,"
				   "Winged with zeal, flies up to thee;"
			}}
		}  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -22 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
 
           		\line { "3  "
			  \column {	     
				  "To thee, rich in mercies' treasure,"
				  "And in goodness without measure,"
				  "Never-failing help to those"
				  "Who on thy sure help repose."
			}}
		        \hspace #1 
           		\line {"4. "
			  \column {	     
				  "Heavenly Tutor, of thy kindness,"
				  "Teach my dullness, guide my blindness,"
				  "That my steps thy paths may tread,"
				  "Which to endless bliss do lead."
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
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f1 f1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo des1 c1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree bes'1 a1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  bes1 f1 \bar "||" }}
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
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 72 2) }}   
       
}  

} %%book bracket
