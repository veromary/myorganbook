%%%% 236.png
%%%% Hymn 146 Tugwood. Sing we triumphant hymns of praise
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "THE CHRISTIAN YEAR - ASCENSIONTIDE"
	\hspace #0.1 }}	
	
	title = "146"   
  
  poet = \markup { \small {  \line { \sans { "TUGWOOD."} \hspace #1 \roman {"(L. M.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time, very dignified} \general-align #Y #DOWN \note #"2" #0.5 = 76.} }
  
  arranger = \markup { \small \smallCaps "Nicholas Gatty." }
  
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% macro to cope with a partial measure in the middle of a piece.
%%% Manual does not recommend using \partial in the middle of a piece.
%%% In this case, the macro specifies that 0 of 1/2 notes in a 4/2 measure have past,
%%% hence we are restarting at the beginning of a measure, and the previous partial measure is 
%%% considered complete
startmeasure =  \set Score.measurePosition = #(ly:make-moment 0 2)

%%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 

straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.6
              \once \override Stem #'X-offset = #-1.6 }

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
  \startmeasure a'1 a2 a | a a b b |  a1 ^\fermata \bar "||"  \startmeasure a1 d,2 e | fis a g fis |  e1 ^\fermata \bar "||" \break
  \startmeasure a1 a2 a | a fis b cis |  d1 ^\fermata \bar "||"  \startmeasure g,1 a2 b | a d, e e |  d1 \bar "||"
} 
   
alto = \relative c' {  
  d1 d2 fis | e fis g g | fis1 \bar "||" d1 d2 cis | d e d d | cis1 \bar "||"
  d1 d2 fis | e d d fis | fis1 \bar "||" \straddle e2( d) cis b | cis d d cis | \merge d1 \bar "||"
}

tenor = \relative c {\clef bass 
  fis1 a2 d2 | cis d d d | d1 \bar "||" a1 fis2 a | a a d a | a1 \bar "||"
  fis1 a2 d | cis d b ais | b1 \bar "||" b1 a2 g | a a b a | fis1 \bar "||"
}

bass = \relative c {\clef bass 
  d1 fis2 g | a d, g g, | d'1 _\fermata \bar "||" fis,1 b2 a | d cis b d | a1 _\fermata
  d1 fis2 g | a d, g fis | b,1 _\fermata \bar "||" e1 fis2 g | g, fis g a | d1 \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 76 2) }}  
  	
	
} %%% Score bracket


%%% Hymn note markup

\markup { \hspace #20 \smallCaps "Note" \hspace #-1.2 ".—" \italic "This hymn can also be sung to" \smallCaps "Beata nobis" "(" \hspace #-1 \italic "No." "185)." }


%%% Lyric attributions and titles

\markup { \hspace #70 \small \center-align { \line { \italic "The Venerable Bede, 673-735."}  
	                                     \line { \italic "Tr. B. Webb."}
}}

\markup { \hspace #40 \small "Hymnum canamus gloriae." }

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #-10 \italic "Unison.  " \hspace #2.2 \column { \lower #2.4 \fontsize #8 "S" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ING we triumphant hymns of praise,"
			                                 "  New hymns to heaven exulting raise:" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Christ, by a road before untrod,"
					   "Ascendeth to the throne of God."
					   "      " %%% adds vertical spacing between verses
			  		}}
		      } 
           		\line { "2  "
			   \column {	     
				   "The holy apostolic band"
				   "Upon the Mount of Olives stand,"
				   "And with the Virgin-mother see"
				   "Jesu's resplendent majesty."
				   "      " %%% adds vertical spacing between verses
			}} 
           		\line { "3  "
			   \column {	     
				   "To whom the Angels, drawing nigh,"
				   "‘Why stand and gaze upon the sky?"
				   "This is the Saviour!’ thus they say,"
				   "‘This is his noble triumph-day!’"
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

\markup { \hspace #30   %%add space as necc. to center the column  
		\column { 
			\hspace #1  
			\line {"4  "
				\column {	     
					"‘Again shall ye behold him, so"
					"As ye to-day have seen him go;"
					"In glorious pomp ascending high,"
					"Up to the portals of the sky.’"
					"      " %%% adds vertical spacing between verses
			}}   
			\line { \hspace #-1 "5* "
				\column {	     
					"O grant us thitherward to tend,"
					"And with unwearied hearts ascend"
					"Toward thy kingdom's throne, where thou,"
					"As is our faith, art seated now."
					"      " %%% adds vertical spacing between verses
			}}
			\line { \hspace #-1 "6* "
				\column {	     
					"Be thou our joy and strong defence."
					"Who art our future recompense:"
					"So shall the light that springs from these"
					"Be ours through all eternity."
					"      " %%% adds vertical spacing between verses
     			}}
			\line { \hspace #-10 \italic "Unison.  " "7. "
				\column {	     
					"O risen Christ, ascended Lord."
					"All praise to thee let earth accord,"
					"Who art, while endless ages run."
					"With Father and with Spirit One.     Amen."
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
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo b1 a1 \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 76 2) }}  %%Amen midi       
       
}  



} %%% book bracket
