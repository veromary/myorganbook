%%% 275.png
%%% Hymn 172 Sion's Daughters!
%%% Version 1

\version "2.10"

\include "gregorian-init.ly"

\header {
	title = "172"
	subtitle = "Jerusalem et Sion filiae."
	
	meter = \markup { \small \italic {"Sequence."} }
	
	composer = \markup { \center-align { 
		\line { \small \italic "Ascr. to Adam of St. Victor, c, 1170."}
		\line { \small \italic "Tr. G. G." } 
	}}
	
	arranger = \markup { \small "Mode v." }
	
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

%%% macro settings for stemless long note which is 2x duration of regular white note    
%%% this one sets a larger offset to avoid collision

lnc = {\once \override NoteHead #'duration-log = #0 
           \once \override Stem #'stencil = ##f
           \once \override NoteColumn #'force-hshift = #'1.6 }	   

%%% macro settings for  black notes 1/2 the duration of regular stemmed white notes    

crochet = { \once \override NoteHead #'duration-log = #2  }

%%% setting to hide accidental. As timing is turned off, accidentals have to be set manually

noacci = \once \override Staff.Accidental #'transparent = ##t

%%% prints four dots in a column, This will be used by other macros to create repeat signs.                   
 
fdots = \markup { \override #'(baseline-skip . 1.0) 
        \column { \with-color #black { \fontsize #0 . \fontsize #0 . \fontsize #0 . \fontsize #0 .} }}           
            
%%% positions 4 dots at beginning of a line of score mimicking a begin repeat sign
%%% uses fdots macro, above
%%% The dots are placed as \mark objects rather than a normal bar glyph because Lilypond will not easily print a bar
%%% glyph at the beginning of a line without upsetting the bar at the end of the previous line
%%% Place \beginfdots before the first note of line you want it to begin.
 
beginfdots = {    
                   \once \override Staff.RehearsalMark #'Y-offset = #'1.4
                   \once \override Staff.RehearsalMark #'X-offset = #'7.0
                   \mark \fdots
                   \once \override Score.SeparationItem #'padding = #2
}           
 			
%%% prints a repeat sign glyph comprising 4 dots. Used only to begin a repeat at the start of a piece where you might normally put \bar "|:"	

fdstartrepeat =  {\once \override Staff.BarLine #'stencil = #ly:text-interface::print
					\once \override Staff.BarLine #'text = \markup  { \line { \hspace #0 \override #'(baseline-skip . 1.0)
							\raise #1.4 \column { \with-color #black { \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
					} }	
					\bar "|:"
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

%%% Prints a repeat sign glyph comprising 4 dots then two thin bars. This is used to end a repeat. 
%%% This macro works by replacing the glyph used by the \bar "||" function. 
%%% This special glyph is wider to correspond to the plainsong equivalent which includes a custos
 
fdendrepeatcustos = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
            \once \override Staff.BarLine #'text = \markup  {  \line { \hspace #1.8 \raise #1.4 \override #'(baseline-skip . 1.0)  
                                                                           \column { \with-color #black {  
                                                                                                             \fontsize #2 . 
                                                                                                             \fontsize #2 . 
                                                                                                             \fontsize #2 . 
                                                                                                             \fontsize #2 .} }
                                                              \hspace #-1 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
                                                                                      \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
            
            } }         
        \bar "||"} 	
	
%%% Half-height bar.  Prints a bar glyph which spans only the middle two staff lines.  
%%% This macro works by replacing the glyph used by the \bar "|" function.

halfbar = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
            \once \override Staff.BarLine #'text = \markup  {   \hspace #-0.6 \filled-box #'(0 . 0.15) #'(-1.0 . 1.0) #0  
                                                                                                                    
            }         
        \bar "|"}  	

		
