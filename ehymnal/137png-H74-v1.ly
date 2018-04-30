%%%137.png
%%%Hymn 74 St. Bride. Have mercy, Lord, on me
%%%Version 1

\version "2.10"

\header {
	dedication = \markup { \center-align { \line {  "THE CHRISTIAN YEAR - LENT" } 
					       \hspace #1
						} }	
  title = "74"
			       
  arranger = \markup { \small { \smallCaps "S. Howard, 1710-82."} }
  poet = \markup { \small { \sans  "ST. BRIDE." \hspace #1 \roman { "(S. M.)"} } }
  meter = \markup { \small { \italic {Moderately slow, dignified} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 66.} }
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% macro to specify a partial measure in the middle of a piece.
%%% Manual does not recommend using \partial in the middle of a piece.
%%% In this case, the macro specifies that 2 1/2 notes in a 4/2 measure have past,
%%% hence we are halfway through the measure
halfmeasure =  \set Score.measurePosition = #(ly:make-moment 2 2)

%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.8 
              \once \override Stem #'X-offset = #-2.8 }

%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro definitions	   
	      
%%% SATB voices

global = {
  \time 4/2
  \key g \minor
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
  \partial 1 g'1 | d2 g bes a | g1 \bar "||" 
     bes1 | f2 bes d c | bes1 \bar "||" \break    
  d1 | c2 bes a g | f ees d1 ^\fermata \bar "||" 
      d'1 | g,2 c bes a | g1 \bar "||" 
}

alto = \relative c' {
  d1 | d2 c bes4( c4) d4( c4) | bes1 \bar "||" 
      d1 | d2. ees4 f2 f4( ees4) d1 \bar "||"       
  f1 | f2 d f ees | d c4( bes4) a1 \bar "||" 
     d1 | bes2 ees g fis | \once \override NoteColumn #'force-hshift = #-0.01 g1 \bar "||" 
}

tenor = \relative c { \clef bass
  bes'1 | g2 g g fis | g1 \bar "||" 
     d'1 | bes2 bes bes a | bes1 \bar "||" 
  bes1 | a2 bes d bes | bes4( a4) g2 fis1 \bar "||" 
      \halfmeasure f!1 | g2 g4( a4) bes4( c4) d4( c4) | bes1 \bar "||" 
}

bass = \relative c { \clef bass
  g1 | bes2 ees d d | g,1 \bar "||" 
      g'1 | \straddle bes4( a4) g2 f f | bes,1 \bar "||"
  \once \override NoteColumn #'force-hshift = #-0.01 bes'1 | f2 g d ees | bes c d1 _\fermata \bar "||" 
      bes1 | ees4( d4) c2 d d | g,1 \bar "||" 
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

\markup { \small { \hspace #6 \italic "Ps. 51."  \hspace #50 \italic "N. Tate and N. Brady.  (New Version, 1698.)"} }

%%% Lyrics, in 2 columns with separator line, 2 verses per column

\markup { \hspace #10  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column comprising 3 columns and separator line
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #5.0 \column { \lower #2.4 \fontsize #8 "H" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "AVE mercy, Lord, on me,"
			                                "  As thou wert ever kind;" } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
"Let me, opprest with loads of guilt,"
"    Thy wonted mercy find."
			  		}}
			       
			           } %%% finish verse 1
		        \hspace #1 
           		\line { "2  "
			   \column {	     
"    Wash off my foul offence,"
"    And cleanse me from my sin;"
"For I confess my crime, and see"
"    How great my guilt has been."
			}}
		}  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -22 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
 
           		\line { "3  "
			  \column {	     
"    The joy thy favour gives"
"    Let me again obtain,"
"And thy free Spirit's firm support"
"    My fainting soul sustain."
			}}
		        \hspace #1 
           		\line {"4. "
			  \column {	     
"    To God the Father, Son,"
"    And Spirit glory be,"
"As 'twas, and is, and shall be so"
"    To all eternity.     Amen."
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
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo c1 b1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree ees1 d1 \bar "||" }}
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