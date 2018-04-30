%%%% 158.png
%%%% Hymn 92. Third Mode Melody When rising from the bed of death
%%%% Rev 3.

\version "2.10"

\header {

  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - LENT"

        \hspace #0.1 }} 

  title = "92"

  meter = \markup { \small {\column {  \line { \sans {"THIRD MODE MELODY."} \hspace #1 \roman {"(D. C. M.)" }}
                                       \line { \italic {Slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 84 "(" \fontsize #-2 \general-align #Y #DOWN \note #"1" #1 = 42 ")." }
                                  }
                  }}
 
  arranger =  \markup { \small {\center-align {
                            \line { \smallCaps "T. Tallis," \italic "c." "1515-85" }
                            \line { "(" \hspace #-1 \italic "rhythm slightly simplified" \hspace #-1 ")." }
                } } }

  tagline =""

}

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% prints a repeat sign glyph comprising 4 dots. Used only to begin a repeat at the start of a piece where \bar ":" does not work      

fdstartrepeat =  {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
                  \once \override Staff.BarLine #'text = \markup  { \line { \hspace #0 \override #'(baseline-skip . 1.0) 
                                                                    \raise #1.4 \column { \with-color #black { 
                                                                    \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
                  } }   
                 \bar "|:"}
                 

%%% prints a repeat sign glyph comprising 4 dots and two thin bars

fdendrepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
                \once \override Staff.BarLine #'text = \markup  {  \line { \raise #1.4 \override #'(baseline-skip . 1.0)  \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
                                                                   \hspace #-1 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
                                                                   \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
        } }     
        \bar "||"} 

%%% generates the breathmarks

breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
        \override Score.RehearsalMark #'Y-offset = #'4.0
        \override Score.RehearsalMark #'X-offset = #'-0.5
        \mark \markup {\fontsize #4 ","}
}

%%% a quick macro to shorten a stem

shortenStem = \once \override Stem #'length = #4.5

%%%  Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work            
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-3.0
              \once \override Stem #'X-offset = #-3.0 }

%%% Push notecolumn a little to the right

push = { \once \override NoteColumn #'force-hshift = #0.4 }

partmeasure =  \set Score.measurePosition = #(ly:make-moment 5 2)


%%%%%%%%%%%%%%%%%%%%%%%%% end of macro definitions

%%% SATB voices

global = {
  \time 6/2
  \key a \minor
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { \once \override Staff.TimeSignature #'stencil = ##f
  \partial 2*3 e2 g g | g1. g2 a a | b1. \bar "||" \partmeasure b2 | b1. b2 b c | b1. \bar "||" \break
  e,2 b' b | b1. g2 a a | b1. \bar "||" \partmeasure b2 | b1. b2 c a | b1. \bar "||" \break
  \partmeasure b2 | b2.( c4) d2 \bar "dashed" e1 d2 | c2 c b1. \bar "||" g2 | a1. e2 f f | e1. \breathmark \bar "||" \break
  \partmeasure a2 | c2.( b4) a2 \bar "dashed" g1 e2 | a2.( g4) f2 \bar "dashed" e1 \breathmark \bar "||" \partmeasure g2 | \time 4/2 f2
       ^\markup { \italic "Slightly slower."}
       d e e | e1. \bar "||"
  
} 
  

alto = \relative c' { 
  e2 e e | e1. e2 c d | b1. \bar "||" e2 | e1. dis2 e e | e1. \bar "||"
  e2 e e | e1. e2 e d | b1. \bar "||" e2 | e1. e2 e c | e1. \bar "||"
  e2 | e( g) f \bar "dashed" e1 g2 | e2 e e1. \bar "||" e2 | e1. e2 e d | c1. \bar "||"
  c2 | c1 c2 \bar "dashed" c1 c2 | c1 c2 \bar "dashed" c1 \bar "||" c2 | \time 4/2 c2 d c c | b1. \bar "||"
}

tenor = \relative c { \once \override Staff.TimeSignature #'stencil = ##f \clef bass
  g'2 b b | b1. b2 a a | gis1. \bar "||" gis!2 | gis1. fis2 gis a | gis1. \bar "||"
  g!2 g g | g1. b2 a a | gis1. \bar "||" gis!2 | gis1. gis2 a a | gis1. \bar "||"
  g!2 | g2.( a4) b2 \bar "dashed" c1 b2 | a a g1. \bar "||" b2 | c1. a2 a a | a1. \bar "||"
  e2 | a2.( g4) f2 \bar "dashed" e1 g2 | c2.( b4) a2 \bar "dashed" g1 \bar "||" e2 | \time 4/2 a2 a a e4( fis4) | gis1. \bar "||"
}

bass = \relative c { 
  e2 e e | e1. g2 f f | e1. \bar "||" e2 | e1. b2 e a, | e'1. \bar "||"
  e2 e e | e1. g2 f f | e1. \bar "||" e2 | e1. e2 a, a | e'1. \bar "||"
  e2 | e1 d2 \bar "dashed" c1 g2 | a a e'1. \bar "||" e2 | a,1. c2 d d | a1. \bar "||"
  a2 | a1 a2 \bar "dashed" c1 c2 | a2 f1 \bar "dashed" c'1 \bar "||" c2 | \time 4/2 f,2 f a a | e'1. \bar "||"
}

#(ly:set-option 'point-and-click #f)


\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##t
}

