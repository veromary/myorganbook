%%%% 413.png
%%%% Hymn 266. ANGELUS. At even when the sun was set
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—EVENING"
	\hspace #0.1 }}	
	
	title = "266"   
  
  meter = \markup { \small { \column { \line { \sans "ANGELUS (DU MEINER SEELEN)." \hspace #1 \roman " (L. M.)" } 
                            \line { { \italic "Slow" \general-align #Y #DOWN \note #"2" #0.5 "= 69." } } }} }
 
  arranger = \markup { \small { \center-align { 
		 \line { "‘" \hspace #-1 \italic  "Cantica Spiritualia" \hspace #-1 ",’ 1847" }
				 \line { "(" \italic "founded on a melody by" \smallCaps "G. Joseph," "1657)." } }} }
 
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
  \time 3/2
  \key ees \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 2 ees2 | ees1 f2 | g2 ( a2 -) bes2 | bes1 a2 | bes1 \breathmark \bar "||" bes2 | c1 d2 | \push ees1 d2 | \push c1 c2 | bes1. \breathmark \bar "||" \break 
  f2 f2 g2 | aes1 aes2 | ees1 f2 | g1. \breathmark \bar "||" d2 ees2 f2 | g1 aes2 | \movenote #1.2 f1 f2 | ees1^\fermata \bar "||"
}
   
alto = \relative c' {  
  bes2 | bes1 bes2 | ees2 ( f2 -) f2 | g1 f2 | f1 \bar "||" f2 | f1 f2 | ees2 ( g2 -) f2 | g2 f2 ( ees2 -) | d1. \bar "||" 
  d2 d2 e2 | f1 f2 | \merge ees1 c2 | d1. \bar "||" b2 c2 d2 | ees1 ees2 | ees2 d1 | bes1 \bar "||"
}

tenor = \relative c {\clef bass 
  g'2 | g1 bes2 | bes2 ( c2 -) bes2 | ees1 c2 | d1 \bar "||" d2 | c1 bes2 | \push bes1 bes2 | bes2 a1 | bes1. \bar "||" 
  bes2 bes2 bes2 | c1 c2 | c1  c2 | b1. \bar "||" g2 g2 bes!2 | bes1 c2 | bes1 aes2 | g1 \bar "||"
}

bass = \relative c {\clef bass 
  ees2 | ees1 d2 | \push ees1 d2 | c1 f2 | bes1 \bar "||" bes2 | a1 aes!2 | g2 ( c,2 -) d2 | ees2 f1 | bes,1. \bar "||"
  bes2 aes2 g2 | f1 f'2 | aes1 aes2 | g1. \bar "||" g2 c,2 bes!2 | ees1 aes,2 | bes1 bes2 | ees1_\fermata \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 69 2) }}      
  	
	
} %%% Score bracket

%%% Lyric attributions and titles

\markup { \small { \hspace #64 \italic "H. Twells" "‡," \italic "1823-1900." }}

%%% Lyrics

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.8 \column { \lower #2.4 \fontsize #8 "A" }   %%Drop Cap goes here
				  \hspace #-2.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "T even when the sun was set"
			                                 "    The sick, O Lord, around thee lay;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "O, in what divers pains they met!"
					   "    O with what joy they went away!"
					   "      " %%% adds vertical spacing between verses
			  		}}
		      }  
		       \line {  "2  "
			   \column {
				   "Once more 'tis eventide, and we"
				   "    Oppressed with various ills draw near;"
				   "What if thy form we cannot see?"
				   "    We know and feel that thou art here."
				    "      " %%% adds vertical spacing between verses
		       }}
			\line { "3  "
				\column {
				   "O Saviour Christ, our woes dispel;"
				   "    For some are sick, and some are sad,"
				   "And some have never loved thee well,"
				   "    And some have lost the love they had;"
			           "      " %%% adds vertical spacing between verses
			}}
			\line {"4  "
				\column {
				   "And some have found the world is vain,"
				   "    Yet from the world they break not free;"
				   "And some have friends who give them pain,"
				   "    Yet have not sought a friend in thee;"
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
			\hspace #1 % adds vertical spacing between verses
			\line {"5  "
				\column {
					"And none, O Lord, have perfect rest,"
					"    for none are wholly free from sin;"
					"And they who fain would serve thee best"
					"    Are conscious most of wrong within."
					 "      " %%% adds vertical spacing between verses
			}}
			\line {"6  "
				\column {
					"O Saviour Christ, thou too art Man;"
					"    Thou hast been troubled, tempted, tried;"
					"Thy kind but searching glance can scan"
					"    The very wounds that shame would hide;"
					 "      " %%% adds vertical spacing between verses
			}}
			\line {"7.  "
				\column {
					"Thy touch has still its ancient power,"
					"    No word from thee can fruitless fall;"
					"Hear in this solemn evening hour,"
					"    And in thy mercy heal us all."
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
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne  ees1 ees1  \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo c1 bes1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree aes'1 g1   \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  aes1 ees'1  \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 69 2) }}  %%Amen midi       
       
}  


} %%% book bracket
