%%% 213-215.png
%%% Hymn 130. Christians to the Paschal Victim.
%%% Version 2
 
 
\version "2.10"
 
\include "gregorian-init.ly"
 
\header {
   dedication = \markup { \center-align { "THE CHRISTIAN YEAR - EASTERTIDE" \hspace #0.1 } }     
   
   title = "130"
   
   poet = \markup { \small \italic { Sequence.} }
   
   composer = \markup { \small \italic { "Ascribed to Wipo, c. 1030.    Tr. cento." } }
   
   meter = \markup { \small { \hspace #45 "Victimae Paschali." } }
   
   arranger = \markup { \small { Mode i. } }
   
   tagline = ""
}

%%%%%%%%%%%%% Macros
 
%%% macro settings for stemless long note which is 2x duration of regular white note    
 
ln = {\once \override NoteHead #'duration-log = #0 
           \once \override Stem #'stencil = ##f
           \once \override NoteColumn #'force-hshift = #'0.4 }

%%% same as above but uses x-offset instead of force-hshift    
 	   	   
lnb = {\once \override NoteHead #'duration-log = #0 
           \once \override Stem #'stencil = ##f
           \once \override NoteHead #'X-offset = #0.8 }
	   	   
%%% settings to generate the double longnotes (breves)

brevenote = { \once \override NoteHead #'duration-log = #-1  
                \once \override NoteColumn #'force-hshift = #0.8 }

crochet = { \once \override NoteHead #'duration-log = #2  }
	   
	   
% *** prints four dots in a column, This will be used by other macros to create repeat signs.                   
 
fdots = \markup { \override #'(baseline-skip . 1.0) 
        \column { \with-color #black { \fontsize #0 . \fontsize #0 . \fontsize #0 . \fontsize #0 .} }}           
            
%%% positions 4 dots at beginning of a line of score mimicking a begin repeat sign
%%% uses fdots macro, above
%%% The dots are placed as \mark objects rather than a normal bar glyph because Lilypond will not easily print a bar
%%% glyph at the beginning of a line without upsetting the bar at the end of the previous line
%%% Place \beginfdots before the first note of line you want it to begin.
 
beginfdots = {    
                   \once \override Staff.RehearsalMark #'Y-offset = #'1.4
                   \once \override Staff.RehearsalMark #'X-offset = #'9.0
                   \mark \fdots
                   \once \override Score.SeparationItem #'padding = #1
}           
            
%%% Prints a repeat sign glyph comprising 4 dots then two thin bars. This is used to end a repeat. 
%%% This macro works by replacing the glyph used by the \bar "||" function. 
 
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
 
%%% Prints a repeat sign glyph comprising two thin bars then 4 dots. Used to end a section then start a repeat.
%%% This macro works by replacing the glyph used by the \bar "||" function.   
 
barstartrepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
            \once \override Staff.BarLine #'text = \markup  {  \line { \filled-box #'(0 . 0.15) #'(-2.0 . 2.0) #0  
                                                                           \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2.0 . 2.0) #0 
                                                                                                   \hspace #-1.0 \raise #1.4 \override #'(baseline-skip . 1.0)  
                                                                                                   \column { \with-color #black {  
                                                                                                             \fontsize #2 . \fontsize #2 . 
                                                                                                            \fontsize #2 .  \fontsize #2 . } }                                                     
            } }         
        \bar "||"}     

	
%%%   
%%% Equivalent macros for plainsong    
%%%
 
%%% prints three dots in a column, suitable for plainsong staffs    
 
tdots = \markup { \override #'(baseline-skip . 1.6) 
                  \column { \with-color #black { \fontsize #0 . \fontsize #0 . \fontsize #0 . } }
}           
  
%%% Using the tdots macro above, positions 3 dots at beginning of a line of score thus mimicking a begin repeat sign.
%%% The dots are placed as \mark objects rather than a normal bar glyph because Lilypond will not easily print a bar
%%% glyph at the beginning of a line without upsetting the bar at the end of the previous line
%%% Place \pbeginfdots before the first note of line you want it to begin.
 
pbegintdots = { 
                   \once \override Staff.RehearsalMark #'Y-offset = #'1.5
                   \once \override Staff.RehearsalMark #'X-offset = #'3.0
                   \mark \tdots
                   \once \override Score.SeparationItem #'padding = #1
}           
 
%%% Prints a repeat sign glyph comprising 3 dots and two thin bars. Used to end a repeat on a plainsong staff.
%%% This macro works by replacing the glyph used by the \bar "||" function. 
 
ptdendrepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
            \once \override Staff.BarLine #'text = \markup  {  \line { \raise #1.4 \override #'(baseline-skip . 1.6)  \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . } }
                                                              \hspace #-1 \filled-box #'(0 . 0.15) #'(-2.4 . 2.4) #0
                                                                                      \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2.4 . 2.4) #0
            } }         
        \bar "||"}      
  
%%% Prints a repeat sign glyph comprising two thin bars then 3 dots. Used to end a section then start a repeat on a plainsong staff.
%%% This macro works by replacing the glyph used by the \bar "||" function.   
 
pbarstartrepeat = {
	    
	    \once \override Staff.BarLine #'stencil = #ly:text-interface::print 
            \once \override Staff.BarLine #'text = \markup  {  \line { \filled-box #'(0 . 0.15) #'(-2.4 . 2.4) #0  
                                                                           \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2.4 . 2.4) #0 
                                                                                                   \hspace #-1.0 \raise #1.4 \override #'(baseline-skip . 1.6)  
                                                                                                   \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . } }                                                 
            } }         
        \bar "||"} 
            
