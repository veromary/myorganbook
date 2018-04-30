%%%% 239.png
%%%% Hymn 149 Old 25th. Thou art gone up on high
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "THE CHRISTIAN YEAR - ASCENSIONTIDE"
	\hspace #0.1 }}	
	
	title = "149"   
  
  meter = \markup { \small { \column {  
	                                \line { \sans { \smallCaps "OLD 25th."} \hspace #1 \roman {"(D. S. M.)"}}
		                        \line { \italic {In moderate time} \general-align #Y #DOWN \note #"2" #0.5 = 72.} }
  	}}	
	

 arranger = \markup { \small  { \center-align { \line {\italic "Day's Psalter, 1563."}
	  					 \line { "(" \hspace #-1 \italic "rhythm slightly adapted" \hspace #-1 ")." }
  	}}}
	 
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01

%%generates the breathmarks
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}	      
	      
%%% Macro to specify restart of a new measure in the middle of a piece.
%%% Needed to restart a new measure after a partial measure.
%%% In this case, the macro specifies that 2 1/2 notes in a 4/2 measure have past,

partmeasure =  \set Score.measurePosition = #(ly:make-moment 2 2)

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 1 f1 | a2 g a bes | c1 \bar "||" a | a2 f bes g | f1 \bar "||" a | g2 f c' bes | \break
  a2 g a1 \breathmark \bar "||" \partmeasure d,1 | g2 f bes a | g1 \bar "||" a | a2 bes c bes | a1 \bar "||" f | \break
  d2 e f g | a1 \bar "||" f1 | a2 a d c | bes a g1 \breathmark \bar "||" \partmeasure f1 | c'2 a bes g | f1 \bar "||"
} 
   
alto = \relative c' {  
  c1 | f2 g f f | e1 \bar "||" c | f2 d f e | \merge f1 \bar "||" f | c2 f e g | 
  f2 e f1 \bar "||" \partmeasure \merge d1 | d4( e) f2 g fis | \merge g1 \bar "||" f1 \bar "||" f2 f f d | c1 \bar "||" c1 |
  bes2  g d' d | cis1 \bar "||" d1 | f2 e d e | d4( c) f2 e1 \bar "||" \partmeasure d1 | e2 f f e | \merge f1 \bar "||"
}

tenor = \relative c {\clef bass 
  a'1 | c2 c c bes | g1 \bar "||" a1 | a2 a d c4( bes) | a1 \bar "||" c1 | c2 a4( bes) c2 d | 
  c2 c c1 \bar "||" \partmeasure bes1 | g2 c d2. c4 | bes1 \bar "||" a1 | a2 d c f, | f1 \bar "||" f1 | 
  f2 c' a g | e1 \bar "||" d1 | a'2 a bes a | f4( g) a( bes) c1 \bar "||" \partmeasure a1 | a2 a d c4( bes) | a1 \bar "||"
}

bass = \relative c {\clef bass 
  f1 | f2 e f d | c1 \bar "||" f1 | d2. c4 bes2 c | f,1 \bar "||" f'1 | e2 d c g |
  a2 c f,1 \bar "||" \partmeasure bes1 | bes2 a g d' | g1 \bar "||" d1 | d2 bes a bes | \merge f'1 \bar "||" a,1 |
  bes2 c d bes | a1 \bar "||" \merge d1 | d2 c bes c | d4( e) f2 c1 \bar "||" \partmeasure d1 | a2 d bes c | f,1 \bar "||"
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

%%% Lyric attributions and titles

\markup { \hspace #60 \small \italic "Mrs. E. Toke, 1812-72."}  

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HOU art gone up on high,"
			                                 "  To mansions in the skies," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "And round thy throne unceasingly"
					   "    The songs of praise arise;"
					   "But we are lingering here,"
					   "    With sin and care opprest:"
					   "Lord, send thy promised Comforter,"
					   "    And lead us to thy rest."
			  		}}
		      } %%% end verse 1			
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
			\hspace #1  % adds vertical spacing between verses  
           		\line { "2  "
			   \column {	     
				   "Thou art gone up on high;"
				   "    But thou didst first come down,"
				   "Through earth's most bitter misery"
				   "    To pass unto thy crown;"
				   "And girt with griefs and fears"
				   "    Our onward course must be;"
				   "But only let that path of tears"
				   "    Lead us at last to thee."
				   "             " %%% add vertical spacing between verse
			}}
			\line { "3. "
				\column {	     
				   "Thou art gone up on high;"
				   "    But thou shalt come again,"
				   "With all the bright ones of the sky"
				   "    Attendants in thy train."
				   "O, by thy saving power"
				   "    So make us live and die,"
				   "That we may stand in that dread hour"
				   "    At thy right hand on high."
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
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  bes1 f'1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 72 2) }}  %%Amen midi       
       
}  

%%% alternative hymns also suitable

\markup {\hspace #32 \column {
	\line{ \hspace #2 \italic "The following are also suitable:"}
	\hspace #0.1 
	\small {
	"301  Alleluya, sing to Jesus."
	"364  All hail the power of Jesu's name."
	"368  At the name of Jesus."
	"380  Come, ye faithful, raise the anthem."
	"381  Crown him with many crowns."
	"476  Rejoice, the Lord is King."
	"519  Ye watchers and ye holy ones."	
	}
}} 


} %%% book bracket
