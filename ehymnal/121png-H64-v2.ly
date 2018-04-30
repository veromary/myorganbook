%%% 121.png
%%% Hymn 64 Dunfermline Maker of Earth, to thee alone
%%% Version 2

\version "2.10"

\header {
	dedication = \markup { \center-align { \line {  "THE CHRISTIAN YEAR - SEPTUAGESIMA TO LENT" } 
					       \hspace #1
						} }	
  title = \markup { "64" }
			       
  arranger = \markup { \small {\italic "Scottish Psalter, 1615."} }
  poet = \markup { \small { \sans  "DUNFERMLINE." \hspace #1 \roman { "(C. M.)"} } }
  meter = \markup { \small { \italic {Moderately slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 66.} }
  tagline = ""
}

%%%%%%%%%%%%%%%%% Macro Definitions

%%% macro to cope with a partial measure in the middle of a piece.
%%% Manual does not recommend using \partial in the middle of a piece.
%%% In this case, the macro specifies that 0 of 1/2 notes in a 4/2 measure have past,
%%% hence we are restarting at the beginning of a measure, and the previous partial measure is 
%%% considered complete
startmeasure =  \set Score.measurePosition = #(ly:make-moment 0 2)

%% generates the breathmarks
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}

%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
 \time 4/2 
 \key e \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  e1 e2 fis2 | gis2 a2 b2 b2 | gis1 \breathmark \bar "||" 
      gis1 | cis2 b2 b2 ais2 | b1 ^\fermata \bar "||" \break
  \startmeasure b1 gis2 b2 | cis2 b2 \once \override NoteColumn #'force-hshift = #1.6 a2 gis2 | fis1 \breathmark \bar "||" 
      gis1 | fis2 e2 e2 dis2 | e1 ^\fermata \bar "||" 
}

alto = \relative c' { 
  b1 b2 cis4( dis4) | e2 e2 e2 dis2 | e1 \bar "||" 
      b1 | e2 dis2 cis2 cis2 | dis1 \bar "||" 
  fis1 e2 fis4( gis4) | a2 gis2 gis4( fis4) e2 | dis1 \bar "||" 
      e1 | cis2 gis4( a4) b2 b2 | b1 \bar "||"
}

tenor = \relative c { \clef bass 
  gis'1 b2 a2 | b2 a2 fis2 fis2 | gis1 \bar "||" 
      e1 | gis2 fis2 gis2 cis2 |  b1  \bar "||"
  b1 e2 d2 | cis2 dis!2 e4( b4) b2 | b1 \bar "||" 
      b1 | a2 e2 fis2 fis2 | gis1 \bar "||"
}

bass = \relative c { \clef bass 
  e1 gis2 fis2 | e2 cis2 b2 b2 | e1 \bar "||" 
      \once \override NoteColumn #'force-hshift = #-0.02 e1 | cis2 dis2 e2 fis2 | b,1 _\fermata \bar "||" 
  dis1 e2 b2 | a2 b2 cis4( dis4) e2 | b1 \bar "||" 
      e1 | a,2 cis2 b2 b2 | e1 _\fermata \bar "||"
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
%	\context { \Score timing = ##f }
	\context { \Score \remove "Bar_number_engraver" }
	\context { \Staff \remove "Time_signature_engraver" }
	\context { \Score \remove "Mark_engraver"  }
        \context { \Staff \consists "Mark_engraver"  }
	}
	
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 144 4)
            }
       }
	
} %%% score bracket

%%% Text markups - lyrics titles

\markup {
	\column { \small {
		\line { \hspace #60  \italic "C. Coffin, 1676-1749.  Tr. J. M. Neale." }
		                                                                                                     
	    \line { \hspace #38 \small "Te laeta, mundi Conditor."}
} } } 

%%% Main lyrics markup block

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "M" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "AKER of earth, to thee alone"  "  Perpetual rest belongs;"} }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "And the bright choirs around thy throne"
					   "    May pour their endless songs."
			  		}}
			       
			           } %% finish stanza 1	
		       \hspace #1 
           		\line { "2  "
			   \column {	     
				   "But we,—ah holy now no more!"
				   "    Are doomed to toil and pain;"
				   "Yet exiles on an alien shore"
				   "    May sing their country's strain."
			}}
			\hspace #1 
					  \line { "3  "
		    \column {	     
			    "Father, whose promise binds thee still"
			    "    To heal the suppliant throng,"
			    "Grant us to mourn the deeds of ill"
			    "    That banish us so long;"
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

\markup { \hspace #30   %%add space as necc. to center the column
          \column {  
           	\line {"4  "
		    \column {	     
			    "And, while we mourn, in faith to rest"
			    "    Upon thy love and care,"
			    "Till thou restore us with the blest"
			    "    The song of heaven to share."
			}} 
		\hspace #1 % adds vertical spacing between verses  
		\line {"5. "
		    \column {	     
			    "O God the Father, God the Son,"
			    "    And God the Holy Ghost,"
			    "To thee be praise, great Three in One,"
			    "    From thy created host.     Amen."
		}}
	  }
} %%% lyric markup bracket

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne e1 e1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo cis1 b1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree a'1 gis1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  a1 e'1 \bar "||" }}
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
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2) }}     
       
}  

%%% List of hymns also suitable

\markup {\hspace #30 \column {
	\line{ \hspace #3 \italic "The following are also suitable:"}
	\hspace #0.1 
	\small {
	"459  O Love, how deep, how broad, how high."
	"471  Praise to the Holiest in the height."
	"497  There is a book who runs may read."  }
}} 


} %%book bracket
