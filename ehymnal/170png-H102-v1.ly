%%%% 170.png
%%%% Hymn 102. Passion Chorale. "O sacred head, sore wounded"
%%%% Rev 1.

\version "2.10"

\header {

  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - PASSIONTIDE"

        \hspace #0.1 }} 

  title = "102"

  meter = \markup { \small {\column {  \line { \sans {"PASSION CHORALE. "} \hspace #1 \roman {"(7 6. 7 6. D.)" }}
                                       \line { \italic {Very slow and solemn} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 42.}
                                  }
                  }}
 
  arranger =  \markup { \small {\center-align {
                            \line { \italic "Melody by " \smallCaps "H. L. Hassler, 1564-1612." }
                            \line { \italic "Adapted and harmonized by" \smallCaps "J. S. Bach." }
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
              
%%%%%%%%%%%%%%%%%%%%%%%%% end of macro definitions

%%% SATB voices

global = {
  \time 8/4
  \key c \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \tag #'repeatpart { \partial 2 \fdstartrepeat e2 \bar "|" a g f e \bar "|" \once \override NoteColumn #'force-hshift = #2 d1 e2^\fermata \breathmark \bar "||" 
      b' \bar "|" c c b4(a) b2 \bar "|" a1.^\fermata \fdendrepeat \break }
  
  \tag #'remainder { c2 \bar "|" b4(a) g2 a b \bar "|" \push c1 c2^\fermata \breathmark \bar "||" 
      g \bar "|" a g f f \bar "|" e1.^\fermata \bar "||" \break
  
  c'2 \bar "|" b4(c) d2 c b \bar "|" \push a1 b2^\fermata \breathmark \bar "||" 
      e, \bar "|" f e d g \bar "|" e1.^\fermata \bar "||" } 
}

alto = \relative c' { 
  \tag #'repeatpart { \partial 2 \fdstartrepeat c2 \bar "|" c c c4(d) \straddle d(c) \bar "|" c2(b) c \bar "||" 
      d \bar "|" c4(d) e2 e e4(d) \bar "|" c1. \fdendrepeat \break }
  
  \tag #'remainder { a'4(g) \bar "|" f2 e4(d) c2 f \bar "|" f(e4 d) e2 \bar "||" 
      e \bar "|" f e e d \bar "|" cis1. \bar "||" \break
      
  d2 \bar "|" d d e d \bar "|" e(d) d \bar "||" 
      c \bar "|" c4(b) c2 c b \bar "|" c1. \bar "||" }
}

tenor = \relative c { 
  \tag #'repeatpart { \partial 2 \clef bass \fdstartrepeat g'2 \bar "|" f g a4(g) g2 \bar "|" a2(g) g \bar "||" 
      gis \bar "|" e a a gis \bar "|" a1. \fdendrepeat \break }
  
  \tag #'remainder { e'2 \bar "|" d4(c) b2 a4(g) f(g) \bar "|" a2(g4 f) g2 \bar "||" 
      c \bar "|" c c4(b) a2 a \bar "|" \once \override NoteColumn #'force-hshift = #1 a1. \bar "||" \break
      
  a2 \bar "|" g g4(fis) g(a) b(g) \bar "|" e(a) fis2 g \bar "||" 
      g f! g a d,4(g) \bar "|" g1. \bar "||" }
}

bass = \relative c { 
  \tag #'repeatpart { \partial 2 \clef bass \fdstartrepeat c2 \bar "|" f e a,4(b) c2 \bar "|"f,(g) c_\fermata \bar "||" 
      b \bar "|" a4(b) c(d) e2 << { \voiceTwo \shortenStem e2 }  
          \new Voice = "pedals" { \once \override NoteColumn #'force-hshift = #0.2 
          \voiceFour \set fontSize = #-3 \override Stem #'length = #4  e,2 } >> 
      \bar "|" a1._\fermata \fdendrepeat \break }
          
  \tag #'remainder { a'2 \bar "|" d, e f4(e) d2 \bar "|" \push c1 c2_\fermata \bar "||" 
      c \bar "|" f c d4(e) f(g) \bar "|" a1._\fermata \bar "||" \break
      
  fis2 \bar "|" g b, e4(fis!) g2 \bar "|" c, d g,_\fermata \bar "||" 
      c4(b) \bar "|" a2 g f g \bar "|" c1._\fermata \bar "||" }
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
        \context { \Staff \remove "Time_signature_engraver" }
        \context { \Score \remove "Mark_engraver"  }
        \context { \Staff \consists "Mark_engraver"  }
        } %% close layout

} %%% end score bracket