%%% clefpad moves the clef a little to the right. When a mid-staff clef change is inserted, Lilypond puts it very close to the 
%%% barline. Unusually, this extra-offset command must be inserted after the \clef command.

clefpad = \once \override Staff.Clef #'extra-offset = #'(0.4 . 0)

%% music function to allow lyrics to skip a given number of note-syllables
%% skips #7 will skip over 7 music note-syllables. Needed to align lyrics which begin partway
%% through the music

skips = #(define-music-function (parser location times) (number?)
     #{
	     \repeat unfold $times { \skip 1}
       #})
     
%%%%%%%%%%%%%%%%%%% End of Macro Definitions

%%% plainsong voice
 
plainsong = {  \relative c' { 
   \clef "vaticana-do3"
   \set fontSize = #3  
   
%%% Set the order in which symbols are printed. By default Lilypond prints mid-staff clef changes before a barline. This section 
%%% sets the clef symbol to come after a barline
%%% As these settings are for the score context, they affect plainsong and normal SATB staffs  

\override Score.BreakAlignment #'break-align-orders = ##(; end-of-line:
  ( left-edge 
  clef staff-bar key-signature
  time-signature )

  ; unbroken
  (left-edge 
  staff-bar 
  clef 
  key-signature
  staff
  time-signature )

  ; begin of line
  ( left-edge 
  clef 
  key-signature 
  staff-bar
  time-signature )		  
)	  

  d,8 c d f g f e d \bar "|" a' g e g f e d \bar "||" \break
  \pbegintdots a' c d a g a a \bar "|" a g a g f e d \bar "|" \break
  f g d e d c e f e d
      
      %%% markup for the custos
       _\markup { \hspace #6.5 
      \override #'(baseline-skip . 0.4)  
      \column { "–"	
               \line{ \hspace #0.1 \tiny \musicglyph #"scripts.prall" \hspace #-1.5 \fontsize #2 . }  }  }
     
      %%% resume music
      \ptdendrepeat \once \override VaticanaStaff.Clef #'non-default = ##t  
      \clef "vaticana-fa2" \clefpad a c d f \[ g \flexa f \] \[ e \flexa d \] \bar "|" \break

%%pp2  
  c f e d e c d \bar "||" f a g a \bar "" \break
  f g \[ f \flexa e \] d \bar "|" d g f g a g f g \[ f \flexa e \] d \bar "||" \break
  a c d f \[ g \flexa f \] \[ e \flexa d \] \bar "|" c f e d e c d \bar "||" \break

%%pp3  
  f a g a f g \[ f \flexa e \] d \bar "|" d g f g a \bar "" \break
  f g \[ f \flexa e \] \once \override TextScript #'extra-offset = #'( 3.0 . -1.2 ) d^\markup { \tiny \musicglyph #"scripts.prall" \hspace #-1.5 \fontsize #2 . } \pbarstartrepeat \once \override VaticanaStaff.Clef #'non-default = ##t \clef "vaticana-do3" \clefpad a' c d a a g a a \bar "|" a c \bar "" \break
  \[ g \flexa e \] f e d \bar "|" c e d g a a \[ g \flexa e \] f e d \ptdendrepeat
} }  


%%% SATB voices

global = {
  \key ees \major 
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
  \tag #'vOne { f8 ees f aes bes aes g f \bar "|" c' bes g bes aes g f \bar "||" \break }
  \tag #'vTwoThree { \beginfdots c' ees f c bes c c \bar "|" c bes c   bes aes g f \bar "|"
  \once \override Score.SeparationItem #'padding = #2	  
      aes bes f g f ees g aes g f \fdendrepeat } \tag #'vFourtoSeven { c ees f aes bes[ aes] g[ f] \bar "|" \break

%%%pp2
   \once \override Score.SeparationItem #'padding = #2 
       ees8 aes g f g ees f \bar "||" aes c bes c \bar "" \break
  aes bes aes[ g] f \bar "|" f bes aes bes c bes aes bes aes[ g] f \bar "||" \break
   \once \override Score.SeparationItem #'padding = #2 
       c ees f aes bes[ aes] g[ f] \bar "|" ees aes g f g ees f \bar "||" \break

%%%pp3
  aes c bes c aes bes aes[ g] f \bar "|" f bes aes bes c \bar "" \break
  \once \override Score.SeparationItem #'padding = #4
      aes bes aes[ g] f } \tag #'vEightNine { \barstartrepeat c' ees f c c bes c c \bar "|" c ees \bar "" \break
  bes[ g] aes g f \bar "|" ees g f bes c c bes[ g] aes g f \fdendrepeat }
}
 
