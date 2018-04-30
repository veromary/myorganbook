%%% 248.png
%%% Hymn 155 Veni, sancte Spiritus
%%% Version 2

\version "2.10"

\include "gregorian-init.ly"

\header {
	title = "155"
	subtitle = "Veni, sancte Spiritus."
	
	meter = \markup { \small \italic {"The Golden Sequence."} }
	
	arranger = \markup { \small \italic {"13th cent.  Tr. J. M. Neale."}}
	
	opus = \markup { \small "Mode i." }
	
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
	   	   
%%% setting to hide accidental. As timing is turned off, accidentals have to be set manually

noacci = \once \override Staff.Accidental #'transparent = ##t

%%% prints four dots in a column, This will be used by other macros to create repeat signs.                   
 
fdots = \markup { \override #'(baseline-skip . 1.0) 
        \column { \with-color #black { \fontsize #0 . \fontsize #0 . \fontsize #0 . \fontsize #0 .} }}           
            
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

%%% Prints a repeat sign glyph comprising 4 dots then two thin bars then 4 dots. Used to end a repeat and then start another repeat.
%%% This macro works by replacing the glyph used by the \bar "||" function.   
 
doublerepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
            \once \override Staff.BarLine #'text = \markup  {  \line { \raise #1.4 \override #'(baseline-skip . 1.0) 
                                                                           \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 . } } 
                                                                                                   \hspace #-1 \filled-box #'(0 . 0.15) #'(-2.0 . 2.0) #0  
                                                                           \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2.0 . 2.0) #0 
                                                                                                   \hspace #-1.0 \raise #1.4 \override #'(baseline-skip . 1.0)  
                                                                                                   \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 . } }                                                      
            } }         
        \bar "||"}  	

%%%%%%   
%%%%%% Equivalent macros for plainsong    
%%%%%%
 
%%% prints three dots in a column, suitable for plainsong staffs    
 
tdots = \markup { \override #'(baseline-skip . 1.6) 
                  \column { \with-color #black { \fontsize #0 . \fontsize #0 . \fontsize #0 . } }
}           

%%% Prints a repeat sign glyph comprising 3 dots and two thin bars. Used to end a repeat on a plainsong staff.
%%% This macro works by replacing the glyph used by the \bar "||" function. 
 
ptdendrepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
            \once \override Staff.BarLine #'text = \markup  {  \line { \raise #1.4 \override #'(baseline-skip . 1.6)  \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . } }
                                                              \hspace #-1 \filled-box #'(0 . 0.15) #'(-2.4 . 2.4) #0
                                                                                      \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2.4 . 2.4) #0
            } }         
        \bar "||"}      
  
%%% Prints a repeat sign glyph comprising 3 dots then two thin bars then 3 dots. Used to end a repeat and then start another repeat on a plainsong staff.
%%% This macro works by replacing the glyph used by the \bar "||" function.   
 
pdoublerepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
            \once \override Staff.BarLine #'text = \markup  {  \line { \raise #1.4 \override #'(baseline-skip . 1.6) 
                                                                           \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . } }            
                                                                                                   \hspace #-1 \filled-box #'(0 . 0.15) #'(-2.4 . 2.4) #0  
                                                                           \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2.4 . 2.4) #0 
                                                                                                   \hspace #-1.0 \raise #1.4 \override #'(baseline-skip . 1.6)  
                                                                                                   \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . } }                                                 
            } }         
        \bar "||"}     
 	
%%% push a tie slightly to the right. Sometimes needed when using \lnb above.

tiepush = \once \override Tie #'extra-offset = #'(0.4 . 0.0)

%%% more space: force more space between notes

morespace = \once \override Score.SeparationItem #'padding = #5

%%%%%%%%%%%%%%%%%%% End of Macro Definitions


%%% plainsong voice

