%%% 042-44.png
%%% Hymn 10 Saviour eternal!
%%% Version 2


\version "2.10.19"

\include "gregorian-init.ly"

\header {
  dedication = \markup { \center-align {  "THE CHRISTIAN YEAR - ADVENT"
		\hspace #0.1 }}	
  title = "10"
  
  meter = \markup {\small { \column { \line { " "}
                                      \line { \italic "Sequence." } } } }
  
  arranger = \markup { \small { \column { \line { \hspace #26 \italic "Before 11th cent.   Tr. M. J. Blacker""‡." }
                                          \line { "Salus aeterna."  \hspace #38 "Mode vii." } }  }  }
  tagline =""
}


%%%%%%%%%%%%%%%%%%%%%%%% macros

%%prints four dots in a column, This will be used by other macros to create repeat signs.. 	       
fdots = \markup { \override #'(baseline-skip . 1.0) 
        \column { \with-color #black { \fontsize #0 . \fontsize #0 . \fontsize #0 . \fontsize #0 .} }}	
	
%%Using the fdots macro above, positions 4 dots at beginning of a line of score thus mimicking a begin repeat sign.
%%The dots are placed as \mark objects rather than a normal bar glyph because Lilypond will not easily print a bar
%%glyph at the beginning of a line without upsetting the bar at the end of the previous line
%%Place \beginfdots before the first note of line you want it to begin.
beginfdots = { 	
	       \once \override Staff.RehearsalMark #'Y-offset = #'1.4
	       \once \override Staff.RehearsalMark #'X-offset = #'9.0
	       \mark \fdots
	       \once \override Score.SeparationItem #'padding = #1
}	
	
%%Prints a repeat sign glyph comprising 4 dots then two thin bars. This is used to end a repeat. 
%%This macro works by replacing the glyph used by the \bar "||" function. 
fdendrepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
	\once \override Staff.BarLine #'text = \markup  {  \line { \raise #1.4 \override #'(baseline-skip . 1.0)  
		                                                   \column { \with-color #black {  
								             \fontsize #2 . 
								             \fontsize #2 . 
								             \fontsize #2 . 
								             \fontsize #2 .} }
	                                                  \hspace #-1 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
							  \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
	
	} }	
        \bar "||"} 

%%Prints a repeat sign glyph comprising two thin bars then 4 dots. Used to end a section then start a repeat.
%%This macro works by replacing the glyph used by the \bar "||" function. 	
barstartrepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
	\once \override Staff.BarLine #'text = \markup  {  \line { \filled-box #'(0 . 0.15) #'(-2.0 . 2.0) #0  
		                                                   \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2.0 . 2.0) #0 
								   \hspace #-1.0 \raise #1.4 \override #'(baseline-skip . 1.0)  
								   \column { \with-color #black {  
								             \fontsize #2 . \fontsize #2 . 
								            \fontsize #2 .  \fontsize #2 . } }					 
	} }	
        \bar "||"} 	
	
%%Prints a repeat sign glyph comprising 4 dots then two thin bars then 4 dots. Used to end a repeat and then start another repeat.
%%This macro works by replacing the glyph used by the \bar "||" function. 	
doublerepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
	\once \override Staff.BarLine #'text = \markup  {  \line { \raise #1.4 \override #'(baseline-skip . 1.0) 
		                                                   \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 . } }	
								   \hspace #-1 \filled-box #'(0 . 0.15) #'(-2.0 . 2.0) #0  
		                                                   \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2.0 . 2.0) #0 
								   \hspace #-1.0 \raise #1.4 \override #'(baseline-skip . 1.0)  
								   \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 . } }					 
	} }	
        \bar "||"} 	

%%%	
%%% Equivalent macros for plainsong	
%%%

