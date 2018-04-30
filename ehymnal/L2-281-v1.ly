%%%% 430.png
%%%% Hymn 281. DRETZEL. Through the day thy love has spared us.
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—EVENING"
	\hspace #0.1 }}	
	
	title = "281"   
  
  meter = \markup { \small { \column { \line { \sans "DRETZEL." \hspace #1 \roman "(8 7. 8 7. 7 7.)" } 
                            \line { { \italic "Moderately slow" \general-align #Y #DOWN \note #"2" #0.5 "= 66." } } }} }
 
  arranger = \markup { \small { \center-align { 
		 \line { \italic  "Abridged by" \smallCaps "W. H. Monk" \italic "from a" }
				 \line { \italic "Chorale by" \smallCaps "C. H. Dretzel," "1698-1775." } }} }
 
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%generates the breathmarks
breathmark = { 
	\override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup { \fontsize #4 "," }
	}

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01		      
	
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key d \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  d2 a'2 a2 g2 | fis2 e2 d2 d2 \breathmark \bar "||" d'2 cis2 b2 cis2 | b2 b2 a1 ^\fermata \bar "||" \break
  d,2 a'2 a2 g2 | fis2 e2 d2 d2 \breathmark \bar "||" d'2 cis2 b2 cis2 | b2 b2 a1 ^\fermata \bar "||" \break
  a2 a2 b2 b2 | cis2 cis2 d1 \breathmark \bar "||" a2 a2 g2 fis2 | e2 e2 d1 ^\fermata \bar "||" 
}
   
alto = \relative c' {  
  a2 a2 d2 e2 | d2 cis2 d2 a2 \bar "||" d2 e2 e2 e2 | fis2 e2 cis1 \bar "||" 
  d2 cis2 d2 e2 | d2 cis2 d2 a2 \bar "||" d2 e2 e2 e2 | e2. d4 cis1 \bar "||" 
  e2 d2 d2 e2 | e4 ( fis4 -) g2 g2 ( fis2 -) \bar "||" e2 d2 b4 ( cis4 -) d2 | d2 cis2 \merge d1 \bar "||"
}

tenor = \relative c {\clef bass 
  fis2 e2 b'2 a2 | a2. g4 g2 fis2 \bar "||" fis2 a2 gis2 a2 | a2 gis2 a1 \bar "||" 
  fis2 a4 ( g4 -) fis2 a2 | a2. g4 g2 fis2 \bar "||" fis4 ( gis4 -) a2 gis2 a2 | a2 gis2 a1 \bar "||"
  a2 fis2 fis2 g2 | a2 a2 a1 \bar "||" a2 fis2 g2 a2 | b2 a2 fis1 \bar "||" 
}

bass = \relative c {\clef bass 
  d2 cis2 b2 cis2 | d2 a2 d2 d2 \bar "||" b2 cis4 ( d4 -) e2 cis2 | d2 e2 a,1 _\fermata \bar "||"
  d2 a2 b2 cis2 | d2 a2 d2 d2 \bar "||" b2 cis2 d2 cis4 ( d4 -) | e2 e2 a,1 _\fermata \bar "||" 
  cis2 d2 b2 e2 | a,2 a2 d1 \bar "||" cis2 d2 e2 fis2 | g2 a2 d,1 _\fermata \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2) }}      
  	
	
} %%% Score bracket

%%% Lyric attributions and titles

\markup { "                "}

\markup { "                "}

\markup { \small { \hspace #64 \italic "T. Kelly, 1769-1854." }}

%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.8 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HROUGH the day thy love has spared us;"
			                                 "  Now we lay us down to rest;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Through the silent watches guard us,"
					   "    Let no foe our peace molest:"
					   "            Jesus, thou our Guardian be;"
					   "            Sweet it is to trust in thee."

					   "      " %%% adds vertical spacing between verses
			  		}}
		      }  
  
	  } %%% end super column
}

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
%%% Continuation of lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
			\hspace #1 % adds vertical spacing between verses
			\line {"2.  "
				\column {
					"Pilgrims here on earth, and strangers,"
					"    Dwelling in the midst of foes;"
					"Us and ours preserve from dangers;"
					"    In thine arms may we repose,"
					"            And, when life's sad day is past,"
					"            Rest with thee in heaven at last."
					 "      " %%% adds vertical spacing between verses
			}}
	  }

} %%% lyric markup bracket

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne  d1 d1  \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo b1 a1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree g'1 fis1   \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  g1 d'1  \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2) }}  %%Amen midi       
       
}  


%%% alternative hymns also suitable

\markup {  \hspace #54 \center-align { \line { \italic "See also for Saturday Evening, No." "282," \italic "on next page."}
	                            \line { "            " }
				    \line {\italic "For other days:" "51 O blest Creator of the light."}
				    \line { "            " }
	                            \line {\italic "For Week-days: Nos." "58-62."}
}}				    


} %%% book bracket