alto = \relative c' {
  \tag #'vOne { c8 c des c bes ees ees c \bar "|" ees f ees f ees ees c \bar "||" \break }
  \tag #'vTwoThree { \beginfdots aes' bes aes g f ees ees \bar "|" \ln ees4. des!8 ees ees c \bar "|" \break 
  ees des! c ees \ln bes4 \ln ees4 ~ ees8 c \fdendrepeat } \tag #'vFourtoSeven { c bes c f \ln f4 ees8[ c] \bar "|" \break

%%%pp2
  c8 ees ees bes bes c c \bar "||" f \ln ees4 ~ ees8 \bar "" \break
  c8 des! \ln ees4 des!8 \bar "|" des! des \brevenote ees\breve *1/4 ~ \ln ees4 ~ \ln ees4 c8 \bar "||" \break
  aes8 bes c f  \ln f4 ees8[ des!] \bar "|" bes \ln ees4 c8 ees ~ ees c \bar "||" \break

%%%pp3
  f \ln ees4 ~ ees8 c des! \ln ees4 des!8 \bar "|" c \brevenote ees\breve *1/4 ~ \bar "" \break
  \ln ees4 ~ \ln ees4 c8 } \tag #'vEightNine { \barstartrepeat aes'8 bes aes g aes f ees ees \bar "|" \ln ees4 \bar "" \break
  \ln ees4 ~ ees8 ees c \bar "|" bes ees c \ln ees4 ~ ees8 \ln ees4 ~ ees8 ees c \fdendrepeat }
}
 
tenor = \relative c { \clef bass
  \tag #'vOne {aes'8 aes \ln aes4 ees8 c' bes aes \bar "|" g f bes des c bes aes \bar "||" \break }
  \tag #'vTwoThree { \beginfdots ees' ees c c f, g g \bar "|" aes g aes f aes bes aes \bar "|" \break
  aes f aes bes aes g bes c g aes \fdendrepeat } \tag #'vFourtoSeven { aes bes aes ~ aes des![ c] bes[ aes] \bar "|" \break