%%prints three dots in a column, suitable for plainsong staffs    
tdots = \markup { \override #'(baseline-skip . 1.6) 
                  \column { \with-color #black { \fontsize #0 . \fontsize #0 . \fontsize #0 . } }}	
	
%%Using the tdots macro above, positions 3 dots at beginning of a line of score thus mimicking a begin repeat sign.
%%The dots are placed as \mark objects rather than a normal bar glyph because Lilypond will not easily print a bar
%%glyph at the beginning of a line without upsetting the bar at the end of the previous line
%%Place \pbeginfdots before the first note of line you want it to begin.
pbegintdots = { 	
	       \once \override Staff.RehearsalMark #'Y-offset = #'1.5
	       \once \override Staff.RehearsalMark #'X-offset = #'9.0
	       \mark \tdots
	       \once \override Score.SeparationItem #'padding = #1
}	

%%Prints a repeat sign glyph comprising 3 dots and two thin bars. Used to end a repeat on a plainsong staff.
%%This macro works by replacing the glyph used by the \bar "||" function. 
ptdendrepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
	\once \override Staff.BarLine #'text = \markup  {  \line { \raise #1.4 \override #'(baseline-skip . 1.6)  \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . } }
	                                                  \hspace #-1 \filled-box #'(0 . 0.15) #'(-2.4 . 2.4) #0
							  \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2.4 . 2.4) #0
	} }	
        \bar "||"} 	 

%%Prints a repeat sign glyph comprising two thin bars then 3 dots. Used to end a section then start a repeat on a plainsong staff.
%%This macro works by replacing the glyph used by the \bar "||" function. 	
pbarstartrepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
	\once \override Staff.BarLine #'text = \markup  {  \line { \filled-box #'(0 . 0.15) #'(-2.4 . 2.4) #0  
		                                                   \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2.4 . 2.4) #0 
								   \hspace #-1.0 \raise #1.4 \override #'(baseline-skip . 1.6)  
								   \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . } }					 
	} }	
        \bar "||"} 	 
	
%%Prints a repeat sign glyph comprising 3 dots then two thin bars then 3 dots. Used to end a repeat and then start another repeat on a plainsong staff.
%%This macro works by replacing the glyph used by the \bar "||" function. 	
pdoublerepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
	\once \override Staff.BarLine #'text = \markup  {  \line { \raise #1.4 \override #'(baseline-skip . 1.6) 
		                                                   \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . } }	
								   \hspace #-1 \filled-box #'(0 . 0.15) #'(-2.4 . 2.4) #0  
		                                                   \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2.4 . 2.4) #0 
								   \hspace #-1.0 \raise #1.4 \override #'(baseline-skip . 1.6)  
								   \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . } }					 
	} }	
        \bar "||"} 	 
	
%% music function to allow lyrics to skip over any number of note-syllables. 
%% The standard \skip command has its duration ignored when using \lyricsto or \addlyrics. 
%% Each instance of \skip will only skip one note-syllable. 
%% To avoid entering too many \skip commands, use this workaround function. 
%% To skip 8 note-syllables, for example, issue the command \skips #8
skips = #(define-music-function (parser location times) (number?)
     #{
	     \repeat unfold $times { \skip 1}
     #})

