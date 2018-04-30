%%%% 311b.png
%%%% Hymn 194 St. Ambrose.  Receive, O Lord, in heaven above
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "SAINTS' DAYS: GENERAL - VIGILS"
	\hspace #0.1 }}	
	
  title = "194"     
  
  meter = \markup { \small { \column {  
	                                \line { \sans { \smallCaps "ST. AMBROSE."} \hspace #1 \roman {"(L. M.)"}}
		                        \line { \italic {In moderate time} \general-align #Y #DOWN \note #"2" #0.5 = 72.   } }
  	}}	
	

%%% In the composer name, \teeny is used because Lilypond's \smallcaps does not handle accented letters	
 
  arranger = \markup { \small  { \center-align { \line {\italic "Melody from" \smallCaps "La Feill" \hspace #-1.2 \teeny "ÉE" \hspace #-1.2 "," }  
	  					 \line { "‘" \hspace #-1 \italic "Méthode du plain-chant," \hspace #-1 "’"  \italic "1782." }
  	}}}
	 
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 2 f2 | f g a bes | a g f \breathmark \bar "||" c' | c d c a | c bes a ^\fermata \bar "||" \break
  bes | a g f e | f g a \breathmark \bar "||" c | bes g a bes | a g f ^\fermata \bar "||"
} 
   
alto = \relative c' {  
  c2 | d e f f | f e f \bar "||" f | e f g f | f f f \bar "||"
  f | f e d c | d e f \bar "||" e | f g f d | f e f \bar "||"
}

tenor = \relative c {\clef bass 
  a'2 | a c c d | c c a \bar "||" a | c a g c | a d c \bar "||"
  d | c c a a | a c c \bar "||" c | d c c d | c c a \bar "||"
}

bass = \relative c {\clef bass 
  f2 | d c f bes, | f' c f \bar "||" f | a d, e f | f bes, f' _\fermata \bar "||"
  bes, | f' c d a | d c f \bar "||" a, | d e f g, | a4( bes) c2 f, _\fermata \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 72 2) }}      
  
	
} %%% Score bracket


%%% Hymn Note markup

\markup { \hspace #53 \center-align { 
	        \line { "[" \hspace #-1 \italic "May also be sung in unison throughout." "]" }
		\line { "              " }
		\line { \smallCaps "Note" \hspace #-1.2 ".—" \hspace #-1.0 \italic "Hymns" "193" \italic "and" "194" \italic "may also be sung to" \smallCaps "Alfreton" "(" \hspace #-1 \italic "No." "81)" \italic "or to any suitable" }
	        \line { "L. M." \italic "tune." }
}}		


\markup { "                 "  }  %%% force some blank space between score and lyrics

\markup { "                 "  }  %%% force some blank space between score and lyrics


%%% Lyric attributions and titles


\markup { \small { \hspace #54 \italic "St. Ephraim the Syrian, d. 373.  Tr. F. C. B." }}

%%% Note: In order to generate the Syriac title below, a Syriac font is needed.   
%%% I have used Estrangelo Talada which is freely available from www.bethmardutho.org 
%%% If you use another Syriac, simply put the name into the font-name override below.

\markup {  \hspace #43 \override #'(font-name . "EstrangeloTalada") {"ܩܒܠ ܡܪܢ ܒܥܘܬ ܟܠܢ"}}

%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.4 \column { \lower #2.4 \fontsize #8 "R" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ECEIVE, O Lord, in heaven above"
			                                 "  Our prayers and supplications pure;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Give us a heart all full of love"
					   "    And steady courage to endure."
					   "         " %%% adds blank spacing between verses
			  		}}
		      } 
		       \line { "2  "
			   \column {
				   "Thy holy name our mouths confess,"
				   "    Our tongues are harps to praise thy grace;"
				   "Forgive our sins and wickedness,"
				   "    Who in this vigil seek thy face."
				    "         " %%% adds blank spacing between verses
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

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
		  	\hspace #1  % adds vertical spacing between verses  
			   \line { "3  "
			   \column {	     
				   "Let not our song become a sigh,"
				   "    A wail of anguish and despair;"
				   "In loving-kindness, Lord most high,"
				   "    Receive to-night our evening prayer."
				  "           " %%% adds vertical spacing between verses
			}}	  
			\line { "4. "
				\column {	     
					"O raise us in that day, that we"
					"    May sing, where all thy Saints adore,"
					"Praise to thy Father, and to thee,"
					"    And to thy Spirit, evermore.     Amen."
     			}}

	  }
} %%% lyric markup bracket


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f1 f1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo d1 c1 \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 76 2) }}  %%Amen midi       
       
}  


} %%% book bracket
