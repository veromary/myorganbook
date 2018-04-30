%%%143.png
%%%Hymn 79 Hunnys. Lord, when we bend before thy throne
%%%Version 2

\version "2.10"

\header {
	dedication = \markup { \center-align { \line {  "THE CHRISTIAN YEAR - LENT" } 
					       \hspace #1
						} }	
  title = "79"
			       
  arranger = \markup { \small { \italic "Melody in ‘Seven Sobs of a Sorrowful Soul,’ 1585."} }
  poet = \markup { \small { \sans  "HUNNYS." \hspace #1 \roman { "(C. M.)"} } }
  meter = \markup { \small { \italic {Moderately slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 80.} }
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%% Macros
	      
%%generates the breathmarks
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 
merge = \once \override NoteColumn #'force-hshift = #-0.01

%%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 

straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.0
              \once \override Stem #'X-offset = #-1.0 
}

%%% push a note slightly to the right	      
	      
push = \once \override NoteColumn #'force-hshift = #0.4


%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro definitions	   
	      
%%% SATB voices

global = {
  \time 6/2
  \key f \minor
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
  \partial 2 f2 | aes1 bes2 g1 aes2 | g1 f2 e1 \breathmark \bar "||" f2 | bes1 aes2 aes1 g2 | aes1. ~ aes1 \bar "||"
  aes2 | bes1 bes2 c1 f,2 | bes1 aes2 g1 \breathmark \bar "||" ees!2 | aes1 f2 aes2 g1 | 
      \once \override Dots #'transparent = ##t f1. ~ f1 \bar "||"
}

alto = \relative c' {
  c2 | f1 f2 ees1 ees2 | des1 f2 c1 \bar "||" f2 | f1 f2 ees1 ees2 | ees1. ~ ees1 \bar "||"
  ees2 | f1 g2 g1 f2 | \straddle d2.( e4) f2 e1 \bar "||" ees2 | ees1 c2 \push f1 e2 | \merge f1. ~ \merge f1 \bar "||"
}

tenor = \relative c { \clef bass
  aes'2 | c1 des2 bes1 aes2 | des1 bes2 g1 \bar "||" c2 | des1 des4( c4) bes1 bes2 | c1. ~ c1 \bar "||"
  c2 | des1 des2 c1 c2 | bes1 c2 c1 \bar "||" g2 | aes1 c2 des2 g,1 | aes1. ~ aes1 \bar "||"
}

bass = \relative c { \clef bass
  f2 | f1 des2 \straddle ees2.( des4) c2 | \straddle bes2.( c4) des2 c1 \bar "||" aes2 | des1 bes2 ees1 ees2 | aes,1. ~ aes1 \bar "||"
  aes'2 | \straddle aes2.( g4) f2 e1 aes2 | g1 f2 c1 \bar "||" ees!2 | c1 aes2 bes2 c1 | f,1. ~ f1 \bar "||" 
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
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 2) }
       }	
} %%score bracket

%%% Lyrics titles

\markup { \small { \hspace #84 \italic "J. D. Carlyle, 1758-1804."} }

%%% Lyrics in 3 columns,  column 1 (verses), column 2 (a dividing line), column 3 (verses)

\markup { \hspace #4  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "L" }   %%Drop Cap goes here
				  \hspace #-1.4    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ORD, when we bend before thy throne,"
			                                "  And our confessions pour," } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Teach us to feel the sins we own,"
					   "    And hate what we deplore."
			  		}}
			       
			           } %%% finish verse 1
		        \hspace #1 
           		\line { "2  "
			   \column {	     
				   "Our broken spirits pitying see,"
				   "    And penitence impart;"
				   "Then let a kindling glance from thee"
				   "    Beam hope upon the heart."
			}}
		}  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -22 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
 
           		\line { "3  "
			  \column {	     
				  "When we disclose our wants in prayer"
				  "    May we our wills resign,"
				  "And not a thought our bosom share"
				  "    That is not wholly thine."
			}}
		        \hspace #1 
           		\line {"4. "
			  \column {	     
				  "Let faith each meek petition fill,"
				  "    And waft it to the skies;"
				  "And teach our hearts 'tis goodness still"
				  "    That grants it or denies."
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
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 2) }}   
       
}  

} %%book bracket