%% macro settings for stemless long note which is 2x duration of regular white note    
ln = {\once \override NoteHead #'duration-log = #0 
           \once \override Stem #'stencil = ##f
           \once \override NoteColumn #'force-hshift = #'0.4 }

%% macro settings for stemmed black notes (1/2 duration of the regular white notes	   
blacknote = { \once \override NoteHead #'duration-log = #2 }	   
     
%%%%%%%%%%%%%%%%%%%%%%%%%%end of macro definitions

%%% plainsong voice


plainsong = \context VaticanaVoice  {  \relative c' { 
	\override Staff.Accidental  #'transparent = ##t
        \override Staff.Clef #'#'font-size = #3
	\clef "vaticana-do2"
	\set fontSize = #3
	\override Staff.StaffSymbol #'staff-space = #1.6
  b8 d8 e8 \[ b8 \flexa \deminutum g16 \] g8 \bar "|" a8 c8 b8 a8 g8 b8 g8 a8 g8   \ptdendrepeat \break 
  \pbegintdots g8 a8 b8 b8 b8 a8 c8 e8 d8 d8 b8 \bar "|" d8 b8 c8 a8 g8 b8 b8  \ptdendrepeat \break 
  \[ a8 \pes e'8 \] f8 e8 d8 e8 d8 b8 \bar "|" c8 b8 a8 g8 a8 b8 c8 a8 b8 \bar "||" \break 
  
  \[ a8 \pes e'8 \] f8 e8 d8 e8 d8 b8 \bar "|" c8 b8 a8 g8 a8 b8 c8 a8 b8 \bar "|" \break
  g8 a8 c8 a8 a8 g8 b8 \pbarstartrepeat  c8 d8 b8 a8 c8 a8 g8 b8 \bar "|" \break
  g8 a8 c8 a8 a8 g8 b8 \pdoublerepeat  b8 d8 d8 d8 e8 d8 e8 d8 b8 \ptdendrepeat \break 
  e8 e8 d8 c8 e8 d8 d8 b8 \bar "|" d8 b8 c8 a8 g8 b8 b8 \bar "||" \break 
  e8 e8 d8 c8 e8 d8 d8 b8 \bar "|" d8 b8 c8 a8 c8 d8 \bar "" \break
  e8 b8 \bar "|" d8 b8 c8 a8 g8 a8 b8  a8  a8 
  \once \override NoteHead #'extra-offset = #'(-3 . 0)
  a8  g8 \bar "||" \break 
}}


%%% SATB voices

global =  {
  \time 8/8
  \key a \major
  \set Staff.midiInstrument = "church organ"
}	   
	   	   
soprano = \relative c' { \autoBeamOff 
  gis'8 b8 cis8 gis8[ 
      \once \override NoteHead #'duration-log = #2
      e8*1/2] e8 \bar "|"fis8 a8 gis8 fis8 e8 gis8 e8 fis8 e8 \fdendrepeat
  \beginfdots e8 fis8 gis8 gis8 gis8 fis8 a8 cis8 b8 b8 gis8 \bar "|" \noBreak b8 gis8 a8 fis8 e8 gis8 gis8 \fdendrepeat
  fis8[ cis'8] d8 cis8 b8 cis8 b8 gis8 \bar "|"a8 gis8 fis8 e8 fis8 gis8 a8 fis8 gis8 \bar "||" 
  fis8[ cis'8] d8 cis8 b8 cis8 b8 gis8 \bar "|"a8 gis8 fis8 e8 fis8 gis8 a8 fis8 gis8 \bar "|" 
  e8 fis8 a8 fis8 fis8 e8 gis8 \barstartrepeat a8 b8 gis8 fis8 a8 fis8 e8 gis8 \bar "|" 
  e8 fis8 a8 fis8 fis8 e8 gis8  \doublerepeat gis8 b8 b8 b8 cis8 b8 cis8 b8 gis8 \fdendrepeat
  cis8 cis8 b8 a8 cis8 b8 b8 gis8 \bar "|"b8 gis8 a8 fis8 e8 gis8 gis8 \bar "||" 
  cis8 cis8 b8 a8 cis8 b8 b8 gis8 \bar "|"b8 gis8 a8 fis8 a8 b8 \bar "" 
  cis8 gis8 \bar "|"b8 gis8 a8 fis8 e8 fis8 gis8 fis8 \ln fis4 e8 \bar "||" 
}

alto = \relative c' { \autoBeamOff
  \ln e4 ~ e8 e8. b8 \bar "|" d8 cis8 \ln b4 ~ b8 e8 e8 d8 cis8 \fdendrepeat
  \beginfdots \ln cis4 \ln e4 ~ e8 cis8 e8 e8 e8 \ln e4 \bar "|" \ln e4 ~ e8 d8 cis8 e8 e8 \fdendrepeat
  \ln fis4 ~ fis8 \ln e4 a8 fis8 e8 \bar "|" \ln e4 cis8 b8 cis8 e8 ~ e8 cis8 e8 \bar "||"
  \ln fis4 ~ fis8 \ln e4 ~ \ln e4 ~ e8 \bar "|" \ln e4 d8 cis8 ~ cis8 e8 \ln cis4 e8 \bar "|"
  e8 cis8 e8 d8 cis8 cis8 e8 \barstartrepeat e8 d8 b8 \ln d4 cis8 cis8 e8 \bar "|" 
  b8 d8 cis8 d8 cis8 cis8 e8 \doublerepeat e8 fis8 fis8 gis8 a8 gis8 gis8 gis8 e8 \fdendrepeat
  e8 e8 e8 cis8 e8 e8 e8 e8 \bar "|" fis8 e8 e8 d8 cis8 e8 e8 \bar "||" 
  gis8 gis8 gis8 fis8 \ln e4 ~ e8 e8 \bar "|" d8 e8 e8 d8 cis8 e8 \bar "" 
  e8 e8 e8 e8 fis8 cis8 cis8 cis8 e8 cis8 d8( \blacknote cis16 \blacknote b16) ~ b8 \bar "||" 
}

tenor = \relative c { \clef bass \autoBeamOff
  b'8 gis8 gis8 e8[ 
       \once \override NoteHead #'duration-log = #2
       gis8*1/2] gis8 \bar "|" a8 a8 b8 a8 gis8 gis8 a8 ~ a8 ~ a8 \fdendrepeat
  \beginfdots \once \override NoteHead #'X-offset = #2  
       \ln a4 gis8 cis8 b8 \ln a4 ~ a8 gis8 gis8 b8 \bar "|" gis8 b8 \ln a4 ~ a8 b8 b8 \fdendrepeat
  \ln a4 a8 a8 b8 e8 d8 cis8 \bar "|" cis8 b8 a8 b8 a8 b8 \ln a4 b8 \bar "||" 
  \ln a4 fis8 a8 gis8 a8 gis8 b8 \bar "|" \ln a4 ~ \ln a4 ~ a8 b8 cis8 a8 b8 \bar "|"
  b8 a8 a8 a8 a8 a8 b8 \barstartrepeat a8 fis8 e8 \ln a4 a8 a8 b8 \bar "|" 
  gis8 a8 \ln a4 ~ \ln a4 b8 \doublerepeat b8 d8 d8 \ln e4 ~ \ln e4 ~ e8 b8 \fdendrepeat
  a8 a8 gis8 a8 gis8 gis8 gis8 b8 \bar "|" d8 b8 \ln a4( a8) b8 b8 \bar "||"
  e8 e8 e8 cis8 a8 gis8 gis8 e8 \bar "|" fis8 e8 a8 a8 a8 gis8 \bar "" 
  gis8 cis8 \bar "|" b8 cis8 cis8 a8 gis8 a8 b8 a8 \ln a4 gis8 \bar "||" 
}

bass = \relative c { \clef bass \autoBeamOff 	
  \ln e4 cis8 \once \override NoteColumn #'force-hshift = #'-0.66 e8. e8 \bar "|" 
      d8 a8 \ln e'4 ~ e8 \ln cis4 d8 a8 \fdendrepeat
  \beginfdots a'8 fis8 \ln cis4 e8 fis8 cis8 a8 e'8 \ln e4 \bar "|" \ln e4 cis8 d8 a'8 e8 e8 \fdendrepeat
  \ln fis4 d8 a'8 gis8 a8 b8 cis8 \bar "|" a8 e8 fis8 gis8 fis8 e8 cis8 fis8 e8 \bar "||" 
  \ln fis4 b,8 cis8 e8 a8 e8 e8 \bar "|" \ln cis4 d8 a8 a'8 gis8 fis8 fis8 e8 \bar "|" 
  gis8 fis8 cis8 d8 fis8 a8 e8 \barstartrepeat cis8 b8 e8 d8 fis8 fis8 a8 e8 \bar "|" 
  e8 d8 a8 d8 fis8 a8 e8 \doublerepeat e8 b8 b8 e8 a8 e8 cis8 e8 e8 \fdendrepeat
  a,8 a8 e'8 fis8 cis8 e8 e8 e8 \bar "|" b8 e8 cis8 d8 a'8 e8 e8 \bar "||" 
  cis8 cis8 e8 fis8 a,8 e'8 e8 e8 \bar "|" b8 e8 cis8 d8 fis8 e8 \bar ""
  cis8 cis8 \bar "|" gis8 cis8 fis,8 a8 cis8 fis8 e8 fis8 \ln d4 e8 \bar "||"
}


%%% Inline lyrics

wordsA = \lyricmode { 
  \once \override LyricText #'self-alignment-X = #0.8 
  "1  Sa" -- viour e -- ter -- nal! Health and life of the world un -- fail -- ing,
  "3  Griev" -- ing that the a -- ges of men must per -- ish Thro' the temp -- ter's sub -- tle -- ty,
  \once \override LyricText #'X-offset = #-2
  "5  Then" free -- ly and gra -- cious -- ly Deign -- ing to as -- sume hu -- man -- i -- ty,       
  \once \override LyricText #'X-offset = #-2
  "6  To" lost ones and per -- ish -- ing Gav -- est thou thy free de -- liv -- er -- ance,        
  Fill -- ing all the world with joy.  
  \once \override LyricText #'self-alignment-X = #0.8
  "7  O" Christ, our souls and bo -- dies cleanse      
  By thy per -- fect sa -- cri -- fice;  "9  By" thy for -- mer ad -- vent jus -- ti -- fy, 
  \once \override LyricText #'X-offset = #-6
  "11  That " when in the might of glo -- ry Thou de -- scend -- est, Judge of all,
  \once \override LyricText #'X-offset = #-4.4
  "12. We" in rai -- ment un -- de -- fi -- led, Bright may shine, and ev -- er            
  fol -- low, Lord, thy foot -- steps blest, where -- 'er they lead us.                                             
}            
            
wordsB = \lyricmode { 
  "2  Light" e -- ver -- last -- ing! And in ve -- ri -- ty our re -- demp -- tion,
  \once \override LyricText #'self-alignment-X = #0.2 
  "4  Still" in heav'n a -- bid -- ing, thou cam -- est earth -- ward Of thine own great cle -- men -- cy:
  \skips #39
  \once \override LyricText #'self-alignment-X = #-0.2
  "8  That" we as tem -- ples pure and bright
  Fit for thine a -- bode may be. 
  \once \override LyricText #'self-alignment-X = #0.2  
  "10  By" thy se -- cond grant us lib -- er -- ty:
}  
  

#(ly:set-option 'point-and-click #f)

\book {

\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##t
}


\score {
<<	
  <<
  \new VaticanaStaff {\plainsong }
  \new Lyrics = "firstline" {s1}
  \new Lyrics = "secondline" {s1}
  \new ChoirStaff <<
    \new Staff = "upper" <<
      \context Voice = sopranos {\voiceOne \global \soprano }
      \context Voice = altos {\voiceTwo \global \alto }
                      >> 
   \new Staff = "lower" <<
      \context Voice = tenors {\voiceOne \global \tenor }
      \context Voice = bass {\voiceTwo \global \bass }
	              >>
		 >>	 
  >>
\context Lyrics = "firstline" \lyricsto "sopranos" \wordsA
\context Lyrics = "secondline" \lyricsto "sopranos" \wordsB  
>>

\layout {
	
  ragged-right = ##f
  ragged-last = ##f
  \context { \Score timing = ##f }
  \context { \Score \override TimeSignature #'transparent = ##t }
  \context { \Score \remove "Mark_engraver" }
  \context { \Staff \consists "Mark_engraver" }
  
%% \context { \Score \override SystemStartBar #'stencil = ##f } %% uncomment this if you want to remove system start bar
  
  \context { \Staff \override NoteHead #'duration-log = #1 }
  \context { \Staff \override Stem #'flag-style = #'no-flag }
  \context { \VaticanaStaff %%customize vaticana staff context 
	          \revert StaffSymbol #'color
		  \revert LedgerLineSpanner #'color
		  \override BarLine #'transparent = ##f 
		  \remove Custos_engraver
		  \consists "Mark_engraver"
 	}
	
 }
}
 
%%%%%%%%%%%%%%%% This next section of code is for
%%%%%%%%%%%%%%%% unfolding the repeats and generating the midi
%%%%%%%%%%%%%%%% Not needed for visual layout
                

\score { 
\new ChoirStaff 
<<

\new Staff = "soprano" { \relative c' {\clef treble \global  
  \unfoldRepeats { \repeat volta 2 { gis'8 b8 cis8 gis8[ e8*1/2] e8 \bar "|"fis8 a8 gis8 fis8 e8 gis8 e8 fis8 e8 }
  \repeat volta 2 { e8 fis8 gis8 gis8 gis8 fis8 a8 cis8 b8 b8 gis8 \bar "|" \noBreak b8 gis8 a8 fis8 e8 gis8 gis8 }
  fis8[ cis'8] d8 cis8 b8 cis8 b8 gis8 \bar "|"a8 gis8 fis8 e8 fis8 gis8 a8 fis8 gis8 \bar "||" 
  fis8[ cis'8] d8 cis8 b8 cis8 b8 gis8 \bar "|"a8 gis8 fis8 e8 fis8 gis8 a8 fis8 gis8 \bar "||" 
  e8 fis8 a8 fis8 fis8 e8 gis8 \repeat volta 2 { a8 b8 gis8 fis8 a8 fis8 e8 gis8 \bar "||" 
  e8 fis8 a8 fis8 fis8 e8 gis8 } \repeat volta 2 { gis8 b8 b8 b8 cis8 b8 cis8 b8 gis8 }
  cis8 cis8 b8 a8 cis8 b8 b8 gis8 \bar "|"b8 gis8 a8 fis8 e8 gis8 gis8 \bar "||" 
  cis8 cis8 b8 a8 cis8 b8 b8 gis8 \bar "|"b8 gis8 a8 fis8 a8 b8 \bar "" 
	cis8 gis8 \bar "|"b8 gis8 a8 fis8 e8 fis8 gis8 fis8 \ln fis4 e8 \bar "||" }	
}
}

\new Staff = "alto" {\relative c' {\clef treble \global  
  \unfoldRepeats { \repeat volta 2 { \ln e4 ~ e8 e8. b8 \bar "|" d8 cis8 \ln b4 ~ b8 e8 e8 d8 cis8 }
  \repeat volta 2 { \ln cis4 \ln e4 ~ e8 cis8 e8 e8 e8 \ln e4 \bar "|" \ln e4 ~ e8 d8 cis8 e8 e8 }
  \ln fis4 ~ fis8 \ln e4 a8 fis8 e8 \bar "|" \ln e4 cis8 b8 cis8 e8 ~ e8 cis8 e8 \bar "||"
  \ln fis4 ~ fis8 \ln e4 ~ \ln e4 ~ e8 \bar "|" \ln e4 d8 cis8 cis8 e8 \ln cis4 e8 \bar "||"
  e8 cis8 e8 d8 cis8 cis8 e8 \repeat volta 2 { e8 d8 b8 \ln d4 cis8 cis8 e8 \bar "||" 
  b8 d8 cis8 d8 cis8 cis8 e8 } \repeat volta 2 { e8 fis8 fis8 gis8 a8 gis8 gis8 gis8 e8 }
  e8 e8 e8 cis8 e8 e8 e8 e8 \bar "|" fis8 e8 e8 d8 cis8 e8 e8 \bar "||" 
  gis8 gis8 gis8 fis8 \ln e4 ~ e8 e8 \bar "|" d8 e8 e8 d8 cis8 e8 \bar "" 
  e8 e8 e8 e8 fis8 cis8 cis8 cis8 e8 cis8 d8( \blacknote cis16 \blacknote b16) ~ b8 \bar "||" }	
}	
}

\new Staff = "tenor" { \relative c {\clef bass \global  
  \unfoldRepeats { \repeat volta 2 { b'8 gis8 gis8 e8[ gis8*1/2] gis8 \bar "|" a8 a8 b8 a8 gis8 gis8 a8 ~ a8 ~ a8 }
  \repeat volta 2 { \ln a4 gis8 cis8 b8 \ln a4 ~ a8 gis8 gis8 b8 \bar "|" gis8 b8 \ln a4 ~ a8 b8 b8 }
  \ln a4 a8 a8 b8 e8 d8 cis8 \bar "|" cis8 b8 a8 b8 a8 b8 \ln a4 b8 \bar "||" 
  \ln a4 fis8 a8 gis8 a8 gis8 b8 \bar "|" \ln a4 ~ \ln a4 ~ a8 b8 cis8 a8 b8 \bar "||"
  b8 a8 a8 a8 a8 a8 b8 \repeat volta 2 { a8 fis8 e8 \ln a4 a8 a8 b8 \bar "||" 
  gis8 a8 \ln a4( a8) a8 b8 } \repeat volta 2 { b8 d8 d8 \ln e4 ~ \ln e4 ~ e8 b8 }
  a8 a8 gis8 a8 gis8 gis8 gis8 b8 \bar "|" d8 b8 \ln a4( a8) b8 b8 \bar "||"
  e8 e8 e8 cis8 a8 gis8 gis8 e8 \bar "|" fis8 e8 a8 a8 a8 gis8 \bar "" 
  gis8 cis8 \bar "|" b8 cis8 cis8 a8 gis8 a8 b8 a8 \ln a4 gis8 \bar "||" }	
} 
}


\new Staff = "bass" { \relative c { \clef bass \global  
  \unfoldRepeats { \repeat volta 2 { \ln e4 cis8 e8. e8 \bar "|" d8 a8 \ln e'4 ~ e8 \ln cis4 d8 a8 }
  \repeat volta 2 { a'8 fis8 \ln cis4 e8 fis8 cis8 a8 e'8 \ln e4 \bar "|" \ln e4 cis8 d8 a'8 e8 e8 }
  \ln fis4 d8 a'8 gis8 a8 b8 cis8 \bar "|" a8 e8 fis8 gis8 fis8 e8 cis8 fis8 e8 \bar "||" 
  \ln fis4 b,8 cis8 e8 a8 e8 e8 \bar "|" \ln cis4 d8 a8 a'8 gis8 fis8 fis8 e8 \bar "||" 
  gis8 fis8 cis8 d8 fis8 a8 e8 \repeat volta 2 { cis8 a8 e'8 d8 fis8 fis8 a8 e8 \bar "||" 
  e8 d8 a8 d8 fis8 a8 e8 } \repeat volta 2 { e8 b8 b8 e8 a8 e8 cis8 e8 e8 }
  a,8 a8 e'8 fis8 cis8 e8 e8 e8 \bar "|" b8 e8 cis8 d8 a'8 e8 e8 \bar "||" 
  cis8 cis8 e8 fis8 a,8 e'8 e8 e8 \bar "|" b8 e8 cis8 d8 fis8 e8 \bar ""
  cis8 cis8 \bar "|" gis8 cis8 fis,8 a8 cis8 fis8 e8 fis8 \ln d4 e8 \bar "||" }	
}
}


>>

\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 80 8)
            }
       }
} %% midi score bracket

} %book bracket