plainsong =  {  \relative c { 
	\clef "vaticana-do3"
	\set fontSize = #3

	c8 d \morespace e \morespace f  \morespace \[ e \flexa d \]  \morespace c \morespace d \bar "|" \morespace f \morespace g \morespace a \morespace bes \morespace \[ \virga a \inclinatum g \inclinatum f \] \bar "" \break 
	g a \bar "|" c, d e f \[ \virga f \inclinatum e \inclinatum d \] c d  \pdoublerepeat a' c d 	\bar "" \break 
	d  \[c \flexa \noacci b \] c d \bar "|" c a \[ c \flexa b \] g \[ f \flexa e \] d c  \bar "|" \break 
	
	%%pp2
	g' f \[ g \pes a \] g \[ \virga f \inclinatum e \inclinatum d \] c d \pdoublerepeat d' d  \[ c \flexa b \] \bar "" \break
	c \[ d \flexa c \] b a  \bar "|" \noBreak f d c d f g f \bar "|" \[ g \pes a \] bes \bar "" \break
	a g \[ \virga f \inclinatum e \inclinatum d \] c d \pdoublerepeat a' c  \[ b \flexa a \] b \[ c \flexa b \] \bar "" \break
	
	%%pp3
	a g \bar "|" a a \[ f \flexa e\] f \[ g \flexa f \] e d \bar "|" e g a \bar "" \break
        g c b a \pdoublerepeat d d g, a c b a \bar "|" a bes \bar "" \break
        \morespace \[ a \flexa g \] a f g f \bar "|" e g a d, f e d  \ptdendrepeat
}
}

%%% SATB voices

global = {
  \key d \major 
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

soprano =  \relative c' {   
  \tag #'vOneTwo { d8 e fis g fis[ e] d e \bar "|" g \stemUp a  b c  b[ a g] 
  a b \bar "|" d, e g a g[ fis e] d e \doublerepeat } \tag #'vThreeFour { b' d e 
  e d[ \noacci cis] d e \bar "|" d b d[ cis] a g[ fis] e d 
 
  %%pp2
  a' g a[ b] a g[ fis e] d e \doublerepeat } \tag #'vFiveSix { e' e d[ cis] 
  \once \override Score.SeparationItem #'padding = #4 d e[ d] cis b \bar "|" g e d e g a g \bar "|" \noBreak a[ b] c! 
  \once \override Score.SeparationItem #'padding = #4 b a g[ fis e] d e \doublerepeat } \tag #'vSevenEight { b' d \noacci cis[ b] cis d[ cis] 
 
  %%pp3
  b a \bar "|" b b g[ fis] g a[ g] fis e \bar "|" fis a b 
  a d cis b \doublerepeat } \tag #'vNineTen { e e a, b d cis b \bar "|" b c 
  b[ a] b g a g \bar "|"  fis a b e, g fis e \fdendrepeat }
}

alto = \relative c' { 
  \tag #'vOneTwo { b8 ~ b \ln d4 d8[ b] b b \bar "|"  \ln d4 ~ d8 e \ln e4. 
  fis8 g \bar "|" d b d c \ln d4{ c!8 } b b \doublerepeat } \tag #'vThreeFour { e fis e 
  g \ln a4 fis8 g \bar "|" fis g \ln a4 fis8 \ln d4 \noacci cis8 d
   
  %%pp2
  \ln d4 ~ \ln d4  ~ d8  \ln d4{c!8} b b \doublerepeat } \tag #'vFiveSix { g' g \ln fis4 ~ 
  fis8 g[ a] ~ a d, \bar "|" d c! b c! b d b \bar "|" \ln d4 c!8 
  d ~ d ~ \ln d4{ c!8} b b \doublerepeat } \tag #'vSevenEight { e fis e[ d] e \ln d4 

  %%pp3
  d8 d \bar "|" d d \ln d4 b8 c![ d] ~ d b \bar "|" d fis fis 
  fis a a fis \doublerepeat } \tag #'vNineTen { e e e fis a a fis \bar "|" g g 
  \ln fis4 fis8 e fis d \bar "|" \ln d4 ~ d8 c! \ln d4 b8 \fdendrepeat }
}

