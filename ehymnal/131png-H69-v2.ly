%%%131.png
%%%Hymn 69 Plaistow O Jesu Christ from thee began
%%%Version 2

\version "2.10"

\header {
	dedication = \markup { \center-align { \line {  "THE CHRISTIAN YEAR - LENT" } 
					       \hspace #1
						} }	
  title = \markup { "69 " \large \smallCaps "(Modern Tune)" }
			       
  arranger = \markup { \small { \italic "From 'Magdalen Hymns,' 1760(?)."} }
  poet = \markup { \small { \sans  "PLAISTOW." \hspace #1 \roman { "(L. M.)"} } }
  meter = \markup { \small { \italic {Slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 58.} }
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

%% Used to pull a note left. Used when a slurred note pair straddles a longer note when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.8 
              \once \override Stem #'X-offset = #-2.8 }

%% Shortcut macro for small notes
smallnote = {  \once \set fontSize = #-3 
              \once \override Stem #'length = #5  }	      
	      
%% Macro to push notes rightwards
push = { \once \override Dots #'transparent = ##t
	\once \override NoteColumn #'force-hshift = #0.5 }

%% Macro to pull notes leftwards, needed to create the partly merged whole notes	
pull = { \once \override NoteColumn #'force-hshift = #-0.01 }	      

%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro definitions	   
	      
%%% SATB voices

global = {
  \time 4/2
  \key d \minor
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
  \partial 2 d2 | a' e f d | g4( a4) bes2 a ^\fermata \bar "||" e | \break
      
  f g a4( c4) bes4( a4) | a2 g f ^\fermata \bar "||" 
      a | c a4( g4) f2 g4( a4) | \break

  bes2 bes a ^\fermata \bar "||" cis | d a bes a4( g4) | f2 e d ^\fermata \bar "||"
}

alto = \relative c' {
  a2 | a cis d d | d d d \bar "||" e |
  
  d e f4( a4) g4( f4) | f2 e f \bar "||"
      f | g e f f | 
      
  f e4( d4) cis2 \bar "||" e | d f g d4( e4) | d2 cis d \bar "||"
}

tenor = \relative c { \clef bass
  f2 | e a a f | g g f \bar "||" a |
      
  a c c d | c c4( bes4) a2 \bar "||" c | g a a d4( c4) |

  bes2 e, a \bar "||" a | a d d d4( bes4) | a2 g f \bar "||"
}

bass = \relative c { \clef bass
  d2 | cis a d d4( c) | bes2 g d' _\fermata \bar "||" cis |
  
  d c! f bes, | c c f, _\fermata \bar "||" f' | e cis d4( c) bes4( a4) |

  g2 g a _\fermata \bar "||" g' | f d g f4( g4) | a2 a, d _\fermata \bar "||"
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
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 58 2) }
       }	
} %%score bracket


%%% Text markups - lyric titles

\markup { \small { \hspace #10 \smallCaps "Office Hymn." "  M." \italic "  Lent." "iii." \italic "till Passion Sunday."  \hspace #15  \italic "c. 9th cent.  Tr. T. A. L." } }
		                                                                                                     
\markup { \hspace #44 \small "Jesu quadragenariae."} 

%%% Main lyrics markup block
  
\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 " JESU Christ, from thee began"  "  This healing for the soul of man," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "By fasting sought, by fasting found,"
					   "Through forty days of yearly round;"


			  		}}
			       
			           } %% finish stanza 1	
		\hspace #1 
           	\line { "2  "
			   \column {	     
				   "That he who fell from high delight,"
				   "Borne down to sensual appetite,"
				   "By dint of stern control may rise"
				   "To climb the hills of Paradise."
			}}
		}  
}	  

%%%fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
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
%%% Continuation of lyrics

\markup { \hspace #32   %%add space as necc. to center the column
          \column { 

		  \hspace #1 
		  \line { "3  "
		    \column {	     
			    "Therefore behold thy Church, O Lord,"
			    "And grace of penitence accord"
			    "To all who seek with generous tears"
			    "Renewal of their wasted years."
			}}
		\hspace #1 % adds vertical spacing between verses  
           	\line {"4  "
		    \column {	     
			    "Forgive the sin that we have done,"
			    "Forgive the course that we have run,"
			    "And show henceforth in evil day"
			    "Thyself our succour and our stay."
			}} 
		\hspace #1 % adds vertical spacing between verses  
           	\line {"5  "
		    \column {	     
			    "But now let every heart prepare,"
			    "By sacrifice of fast and prayer,"
			    "To keep with joy magnifical"
			    "The solemn Easter festival."
		}}
		\hspace #1 % adds vertical spacing between verses  
           	\line {"6. "
		    \column {	     
			    "Father and Son and Spirit blest,"
			    "To thee be every prayer addrest,"
			    "Who art in threefold Name adored,"
			    "From age to age, the only Lord.     Amen."
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
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo bes1 a1 \bar "||" }}
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

%%% Amen midi       
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 58 2) }}   
       
}  

} %%book bracket
