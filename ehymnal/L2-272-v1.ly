%%%% 420.png
%%%% Hymn 272. Seelenbrautigam. Round me falls the night.
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—EVENING"
	\hspace #0.1 }}	
	
	title = "272"   
  
  poet = \markup { \small {  \line { \sans { "SEELENBRÄUTIGAM."} \hspace #1 \roman {"(5 5. 8 8. 5 5.)"}} }}
  
  meter = \markup { \small { \italic {Slow} \general-align #Y #DOWN \note #"4" #0.5 = 100 "("\general-align #Y #DOWN \note #"2" #0.5 = 50")." }}
  
  arranger = \markup { \small { \smallCaps "A. Drese," "1620-1701." }}
  
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% Merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = { \once \override NoteColumn #'force-hshift = #-0.01 }

%%generates the breathmarks
breathmark = { 
	\override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup { \fontsize #4 "," }
	}

%%% music function to move a note various amounts of space. \movenote #0.4 moves is equivalent to force-hshift = #0.4

movenote = #(define-music-function (parser location vector) (number?)
     #{
	     \once \override NoteColumn #'force-hshift = #$vector
     #})
	
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 3/2
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  g'4 g4 fis2 g2 | a1. \bar "||" g4 a4 b2 a2 | g1. \bar "||" \break
  b4 c4 d2 c2 | b4 a4 b2 a2^\fermata  \breathmark \bar "||" g4 a4 b2 a2 | g4 fis4 g2 fis2^\fermata \breathmark \bar "||" \break 
  g4 g4 fis2 g2 | a1. \bar "||" g4 a4 b2 a2 | g1. \bar "||" 
}
   
alto = \relative c' {  
  d4 d4 d2 d4 ( e4 -) | fis1. \bar "||" e4 fis4 g2 fis2 | \merge g1. \bar "||" 
  g4 g4 g2 e2 | g4 fis4 d4 ( e4 -) fis2 \bar "||" e4 fis4 g2 fis2 | e4 dis4 b4 ( cis4 -) dis!2 \bar "||" 
  b4 cis4 d2 d4 ( e4 -) | fis1. \bar "||" d4 e4 d2 d4 ( c4 -) | b1. \bar "||" 
}

tenor = \relative c {\clef bass 
  b'4 b4 a2 g2 | d'1. \bar "||" b4 d4 d2 d4 ( c4 -) | b1. \bar "||" 
  d4 c4 g2 g2 | b4 d4 d2 d2 \bar "||" b4 d4 d2 d2 | b4 b4 b2 b2 \bar "||" 
  g4 g4 a2 g2 | d'1. \bar "||" g,4 g4 g2 fis2 | g1. \bar "||" 
}

bass = \relative c {\clef bass 
  g'4 g4 d2 b2 | d1. \bar "||" e4 d4 b4 ( c4 -) d2 | g,1. \bar "||" 
  g'4 e4 b2 c2 | g'4 d4 g2 d2_\fermata \bar "||" e4 d4 g,2 d'2 | e4 b4 e2 b2_\fermata \bar "||" 
  e4 e4 d2 b2 | d1. \bar "||" b4 c4 d2 d2 | g,1. \bar "||"
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

%%% Lyric titles and attributions

\markup { "               "}
\markup { "               "}

\markup { \hspace #66 \small { \italic "W. Romanis, 1824-99." }} 
          
\markup { "               "}

%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #4.9 \column { \lower #2.4 \fontsize #8 "R" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "OUND me falls the night;"
			                                "  Saviour, be my Light:"} }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Through the hours in darkness shrouded"
					   "Let me see thy face unclouded;"
					   "    Let thy glory shine"
					   "    In this heart of mine."
					   "          " %%% adds vertical spacing between verses
			  		}}
		      } %%% end verse 1	
           		\line { "2  "
			   \column {	     
				   "    Earthly work is done,"
				   "    Earthly sounds are none;"
				   "Rest in sleep and silence seeking,"
				   "Let me hear thee softly speaking;"
				   "    In my spirit's ear"
				   "    Whisper, ‘I am near.’"
				   "          " %%% adds vertical spacing between verses
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
			\hspace #1  % adds vertical spacing between verses  
           		\line { "3. "
			   \column {	     
				   "    Blessed, heavenly Light,"
				   "    Shining through earth's night;"
				   "Voice, that oft of love hast told me;"
				   "Arms, so strong to clasp and hold me;"
				   "    Thou thy watch wilt keep,"
				   "    Saviour, o'er my sleep."
			}}
	  }
} %%% lyric markup bracket



%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne  \cadenzaOn g'1 g1   \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo c1 b1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree e1 d1   \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 50 2) }}  %%Amen midi       
       
}  


} %%% book bracket


