%%%% 189.png
%%%% Hymn 117 Saffron Walden. His are the thousand sparkling rills
%%%% Rev 2

\version "2.10"
\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - PASSIONTIDE: GOOD FRIDAY"
	\hspace #0.1 }}	
	
  title = "117"
  
  poet = \markup { \small {  \line { \sans {"SAFFRON WALDEN."} \hspace #1 \roman {"(8 8. 8 6.)"}} }}
  
  meter = \markup { \small { \italic {Slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 76.} }
  
  arranger = \markup { \small \smallCaps "A. H. Brown." }
  
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% generates the breathmarks

breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%% push a note slightly to the right

push = \once \override NoteHead #'X-offset = #1.0

%% Used to pull an upstem note left. Used when a slurred note pair straddles a longer note below and when notecolumn force-hshift does not work 
topstraddle = { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.5 
              \once \override Stem #'X-offset = #-0.2 }

	      
%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01		  

	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 3/2
  \key d \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  fis2 e d | a'1 d2 | d( cis ) b | a1. \bar "||" a2 g fis | \break
  e( cis) d | g2.( a4) fis2 | e1 \breathmark \bar "||" e2 | \push a1 a2 | \break
  a1 d2 | \topstraddle d2( b) g | e1. \bar "||" a2 d, e | fis1 e2 | \once \override Dots #'transparent = ##t d1. \bar "||" 
} 
   
alto = \relative c' {
  d2 cis d | d1 a'2 | \push g1 g2 | g1. \bar "||" fis4( e) d2. cis4 |
  b2( a) a | b( cis) d | cis1 \bar "||" cis2 | cis2( d) e
  d1 d2 | d1 d2 | cis1. \bar "||" cis2 d d | d1 cis2 | \merge d1. \bar "||"
}

tenor = \relative c {\clef bass 
  a'2 g fis | a1 a2 | b( cis) d | \push e1. \bar "||" d4( cis) b2 a |
  g1 a2 | \push g1 a2 | a1 \bar "||" a2 a( b) cis |
  d1 c2 | b1 b2 | a1. \bar "||" a2 fis b | a1 g2 | fis1. \bar "||"
}

bass = \relative c {\clef bass 
  d2 a b | fis1 fis'2 | \push e1 d2 | \push cis1. \bar "||" d2 d d |
  \merge g1 fis2 | \push e1 d2 | a1 \bar "||" a'2 | a1 g2 |
  fis1 fis2 | g1 e2 | a,1. \bar "||" fis2 b g | a1 a2 | d1. \bar "||" 
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
	} %% close layout
	
%%% Hymn Midi	

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 76 2)}} 

} %%% Score bracket

%%% Hymn Note and Lyric Attribution and title markup

\markup { \small { \hspace #74 \italic "Mrs. C. F. Alexander, 1823-95." } }

\markup { \hspace #49 \small "‘I thirst.’" }

%%% Main lyric block

\markup { \hspace #34 %%add space as necc. to center the column
          \column { %%% one super column for the entire block of lyrics
	                  \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "H" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "IS are the thousand sparkling rills"
			                                 "  That from a thousand fountains burst," } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "And fill with music all the hills:"
					   "        And yet he saith, ‘I thirst.’"
			  		}}
			       
			           } %%% finish verse 1
		        \hspace #1 
           		\line { "2  "
			   \column {	     
				   "All fiery pangs on battlefields,"
				   "    On fever beds where sick men toss,"
				   "Are in that human cry he yields"
				   "        To anguish on the Cross."
			}}	
    }	%%% end super column  
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

\markup { \hspace #34   %%add space as necc. to center the column
          \column { 
		        \hspace #1 
           		\line { "3* "
			  \column {	     
				  "But more than pains that racked him then"
				  "    Was the deep longing thirst divine"
				  "That thirsted for the souls of men:"
				  "        Dear Lord! and one was mine."
			}}			
    		        \hspace #1 
           		\line {"4. "
			  \column {	     
				  "O Love most patient, give me grace;"
				  "    Make all my soul athirst for thee:"
				  "That parched dry lip, that fading face,"
				  "        That thirst, were all for me."
			}}
	  }
} %%% lyric markup bracket


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne d1 d  \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo b1 a \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree g'1 fis \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  g1 d' \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
      \context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       } %% close layout

%%% Amen Midi

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 76 2) }} 

}


%%% alternative hymns also suitable

\markup { \hspace #48 \italic "Or the following: " }

\markup { \hspace #40 \small  "106  There is a green hill far away." }

	
} %%% book bracket