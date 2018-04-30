%%% 084.png
%%% Hymn 32 WOHLAUF The Lord and King of all things
%%% Version 3


\version "2.10.19"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - CHRISTMAS"
		\hspace #0.1 }}	
  title = "32"
 
  poet = \markup { \small { \sans "WOHLAUF, THUT NICHT VERZAGEN." \hspace #1 \roman  "(7 6. 7 6. D.)" } }
 
  meter =  \markup { \small { \italic "In moderate time" \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 69.} }
 
  arranger = \markup { \small \smallCaps "B. Helder, 1585-1635."}
 
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%% macros

%%% generates the breathmarks
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}	      

%%% prints a repeat sign glyph comprising 4 dots and two thin bars
fdendrepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
	\once \override Staff.BarLine #'text = \markup  {  \line { \raise #1.4 \override #'(baseline-skip . 1.0)  \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
	                                                  \hspace #-1 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
							  \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
	
	} }	
        \bar "||"} 

%% %prints a repeat sign glyph comprising 4 dots. Used only to begin a repeat at the start of a piece where \bar ":" does not work	
fdstartrepeat =  {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
	          \once \override Staff.BarLine #'text = \markup  { \line { \hspace #0 \override #'(baseline-skip . 1.0) 
	                                                 \raise #1.4 \column { \with-color #black { 
							                \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
	          } }	
                 \bar "|:"}
	
%%%%%%%%%%%%%%%%%%%%%%%%%% end of macro definitions

%%% SATB voices

global = {
\time 4/2
\key g \major  
\set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
  \fdstartrepeat \partial 2 g'2 | b2. b4 a2 g2 | c1 b2 \breathmark \bar "||" 
      d2 e2. d4 c2 a2 | b1. \breathmark \fdendrepeat  \break
  d2 | d2 c2 b2 a2 | b2 ( a4 g4 ) a2 \bar "||" 
      fis2 | g2 a2 b2 cis2 | d1. \breathmark \bar "||" \break
  a2 | b2 a2 g2 fis2 | e2 ( d4 c4 ) d2 \breathmark \bar "||" 
      d2 | e2 g2 g2 fis2 | g1. \bar "||" 
}

alto = \relative c' {
  d2 | g2 g2 fis2 e2 | g1 g2 \breathmark \bar "||" 
      g2 | g2 g2 e2 fis2 | g1. 
  g2 | fis2 g2 g2 e4 ( fis4 ) | g2 ( fis4 e4 ) fis2 \breathmark \bar "||" 
      d2 | d2 fis2 g2 g2 | fis1. \bar "||" 
  fis2 | g2 fis2 e2 d2 | c2 ( b4 a4 ) b2 \bar "||" 
      d2 | d2  b4 ( c4 ) d2 d2 | d1. \bar "||"
}

tenor = \relative c { \clef bass
  \fdstartrepeat b'2 | d2. d4 d2 b2 | e1 d2 \bar "||" 
      b2 c2 b2 c2 d2 | d1. \fdendrepeat
  b2 | a2 e'2 d2 c2 | d1 d2 \bar "||" 
      a2 g2 d'2 d2 g,2 | a1. \bar "||" 
  d2 | d2 d2 b2 b2 | g1 g2 \bar "||" 
      g2 | g2 g2 a2 a2 | b1. \bar "||"
}

bass = \relative c { \clef bass
  \repeat volta 2 { g'2 | g2 g2 d2 e2 | c1 g'2 \bar "||" 
      g2 | c2 g2 a2 d,2 | g1. } 
  g2 | d2 e4 ( fis4 ) g2 a2 | g1 d2 \bar "||" 
      c2 | b2 d2 g2 e2 | d1. \bar "||" 
  d2 | g2 d2 e2 b2 | c1 g2 \bar "||" 
      b2 | c2 e2 d2 d2 | g,1. \bar "||" 
}


#(ly:set-option 'point-and-click #f)

\paper {
 #(set-paper-size "a4")
%% annotate-spacing = ##t
 print-page-number = ##f
 ragged-last-bottom = ##t
 ragged-bottom = ##t
}


\book{

\score{
\new ChoirStaff	
 <<

	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \soprano }
	\context Voice = altos {\voiceTwo \global \alto }
	 >>
 
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \tenor }
	\context Voice = basses { \voiceTwo \global \bass }
			 >> 
			 

 >>
\layout {
		indent=0
	%	\context { \Score timing = ##f }
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver" }
		\context { \Staff \consists "Mark_engraver" }
	}
	
} %%score bracket