%%%%%%   
%%%%%% Equivalent macros for plainsong    
%%%%%%
           

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
                   \once \override Staff.RehearsalMark #'X-offset = #'7.0
                   \mark \tdots
                   \once \override Score.SeparationItem #'padding = #2
}           
 
%%% prints a repeat sign glyph comprising 3 dots. Used  to begin a repeat at the start of a piece on a plainsong staff 

ptdstartrepeat =  {\once \override Staff.BarLine #'stencil = #ly:text-interface::print
					\once \override Staff.BarLine #'text = \markup  {  \line { \hspace #0.0 \raise #1.4 \override #'(baseline-skip . 1.6)  \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . } }
					} }	
					\bar "|:"
}	

%%% Prints a repeat sign glyph comprising 3 dots and two thin bars. Used to end a repeat on a plainsong staff.
%%% This macro works by replacing the glyph used by the \bar "||" function. 
 
ptdendrepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
            \once \override Staff.BarLine #'text = \markup  {  \line { \raise #1.4 \override #'(baseline-skip . 1.6)  \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . } }
                                                              \hspace #-1 \filled-box #'(0 . 0.15) #'(-2.4 . 2.4) #0
                                                              \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2.4 . 2.4) #0
            } }         
        \bar "||"}      
  
%%% Prints a repeat sign glyph comprising 3 dots and two thin bars. Used to end a repeat on a plainsong staff.
%%% This macro works by replacing the glyph used by the \bar "||" function. 
%%% This special glyph includes a custos on the top staff line.
 
ptdendrepeatcustos = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
            \once \override Staff.BarLine #'text = \markup  {  \line { \raise #1.4 \override #'(baseline-skip . 1.6)  \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . } }
		    \hspace #0.1 \raise #2.4 { \tiny \musicglyph #"scripts.prall" \hspace #-1.5 \fontsize #2 . }}                          
		    \hspace #-1 \filled-box #'(0 . 0.15) #'(-2.4 . 2.4) #0
                                                              \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2.4 . 2.4) #0
             }         
        \bar "||"}   	

%%% Prints a repeat sign glyph comprising 3 dots and two thin bars. Used to end a repeat on a plainsong staff.
%%% This macro works by replacing the glyph used by the \bar "||" function. 
%%% This special glyph includes a custos on the bottom staff line.
 
ptdendrepeatcustoslow = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
            \once \override Staff.BarLine #'text = \markup  {  \line { \raise #1.4 \override #'(baseline-skip . 1.6)  \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . } }
		    \hspace #0.1 \lower #2.4 { \tiny \musicglyph #"scripts.prall" \hspace #-1.5 \fontsize #2 . }}                          
		    \hspace #-1 \filled-box #'(0 . 0.15) #'(-2.4 . 2.4) #0
                                                              \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2.4 . 2.4) #0
             }         
        \bar "||"}	
	
%%% Plainsong half-bar.  Prints a bar glyph on a plainsong staff slightly shorter than a full height bar.
%%% Corresponds to a half-height bar on a normal SATB staff
%%% This macro works by replacing the glyph used by the \bar "|" function.	
	
phalfbar = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
            \once \override Staff.BarLine #'text = \markup  {  \hspace #-0.6 \filled-box #'(0 . 0.15) #'(-1.8 . 1.8 ) #0
            }          
        \bar "||"} 

%%%%%%%%%%%%%%%%%%% End of Macro Definitions


%%% plainsong voice

