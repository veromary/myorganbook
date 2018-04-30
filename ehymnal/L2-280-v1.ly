%%%% 429.png
%%%% Hymn 280. St. Columba. The sun is sinking fast
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—EVENING"
	\hspace #0.1 }}	
	
	title = "280"   
  
  poet = \markup { \small {  \line { \sans { "ST. COLUMBA."} \hspace #1 \roman {"(6 4. 6 6.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"2" #0.5 = 72.} }
  
  arranger = \markup { \small { \smallCaps "H. S. Irons," "1834-1905." }}
  
  tagline = ""
}


%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%%% Mergedotted. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 
%%% Turns one dot off as there is only one dot for the two merged notes.

mergedotted = { \once \override Dots #'transparent = ##t
          \once \override NoteColumn #'force-hshift = #-0.01 }

%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.0
              \once \override Stem #'X-offset = #-2.0 }

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions


%%% SATB voices

global = {
  \time 4/2
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 2 c'2 | bes2 a2 g2 g2 | \mergedotted f1. \bar "||" a2 | c1 d1 | g,1. \bar "||" \break
  c2 | c2 a2 g2 a2 | bes1 \breathmark \bar "||" bes1 | a2 f2 g2 g2 | \mergedotted f1. \bar "||"
}
   
alto = \relative c' {  
  f2 | f2 f2 f2 e2 | f1. \bar "||" f2 | g1 f1 | e1. \bar "||" 
  e2 | e2 ees2 d2 d2 | d1 \bar "||" \straddle d2. ( e4 ) | f2 f2 f2 e2 | f1. \bar "||" 
}

tenor = \relative c {\clef bass 
  a'2 | bes2 c2 d2 c2 | a1. \bar "||" c2 | c1 b1 | c1. \bar "||" 
  g2 | g2 c2 bes2 fis2 | g1 \bar "||" bes1 | c2 a2 c2. bes4 | a1. \bar "||"
}

bass = \relative c {\clef bass 
  f2 | d2 a2 bes2 c2 | f,1. \bar "||" f'2 | e1 d1 | c1. \bar "||" 
  c2 | c2 c2 d2 d2 | g,1 \bar "||" g1 | a2 d2 c2 c2 | f,1. \bar "||" 
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

\markup { \small { \hspace #64 \italic "c. 18th. cent.  Tr. E. Caswall." }}

\markup { \small { \hspace #42  "Sol praeceps rapitur." }}

%%% Lyrics

\markup { \hspace #36 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HE sun is sinking fast,"
			                                 "    The daylight dies;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Let love awake, and pay"
					   "    Her evening sacrifice."
					   "      " %%% adds vertical spacing between verses
			  		}}
		      }  
		       \line {  "2  "
			   \column {
				   "As Christ upon the Cross,"
				   "    In death reclined,"
				   "Into his Father's hands"
				   "    His parting soul resigned,"
				    "      " %%% adds vertical spacing between verses
		       }}
			\line { "3  "
				\column {
					"So now herself my soul"
					"    Would wholly give"
					"Into his sacred charge,"
					"    In whom all spirits live;"
			           "      " %%% adds vertical spacing between verses
			}}
			\line {"4  "
				\column {
					"So now beneath his eye"
					"    Would calmly rest,"
					"Without a wish or thought"
					"    Abiding in the breast,"
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

\markup { \hspace #36 %%add space as necc. to center the column
          \column { %% super column of everything
			\hspace #1 % adds vertical spacing between verses
			\line {"5  "
				\column {
					"Save that his will be done,"
					"    Whate'er betide,"
					"Dead to herself, and dead"
					"    In him to all beside."
					 "      " %%% adds vertical spacing between verses
			}}
			\line {"6  "
				\column {
					"Thus would I live; yet now"
					"    Not I, but he"
					"In all his power and love"
					"    Henceforth alive in me—"
					 "      " %%% adds vertical spacing between verses
			}}
			\line {"7. "
				\column {
					"One sacred Trinity,"
					"    One Lord Divine,"
					"Myself for ever his,"
					"    And he for ever mine!"
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
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne  f1 f1  \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo d1 c1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree bes'1 a1   \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  bes1 f'1  \bar "||" }}
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


} %%% book bracket
