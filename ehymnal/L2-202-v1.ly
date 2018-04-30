%%%% 319.png
%%%% Hymn 202. St. Anne. The Son of God goes forth to war.
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "SAINTS' DAYS: GENERAL - FOR ANY SAINT'S DAY"
	\hspace #0.1 }}	
	
  title = "202"   
  
  meter = \markup { \small { \column {  \line { "          " }
	                                \line { \sans {"ST. ANNE."} \hspace #1 \roman {"(C. M.)"}}
		                        \line { \italic {Slow and dignified} \general-align #Y #DOWN \note #"2" #0.5 = 50.} 
  }}}	
	

 arranger = \markup { \small  { \center-align { \line {\italic "Melody from the" "‘" \hspace #-1.2 \italic "Supplement to" }
	  					 \line { \italic "the" \smallCaps "New Version, 1708." \hspace #-1.2 "’"  \italic " Probably" }
						 \line { \italic "by" \smallCaps "Dr. Croft, 1678-1727." }	
 }}}
	 
  tagline = ""
}

%%%%%%%%%%%% 
%%%%%%%%%%%%%%%%%%Macros

%%generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%%% music function to allow lyrics to skip a given number of notes

skips = #(define-music-function (parser location times) (number?)
     #{
	     \repeat unfold $times { \skip 1}
       #})

%%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 

straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.6
              \once \override Stem #'X-offset = #-2.6 }

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01

%%% Macro to specify restart of a new measure or specify a partial measure in the middle of a piece 
%%% In this case, the macro specifies that 2 1/2 notes in a 4/2 measure have past,

partmeasure =  \set Score.measurePosition = #(ly:make-moment 2 2)


%%%%%%%%%%%%%%%%%End of Macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key c \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 1 g'1 | e2 a2 g2 c2 | c2 b2 c1 \breathmark \bar "||" \partmeasure g1 | c2 g2 a2 fis2 | g1 ^\fermata \bar "||" \break
  b1 | c2 a2 d2 b2 | c2 a2 b1 \breathmark \bar "||" \partmeasure g1 | a2 c2 d2 b2 | c1 ^\fermata \bar "||" 
} 
   
alto = \relative c' {  
  c1 | c2 c4 ( d4 ) e2 e2 | d2 d2 e1 \bar "||" e1 | e2 e2 e2 d2 | d1 \bar "||" 
  d1 | e2 c2 f2 d2 | c2 a'2 gis1 \bar "||" \merge g!1 | f2 e2 d2 d2 | e1 \bar "||" 
}

tenor = \relative c {\clef bass 
  e1 | g2 a4 ( b4 ) c2 c2 | a2 g2 g1 \bar "||" c1 | c2 b2 c2 a2 | b1 \bar "||" 
  g1 \bar "||" g2 a2 a2 b2 | e2. d4 b1 \bar "||" c1 | f,2 g2 a2 g2 | g1 \bar "||" 
}

bass = \relative c {\clef bass 
  c1 | c2 f2 e2 a2 | f2 g2 c,1 \bar "||" c1 | a2 e'2 c2 d2 | g,1 _\fermata \bar "||" 
  \merge g'1 | c,2 f2 d2 g2 | a2 f2 e1 \bar "||" e1 \bar "||" d2 c2 f2 g2 | c,1 _\fermata  \bar "||" 
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 50 2) }}      
  	
	
} %%% Score bracket

%%% Hymn Note markup

\markup {  \hspace #22 \smallCaps "Note" \hspace #-1.2 ".—" \hspace #-1 \italic "This hymn may also be sung to" \smallCaps "Old 81st (" \hspace #-1 \italic "No." "211)." }

\markup { "                 "  }  %%% force some blank space between score and lyrics

\markup { "                 "  }  %%% force some blank space between score and lyrics



%%% Lyric attributions and titles


\markup { \small { \hspace #66 \italic "Bishop R. Heber, 1783-1826." }}

%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HE Son of God goes forth to war,"
			                                "  A kingly crown to gain;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "His blood-red banner streams afar!"
					   "    Who follows in his train?"
					   "         " %%% adds blank spacing between verses
			  		}}
		      }
		      	   \line { "2  "
			   \column {	     
				   "Who best can drink his cup of woe,"
				   "    Triumphant over pain,"
				   "Who patient bears his cross below,"
				   "    He follows in his train."
				   "           " %%% adds vertical spacing between verses
					}}
		      	   \line { "3  "
			   \column {	     
				   "The Martyr first, whose eagle eye"
				   "    Could pierce beyond the grave;"
				   "Who saw his Master in the sky,"
				   "    And called on him to save."
				   "           " %%% adds vertical spacing between verses
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
			   \line { "4  "
			   \column {	     
				   "Like him, with pardon on his tongue"
				   "    In midst of mortal pain,"
				   "He prayed for them that did the wrong!"
				   "    Who follows in his train?"
				   "           " %%% adds vertical spacing between verses
			}}
			  \line { \hspace #-9.6 \italic "Unison. "  "5  "
			   \column {	     
				   "A glorious band, the chosen few"
				   "    On whom the Spirit came,"
				   "Twelve valiant Saints, their hope they knew,"
				   "    And mocked the cross and flame."
				   "           " %%% adds vertical spacing between verses
			}}
			\line { "6  "
				\column {	     
				   "They met the tyrant's brandish'd steel,"
				   "    The lion's gory mane,"
				   "They bowed their necks the death to feel;"
				   "    Who follows in their train?"
				   "           " %%% adds vertical spacing between verses
     			}}
			  \line { \hspace #-9.6 \italic "Unison. "  "7  "
			   \column {	     
				   "A noble army, men and boys,"
				   "    The matron and the maid,"
				   "Around the Saviour's throne rejoice"
				   "    In robes of light arrayed."
				   "           " %%% adds vertical spacing between verses
			}}
			\line { "8. "
				\column {	     
				   "They climbed the steep ascent of heaven"
				   "    Through peril, toil, and pain;"
				   "O God, to us may grace be given"
				   "    To follow in their train."
				   "           " %%% adds vertical spacing between verses
     			}}

	  }
} %%% lyric markup bracket
  

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f1 e1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo c1 c1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree a'1 g1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  f1 c1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 50 2) }}  %%Amen midi       
       
}  


} %%% book bracket
