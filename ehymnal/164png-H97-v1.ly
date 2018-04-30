%%%% 164.png
%%%% Hymn 97 Dost thou truly seek renown
%%%% Rev 1

\version "2.10"

\header {

  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - PASSIONTIDE"

        \hspace #0.1 }} 

  title = "97"

  meter = \markup { \small {\column {  \line { \sans {"DAS IST MEINE FREUDE."} \hspace #1 \roman {"(7 6. 7 6. 7 7 6.)" }}
                                       \line { \italic {Moderately slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 60.}
                                  }
                  }}
 
  arranger =  \markup { \small {\center-align {
                            \line { \italic "Melody by" }
                            \line { \smallCaps "J. A. Freylinghausen, 1670-1739." }
                } } }

  tagline =""

}

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%%  Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work            
	      
straddle =  { \once \override Score.SeparationItem #'padding = #1
              \once \override NoteHead #'X-offset = #-1.4
              \once \override Stem #'X-offset = #-1.4 }	      
	      
	      
%%% Push notecolumn a little to the right

push = { \once \override NoteColumn #'force-hshift = #0.4 }

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged semibreves and breves

merge = \once \override NoteColumn #'force-hshift = #-0.01


%%%%%%%%%%%%%%%%%%%%%%%%% end of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  f2 c' a f | d e f1 | a2 g a d | b1 c1 \bar "||" \break
  g2 c4( g4) a2 g | f g e1 | g2 g g f4( g4) | e2( d2) c1^\fermata \bar "||" \break
  g'2 a bes c4(d4) | bes2 a g1 | f2 g a g | \break
  a2 b c1^\fermata \bar "||" a2 g4( a4) bes2 a4( g4) | a2( g2) f1 \bar "||"
}

alto = \relative c' { 
  c2 c c c | bes bes c1 | c2 c f a | \straddle g( f) e1 \bar "||" 
  e4( d4) c2 c c | d d c1 | c2 b c c | c( b) \merge c1 \bar "||"
  e2 fis g d | d d4( c) bes1 | d2 c c c |
  f d e1 \bar "||" f2 c f f | f( e) \merge f1 \bar "||"
}

tenor = \relative c { \clef bass
  a'2 g f f | f g a1 | f2 c' c f | d1 c1 \bar "||"
  c2 g f g | a g g1 | e2 f g a | g2.( f4) e1 \bar "||"
  c'2 c bes g | g fis g1 | a2 c c c |
  a g g1 \bar "||" f2 c' bes c4( d4) | c2.( bes4) a1 \bar "||"
}

bass = \relative c { \clef bass
  f2 e f a, | bes g f1 | f'2 e f d | g1 c, \bar "||"
  c4( d) e( c) f2 e | d b c1 | c2 d e f |        
      \override Staff.NoteCollision
      #'merge-differently-dotted = ##t g2 ( g,2) c1_\fermata \bar "||" 
  c2 bes4( a) g2 bes | d d g,1 | d'2 e f e |
  d g c,1_\fermata \bar "||" f2 ees d c4( bes) | \push c1 
      << { f1 } 
         \new Voice = "alt" { 
	 \voiceFour \set fontSize = #-3  
         \once \override NoteColumn #'force-hshift = #0.2
	 f,1 } >> 
      \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 60 2)}} 
		
} %%% end score bracket

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

%%% Lyric attribution and title

\markup { \hspace #78 \small \italic "14th or 15th cent.  Tr. A. R." }  

\markup { \hspace #44 \small "Si vis vere gloriari." }

%%% Main lyrics markup block
  
\markup { \hspace #32 %%add space as necc. to center the column
	     \column {  %% a super column for entire block of lyrics 
                        \column { %%% verse 1 is a column of 2 lines  
                          \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "D" }   %%Drop Cap goes here
                                  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
                                  \column  { \raise #0.0 "OST thou truly seek renown"
                                                         "  Christ his glory sharing?" } }          
                          \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
                                   \lower  #1.56  %%adjust this until the line spacing looks right
                                   \column {   
					   "Wouldst thou win the heavenly crown"
					   "    Victor's meed declaring?"
					   "Tread the path the Saviour trod,"
					   "Look upon the crown of God,"
					   "    See what he is wearing."
                                        }}
                                   } %% finish verse 1    
                \hspace #1 
                \line { "2  "
                           \column {         
				   "This the King of heaven bore"
				   "    In that sore contending;"
				   "This his sacred temples wore,"
				   "    Honour to it lending;"
				   "In this helm he faced the foe,"
				   "On the Rood he laid him low,"
				   "    Satan's kingdom ending."
                        }}
                  \hspace #1 
                  \line { "3  "
                    \column {        
			    "Christ upon the Tree of Scorn,"
			    "    In salvation's hour,"
			    "Turned to gold these pricks of thorn"
			    "    By his Passion's power;"
			    "So on sinners, who had earned"
			    "Endless death, from sin returned,"
			    "    Endless blessings shower."
                        }}
                \hspace #1 % adds vertical spacing between verses  
                \line {"4. "
                    \column {        
			    "When in death's embrace we lie,"
			    "    Then, good Lord, be near us;"
			    "With thy presence fortify,"
			    "    And with victory cheer us;"
			    "Turn our erring hearts to thee,"
			    "That we crowned for ay may be:"
			    "    O good Jesu, bear us!"
                }}
          }
} %%% lyric markup bracket


%% Amen score block

\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
                              << 
        \context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f1 f1  \bar "||" }}
        \context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo d1 c1 \bar "||" }}
                              >>

	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }

        \context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
                               << 
        \context Voice = "tenors" { \relative c { \clef bass \global \voiceThree bes'1 a1 \bar "||" }}
        \context Voice = "basses" { \relative c { \clef bass \global \voiceFour  bes1 f'1 \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 60 2) }} 
}

} %%% book bracket