%%%pp2
  \ln c4 bes8 aes g g aes \bar "||" c aes g ~ g \bar "" \break
  f ~ f \ln aes4  ~ aes8 \bar "|" aes bes  ees,  \crochet f16( \crochet g16)  aes8  bes  c bes \ln c4 aes8 \bar "||" \break
  ees ees aes c des![ c] c[ aes] \bar "|" g aes bes aes bes bes aes \bar "||" \break

%%%pp3
  aes aes g g f ~ f \ln aes4 ~ aes8 \bar "|" aes g aes g aes ~ \bar "" \break
  aes ees \ln c'4 aes8 } \tag #'vEightNine { \barstartrepeat ees' ees c c c f, g g \bar "|" aes bes \bar "" \break
  g[ bes] aes bes aes \bar "|" bes bes aes \ln g4 aes8 g[ bes] c g aes \fdendrepeat }
}
 
bass = \relative c { \clef bass
  \tag #'vOne {f,8 aes des aes g aes ees' f \bar "|" c des! ees bes c ees f \bar "||" \break }
  \tag #'vTwoThree { \beginfdots aes g f ees des! c c \bar "|" aes ees' aes, bes c ees f \bar "|" \break 
  c bes f' \ln ees4. ees8 aes, c f, \fdendrepeat } \tag #'vFourtoSeven { aes' g f des! \ln bes4 ees8[ f]

%%%pp2
  \lnb aes4 \ln ees4 ~ ees8 c f, \bar "||" f' aes ees c \bar "" \break
  f bes, \lnb c4 des!8 \bar "|" des! bes c bes \ln aes4. g8 \lnb c4 f,8 \bar "||" \break
  aes g f f' bes,[ f'] c[ des!] \bar "|" ees c ees f ees g f \bar "||" \break

%%%pp3
  \once \override Score.SeparationItem #'padding = #2 
      des!8 aes ees' c f bes, \lnb c4 des!8 \bar "|" f ees c bes aes \bar "" \break
  c g aes[ c] f } \tag #'vEightNine { \barstartrepeat aes g f ees f des! c c \bar "|" aes g \bar "" \break
  \ln ees'4 c8 ees f \bar "|" g ees f ees c aes \ln ees'4 aes,8 c f, \fdendrepeat }
}
 
 
lyricsOne = \lyricmode {
  \override LyricText #'font-size = #-1.	
  "1  Chris" -- tians, to the Pas -- chal Vic -- tim  Of -- fer your thank -- ful prai -- ses!
  \once \override LyricText #'self-alignment-X = #1
  "2    A" Lamb the sheep re -- deem -- eth: Christ, who on -- ly is  sin -- less,	
  Re -- con -- cil -- eth sin -- ners to the Fa -- ther:  
      \once \override LyricText #'self-alignment-X = #0.4 
      "4  Speak" Ma -- ry, de -- clar -- ing
  What thou saw -- est way -- far -- ing: 
        \once \override LyricText #'self-alignment-X = #0.65
      "5  ‘ The" Tomb of Christ,
  who is liv -- ing, The glo -- ry of Je -- su's Re -- sur -- rec -- tion:
  \once \override LyricText #'self-alignment-X = #0.4
  "6  Bright" an -- gels at -- test -- ing, The shroud and nap -- kin rest -- ing.
  \once \override LyricText #'self-alignment-X = #0.4
  "7  Yea," Christ my hope is a -- ris -- en: To Ga -- li -- lee he
  goes be -- fore you.’ 
  \once \override LyricText #'self-alignment-X = #0.8
  "8  Hap" -- py they who hear the wit -- ness, Ma -- ry's
  word be -- liev -- ing  A -- bove the tales of Jew -- ry de -- ceiv -- ing.
}
 
lyricsTwo = \lyricmode {
  \override LyricText #'font-size = #-1.	
  \skips #15
  \once \override LyricText #'self-alignment-X = #0.0
  "3  Death" and life have con -- tend -- ed  In that com -- bat stu -- pen -- dous:
  The Prince of Life, who died, reigns im -- mor -- tal. 
  \skips #61
  \once \override LyricText #'self-alignment-X = #0.2
  "9. Christ" in -- deed from death is ris -- en, our new
  life ob -- tain -- ing. Have mer -- cy, vic -- tor King, ev -- er reign -- ing! 
} 

 
#(ly:set-option 'point-and-click #f)
 