%%% A separate score block to unfold the repeats and generate the midi

\score { 
\new ChoirStaff 
<<

\new Staff = "soprano" {\relative c' {\clef treble \global  \set Staff.midiInstrument = "church organ"
  \unfoldRepeats  {   \repeat volta 2 { \partial 2 g'2 | b2. b4 a2 g2 | c1 b2 \bar "||" 
      d2 e2. d4 c2 a2 | b1. }  }\break
  d2 | d2 c2 b2 a2 | b2 ( a4 g4 ) a2 \bar "||" 
      fis2 | g2 a2 b2 cis2 | d1. \bar "||" \break
  a2 | b2 a2 g2 fis2 | e2 ( d4 c4 ) d2 \bar "||" 
      d2 | e2 g2 g2 fis2 | g1. \bar "||" 
}
}

\new Staff = "alto" {\relative c' {\clef treble \global  \set Staff.midiInstrument = "church organ"
  \unfoldRepeats {   \repeat volta 2 { d2 | g2 g2 fis2 e2 | g1 g2 \bar "||" 
      g2 | g2 g2 e2 fis2 | g1. } }
  g2 | fis2 g2 g2 e4 ( fis4 ) | g2 ( fis4 e4 ) fis2 \bar "||" 
      d2 | d2 fis2 g2 g2 | fis1. \bar "||" 
  fis2 | g2 fis2 e2 d2 | c2 ( b4 a4 ) b2 \bar "||" 
      d2 | d2  b4 ( c4 ) d2 d2 | d1. \bar "||"
}	
}

\new Staff = "tenor" { \relative c {\clef bass \global  \set Staff.midiInstrument = "church organ"
  \unfoldRepeats {   \repeat volta 2 { b'2 | d2. d4 d2 b2 | e1 d2 \bar "||" 
      b2 c2 b2 c2 d2 | d1. } }
  b2 | a2 e'2 d2 c2 | d1 d2 \bar "||" 
      a2 g2 d'2 d2 g,2 | a1. \bar "||" 
  d2 | d2 d2 b2 b2 | g1 g2 \bar "||" 
      g2 | g2 g2 a2 a2 | b1. \bar "||"
} 
}

\new Staff = "bass" { \relative c { \clef bass \global  \set Staff.midiInstrument = "church organ"
  \unfoldRepeats {   \repeat volta 2 { g'2 | g2 g2 d2 e2 | c1 g'2 \bar "||" 
      g2 | c2 g2 a2 d,2 | g1. } }
  g2 | d2 e4 ( fis4 ) g2 a2 | g1 d2 \bar "||" 
      c2 | b2 d2 g2 e2 | d1. \bar "||" 
  d2 | g2 d2 e2 b2 | c1 g2 \bar "||" 
      b2 | c2 e2 d2 d2 | g,1. \bar "||" 
}
}

>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 69 2) }}      
 
} %%% midi score bracket

%%% lyric titles and attributions

\markup { \hspace #60 \small \italic "Anatolius, c. 800.  Tr. J. M. Neale."} 

\markup { \hspace #40 \small {Τῷ Βασιλεῖ καὶ Δεσπότῃ. [Tô Basilei kai Despotê.] }}

%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HE Lord and King of all things"
			                               "  But yesterday was born;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
				"And Stephen's glorious offering"
				"    His birth-tide shall adorn:"
				"No pearls of orient splendour,"
				"    No jewels can he show;"
				"But with his own true heart's blood"
				"    His shining vestments glow."
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
			 "Come, ye that love the Martyrs,"
			 "    And pluck the flowers of song,"
			 "And weave them in a garland"
			 "    For this our suppliant throng;"
			 "And cry, 'O thou that shinest"
			 "    In grace's brightest ray,"
			 "Christ's valiant Protomartyr,"
			 "    For peace and favour pray!'" 
			}}
			\hspace #1  % adds vertical spacing between verses  
           		\line { "3. "
			   \column {	     
			     "Thou first of all confessors,"
			     "    Of all the deacons crown,"
			     "Of every following athlete"
			     "    The glory and renown:"
			     "Make supplication, standing"
			     "    Before Christ's royal throne,"
			     "That he would give the kingdom,"
			     "    And for our sins atone!"
			}}
	  }
} %%% lyric markup bracket


%%% Amen score block

\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne g'1 g1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo e1 d1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree c'1 b1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  c1 g1 \bar "||" }}
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
       
} %%% end Amen score block 


} %% book bracket