tenor = \relative c { \clef bass 
  \tag #'vOneTwo { g'8 ~ g a b ~ b[ g] fis g \bar "|" g fis g g g[ a b]
  d d \bar "|" a g g e \ln g4 ~ { g8 } g g  \doublerepeat } \tag #'vThreeFour { g a cis
  b \ln a4 b8 b \bar "|" b d d[ a] cis b[ a] a fis
  
  %%pp2
  fis g \ln fis4 ~ fis8 \ln g4 ~ { g8} g g \doublerepeat } \tag #'vFiveSix { b b \ln d4 ~ 
  d8 b[ a] ~ a g \bar "|" b g ~ g g ~ g fis g \bar "|" fis[ g] g ~ 
  g fis \ln g4 ~ { g8} g g \doublerepeat } \tag #'vSevenEight { g a a[ fis] g \ln a4 
	
  %%pp3
  g8 fis \bar "|" g fis \ln g4 ~ g8 e[ d] fis g \bar "|" a d d 
  d d e d \doublerepeat } \tag #'vNineTen { cis cis e d d e d \bar "|" d e 
  \ln d4 d8 b d b \bar "|" a fis g g b b g \fdendrepeat }
}

bass = \relative c { \clef bass 
  \tag #'vOneTwo { g'8 e d g, \ln b4 ~ b8 e \bar "|" b d g c, \ln e4.	
  d8 g \bar "|" fis e b a \ln b4{ c!8 } g e \doublerepeat } \tag #'vThreeFour { e' d a'
  e \lnb fis4 b,8 e \bar "|" b' g \ln a4 fis8 g[ d] a d
  
  %%pp2
  d b d[ b] d \lnb b4 { c!8} g' e \doublerepeat } \tag #'vFiveSix { e e \tiepush \lnb b'4 ~ 
  b8 e,[ fis] ~ fis g \bar "|" g c,! g c! e d g, \bar "|" d'[ g] e 
  g d \lnb b4 { c!8} g e \doublerepeat } \tag #'vSevenEight { e' d a[ b] e \lnb fis4 

  %%pp3
  g8 d \bar "|" g, \tiepush b ~ \lnb b4 e8 a,[ b] ~ b e \bar "|" d d b 
  d fis a b \doublerepeat } \tag #'vNineTen { a a cis b fis a b \bar "|" g c,! 
  \lnb d4 b8 e d g \bar "|" d d g, c! g b e \fdendrepeat }
}
  
wordsA = \lyricmode {
  \override LyricText #'font-size = #-1.	
  "1  Come," thou ho -- ly Par -- a -- clete, And from thy ce --  "les    " --  
  \once \override LyricText #'self-alignment-X = #0.8  "-    tial" seat Send thy light and bril --   lian -- cy: "3  Come," of com -- 
  \once \override LyricText #'self-alignment-X = #0.8 "-    for" -- ters  the best, Of the soul  the sweet --   est guest, 
  
  Come in toil  re -- "fresh " --   ing -- ly; \once \override LyricText #'self-alignment-X = #0.8 "5     O" thou Light,  
  most pure  and blest, Shine with -- in the in -- most breast Of  thy 
  faith -- ful "com    " --   pa -- ny. "7  What" is soil --  ed, make  
  
  thou pure; What is wound --  ed work  its cure; What is parch -- 
  \once \override LyricText #'self-alignment-X = #0.8 "-     ed," fruc -- ti -- fy; "9  Fill" thy faith -- ful, who con -- fide In thy
  \once \override LyricText #'self-alignment-X = #0.8 power  to guard and guide, With thy seven -- fold Mys -- te -- ry. 
}

