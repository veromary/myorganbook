%%%% 423.png
%%%% Hymn 274 Alternative tune Herr Gott Vater Sun 0f my soul, thou saviour dear
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—EVENING"
	\hspace #0.1 }}	
	
  title = \markup { "274" \large \smallCaps "(Alternative Tune)" }

  meter = \markup { \small { \column { \line { \sans "HURSLEY." \hspace #1 \roman " (L. M.)" } 
                            \line { { \italic "Slow" \general-align #Y #DOWN \note #"2" #0.5 "= 80." } } }} }
 
  arranger = \markup { \small { \center-align { 
		 \line { \italic  "Abridged from melody in" }
				 \line { "‘" \hspace #-1 \italic "Katholisches Gesangbuch," \hspace #-1 "’" \italic "Vienna, c. 1774." } }} }
 
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% Mergedotted. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 
%%% Turns one dot off as there is only one dot for the two merged notes.

mergedotted = { \once \override Dots #'transparent = ##t
          \once \override NoteColumn #'force-hshift = #-0.01 }
	
%%% pushes notecolumn slightly to the right
push = \once \override NoteColumn #'force-hshift = #0.4

 
%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.2
              \once \override Stem #'X-offset = #-1.2 }

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 3/2
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  f2 f2 f2 | f2 ( e2 -) f2 | g2 ( a2 -) g2 |  \mergedotted  f1. \bar "||" a2 a2 a2 | \break
  a2 ( g2 -) a2 | c2 ( bes2 -) a2 | g1. \bar "||" g2 g2 a2 | bes1 g2 | \break
  a1 bes2 | c1. \bar "||" d2 d2 d2 | c1 a2 | bes2 ( a2 -) g2 | \mergedotted f1. \bar "||" 
}
   
alto = \relative c' {  
  c2 c2 c2 | \push c1 c2 | \push e1 e2 | f1. \bar "||" f2 f2 f2 |
  f2 ( e2 -) f2 | f2 ( e2 -) f2 | e1. \bar "||" e2 g2 fis2 | \straddle g2 ( d2 -) e2 | 
  f1 f2 | e1. \bar "||" d2 f2 f2 | \straddle f2 ( e2 -) f2 | \push f1 e2 |  f1. \bar "||"
}

tenor = \relative c {\clef bass 
  a'2 a2 a2 | a2 ( g2 -) a2 | bes2 ( c2 -) bes2 | a1. \bar "||" c2 c2 c2 | 
  c1 c2 | \push c1 c2 | c1. \bar "||" c2 d2 c2 | bes1 c2 |
  c1 f,2 | g1 ( a2 -) \bar "||" bes2 bes2 bes2 | g1 f2 | d'2 ( c2 -) bes2 | a1. \bar "||" 
}

bass = \relative c {\clef bass 
  f2 f2 f2 | \push f1 f2 | \push c1 c2 | f1. \bar "||" f2 f2 f2 | 
  f1 f2 | a2 ( g2 -) f2 | c1. \bar "||" c'2 bes2 a2 | g1 c,2 | 
  f1 d2 | c1. \bar "||" bes2 bes2 bes2 | c1 d2 | bes2 ( c2 -) c2 |  f1. \bar "||" 
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 2) }}      
  	
	
} %%% Score bracket

%%% Hymn Note 

\markup { \hspace #54 \center-align {
	\line {  \italic "As this hymn is very frequently sung, it is thought advisable to add here an alternative" } 
        \line {  \italic "tune. The former tune is the more suitable for use in church."  } 
}}



%%% Lyric attributions and titles

\markup { "                "}

\markup { \small { \hspace #64 \italic "J. Keble, 1792-1866." }}

%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.8 \column { \lower #2.4 \fontsize #8 "S" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "UN of my soul, thou Saviour dear,"
			                                 "  It is not night if thou be near:" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "O may no earth-born cloud arise"
					   "To hide thee from thy servant's eyes."
					   "      " %%% adds vertical spacing between verses
			  		}}
		      }  
		       \line {  "2  "
			   \column {
				   "When the soft dews of kindly sleep"
				   "My wearied eyelids gently steep,"
				   "Be my last thought, how sweet to rest"
				   "For ever on my Saviour's breast."
				    "      " %%% adds vertical spacing between verses
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
			\hspace #1 % adds vertical spacing between verses
			\line { "3   "
				\column {
				   "Abide with me from morn till eve,"
				   "For without thee I cannot live;"
				   "Abide with me when night is nigh,"
				   "For without thee I dare not die."
			           "      " %%% adds vertical spacing between verses
			}} 
			\line {"4   "
				\column {
					"If some poor wand'ring child of thine"
					"Have spurned to-day the voice divine,"
					"Now, Lord, the gracious work begin;"
					"Let him no more lie down in sin."
					 "      " %%% adds vertical spacing between verses
			}}
			\line {"5   "
				\column {
					"Watch by the sick; enrich the poor"
					"With blessings from thy boundless store;"
					"Be every mourner's sleep to-night"
					"Like infant's slumbers, pure and light."
					 "      " %%% adds vertical spacing between verses
			}}
			\line {"6.  "
				\column {
					"Come near and bless us when we wake,"
					"Ere through the world our way we take;"
					"Till in the ocean of thy love"
					"We lose ourselves in heaven above."  
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 2) }}  %%Amen midi       
       
}  


} %%% book bracket