plainsong =  {  \relative c { 
	\clef "vaticana-do3"
	\set fontSize = #3
	   \set Staff.explicitClefVisibility = #end-of-line-invisible

  \ptdstartrepeat c8 f g f \phalfbar bes a f g f f \bar "|" a c \bar "" \break
  \once \override Score.SeparationItem #'padding = #4
     a f \phalfbar bes a g \[ f \flexa e \] d \[ d \flexa c \] \bar "|" f g \bar "" \break

%% pp 2     
     
  a f \phalfbar bes a g a bes c \bar "|" a f g f \ptdendrepeatcustos \break
  
  %%% change clef
  \once \override VaticanaStaff.Clef #'non-default = ##t 
  \clef "vaticana-do2"
  \pbegintdots c' d e f \phalfbar e d c d c c \bar "|" f e \bar "" \break

%% pp 3  
  
  \[ d \pes f \] c \phalfbar d c a bes a g \bar "|" a c c \bar "" \break
  f, \phalfbar g a bes a \[ g \flexa f \] e \bar "|" f g g f \ptdendrepeatcustoslow \break

%% pp 4

  %%% change clef
  \clef "vaticana-do3"
  \pbegintdots f e d c \phalfbar d e f e f f \bar "|" f a \bar "" \break 
  bes c \phalfbar c d c bes! c c \bar "|" f, d g g \phalfbar \break
  f g a g f e \bar "|" f bes! \[ a \flexa g \] f \ptdendrepeat 
}
}

%%% SATB voices

global = {
  \key f \major 
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

soprano =  \relative c' { 
	
  \tag #'v1256 { \fdstartrepeat c8 f g f \halfbar bes a f g f f \bar "|" a c \bar "" \break
  a f \halfbar bes a g f[ e] d d[ c] \bar "|" f g \bar "" \break

  a f \halfbar  bes a g a bes c \bar "|" a f g f \fdendrepeatcustos }
  \tag #'v3478 { \beginfdots c' d e f \halfbar e d c d c c \bar "|" f e \bar "" \break

  d8[ f] c \halfbar d c a bes a g \bar "|" a c c \bar "" \break
  f, \halfbar g a bes a g[ f] e \bar "|" f g g f \fdendrepeatcustos }

  \tag #'v9 { \beginfdots f8 e d c \halfbar d e f e f f \bar "|" f a \bar "" \break
  bes c \halfbar c d c bes c c \bar "|" f, d g g \halfbar \break
  f8 g a g f e \bar "|" f bes a[ g] f \fdendrepeat }
}

alto = \relative c' { 
	
  \tag #'v1256 { a8 \ln c4 ~ c8 \halfbar \ln f4 ~ f8 e c c \bar "|" f g \bar "" \break
  f f \halfbar \ln d4. \ln d4 a8 bes[ g] \bar "|" c bes \bar "" \break

  a c \halfbar \ln d4 \crochet c16( d) \ln f4 e8 \bar "|" c f \crochet f16( e) c8 \fdendrepeatcustos }
  \tag #'v3478 { \ln f4 g8 a8 \halfbar \ln g4. ~ g8 e e \bar "|" \ln a4 \bar "" \break

  \ln f4. \halfbar f8 g f \ln f4 d8 \bar "|" \ln f4 e8 \bar "" \break
  c8 \halfbar \ln c4 bes8 \ln c4. ~ c8 \bar "|" a8 bes c a \fdendrepeatcustos }

  \tag #'v9 { \ln a4 ~ \ln a4 \halfbar a8 \ln c4 ~ \ln c4 ~ c8 \bar "|" c8 f \bar "" \break
  f e \halfbar f f e f e e \bar "|" \ln a,4 bes8 c \halfbar
  \ln c4. \ln d4 c8 \bar "|" a8 d \ln c4 a8 \fdendrepeat }
}

tenor = \relative c { \clef bass 
	
  \tag #'v1256 { \fdstartrepeat f8 a g a \halfbar d c c c a a \bar "|" c c ~ \bar "" \break
  c c \halfbar d c bes a[ g] f f[ e] \bar "|" f e \bar "" \break

  \ln f4 \halfbar d'8 c bes a f g \bar "|" f a c a \fdendrepeatcustos }
  \tag #'v3478 { \ln a4 \ln c4 \halfbar \ln c4. b!8 c c \bar "|" d c \bar "" \break

  \ln d4 a8 \halfbar a c ~ c d c bes \bar "|" f g g \bar "" \break
  a \halfbar \ln g4 f8 f g[ a] g \bar "|" f d e f \fdendrepeatcustos }

  \tag #'v9 { \beginfdots \ln a4 \lnc f4 ~ \halfbar f8 g a g a a \bar "|" a c \bar "" \break
  bes8 g \halfbar a bes g f g g \bar "|" \ln f4 d8 e \halfbar 
  \ln f4 e8 bes' a g \bar "|" \ln f4 ~ f8[ e] f \fdendrepeat }
}

