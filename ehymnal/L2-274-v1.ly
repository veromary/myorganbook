%%%% 422.png
%%%% Hymn 274. Herr Gott Vater Sun 0f my soul, thou saviour dear
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—EVENING"
	\hspace #0.1 }}	
	
	title = "274"   
  
  meter = \markup { \small { \column { \line { \sans "HERR GOTT VATER." \hspace #1 \roman " (L. M.)" } 
                            \line { { \italic "Slow" \general-align #Y #DOWN \note #"2" #0.5 "= 80." } } }} }
 
  arranger = \markup { \small { \center-align { 
		 \line { \italic  "Melody by" }
				 \line { \smallCaps "S. Besler, 1574-1625." } }} }
 
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%generates the breathmarks
breathmark = { 
	\override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup { \fontsize #4 "," }
	}

%%lyrics to skip a specified number of notes 	
skips = #(define-music-function (parser location times) (number?)
     #{
	     \repeat unfold $times { \skip 1}
       #})

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 3/2
  \key ees \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  ees2 ees2 ees2 | f1 f2 | g1 aes2 | bes1. \breathmark \bar "||" bes2 bes2 g2 | c1 d2 | \break
  ees2. ( d4 -) c2 | bes1. \breathmark \bar "||" bes2 c2 bes2 | g1 bes2 | aes1 g2 | f1 \breathmark \bar "||" \break 
  g2 | bes2 ( g2 -) aes2 | g2 ( f4 ees4 -) f2 | ees1 ( d4 c4 -) | d1. | ees1. \bar "||" 
}
   
alto = \relative c' {  
  bes2 aes2 bes2 | c1 bes2 | ees1 ees2 | ees1 ( d2 -) \bar "||" ees2 ees2 ees2 | ees1 aes2 | 
  g2. ( f4 -) ees2 | ees1 ( d2 -) \bar "||" ees2 c2 d2 | ees1 ees2 | c2 ( f2 -) ees2 | d1 \bar "||"
  ees2 | f2 ( ees2 -) f2 | ees2 ( bes2 -) c2 | bes1. | bes1. | bes1. \bar "||" 
}

tenor = \relative c {\clef bass 
  g'2 f2 g2 | aes1 bes2 | g1 f2 | f1. \bar "||" bes2 bes2 c2 | c2. ( bes4 -) aes2 | 
  bes1 a2 | bes1. \bar "||" bes2 aes2 bes2 | c1 bes2 | c2. ( bes4 -) c2 | d1 \bar "||" 
  bes2 | bes1 c2 | bes1 aes2 | g1 ( f4 ees4 -) | f1 ( aes2 -) | g1. \bar "||"
}

bass = \relative c {\clef bass 
  ees2 ees2 ees2 | ees1 d2 | c1 f2 | bes,1 ( aes2 -) \bar "||" g2 g2 c2 | aes'2. ( g4 -) f2 | 
  ees1 f2 | bes,1. \bar "||" g'2 aes2 g2 | c,1 g'2 | f2. ( g4 -) aes2 | bes1 \bar "||" 
  ees,2 | d2 ( ees2 -) f,2 | g1 aes2 | bes1. | bes1. | ees1. \bar "||" 
}

inlinelyrics = \lyricmode {
  \override LyricText #'font-size = #-2.	
  \skips #24 To "hide . . ." thee "from   .   .   ." thy ser -- vant's eyes.
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
        \new Lyrics \with {alignAboveContext=upper} \lyricsto sopranos \inlinelyrics			      
			      
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 2) }}  %%Amen midi       
       
}  


} %%% book bracket
