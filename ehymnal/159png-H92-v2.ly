%%% 159.png
%%% Hymn 92 THIRD MODE MELODY.  "When rising from the bed of death"
%%% Version 2

\version "2.10"

\include "gregorian-init.ly"

\header {
   dedication = \markup { \center-align { "THE CHRISTIAN YEAR - LENT" \hspace #0.1 } }	
   title = "92"
   subtitle = \markup { \small { \hspace #7 \smallCaps "Alternative Version" \normal-text "(melody in the tenor)" } }
   meter = \markup { \small {\column {  \line { \sans {"THIRD MODE MELODY."} \hspace #1 \roman {"(D. C. M.)" }}
                                        \line { \raise #2 { \italic {Slow} \normal-text \general-align #Y #DOWN \note #"2" #0.6 = 84 
                                                   "(" \fontsize #-2 \general-align #Y #DOWN \note #"1" #1 = 42 ")." } }
                   }        }        }
   arranger = \markup { \small { \center-align { \line { \italic "Tallis' Original Version" }
                                                 \line { \raise #1 { "(" \hspace #-1 \italic "rhythm slightly simplified" \hspace #-1 ")." } } } } }
   tagline =""
}



%%%%%%%%%%     Macro Definitions     %%%%%%%%%%


global = {
   \key a \minor
   \time 6/2
   \autoBeamOff
   \set Staff.midiInstrument = "church organ"
}

partmeasure =  \set Score.measurePosition = #(ly:make-moment 5 2)



%%%%%%%%%%     Music     %%%%%%%%%%


soprano = \relative c' {

   \once \override Staff.TimeSignature #'stencil = ##f \partial 2*3 e2 e2 e2 \bar "|" e1. e2 a2 a2 \bar "|" gis1. \bar "||" 
      \partmeasure gis!2 \bar "|" gis1. fis2 gis2 a2 \bar "|" gis1. \bar "||" \break

   g2 g2 g2 \bar "|" g1. b2 a2 a2 \bar "|" gis1. \bar "||" \partmeasure gis!2 \bar "|" gis1. gis2 a2 a2 \bar "|" gis1. \bar "||" \break

   \partmeasure g2 \bar "|" \once \override NoteColumn #'force-hshift = #-0.3 g2.( a4) b2 \bar "dashed" c1 b2 \bar "|" a2 a2 g1. \bar "||" g2 \bar "|" f1. e2 e2 d2 \bar "|" e1. 
      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
      \override Score.RehearsalMark #'Y-offset = #'-0.5
      \override Score.RehearsalMark #'X-offset = #'-1.0
      \mark \markup {\fontsize #4 ","} \bar "||" \break

   \partmeasure e2 \bar "|" \once \override NoteColumn #'force-hshift = #-0.3 a2.( g4) f2 \bar "dashed" e1 g2 \bar "|" c2.( b4) a2 \bar "dashed" g1 
      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
      \override Score.RehearsalMark #'Y-offset = #'-2.0
      \override Score.RehearsalMark #'X-offset = #'-0.5
      \mark \markup {\fontsize #4 ","} \bar "||" \partmeasure e2 \bar "|" \override Staff.TimeSignature #'transparent = ##f 
      \time 4/2 a2^\markup { \italic "Slightly slower." } a2 a2 e4( fis) \bar "|" gis1. \bar "||"
} 
  

alto = \relative c' { 

   b2 b2 b2 \bar "|" b1. b2 c2 d2 \bar "|" e1. \bar "||" e2 \bar "|" e1. dis2 e2 e2 \bar "|" e1. \bar "||"

   e2 e2 e2 \bar "|" e1. e2 e2 d2 \bar "|" e1. \bar "||" e2 \bar "|" e1. e2 e2 e2 \bar "|" e1. \bar "||"

   e2 \bar "|" e1 f2 \bar "dashed" g1 g2 \bar "|" e2 e2 e1. \bar "||" e2 \bar "|" c1. c2 a2 a2 \bar "|" a1. \bar "||"

   c2 \bar "|" e1 c2 \bar "dashed" c1 c2 \bar "|" c1 c2 \bar "dashed" c1 \bar "||" c2 \bar "|" \time 4/2 a2 d2 c2 c2 \bar "|" b1. \bar "||"
}

tenor = \relative c { 

   \once \override Staff.TimeSignature #'stencil = ##f \clef bass e2 g2 g2 \bar "|" g1. g2 a2 a2 \bar "|" b1. \bar "||" 
      b2 \bar "|" b1. b2 b2 c2 \bar "|" b1. \bar "||"

   e,2 b'2 b2 \bar "|" b1. g2 a2 a2 \bar "|" b1. \bar "||" b2 \bar "|" b1. b2 c2 a2 \bar "|" b1. \bar "||"

   b2 \bar "|" \once \override NoteColumn #'force-hshift = #-0.3 b2.( c4) d2 \bar "dashed" e1 d2 \bar "|" c2 c2 b1. \bar "||" g2 \bar "|" a1. e2 f2 f2 \bar "|" e1. \bar "||"

   a2 \bar "|" \once \override NoteColumn #'force-hshift = #-0.3 c2.( b4) a2 \bar "dashed" g1 e2 \bar "|" a2.( g4) f2 \bar "dashed" e1 \bar "||" g2 \bar "|" 
      \override Staff.TimeSignature #'transparent = ##f \time 4/2 f2 d2 e2 e2 \bar "|" 
      \once \override Dots #'transparent = ##t e1. \bar "||"
}

bass = \relative c { 

   e2 e2 e2 \bar "|" e1. g2 f2 f2 \bar "|" e1. \bar "||" e2 \bar "|" e1. b2 e2 a,2 \bar "|" e'1. \bar "||"

   e2 e2 e2 \bar "|" e1. g2 f2 f2 \bar "|" e1. \bar "||" e2 \bar "|" e1. e2 a,2 a2 \bar "|" e'1. \bar "||"

   e2 \bar "|" e1 d2 \bar "dashed" c1 g2 \bar "|" a2 a2 e'1. \bar "||" e2 \bar "|" a,1. c2 d2 d2 \bar "|" a1. \bar "||"

   a2 \bar "|" a1 a2 \bar "dashed" c1 c2 \bar "|" a2 f1 \bar "dashed" c'1 \bar "||" c2 \bar "|" \time 4/2 f,2 f2 a2 a2 \bar "|" 
      << { \voiceTwo \once \override NoteColumn #'force-hshift = #-0.01 e'1. } 
         \new Voice = "pedals" { \voiceFour \set fontSize = #-3 e,1. } >> \bar "||"
}



%%%%%%%%%%     Score block     %%%%%%%%%%


#(ly:set-option 'point-and-click #f)

\book {

\paper {
   #(set-paper-size "a4")
   between-system-padding = #0.0
   print-page-number = ##f
   % *** forces Lilypond to space out systems to fill the entire page
   ragged-bottom=##t
   ragged-last-bottom=##t
}

\score { <<

\new ChoirStaff <<
   \new Staff = "upper" << \context Voice = sopranos { \voiceOne \global \soprano }
                           \context Voice = altos    { \voiceTwo \global \alto } >> 
   \new Staff = "lower" << \context Voice = tenors   { \voiceOne \global \tenor }
                           \context Voice = bass     { \voiceTwo \global \bass } >>
                >>  
>>

\layout {
   ragged-right = ##f
   % *** makes sure last system spreads right across the page
   ragged-last = ##f
\context { \Score 
   \remove "Bar_number_engraver"
   % *** uncomment this to remove system start bar 
   % \override SystemStartBar #'stencil = ##f 
   \override NonMusicalPaperColumn #'page-break-permission = ##f }
\context { \Staff 
   \override TimeSignature #'transparent = ##t }
} 

\midi { 
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 84 2) } 
}

} % *** end score 



%%%%%%%%%%     Markup     %%%%%%%%%%


\markup {

\hspace #12

\override #'(line-width . 90) {

\justify {

\small { 

\column { 

\line { \hspace #3 {[} \italic {This version may be used,} \null \italic {in connexion with the other,} \null \italic {for one verse;} \null \italic {it is intended} }
  
\line { \italic {for the} \null \smallCaps { Choir alone } \null \italic {and must be sung without the organ.} \hspace #1 \italic {It should only be attempted} }

\line { \italic {by good choirs.} \normal-text {]} }

\line { \hspace #3 \smallCaps "Note" \hspace #-1.2 ".—" \italic {This tune is founded on the alternation of } \null \null \override #'(baseline-skip . 1.5) \raise #0.7 \column { "3 " "1 " } \null \italic { and } \null \override #'(baseline-skip . 1.5) \raise #0.7 \column { " 6 " " 2 " } \null \italic { times.} \null \italic {This can be easily} }

\line { \italic {learnt by a congregation,} \italic {who will sing the melody by ear.} \null \italic {However,} \italic {should a} \null \normal-text {C. M.} \italic {tune} }

\line { \italic {be thought preferable, } \smallCaps { Cheshire (} \italic {No. 109} \normal-text {)} \italic {or} \smallCaps { Martyrs (} \italic {No. 449} \normal-text {)} \italic { are also suitable.} }

} % end column
} % end small
} % end justify
} % end line-width
} % end markup

% *** return to margin

\markup { \hspace #40 \column { 

\center-align {

\hspace #1

\italic \small "The following are also suitable, among others:"

\line { \tiny { \column { "316 Just as I am."
                          "366 Art thou weary."
                          "378 Come, O thou Traveller."
                          "385 Father, hear the prayer."
                          "418 Jesu, name all names."
                          "430 Lighten the darkness."}
                \hspace #0.5 \column { "439 My faith looks up."
                          "456 O Lord, and Master."
                          "474 Prayer is the soul's."
                          "477 Rock of ages."
                          "482 Still will we trust."
                          "483 Strong Son of God."}  
                \hspace #0.5 \column { "484 Take up thy cross."
                          "495 The world is very evil."
                          "510 We sing the praise."
                          "515 Wilt thou forgive."
                          "648 Litany of Penitence."
                          "736 Lent Prose."}

} % end tiny
} % end line
} % end center-align
} % end column
} % end markup



%%%%%%%%%%     Page Break     %%%%%%%%%%
  

% *** fake score block to occupy space and force a pagebreak.

\score { 

   { s4 }

\header { breakbefore = ##t }

\layout{
   \context { \Staff
      \remove Time_signature_engraver
      \remove Key_engraver
      \remove Clef_engraver
      \remove Staff_symbol_engraver } }  
}
	


%%%%%%%%%%     Lyrics     %%%%%%%%%%


\markup {
   % *** change number as necessary to centre lyrics block
   \hspace #34 

\column { 
   % *** whole lyrics block is formatted into a single column

% *** heading section
   \line { \small { \hspace # 40 \italic "J. Addison," \normal-text "1672-1719." } }
      
% *** lyrics section 1: double column of verses
   % *** Create a line made up of two columns of verse separated by a vertical line
   \line {
      % *** first column of verse  
      % *** return to LH margin
         \hspace #-30
      \column {  
         \line { \hspace #2.2 
                    % *** Drop Cap goes here
                 \column { \lower #2.4 \fontsize #8 "W" }
                    % *** adjust if rest of line is too far from Drop Cap - left is negative
                  \hspace #-1.3    
	          \column { \raise #0.0 "HEN rising from the bed of death,"
                                        "    O'erwhelmed with guilt and fear," } }          

                  \line { % *** adjust hspace until this line left edge is flush with Drop Cap
                          \hspace #2.7  
                          % *** adjust this until the line spacing looks right
                          \lower  #1.56  
		          \column { "I see my Maker face to face,"
                                    "    O how shall I appear?" } }

                  \hspace #1
                  \line { "2  " \column { "If yet, while pardon may be found,"
                                          "    And mercy may be sought,"
                                          "My heart with inward horror shrinks,"
                                          "    And trembles at the thought;" } }
 
                 \hspace #1 
                 \line { "3  " \column { "When thou, O Lord, shalt stand disclosed"
                                         "    In majesty severe,"
                                         "And sit in judgement on my soul,"
                                         "    O how shall I appear?" } }
      } % *** end first column of verse

      % *** create some space between first column of verse and the vertical line
      \hspace #2

      % *** vertical line	
      \column { \filled-box #'(0.0 . 0.1) #'(-36 . 2) #0 }

      % *** second column of verse
         \hspace #3
      \column {
         \line { "4  " \column { "But thou hast told the troubled mind"
                                 "    Who does her sins lament,"
                                 "The timely tribute of her tears"
                                 "    Shall endless woe prevent." } }
         \hspace #1
         \line { "5  " \column { "Then see the sorrow of my heart,"
                                 "    Ere yet it be too late;"
                                 "And hear my Saviour's dying groans,"
                                 "    To give those sorrows weight." } }
         \hspace #1 
         \line { "6. " \column { "For never shall my soul despair"
                                 "    Her pardon to procure,"
                                 "Who knows thine only Son has died"
                                 "    To make her pardon sure." } }
      \hspace #1   
      } % end second column of verse
   } % end master line
} % end column that is entire lyrics section

} % end markup



%%%%%%%%%%     Amen Block     %%%%%%%%%%
	
\score { <<

\new ChoirStaff <<
   \new Staff = upper << 
      \new Voice = "sopranos"  { \relative c' { \global \voiceOne e1 e1 \bar "||" } }
      \new Voice = "altos"     { \relative c' { \global \voiceTwo c1 b1 \bar "||" } } >>

      \new Lyrics \lyricsto sopranos { \override LyricText #'font-size = #-1 { A -- men. } } 

      \new Staff = lower <<
         \new Voice = "tenors" { \relative c { \global \voiceThree \clef bass a'1 gis1 \bar "||" } }
         \new Voice = "basses" { \relative c { \global \voiceFour \clef bass a1 e'1 \bar "||" } } >> 

>> % choirstaff bracket

>> % score bracket

% *** creates space between end of lyrics and amen score
\header { breakbefore = ##f piece = " " opus = " " }

\layout {
   indent = 15\cm
   raggedright = ##t
   ragged-bottom = ##t
   packed = ##f

\context { \Score 
   % *** controls the amount of space between notes on the staff
   \override SeparationItem #'padding = #2 
}
     
\context { \Staff 
   \remove "Time_signature_engraver"
   \override VerticalAxisGroup #'minimum-Y-extent = #'( -2 . 2) 
   fontSize = #-2 
   \override StaffSymbol #'staff-space = #(magstep -2)
   \override NoteHead #'duration-log = #1
   \override Stem #'flag-style = #'no-flag
}

} % *** end amen layout

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 84 2) } } 

} % *** end amen score

} % *** end book