\book {
 
\paper {
 #(set-paper-size "a4")
%% annotate-spacing = ##t
 print-page-number = ##f
 ragged-last-bottom = ##t
 ragged-bottom = ##t
}

%%% Score block

\score { 
<<
 
\context VaticanaStaff 
   <<
   \new VaticanaVoice = "cantus" { \plainsong }
   >> % end vaticana staff


\context ChoirStaff <<
   \context Staff = upper << 
      \context Voice = sopranos { \voiceOne \global \soprano }
      \context Voice = altos {\voiceTwo  \global \alto  }
                          >> 
   \new Lyrics \lyricsto sopranos {\set alignAboveContext = #"upper" \small \override LyricSpace #'minimum-distance = #1.8 \lyricsOne }
 
   \new Lyrics \lyricsto sopranos {\set alignAboveContext = #"upper" \small \lyricsTwo }
 
   \context Staff = "lower" << \clef bass
      \context Voice = tenors { \voiceOne \global \tenor }
      \context Voice = bass { \voiceTwo  \global \bass  }
                            >> 
                    >> 
>> 
 
\layout {
            
  ragged-right = ##f
  ragged-last = ##f
  \context { \Score timing = ##f }
  \context { \Score \override TimeSignature #'transparent = ##t }
  \context { \Score \remove "Mark_engraver" }
  \context { \Staff \consists "Mark_engraver" }
%  \context { \VaticanaStaff Clef #'break-visibility = #begin-of-line-visible }
  
  % *** Needed to produce beamed minims - which are quavers in disguise
  \context { \Staff \override NoteHead #'duration-log = #1 }
  \context { \Staff \override Stem #'flag-style = #'no-flag }
  
  \context { \VaticanaStaff
           % *** Increases distance between lines of staff  
           \override StaffSymbol #'staff-space = #1.6            
           % *** Changes staff to black instead of default red
           \revert StaffSymbol #'color
           % *** Makes clef bigger       
           \override Clef #'font-size = #3
           % *** Would make ledger lines black, if there were any
           \revert LedgerLineSpanner #'color
           % *** Makes terminal barline visible 
           \override BarLine #'transparent = ##f 
               % *** Remove custos
               \remove Custos_engraver
               % *** needed for certain tweaks
               \consists "Mark_engraver"
           \remove Key_engraver
           \override Accidental #'transparent = ##f }
} % end layout
 
} % end score

%%% A separate score block to generate the midi minus the plainsong voice
%%% Since minims are quavers in disguise, tempo has to be set accordingly, tempo set to 2=80

\score {	
  \new ChoirStaff <<
   \new Staff = "upper" <<
      \context Voice = sopranos {\voiceOne \global \keepWithTag #'vOne \soprano \keepWithTag #'vTwoThree \soprano \keepWithTag #'vTwoThree \soprano
                                                   \keepWithTag #'vFourtoSeven \soprano \keepWithTag #'vEightNine \soprano \keepWithTag #'vEightNine \soprano }
      \context Voice = altos {\voiceTwo \global \keepWithTag #'vOne \alto \keepWithTag #'vTwoThree \alto \keepWithTag #'vTwoThree \alto
                                                 \keepWithTag #'vFourtoSeven \alto \keepWithTag #'vEightNine \alto \keepWithTag #'vEightNine \alto }
                      >> 
   \new Staff = "lower" <<
      \context Voice = tenors {\voiceOne \global \keepWithTag #'vOne \tenor \keepWithTag #'vTwoThree \tenor \keepWithTag #'vTwoThree \tenor
                                                 \keepWithTag #'vFourtoSeven \tenor \keepWithTag #'vEightNine \tenor \keepWithTag #'vEightNine \tenor }
      \context Voice = bass {\voiceTwo \global \keepWithTag #'vOne \bass \keepWithTag #'vTwoThree \bass \keepWithTag #'vTwoThree \bass
                                                 \keepWithTag #'vFourtoSeven \bass \keepWithTag #'vEightNine \bass \keepWithTag #'vEightNine \bass }
	             >> 
		 >>  

\midi { 
  \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) }
       } 
}
 
} % end book
 