wordsB = \lyricmode {
  \override LyricText #'font-size = #-1.	
  \once \override LyricText #'self-alignment-X = #0.6 
  "2    Fa" -- ther of the poor,  draw near; Gi -- ver of all gifts,   
  be here; Come, the soul's true ra --   dian -- cy; \once \override LyricText #'self-alignment-X = #0.2 "4  Thou" in la -- 
  \once \override LyricText #'self-alignment-X = #0.4 "-   bour" rest  most sweet, Thou art sha -- dow from  the heat, 
  
  Com -- fort in  ad -- "ver    " --   si -- ty. \once \override LyricText #'self-alignment-X = #0.1 "6  Where" thou art  
  not, man  hath nought; Ev -- ery ho -- ly deed and thought Comes  
  from thy "    Di    " -- "  vi     " --   ni -- ty. "8  What" is ri --  gid, gent --  
  
  \once \override LyricText #'self-alignment-X = #0.8 "-     ly" bend; What is fro --   zen, warm --  ly tend; Strength -- en what 
  goes err -- ing -- ly. "10.  Here" thy grace and vir -- tue send; Grant \set associatedVoice = "altos" sal -- 
  \once \override LyricText #'self-alignment-X = #0.0 "-     va         " --  \set associatedVoice = "sopranos" "    tion" in the end, And in heaven fe -- li -- ci -- ty. 		
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
   \new Lyrics \lyricsto sopranos {\set alignAboveContext = #"upper"  \override LyricSpace #'minimum-distance = #1.8 \wordsA }
 
   \new Lyrics \lyricsto sopranos {\set alignAboveContext = #"upper" \wordsB }
 
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
      \context Voice = sopranos {\voiceOne \global \keepWithTag #'vOneTwo \soprano      \keepWithTag #'vOneTwo \soprano
	                                           \keepWithTag #'vThreeFour \soprano  \keepWithTag #'vThreeFour \soprano
						   \keepWithTag #'vFiveSix \soprano    \keepWithTag #'vFiveSix \soprano
                                                   \keepWithTag #'vSevenEight \soprano \keepWithTag #'vSevenEight \soprano 
                                                   \keepWithTag #'vNineTen \soprano    \keepWithTag #'vNineTen \soprano
      }
      
      \context Voice = altos {\voiceTwo \global    \keepWithTag #'vOneTwo \alto      \keepWithTag #'vOneTwo \alto
	                                           \keepWithTag #'vThreeFour \alto  \keepWithTag #'vThreeFour \alto
						   \keepWithTag #'vFiveSix \alto    \keepWithTag #'vFiveSix \alto
                                                   \keepWithTag #'vSevenEight \alto \keepWithTag #'vSevenEight \alto 
                                                   \keepWithTag #'vNineTen \alto    \keepWithTag #'vNineTen \alto
      }
                      >> 
     \new Staff = "lower" <<
      \context Voice = tenors {\voiceOne \global   \keepWithTag #'vOneTwo \tenor      \keepWithTag #'vOneTwo \tenor
	                                           \keepWithTag #'vThreeFour \tenor  \keepWithTag #'vThreeFour \tenor
						   \keepWithTag #'vFiveSix \tenor    \keepWithTag #'vFiveSix \tenor
                                                   \keepWithTag #'vSevenEight \tenor \keepWithTag #'vSevenEight \tenor 
                                                   \keepWithTag #'vNineTen \tenor    \keepWithTag #'vNineTen \tenor
      }
      \context Voice = bass {\voiceTwo \global     \keepWithTag #'vOneTwo \bass      \keepWithTag #'vOneTwo \bass
	                                           \keepWithTag #'vThreeFour \bass  \keepWithTag #'vThreeFour \bass
						   \keepWithTag #'vFiveSix \bass    \keepWithTag #'vFiveSix \bass
                                                   \keepWithTag #'vSevenEight \bass \keepWithTag #'vSevenEight \bass 
                                                   \keepWithTag #'vNineTen \bass    \keepWithTag #'vNineTen \bass
      }
	             >> 
		 >>  

\midi { 
  \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) }
       } 
}

} % end book
