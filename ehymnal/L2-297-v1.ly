%%%% 446.png
%%%% Hymn 297. LONDON (OR ADDISON'S) The spacious firmament on high
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—GENERAL"
	\hspace #0.1 }}	
	
	title = "297"   
  
  poet = \markup { \small {  \line { \sans { "LONDON (" \hspace #-1 \smallCaps "or" "ADDISON'S)."} \hspace #1 \roman {"(D. L. M.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"2" #0.5 = 72.} }
  
  arranger = \markup { \small { \smallCaps "J. Sheeles," \italic "c." "1720." }}
  
  tagline = ""
}


%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%% Macro for generating two augmentation dots for a notehead. 
%% When dotted notes from two vocal parts share a single notehead, 
%% Lilypond only inserts a single dot. In the image, two dots are used. 
%% This macro generates the two dots by replacing the normal dot glyph 
%% with a new glyph comprising a column of 2 dots one above the other.
 
%%generates the percent sign used to indicate a repeat e.g. of lyrics
percentRepeat = \mark \markup { 
                          \fontsize #-2 { \rotate #'-31 ":" }  
                          {\fontsize #-5 \translate #(cons -1.2 0.4 ) \musicglyph #"noteheads.s2slash"} 
                          {\fontsize #-5 \translate #(cons -1.2 0.4 ) \musicglyph #"noteheads.s2slash"}  
                           \fontsize #-2  {\translate #(cons -1 -0.1 ) \rotate #'-30 ":" } 
                        }

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 2 f2 | a2 a2 g2 c2 | bes4 ( a4 ) g4 ( f4 ) g2 \breathmark \bar "||" c,2 | f4 ( g4 ) a2 g2 f4 ( e4 ) | \break
  f2 e4 ( d4 ) e2 \breathmark \bar "||" g2 | a2 d2 g,2 c2 | f,2 g4 ( f4 ) e2 \breathmark \bar "||" g2 | \break
  a2 b2 c2 f,2 | e2 d2 c2 ^\fermata \bar "||" c2 | g'2 g2 e2 d4 ( c4 ) | \break
  f2 g2 a2 \breathmark \bar "||" a2 | c2 c2 bes4 ( a4 ) g4 ( f4 ) | bes2 c2 d2 \breathmark \bar "||" \break 
  c2 | d2 c4 ( bes4 ) c2 f,2 | bes2 a4 ( g4 ) a2 \breathmark \bar "||" f2 | g2 f2 e2 f2 | \break \pageBreak
  bes2 a2 g2^\fermata \percentRepeat c2 | d2 c2 e,2 f4 ( g4 ) | a2 g4 ( f4 ) f2^\fermata \bar "||"
}
   
alto = \relative c' {  
  c2 | c2 f2 g2 e2 | f2 c4 ( b4 ) c2 \bar "||" c2 | c2 f2 c2 c2 | 
  c2 b2 c2 \bar "||" g'2 f2 f2 c2 e2 | d2 d2 c2 \bar "||" c2 | 
  f2 f2 c2 d2 | c2 b2 c2 \bar "||" c2 | c2 d2 c2 g2 | 
  c2 e2 f2 \bar "||" f2 | g2 e2 f2 c2 | f2 g4 ( a4 ) bes2 \bar "||" 
  f2 | f2 g2 e2 f2 | f2 e2 f2 \bar "||" c2 | c2 c2 c2 f2 | 
  g2 f2 e2 f2 | f2 f2 e2 c4 ( d4 ) | c2 c2 a2 \bar "||" 
}

tenor = \relative c {\clef bass 
  a'2 | c2 c2 c2 c2 | c2 g2 e2 \bar "||" g2 | a2 a4 ( b4 ) c2 g2 |
  f2 g2 g2 \bar "||" c2 | c2 bes4 ( a4 ) g2 a4 ( g4 ) | f2 bes4 ( a4 ) g2 \bar "||" g2 |
  c2 b4 ( a4 ) g2 a2 | g2 g4 ( f4 ) e2 \bar "||" e4 ( f4 ) | g2 g2 g2 e2 |
  f2 c'2 c2 \bar "||" c2 | c2 c2 c2 a2 | bes2 ees2 d2 \bar "||"
  a2 | bes2 d2 c2 a2 | bes2 c2 c2 \bar "||" a2 | bes2 a2 bes2 a2 |
  c2 c2 c2 f,2 | f2 f2 bes2 f2 | f2 e4 ( f4 ) f2 \bar "||"
}

bass = \relative c {\clef bass 
  f2 | f2 f2 e2 c2 | f2 e4 ( d4 ) c2 \bar "||" e2 | f2 d2 e2 c2 |
  d2 g,2 c2 \bar "||" e2 | f2 d2 e2 c2 | d2 bes2 c2 \bar "||" e2 |
  f2 d2 e2 f2 | g2 g,2 c2 _\fermata \bar "||" c4 ( d4 ) | e2 b2 c2 bes!2 |
  a2 c2 f2 \bar "||" f2 | e2 c2 f2 ees2 | d2 c2 bes2 \bar "||" 
  f'2 | bes2 g2 a2 d,2 | g2 c,2 f2 \bar "||" f2 | e2 f2 c2 d2 | 
  e2 f2 c2_\fermata a2 | bes2 a2 g2 a4 ( bes4 ) | c2 c2 f,2_\fermata \bar "||" 
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

\markup { \small { \hspace #64 \italic "J. Addison, 1672-1719." }}

%%% Lyrics

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.4 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HE spacious firmament on high,"
			                                 "  With all the blue ethereal sky," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "And spangled heavens, a shining frame,"
					   "Their great Original proclaim."
					   "The unwearied sun from day to day"
					   "Does his Creator's power display,"
					   "And publishes to every land"
					   "The works of an almighty hand."
					   "      " %%% adds vertical spacing between verses
			  		}}
		      } %% end verse 1  
			\line {"2  "
				\column {
					"Soon as the evening shades prevail"
					"The moon takes up the wondrous tale,"
					"And nightly to the listening earth"
					"Repeats the story of her birth;"
					"Whilst all the stars that round her burn,"
					"And all the planets in their turn,"
					"Confirm the tidings, as they roll,"
					"And spread the truth from pole to pole."
					 "      " %%% adds vertical spacing between verses
			}}
			\line {\hspace #-9.6 \italic "Unison." " 3. "
				\column {
					"What though in solemn silence all"
					"Move round the dark terrestrial ball;"
					"What though nor real voice nor sound"
					"Amid their radiant orbs be found;"
					"In reason's ear they all rejoice,"
					"And utter forth a glorious voice;"
					"For ever singing as they shine,"
					"‘The hand that made us is Divine.’"
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
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo bes1 a1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree d1 c1   \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  bes1 f1  \bar "||" }}
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
