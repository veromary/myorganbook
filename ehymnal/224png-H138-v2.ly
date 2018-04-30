%%%% 224.png
%%%% Hymn 138. Mach's Mit Mir Gott.  Thou hallowed chosen morn of praise
%%%% Rev 2.

\version "2.10"

\header {

  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - EASTERTIDE"

        \hspace #0.1 }} 

  title = "138"

  meter = \markup { \small {\column {  \line { \sans {"MACH'S MIT MIR GOTT."} \hspace #1 \roman {"(8 7. 8 7. 8 8.)" }}
                                       \line { \italic {Very slow and solemn} \general-align #Y #DOWN \note #"2" #0.5 = 46.}
                                  }
                  }}
 
  arranger =  \markup { \small {\center-align {
                            \line { \italic "Melody by " \smallCaps "J. H. Schein, 1586-1630." }
                            \line { \italic "Adapted by" \smallCaps "J. S. Bach." }
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

%%%  Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work            
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.6
              \once \override Stem #'X-offset = #-2.6 }

%%% Push notecolumn a little to the right

push = { \once \override NoteColumn #'force-hshift = #0.4 }
              
%%%%%%%%%%%%%%%%%%%%%%%%% end of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key d \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \tag #'repeatpart { \partial 2 \fdstartrepeat d4( e) | fis2 g a a | g fis e^\fermata \bar "||" a | \break
  b cis d cis4( b) | \push b1 a2^\fermata \fdendrepeat } \tag #'remainder { a | d cis b2  a2 | \break
  g fis e^\fermata \bar "||" a g fis e4( fis) g2 | fis e d^\fermata \bar "||" }
}

alto = \relative c' { 
  \tag #'repeatpart { \fdstartrepeat a2 | d d d d | d4( cis) d2 cis \bar "||" e | \break
  e gis a4( e) e2 | fis( gis) e \fdendrepeat } \tag #'remainder { e | fis e d4( e) fis2 |
  e a,4( b) cis2 \bar "||" fis4( e) | d4( e) \straddle e( d) d( cis) d2 | d cis a \bar "||" }
}

tenor = \relative c { \clef bass
  \tag #'repeatpart { \fdstartrepeat fis4( g) | a2 b c b4( a) | b2 a a \bar "||" cis | \break
  b e a,4( b) cis2 | d4( cis b2) cis \fdendrepeat } \tag #'remainder { cis4( b) | a( fis) g( a) b2 b | \break
  b4( cis) d2 a \bar "||" cis | b4( a) a2 a g | a2. g4 fis2 \bar "||" }
}

bass = \relative c { \clef bass
  \override Stem #'length = #5	
  \tag #'repeatpart { \fdstartrepeat d2 | d b fis b | e fis4( g) \once \override Script #'padding = #2 a2 _\fermata  \bar "||" a2 | \break
  gis fis4( e) fis( gis) a2 | d,2( e) a,_\fermata \fdendrepeat } \tag #'remainder { a'4( g) | fis( d) e( fis) g( fis) e( dis) | \break
  e2 fis4( g) a2_\fermata \bar "||" fis | b,4( cis) d2 a b | a4( g) a2 \once \override Script #'padding = #4 d2 _\fermata \bar "||" }
}

org = \relative c { \clef bass
  \set fontSize = #-3 \override Stem #'length = #4 
  \override NoteColumn #'force-hshift = #0.2
  \override TextScript #'staff-padding = #5
  \override TextScript #'extra-offset = #'(-6.0 . 4.0 ) 
  \tag #'repeatpart { \fdstartrepeat d,2_\markup { \normalsize \italic Org. } | s1 s1 | e2_\markup { \normalsize \italic Org. } fis4 g a2 \bar "||" s2 |
  s1 s1 | s1 s2 \fdendrepeat } \tag #'remainder { s2 | s1 s1 
  s1 s2 \bar "||" s2 | s1 s1 | s2 s2 d,2 _\markup { \normalsize \italic Org. } }
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
	\context Voice = org    { \voiceFour \global \org }
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
        \context Voice = org { \voiceFour \global \keepWithTag #'repeatpart \org \org }
                              >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 46 2)}} 

} %%% end Hymn midi Score 


%%% Hymn Note

\markup { \hspace #6 \column {	
  \line { \hspace #4 \smallCaps "Note" \hspace #-1 ".—"   \italic "An  adaptation  of  this  tune  to  the" "L. M." \italic "measure  is  found  at  Hymn" "459" }
  \line { \smallCaps "(Eisenach)." \italic  "  Those who think it inadvisable to use two versions of the same tune can sing"  }
  \line { \italic "the present hymn to the tune on the following page." }
}}



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


%%% Second page
%%% Lyric attribution

\markup { \hspace #78 \small { \center-align { \line { \italic "St. John Damascene, c. 750." }  
                                               \line {\italic "Tr. J. M. Neale." }
}}}


\markup { \hspace #40 \small { "Αὔτη ἡ κλητή." "[Autê hê klêtê.]" }}

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
					   "           " %%% extra spacing between verses
                                        }}
                \line { "2  "
                           \column {         
				   "Come, let us taste the Vine's new fruit,"
				   "    For heavenly joy preparing;"
				   "To-day the branches with the Root"
				   "    In Resurrection sharing:"
				   "Whom as true God our hymns adore"
				   "For ever and for evermore."
				   "           " %%% extra spacing between verses
                        }}
                  \line { "3  "
                    \column {        
			    "Rise, Sion, rise! and looking forth,"
			    "    Behold thy children round thee!"
			    "From east and west, from south and north,"
			    "    Thy scattered sons have found thee;"
			    "And in thy bosom Christ adore"
			    "For ever and for evermore."
			    "           " %%% extra spacing between verses
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
        \context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne d1 d  \bar "||" }}
        \context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo b1 a \bar "||" }}
                              >>

	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }

        \context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
                               << 
        \context Voice = "tenors" { \relative c { \clef bass \global \voiceThree g'1 fis \bar "||" }}
        \context Voice = "basses" { \relative c { \clef bass \global \voiceFour  g1 d' \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 46 2) }} 
}

} %%% book bracket