bass = \relative c { \clef bass 
	
  \tag #'v1256 { f,8 f' e f \halfbar bes, f' a, c f, f \bar "|" f' e \bar "" \break
  f a \halfbar \ln g4. \ln d4 ~ d8 bes[ c] \bar "|" a g \bar "" \break

  f8 a \halfbar \ln g4 g'8 f d c \bar "|" f f c g \fdendrepeatcustos }
  \tag #'v3478 { \beginfdots f'8 d c f \halfbar c d e g c, c \bar "|" d' a \bar "" \break

  \noacci \lnb bes4 a8 \halfbar d,8 e f d f g \bar "|" f \ln c4 \bar "" \break
  f8 \halfbar \lnb e4 d8 \ln f4. c8 \bar "|" d g, c f, \fdendrepeatcustos }

  \tag #'v9 { \lnb f4 f'8 e \halfbar d c a c f, f \bar "|" f' f \bar "" \break
  d c \halfbar f bes, c d c c \bar "|" \lnb d4 g,8 c \halfbar
  \lnb a4. \ln bes4 c8 \bar "|" d g, a[ c] f, \fdendrepeat }
}
  

wordsA = \lyricmode {
  \override LyricText #'font-size = #-1.
  \once \override LyricText #'self-alignment-X = #1
  "1  Si" -- on's daugh -- ters! Sons  of  Je -- ru -- sa -- lem! All ye
  hosts of hea -- ven -- ly chi -- val -- ry! Lift your

  voi -- ces, sing -- ing  right  mer -- ri -- ly  Al -- le -- lu -- ya!
  \once \override LyricText #'self-alignment-X = #0.4
  "3   Now" the Bride re -- ceiv -- eth his be -- ni -- son, Tast -- eth

  now the joys of the Pa -- ra -- clete; Kings and queens
  with ju -- bi -- lant me -- lo -- dy Call her bless -- éd.

  "9.  Christ," whose joys we joy -- ful -- ly ce -- le -- brate, Grant us
  all  a  place with  thy  cho -- sen  ones,  True  de -- lights, in --
  "- ef" -- fa -- ble hap -- pi -- ness, Rest e -- ter -- nal. 
}

wordsB = \lyricmode {
  \override LyricText #'font-size = #-1.	
  \once \override LyricText #'self-alignment-X = #-0.2
  "2  Christ" our Sa -- viour weds on this fes -- ti -- val  Ho -- ly
  Church, the Pat -- tern of Right -- eous -- ness, Whom from

  depths of ut -- ter -- most mi -- se -- ry  He hath res -- cued.
  \once \override LyricText #'self-alignment-X = #0.8
  "4   Mo" -- ther meet for sin -- ful hu -- ma -- ni -- ty, Life's sure

  ha -- ven, rest for the sor -- row -- ful, Strong pro -- tect --
  "- ress," born in a mys -- te -- ry Ev -- er won -- drous. 		
}	
 
wordsC = \lyricmode {
  \override LyricText #'font-size = #-1.	
  \once \override LyricText #'self-alignment-X = #0.3
  "5  Not" more fair the moon in her love -- li -- ness! Not more
  bright the sun in his ma -- jes -- ty! Like an

  ar -- my  splen -- did and ter -- ri -- ble, Ranged for bat -- tle --
  \once \override LyricText #'self-alignment-X = #0.65
  "7* So," fore -- told by fi -- gures and pro -- phe -- cies, Clothed in

  nup -- tial ves -- ture of cha -- ri -- ty, Joined with Christ,
  o'er hea -- ven's glad ci -- ti -- zens Now she reign -- eth. 		
}

