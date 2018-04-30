%%% 329.png
%%% Hymn 210. "The highest and the holiest place"
%%% Rev 1.


\version "2.10"

\header {
	dedication = \markup { \center-align { "SAINTS' DAYS: ST. MATTHIAS" \hspace #0.1 }}
	title = "210"
	poet = \markup { \small { \sans "ST. JAMES." \hspace #1 \roman  "(C. M.)" } }
	meter =  \markup { \small { \italic "In moderate time"  \general-align #Y #DOWN \note #"2" #0.5 = 69.} }
	arranger = \markup { \small { \smallCaps "R. Courtville," \italic "d." "1785?" } }
	tagline =""
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%macros begin

%% Macro to pull notes leftwards
merge = { \once \override Dots #'transparent = ##t
	\once \override NoteColumn #'force-hshift = #-0.01 }

%%generates the breathmarks
breathmark = { 
	\override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup { \fontsize #4 "," }
	}

%%%%%%%%%%%%%%%%%%%%%%%%%%%macro end


global = {
\time 4/2
\key g \major
\set Staff.midiInstrument = "church organ"
}


soprano = \relative c' {
  \clef treble \partial 2 d2 | g2 a2 b2 g2 | a2 c2 b2^\fermata \bar "||" b2 | e,2 fis2 g2 e2 | d1. \breathmark \bar "||" \break
  a'2 | b2 g2 c2 b2 | e,2 a2 fis2^\fermata \bar "||" d2 | g4 ( a4 -) b2 c2 a2 | g1. \bar "||" 
}

alto = \relative c' {
  \clef treble  b2 | b2 d2 d2 d2 | d2 e2 d2 \bar "||" d2 | cis2 d2 d2 cis2 | \merge d1. \bar "||" 
   d2 | d2 d2 c2 d2 | c2 e2 d2 \bar "||" d2 | d2 d2 c2 d2 | b1. \bar "||" 
}

tenor = \relative c { 
  \clef bass  g'2 | g2 fis2 g2 g2 | fis2 g2 g2 \bar "||" g2 | g2 fis2 b2 a4 ( g4 -) | fis1. \bar "||" 
  fis2 | g2 g2 e4 ( fis4 -) g2 | g2 c2 a2 \bar "||" fis2 | g2 g2 e2 fis2 | g1. \bar "||" 
}

bass = \relative c { 
  \clef bass
  g'2 | e2 d2 g,2 b2 | d2 c2 g2_\fermata \bar "||" g2 | a2 d2 g,2 a2 | d1. \bar "||" 
  d2 | g,2 b2 a2 b2 | c2 a2 d2_\fermata \bar "||" d4 ( c4 -) | b4 ( a4 -) g2 a2 d2 | \merge g1. \bar "||" 
}

#(ly:set-option 'point-and-click #f)


\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##f
}

\book{

\score{
\new ChoirStaff
<<
	\context Staff = upper <<
	\context Voice = sopranos { \voiceOne \global \soprano }
	\context Voice = altos { \voiceTwo \global \alto }
							>>
		\context Staff = lower <<
		\context Voice = tenors { \voiceOne \global \tenor }
		\context Voice = basses { \voiceTwo \global \bass}
								>>
>>

\layout {
	indent=0
	\context { \Score \remove "Bar_number_engraver" }
	\context { \Staff \remove "Time_signature_engraver" }
	\context { \Score \remove "Mark_engraver" }
		\context { \Staff \consists "Mark_engraver" }
	}
%%midi
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 69 2)}}%% midi score bracket

}%%score


%%% Hymn note

\markup { \hspace #54 \center-align {
	\line {\smallCaps "Note" \hspace #-1.2 ".—" \hspace #-1  \italic "A higher setting of this tune will be found at Hymn" "341."  }
       \line {"                "}  %%% force blank space before start of lyrics if needed
	\line {"                "}  %%% and more blank space if needed
	\line {"                "}  %%% and more blank space if needed.
}}


%%% Lyric attributions and titles

\markup { \column {
	\line { \small { \hspace #14 "(" \hspace #-1 \italic "O. H., 174-6.)" \hspace #46 \italic "H. Alford, 1810-71." }}  
	\line {"                "}  %%% and more blank space if needed
}}	


\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.3 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HE highest and the holiest place"
			                               "    Guards not the heart from sin;"} }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "The Church that safest seems without"
					   "    May harbour foes within."
					   "             " %%% add vertical spacing between verses
			  		}}
		      } %%% end verse 1	
           		\line { "2  "
			   \column {	     
				   "Thus in the small and chosen band,"
				   "    Beloved above the rest,"
				   "One fell from his apostleship,"
				   "    A traitor-soul unblest"
				   "             " %%% add vertical spacing between verses
			}}    
	             	\line { "3  "
			   \column {	     
				   "But not the great designs of God"
				   "    Man's sins shall overthrow;"
				   "Another witness to the truth"
				   "    Forth to the lands shall go."
				   "             " %%% add vertical spacing between verses
			}}
				             	\line { "4  "
			   \column {	     
				   "The soul that sinneth, it shall die;"
				   "    Thy purpose shall not fail;"
				   "The word of grace no less shall sound,"
				   "    The truth no less prevail."
				   "             " %%% add vertical spacing between verses
			}}
	  } %%% end supercolumn
} %%% end markup	  
       
       
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
%%% continuation of  lyrics

\markup { \hspace #36   %%add space as necc. to center the column  
		\column { 
			\hspace #1  % adds vertical spacing between verses  
           		\line { "5. "
			   \column {	     
				   "Righteous, O Lord, are all thy ways;"
				   "    Long as the worlds endure,"
				   "From foes without and foes within"
				   "    Thy Church shall stand secure."
				   "             " %%% add vertical spacing between verses
			}}
	  }
} %%% lyric markup bracket


%%Amen score block
\score {
\new ChoirStaff
	<<
	\context Staff = upper \with { fontsize = #-3 \override StaffSymbol #'staff-space = #(magstep -2) }
		<<
		\context Voice = "sopranos" { \relative c' {\clef treble \global \voiceOne g'1 g \bar "||" }}
		\context Voice = "altos" { \relative c' {\clef treble \global \voiceTwo c1 b \bar "||" }}
		>>
		\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	\context Staff = lower \with { fontsize = #-3 \override StaffSymbol #'staff-space = #(magstep -2) }
		<<
		\context Voice = "tenors" { \relative c {\clef bass \global \voiceOne e1 d \bar "||" }}
		\context Voice = "basses" { \relative c {\clef bass \global \voiceTwo c1 g \bar "||" }}
		>>
>>

\header { breakbefore = ##f piece = " " opus = " " }
\layout {
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove "Time_signature_engraver" }
	}%%layout

%%Amen midi
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 69 2) }} %%Amen midi 



}%%amen score
} %%book bracket
