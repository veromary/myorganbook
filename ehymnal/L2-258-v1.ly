%%%% 404.png
%%%% Hymn 258. MINISTRES DE L'ETERNEL Christ, whose glory fills the skies
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—MORNING"
	\hspace #0.1 }}	
	
	title = "258"   
  
  meter = \markup { \small { \column { \line { \sans "MINISTRES DE L'ÉTERNEL." \hspace #1 \roman " (7 7. 7 7. 7 7.)" } 
  \line { { \italic "In moderate time" \general-align #Y #DOWN \note #"2" #0.5 "= 56" "("\general-align #Y #DOWN \note #"4" #0.5 = 112")." }}}}}
 
  arranger = \markup { \small { \center-align { 
		 \line { \italic  "Psalm 135 in the Genevan Psalter, 1562" }
				 \line { "(" \hspace #-1 \italic "rhythm of line 2 slightly simplified" \hspace #-1 ")." } }} }
 
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% Merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = { \once \override NoteColumn #'force-hshift = #-0.01 }

%%% Mergedotted. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 
%%% Turns one dot off as there is only one dot for the two merged notes.

mergedotted = { \once \override Dots #'transparent = ##t
          \once \override NoteColumn #'force-hshift = #-0.01 }

%%generates the breathmarks
breathmark = { 
	\override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup { \fontsize #4 "," }
	}
	
%%% pushes notecolumn slightly to the right
push = \once \override NoteColumn #'force-hshift = #0.4

%%% music function to move a note various amounts of space. \movenote #0.4 moves is equivalent to force-hshift = #0.4

movenote = #(define-music-function (parser location vector) (number?)
     #{
	     \once \override NoteColumn #'force-hshift = #$vector
     #})

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/4
  \key d \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \once \override Staff.TimeSignature #'stencil = ##f	
  d'2 b2 | a4 a4 b4 cis4 | d1 \bar "||" a2 b2 | a4 g4 fis4 e4 | d1 \bar "||" \break
  d2 fis2 | e4 d4 fis4 g4 | \push a1 \bar "||" fis2 a2 | b4 cis4 d4 b4 | \push a1 \bar "||" \break 
  a2 g2 | fis4 a4 g4 fis4 | \merge e1 \bar "||" e2 fis2 | \time 3/2 a4 g4 fis2 e2 | \mergedotted d1. \bar "||"
}
   
alto = \relative c' {  
  fis2 g2 | a4 fis4 g4 g4 | fis1 \bar "||" fis4 ( e4 -) d4 ( e4 -) | fis4 e4 d4 cis4 | b1 \bar "||" 
  b2 cis2 | b4 d4 d4 d4 | d2 ( cis2 -) \bar "||" d2 d4 ( cis4 -) | fis4 fis4 fis4 e4 | cis2 ( e2 -) \bar "||" 
  d2 e2 | fis4 e4 e4 dis4 | e1 \bar "||" e2 dis2 | fis4 e4 d2 cis2 | d1. \bar "||" 
}

tenor = \relative c {\clef bass 
  \once \override Staff.TimeSignature #'stencil = ##f		
  a'2 cis2 | d4 d4 d4 e4 | a,1 \bar "||" d4 ( cis4 -) b4 ( cis4 -) | d4 b4 a4 a4 | fis1 \bar "||" 
  d'2 a2 | b4 a4 a4 g4 | e2 ( a2 -) \bar "||" a2 a2 | a4 a4 a4 gis4 | a2 ( cis2 -) \bar "||" 
  d4 ( a4 -) b4 ( cis4 -) | d4 c4 b4 b4 | \push g1 \bar "||" g2 b2 | b4 b4 a2 a4 ( g4 -) | fis1. \bar "||" }

bass = \relative c {\clef bass 
  d2 e2 | fis4 d4 g4 e4 | d1 \bar "||" fis2 g2 | fis4 g4 a4 a,4 | b1 \bar "||"
  b'2 a2 | g4 fis4 d4 b4 | \push a1 \bar "||" d4 ( e4 -) fis4 ( e4 -) | d4 cis4 b4 e4 | a,2 ( a'4 g4 -) \bar "||" 
  fis2 e2 | d4 a4 b4 b4 | e2 ( d!2 -) \bar "||" c2 b2 | e4 e4 fis4 ( g4 -) a4 ( a,4 -) | d1. \bar "||" 
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 112 4) }}      
  	
	
} %%% Score bracket

%%% Lyric attributions and titles

\markup {"                "}
\markup {"                "}

\markup { \small { \hspace #64 \italic "C. Wesley, 1707-88." }}

%%% Lyrics

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.4 \column { \lower #2.4 \fontsize #8 "C" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HRIST, whose glory fills the skies,"
			                                 "    Christ, the true, the only Light," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Sun of Righteousness, arise,"
					   "    Triumph o'er the shades of night;"
					   "Dayspring from on high, be near;"
					   "Daystar, in my heart appear."
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

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
			\hspace #1 % adds vertical spacing between verses
			\line {  "2   "
			   \column {
				   "Dark and cheerless is the morn"
				   "    Unaccompanied by thee;"
				   "Joyless is the day's return,"
				   "    Till thy mercy's beams I see;"
				   "Till they inward light impart,"
				   "Glad my eyes, and warm my heart."
				    "      " %%% adds vertical spacing between verses
		       }}
			
			\line {"3.  "
				\column {
					"Visit then this soul of mine,"
					"    Pierce the gloom of sin and grief;"
					"Fill me, Radiancy Divine,"
					"    Scatter all my unbelief;"
					"More and more thyself display,"
					"Shining to the perfect day." 
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 112 4) }}  %%Amen midi       
       
}  


} %%% book bracket


%%%Transcriber's Notes
%%%
%%% Time signatures in the image don't add up. 
%%% 2=66 is not equal to 4=112
%%% Correct to 2=56 which is equal to 4=112. This is closer to the "moderate time" instruction.