wordsD = \lyricmode {
  \override LyricText #'font-size = #-1.	
  \once \override LyricText #'self-alignment-X = #0.7 
  "6  So" the Church shines forth on her pil -- grim -- age, Signed with
  Jor -- dan's wa -- ters of pe -- ni -- tence, Drawn to 

  hear the wis -- dom of So -- lo -- mon, From the world's end.
  \once \override LyricText #'self-alignment-X = #0.4
  "8* Wel" -- come! feast of light and fe -- li -- ci -- ty, Bride to 

  Bride -- groom join -- ing in u -- ni -- ty; in her mys -- 
  "- tic" mar -- riage is ty -- pi -- fied Our sal -- va -- tion. 	
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
   \new Lyrics \lyricsto sopranos {\set alignAboveContext = #"upper" \wordsC }
   \new Lyrics \lyricsto sopranos {\set alignAboveContext = #"upper" \wordsD }
 
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


%%% Separate score blocks provided to generate three midis: tune for verses 1, 2, 5 & 6, tune for verses 3, 4, 7 & 8, and tune for verse 9.  
%%% Since minims are quavers in disguise, tempo has to be set accordingly, tempo set to 2=80

%%% Verse 1, 2, 5 & 6

\score {	
  \new ChoirStaff <<
   \new Staff = "upper" <<
      \context Voice = sopranos {\voiceOne \global \keepWithTag #'v1256 \soprano }
      \context Voice = altos {\voiceTwo \global    \keepWithTag #'v1256 \alto    }
                      >> 
     \new Staff = "lower" <<
     \context Voice = tenors {\voiceOne \global   \keepWithTag #'v1256 \tenor    }
     \context Voice = bass {\voiceTwo \global     \keepWithTag #'v1256 \bass     }
                          >> 
		 >>  

\midi { 
  \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) }
       } 
}

%%% Verse 3, 4, 7, 8

\score {	
  \new ChoirStaff <<
   \new Staff = "upper" <<
      \context Voice = sopranos {\voiceOne \global \keepWithTag #'v3478 \soprano }
      \context Voice = altos {\voiceTwo \global    \keepWithTag #'v3478 \alto    }
                      >> 
     \new Staff = "lower" <<
     \context Voice = tenors {\voiceOne \global   \keepWithTag #'v3478 \tenor    }
     \context Voice = bass {\voiceTwo \global     \keepWithTag #'v3478 \bass     }
                          >> 
		 >>  

\midi { 
  \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) }
       } 
}

%%% Verse 9

\score {	
  \new ChoirStaff <<
   \new Staff = "upper" <<
      \context Voice = sopranos {\voiceOne \global \keepWithTag #'v9 \soprano }
      \context Voice = altos {\voiceTwo \global    \keepWithTag #'v9 \alto    }
                      >> 
     \new Staff = "lower" <<
     \context Voice = tenors {\voiceOne \global   \keepWithTag #'v9 \tenor    }
     \context Voice = bass {\voiceTwo \global     \keepWithTag #'v9 \bass     }
                          >> 
		 >>  

\midi { 
  \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) }
       } 
}

%%% markup about half-bars

\markup { \hspace #22 "N. B" \hspace #-1.2 ".—" \italic "With regard to the half-bars in this tune, see" "Preface." } 

%%% markup about suitable hymns for Patronal Festivals

\markup { \hspace #6 \column { 
	\line { \hspace #4 \italic "The above hymns are suitable for a Dedication Festival only.  For a Patronal Festival," }
	\line { \italic "see Nos." "195-204" \italic "and the Proper Saints' Day Hymns." }
}}

} % end book
