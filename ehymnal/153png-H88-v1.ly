%%%153.png
%%%Hymn 88 Tunbridge Sinful, sighing to be blest
%%%Version 1

\version "2.10"

\header {
	dedication = \markup { \center-align { \line {  "THE CHRISTIAN YEAR - LENT" } 
					       \hspace #1
						} }	
  title = "88"
			       
  arranger = \markup { \small { \smallCaps "J. Clarke, 1670-1707."} }
  poet = \markup { \small { \sans  "TUNBRIDGE." \hspace #1 \roman { "(7 7. 7 7.)"} } }
  meter = \markup { \small { \italic {Moderately slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 63.} }
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

%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.8 
              \once \override Stem #'X-offset = #-2.8 }

%% Same as above, but a smaller displacement. 		 
smallstraddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.5
              \once \override Stem #'X-offset = #-1.5 }	      
	      
	      
%% Used to pull an upstem note left. Used when a slurred note pair straddles a longer note below when notecolumn force-hshift does not work 
topstraddle = { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.5 
              \once \override Stem #'X-offset = #-0.2 }

%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro definitions	   
	      
%%% SATB voices

soprano = \relative c' {
  g'2 bes a d, | ees c d1 \breathmark \bar "||" 
     bes'2 d c f, | g a bes1 \breathmark \bar "||" \break    
  d,2 g e e | c' a fis1 \breathmark \bar "||" 
      d'2 d, g a4( bes) | c( bes4) a4( g4) g1 \bar "||" 
}

alto = \relative c' {
  d2 bes4( c) d2 \straddle d4( c4) | bes2 c a1 \bar "||" 
      d4( ees4) f2 f f | bes,4( ees) d4( c) d1 \bar "||"       
  d2 d c c | c4( d) ees!2 d1 \bar "||" 
     d2 d d4( c) ees2  | d4( g) fis( g) d1 \bar "||" 
}

tenor = \relative c { \clef bass
  bes'2 g a a | g g \topstraddle g( fis) \bar "||" 
      f! f4( g) a2 bes4( a) | g2 f f1 \bar "||" 
  bes4( c) bes( a) g2 c | ees!4( d) c( bes) a1 \bar "||" 
      g2 g g g | g c bes1 \bar "||" 
}

bass = \relative c { \clef bass
  g'2 g g fis | g ees  d1 \bar "||" 
      bes2 bes f'4( ees4) d2 | ees2 f bes,1 \bar "||"
  bes2 g c4( d) c( bes) | a2 c \smallstraddle d( c) \bar "||" 
      bes2 bes ees c | d d g,1 \bar "||" 
}

global = {
  \time 4/2
  \key g \minor
  \set Staff.midiInstrument = "church organ"
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
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 63 2) }
       }	
} %%score bracket

%%% Lyrics titles

\markup { \hspace #76 \small \italic "J. S. B. Monsell, 1811-75."}

%%% Lyrics, in 2 columns with separator line, 3 verse per column

\markup { \hspace #10  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column comprising 3 columns and separator line
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "S" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "INFUL, sighing to be blest;"
			                                "  Bound, and longing to be free;" } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Weary, waiting for my rest:"
					   "    God, be merciful to me."
			  		}}
			       
			           } %%% finish verse 1
		        \hspace #1 
           		\line { "2  "
			   \column {	     
				   "Holiness I've none to plead,"
				   "    Sinfulness in all I see,"
				   "I can only bring my need:"
				   "    God, be merciful to me."
			}}
			\hspace #1 
           		\line { "3  "
			   \column {	     
				   "Broken heart and downcast eyes"
				   "    Dare not lift themselves to thee;"
				   "Yet thou canst interpret sighs:"
				   "    God, be merciful to me."
			}}
		}  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -36 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
 
           		\line { "4  "
			  \column {	     
				  "From this sinful heart of mine"
				  "    To thy bosom I would flee;"
				  "I am not mine own, but thine:"
				  "    God, be merciful to me."
			}}
		        \hspace #1 
           		\line {"5  "
			  \column {	     
				  "There is One beside thy throne,"
				  "    And my only hope and plea"
				  "Are in him and him alone:"
				  "    God, be merciful to me."
			}}
			\hspace #1 
           		\line {"6. "
			  \column {	     
				  "He my cause will undertake,"
				  "    My interpreter will be;"
				  "He's my all, and for his sake,"
				  "    God, be merciful to me."
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
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo ees1 d1 \bar "||" }}
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

%%% Amen midi       
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 63 2) }}   
       
}  

} %%book bracket