%%%% 225.png
%%%% Hymn 138 Alternative Tune. Dies ist der tag.  Thou hallowed chosen morn of praise
%%%% Rev 2.

\version "2.10"

\header {

  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - EASTERTIDE"

        \hspace #0.1 }} 

  title = \markup { "138" \large \smallCaps "(Alternative Tune)" }

  meter = \markup { \small {\column {  \line { \sans {"DIES IST DER TAG."} \hspace #1 \roman {"(8 7. 8 7. 8 8.)" }}
                                       \line { \italic {In moderate time} \general-align #Y #DOWN \note #"4" #0.5 = 120.}
                                  }
                  }}
 
  arranger =  \markup { \small {\center-align {
                            \line { \italic "Melody by " \smallCaps "P. Sohren, c. 1676" }
                            \line { "(" \hspace #-1 \italic "rhythm slightly adapted" \hspace #-1 ")." }
                } } }

  tagline =""

}

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}


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


              
%%%%%%%%%%%%%%%%%%%%%%%%% end of macro definitions

%%% SATB voices

global = {
  \time 3/2
  \key bes \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \tag #'repeatpart { \fdstartrepeat \partial 4 bes'4 | bes2 f4 bes2 d4 | c2 c4 bes2 \breathmark \bar "||" c4 | \break
  c2 a4 bes2 a4 | g2. f2.^\fermata \fdendrepeat } \tag #'remainder { g4 g g g2 bes4 | \break
  a8([ g fis g]) a4 g2. \bar "||" bes4 bes c d2 d4 | c8([ bes a g]) a4 bes2. ^\fermata \bar "||" }
}

alto = \relative c' { 
  \tag #'repeatpart { \fdstartrepeat f4 | f2 f4 d2 f4 | g2 f4 d2 \bar "||" f4 | \break
  g2 f4 f2 f4 | f2( e4) f2. \fdendrepeat } \tag #'remainder { bes,4 bes ees d2 g4 | \break
  ees4( c) c bes2. \bar "||" g'4 f a bes2 bes4 | g4( ees) ees d2. \bar "||" }
}

tenor = \relative c { \clef bass
  \tag #'repeatpart { \fdstartrepeat d'4 | d2 c4 bes2 bes4 | bes2 a4 bes2 \bar "||" a4 | \break
  c2 c4 d2 d4 | g,2. a2. \fdendrepeat } \tag #'remainder { g4 g g g2 d'4 | \break
  a2 fis4 g2. \bar "||" g4 bes ees d2 f4 | c2 c4 bes2. \bar "||" }
}

bass = \relative c { \clef bass
  \tag #'repeatpart { \fdstartrepeat bes'4 | bes2 a4 g2 d4 | ees2 f4 bes,2 \bar "||" f'4 | \break
  e2 f4 g,4.( a8) bes4 | c2. f2. _\fermata \fdendrepeat } \tag #'remainder { ees4 d c bes2 g4 | \break
  c4( ees) d g2. \bar "||" ees4 d c bes2 d4 | ees4( c) f bes,2. _\fermata \bar "||"  }
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4)}} 

} %%% end Hymn midi Score 


%%% Lyric attribution

\markup { \hspace #78 \small { \center-align { \line { \italic "St. John Damascene, c. 750." }  
                                               \line {\italic "Tr. J. M. Neale." }
}}}


\markup { \hspace #40 \small { "Αὔτη ἡ κλητή." "[Autê hê klêtê.]" }}

%%% Main lyrics markup block
  
\markup { \hspace #32 %%add space as necc. to center the column
                      \column { %%% verse 1 is a column of 2 lines  
                          \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
                                  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
                                  \column  { \raise #0.0 "HOU hallowed chosen morn of praise,"
                                                         "  That best and greatest shinest:" } }          
                          \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
                                   \lower  #1.56  %%adjust this until the line spacing looks right
                                   \column {   
					   "Lady and queen and day of days,"
					   "    Of things divine, divinest!"
					   "On thee our praises Christ adore"
					   "For ever and for evermore."
                                        }}

	      }	%%% end super column	
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
%%% continuation of  lyrics

\markup { \hspace #32   %%add space as necc. to center the column
          \column { 
		\hspace #1 
                \line { "2  "
                           \column {         
				   "Come, let us taste the Vine's new fruit,"
				   "    For heavenly joy preparing;"
				   "To-day the branches with the Root"
				   "    In Resurrection sharing:"
				   "Whom as true God our hymns adore"
				   "For ever and for evermore."
				   "      " %%% add vertical spacing between verses
                        }}
                  \line { "3  "
                    \column {        
			    "Rise, Sion, rise! and looking forth,"
			    "    Behold thy children round thee!"
			    "From east and west, from south and north,"
			    "    Thy scattered sons have found thee;"
			    "And in thy bosom Christ adore"
			    "For ever and for evermore."
			    "      " %%% add vertical spacing between verses
                        }}
                \line {"4. "
                    \column {        
			    "O Father, O co-equal Son,"
			    "    O co-eternal Spirit,"
			    "In persons Three, in substance One,"
			    "    And One in power and merit;"
			    "In thee baptized, we thee adore"
			    "For ever and for evermore.     Amen."
                }}
          }
} %%% lyric markup bracket


%% Amen score block

\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
                              << 
        \context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne bes'1 bes  \bar "||" }}
        \context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo ees1 d \bar "||" }}
                              >>

	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }

        \context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
                               << 
        \context Voice = "tenors" { \relative c { \clef bass \global \voiceThree g'1 f \bar "||" }}
        \context Voice = "basses" { \relative c { \clef bass \global \voiceFour  ees1 bes \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4) }} 
}

} %%% book bracket
