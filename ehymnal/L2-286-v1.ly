%%%% 435.png
%%%% Hymn 286. CULBACH. 
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—NEW YEAR"
	\hspace #0.1 }}	
	
	title = "286"   
  
  meter = \markup { \small { \column { \line { \sans "CULBACH." \hspace #1 \roman "(7 7. 7 7.)" } 
                                       \line { { \italic "Moderately slow" \general-align #Y #DOWN \note #"2" #0.5 "= 66." }}}}}
	  
  arranger = \markup { \small { \center-align { 
		 \line { \italic "From a Chorale in" \smallCaps "Scheffler's" }
		 \line { "‘" \hspace #-1 \italic "Heilige Seelenlust" \hspace #-1.2 ",’" \italic "1657." }}}}
 
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
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
  d2 fis2 a2 a2 | g2 a2 fis1 \breathmark \bar "||"  d'2 d2 cis2 cis2 | b2 b2 a1 \breathmark \bar "||" \break
  a2 cis2 d2 a2 | b2 a2 fis1 \breathmark \bar "||" a2 a2 g2 fis2 | e2 e2 d1 \bar "||"
}
   
alto = \relative c' { 
  a2 d2 e2 cis2 | d2 a2 d1 \bar "||" d2 e2 e2 e2 | fis2 e4 ( d4 -) cis1 \bar "||" 
  fis2 e2 d2 d2 | d2 cis2 d1 \bar "||" d2 cis2 d2 d2 | d2 cis2 \merge d1 \bar "||" 
}

tenor = \relative c {\clef bass 
  fis2 a2 a2 a2 | d,2 e2 fis1 \bar "||" fis2 b2 a2 a2 | a2 gis2 a1 \bar "||"
  a2 ais2 b2 fis2 | g2 e2 fis1 \bar "||" fis2 e2 g2 a2 | b2 a4 ( g4 ) fis1 \bar "||"
} 

bass = \relative c {\clef bass 
  d2 d2 cis2 a2 | b2 cis2 d1 \bar "||" b2 gis2 a2 cis2 | d2 e2 a,1 \bar "||"
  d2 cis2 b2 d2 | g,2 a2 d1 \bar "||" d2 a2 b2 d2 | g,2 a2 d1 \bar "||"
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
	%	\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %% close layout

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2) }}      
  		
	
} %%% Score bracket

%%% Hymn Note markup

\markup { \hspace #20 \smallCaps "Note" \hspace #-1.2 ".—" \italic "A higher setting of this tune will be found at Hymn" "481." }


%%% Lyric titles and attributions

\markup { "                " }


\markup {  \small {  \hspace #64 \italic "H. Downton, 1818-85." }} 

%%% Lyrics

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.6 \column { \lower #2.4 \fontsize #8 "F" }   %%Drop Cap goes here
				  \hspace #-1.0   %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "OR thy mercy and thy grace,"
			                                 "    Faithful through another year," } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Hear our song of thankfulness,"
					   "    Father, and Redeemer, hear."
					   "                " %%% adds vertical spacing between verses
			}}
 		} %%% finish verse 1
			\line { "2  " 
			   \column {	     
				   "Lo, our sins on thee we cast,"
				   "    Thee, our perfect Sacrifice;"
				   "And, forgetting all the past,"
				   "    Press towards our glorious prize."
				   "                " %%% adds vertical spacing between verses
			}}
			\line { "3  "
			\column {	     
				"Dark the future: let the light"
				"    Guide us, bright and Morning Star;"
				"Fierce our foes, and hard the fight:"
				"    Arm us, Saviour, for the war."
				"                " %%% adds vertical spacing between verses
			}}
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

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything				 	 
		        \hspace #1  % adds vertical spacing between verses  
			\line { "4  "
			\column {	     
				"In our weakness and distress,"
				"    Rock of strength, be thou our Stay;"
				"In the pathless wilderness"
				"    Be our true and living Way."
				"                " %%% adds vertical spacing between verses
			}}
			\line { "5  "
			\column {	     
				"Who of us death's awful road"
				"    In the coming year shall tread,"
				"With thy rod and staff, O God,"
				"    Comfort thou his dying head."
				"                " %%% adds vertical spacing between verses
			}}
           		\line { "6. "
			   \column {	     
				   "Keep us faithful, keep us pure,"
				   "    Keep us evermore thine own:"
				   "Help, O help us to endure;"
				   "    Fit us for the promised crown."
			}}
	  } %%% end supercolumn
} %%% end markup	  


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne  g'1 g1  \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo e1 d1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree c'1 b1   \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  c1 g1  \bar "||" }}
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


%%% List of hymns also suitable

\markup { \hspace #32 \column {
	\line { \hspace #-8 \italic "The following hymns are also suitable for the New Year:"}	
	"                  "
	\small { "    3  Behold, the Bridegroom cometh."
	"361  A few more years shall roll."
	"368  At the Name of Jesus."
	"382  Days and moments quickly flying."
	"389  Fight the good fight."
	"405  How sweet the name of Jesus sounds."
	"418  Jesu, name all names above."
	"450  O God, our help in ages past."
	"507  To the name that brings salvation." }
	"                  "
	\line{ \hspace #-6 \italic "See also Hymns for Mission Services, Nos." "567-585."}
	}}
	 


} %%% book bracket

