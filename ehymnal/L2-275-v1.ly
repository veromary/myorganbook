%%%% 424.png
%%%% Hymn 275. Lodsworth. Sweet saviour, bless us ere we go;
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—EVENING"
	\hspace #0.1 }}	
	
	title = "275"   
  
  poet = \markup { \small {  \line { \sans { "LODSWORTH."} \hspace #1 \roman {"(8 8. 8 8. 8 8.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"2" #0.5 = 76. }}
  
  arranger = \markup { \small { \italic "English Traditional Melody." }}
  
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

%%shortcut macro for small notes
smallnote = {  \once \set fontSize = #-3 
              \once \override Stem #'length = #4  }

%% Used to pull an upstem note left. Used when a slurred note pair straddles a longer note below and when notecolumn force-hshift does not work 
topstraddle = { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.5 
              \once \override Stem #'X-offset = #-0.2 }	      
	          
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key ees \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 2 ees2 | g2 ees2 aes2 c2 | \topstraddle bes2 ( g1 -) f2 | ees1. \bar "||" ees2 | g2 ees2 aes2 c2 | \topstraddle bes2 ( g1 -) f4 ( ees4 -) | f1. \bar "||" \break
  f2 | g2 f4 ( ees4 -) g2 f4 ( ees4 -) | g2 bes2 ees2^\fermata \breathmark \bar "||" c2 | bes2 g2 ees4 ( g4 -) bes4 ( aes4 -) | g1 f1 | ees1. \bar "||" \break
  ees2 | g2 f4 ( ees4 -) g2 f4 ( ees4 -) | g2 bes2 ees2^\fermata \breathmark \bar "||" c2 | bes2 g2 ees4 ( g4 -) bes4 ( aes4 -) | g1 f1 | ees1. \bar "||" 
}
   
alto = \relative c' {  
  ees2 | ees2 bes2 ees2 ees2 | bes1 ( c2 -) d2 | \merge ees1. \bar "||" ees2 | d2 c2 c2 d2 | ees1. c2 | d1. \bar "||" 
  d2 | ees2 bes2 ees2 d4 ( c4 -) | ees2 f2 ees2 \bar "||" ees2 | d2 d2 ees2 g4 ( f4 -) | ees1 d1 | \merge ees1. \bar "||" 
  bes2 | ees2 bes2 ees2 d4 ( c4 -) | ees2 f2 ees2 \bar "||" ees2 | d2 d2 ees2 g4 ( f4 -) | ees1 d1 | \merge ees1. \bar "||" 
}

tenor = \relative c {\clef bass 
  g'2 | bes2 g2 aes2 aes2 | bes1. aes2 | g1. \bar "||" g2 | g2 g2 aes2 aes2 | bes1. a2 | bes1. \bar "||" 
  bes2 | bes2 aes4 ( g4 -) c2 g2 | bes2 d2 ees2 \bar "||" ees,2 | g2 bes2 g2 c2 | bes1 aes1 | g1. \bar "||" 
  g2 | bes2 aes4 ( g4 -) c2 g2 | bes2 d4 ( c4 -) bes2 \bar "||" ees,2 | g2 bes2 g2 c2 | bes1 aes1 | g1. \bar "||"
}

bass = \relative c {\clef bass 
  ees2 | ees2 ees2 c2 aes2 | g1 ( aes2 -) bes2 | c1. \bar "||" c2 | bes2 c2 aes2 f2 | g1 c1 | bes1. \bar "||" 
  bes2 | ees2 ees2 c2 c2 | bes2 aes2 g2_\fermata \bar "||" aes2 | bes2 bes2 c2 aes2 | bes1 bes1 | ees1. \bar "||" 
  ees2 | ees2 ees2 c2 c2 | bes2 aes2 g2_\fermata \bar "||" aes2 | bes2 bes2 c2 aes2 | bes1 bes1 | ees1. \bar "||" 
}

altsop = \relative c' { \voiceThree s2 | s1 * 14
                       s2 \stemDown 
                       \once \override Stem #'transparent = ##t
		       \once \override NoteHead #'transparent = ##t
		       \once \override Tie #'control-points = #'((3 . -0.5 ) ( 3.5 . -1 ) ( 4.1 . -1 ) ( 4.6 . -0.5))
                       bes'2 ~ \smallnote bes2 s2 s1 * 8 s2
		        \once \override Stem #'transparent = ##t
		       \once \override NoteHead #'transparent = ##t
		       \once \override Tie #'control-points = #'((3 . -0.5 ) ( 3.5 . -1 ) ( 5.3 . -1 ) ( 5.8 . -0.5))
		       bes2 ~ \smallnote bes2 
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
	\context Voice = altsop   { \global \altsop }
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
	
} %%% Score bracket

%%% A separate score block to generate midi without the alternate notes

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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 76 2) }}      
  		
} %%% Score bracket

%%% Lyric titles and attributions

\markup { "               "}
\markup { "               "}


\markup { \hspace #66 \small { \italic "F. W. Faber, 1814-63." }} 
          
\markup { "               "}

%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "S" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "WEET Saviour, bless us ere we go;"
			                                "    Thy word into our minds instil;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "And make our lukewarm hearts to glow"
				   "    With lowly love and fervent will."
				   \italic "    Through life's long day and death's dark night,"
				   \italic "    O gentle Jesus, be our Light."
				   "          " %%% adds vertical spacing between verses
			  		}}
		      } %%% end verse 1	
		      	  
           		  \line { "2  "
			   \column {	     
				   "The day is done, its hours have run,"
				   "    And thou hast taken count of all;"
				   "The scanty triumphs grace hath won,"
				   "    The broken vow, the frequent fall."
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
           		\line { "3  "
			   \column {	     
				   "Grant us, dear Lord, from evil ways"
				   "    True absolution and release;"
				   "And bless us, more than in past days,"
				   "    With purity and inward peace."
				   "          " %%% adds vertical spacing between verses
			}}
			\line { "4* "
			   \column {	     
				   "Do more than pardon; give us joy,"
				   "    Sweet fear and sober liberty,"
				   "And loving hearts without alloy,"
				   "    That only long to be like thee."
				   "          " %%% adds vertical spacing between verses				   
			}}
			\line { "5* "
			   \column {	     
				   "Labour is sweet, for thou hast toiled,"
				   "    And care is light, for thou hast cared;"
				   "Let not our works with self be soiled,"
				   "    Nor in unsimple ways ensnared."
				   "          " %%% adds vertical spacing between verses				   
			}}
			\line { "6. "
			   \column {	     
				   "For all we love, the poor, the sad,"
				   "    The sinful,--unto thee we call;"
				   "O let thy mercy make us glad;"
				   "    Thou art our Jesus and our All."
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 50 2) }}  %%Amen midi       
       
}  


} %%% book bracket