\book {

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
%        \context { \Staff \remove "Time_signature_engraver" }
        \context { \Score \remove "Mark_engraver"  }
        \context { \Staff \consists "Mark_engraver"  }
        } %% close layout

\midi { 
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 84 2) }
       }	
		
} %%% end score bracket


%%% Lyric attribution

\markup { \small { \hspace #74 \italic "J. Addison, 1672-1719." } }

%%% Main lyrics markup block
  
\markup { \hspace #32 %%add space as necc. to center the column
                      \column { %%% verse 1 is a column of 2 lines  
                          \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "W" }   %%Drop Cap goes here
                                  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
                                  \column  { \raise #0.0 "HEN rising from the bed of death,"  
                                                         "  O'erwhelmed with guilt and fear," } }          
                          \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
                                   \lower  #1.56  %%adjust this until the line spacing looks right
                                   \column {   
					   "I see my Maker face to face,"
					   "    O how shall I appear?"
                                        }}
                               
                                   } %% finish verse 1    
}         



%%%fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
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

        
%%% second page
%%% Continuation of lyrics

\markup { \hspace #32   %%add space as necc. to center the column
          \column { 
                \hspace #1 
                \line { "2  "
                           \column {         
				   "If yet, while pardon may be found,"
				   "    And mercy may be sought,"
				   "My heart with inward horror shrinks,"
				   "    And trembles at the thought;"
                        }}
                  \hspace #1 
                  \line { "3  "
                    \column {        
			    "When thou, O Lord, shalt stand disclosed"
			    "    In majesty severe,"
			    "And sit in judgement on my soul,"
			    "    O how shall I appear?"
                        }}
                \hspace #1 % adds vertical spacing between verses  
                \line {"4  "
                    \column {        
			    "But thou hast told the troubled mind"
			    "    Who does her sins lament,"
			    "The timely tribute of her tears"
			    "    Shall endless woe prevent."
                        }} 
		\hspace #1 % adds vertical spacing between verses  
                \line {"5  "
                    \column {        
			    "Then see the sorrow of my heart,"
			    "    Ere yet it be too late;"
			    "And hear my Saviour's dying groans,"
			    "    To give those sorrows weight."
                        }} 
                \hspace #1 % adds vertical spacing between verses  
                \line {"6. "
                    \column {        
			    "For never shall my soul despair"
			    "    Her pardon to procure,"
			    "Who knows thine only Son has died"
			    "    To make her pardon sure."
                }}
          }
} %%% lyric markup bracket


%% Amen score block

\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
                              << 
        \context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne e1 e  \bar "||" }}
        \context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo c1 b \bar "||" }}
                              >>

	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }

        \context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
                               << 
        \context Voice = "tenors" { \relative c { \clef bass \global \voiceThree a'1 gis \bar "||" }}
        \context Voice = "basses" { \relative c { \clef bass \global \voiceFour  a1 e' \bar "||" }}
                                >> 
  >>                          

\header { breakbefore = ##f piece = " " opus = " " }

\layout { 

   \context { 
        \Score timing = ##f }
        ragged-right = ##t
        indent = 15\cm
   \context { \Staff \remove Time_signature_engraver }

       } %% close layout

%%%%%%%%%%%%%% Amen Midi

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 84 2) }} 
}

} %%% book bracket