%%% A separate score block to unfold repeats and generate Hymn Midi     

\score{
\new ChoirStaff 
<<
  \context Staff = upper << 
        \context Voice = sopranos { \voiceOne \global \keepWithTag #'repeatpart \soprano \soprano }
        \context Voice = altos    { \voiceTwo \global \keepWithTag #'repeatpart \alto \alto }
                              >>
  \context Staff = lower <<
        \context Voice = tenors { \voiceOne \global \keepWithTag #'repeatpart \tenor \tenor }
        \context Voice = basses { \voiceTwo \global \keepWithTag #'repeatpart \bass \bass }
                              >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 42 2)}} 

} %%% end Hymn midi Score 

%%% Lyric attribution

\markup { \hspace #78 \small { \center-align { \line { \italic "P. Gerhardt, 1607-76, based on" "Salve caput cruentatum" }  
                                               \line { "(" \italic "ascribed to St. Bernard" ")." \italic " Tr. Y. H." }
}}}

%%% Note: In order to generate the Fraktur title below, a Fraktur font is needed.
%%% HumboldtFraktur and GF Gesetz are examples of Fraktur fonts which resemble the original
%%% image and are free and downloadable from the internet.   
%%% HumboldtFraktur works well on Windows and Linux 
%%% but has been reported to give problems when compiling
%%% on Macintosh installations, thus GF Gesetz has been used below
%%% If you use another Fraktur font, simply put the name into the font-name override below.

\markup { \line {  \small { \hspace #38 \override #'(font-name . "GF Gesetz") {"O Haupt voll Blut und Wunden." }}}}

%%% Main lyrics markup block
  
\markup { \hspace #32 %%add space as necc. to center the column
                      \column { %%% verse 1 is a column of 2 lines  
                          \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
                                  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
                                  \column  { \raise #0.0 " SACRED head, sore wounded,"  
                                                         "  Defiled and put to scorn;" } }          
                          \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
                                   \lower  #1.56  %%adjust this until the line spacing looks right
                                   \column {   
                                           "O kingly head, surrounded"
                                           "    With mocking crown of thorn:"
                                           "What sorrow mars thy grandeur?"
                                           "    Can death thy bloom deflower?"
                                           "O countenance whose splendour"
                                           "    The hosts of heaven adore."
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
				   "Thy beauty, long-desirèd,"
				   "    Hath vanished from our sight;"
				   "Thy power is all expirèd."
				   "    And quenched the light of light."
				   "Ah me! for whom thou diest,"
				   "    Hide not so far thy grace:"
				   "Show me, O Love most highest,"
				   "    The brightness of thy face."
                        }}
                  \hspace #1 
                  \line { "3  "
                    \column {        
			    "* I pray thee, Jesus, own me,"
			    "    Me, Shepherd good, for thine;"
			    "Who to thy fold hast won me,"
			    "    And fed with truth divine."
			    "Me guilty, me refuse not,"
			    "    Incline thy face to me,"
			    "This comfort that I lose not,"
			    "    On earth to comfort thee."
                        }}
                \hspace #1 % adds vertical spacing between verses  
                \line {"4  "
                    \column {        
			    "In thy most bitter passion"
			    "    My heart to share doth cry,"
			    "With thee for my salvation"
			    "    Upon the Cross to die."
			    "Ah, keep my heart thus movèd"
			    "    To stand thy Cross beneath,"
			    "To mourn thee, well-belovèd,"
			    "    Yet thank thee for thy death."
                        }} 
                \hspace #1 % adds vertical spacing between verses  
                \line {"5. "
                    \column {        
			    "* My days are few, O fail not,"
			    "    With thine immortal power,"
			    "To hold me that I quail not"
			    "    In death's most fearful hour:"
			    "That I may fight befriended,"
			    "    And see in my last strife"
			    "To me thine arms extended"
			    "    Upon the Cross of life."
                }}
          }
} %%% lyric markup bracket


%% Amen score block

\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
                              << 
        \context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f1 e  \bar "||" }}
        \context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo c1 c \bar "||" }}
                              >>

	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }

        \context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
                               << 
        \context Voice = "tenors" { \relative c { \clef bass \global \voiceThree a'1 g \bar "||" }}
        \context Voice = "basses" { \relative c { \clef bass \global \voiceFour  f1 c \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 42 2) }} 
}

} %%% book bracket