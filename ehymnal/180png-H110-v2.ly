%%% 180.png
%%% Hymn 110. Nun Komm, der Heiden Heiland. "See the destined day arise!"
%%% Rev 2.

\version "2.10"

\header {

  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - PASSIONTIDE: GOOD FRIDAY"

	\hspace #0.1 }}	

  title = "110"

  meter = \markup { \small { \column { \hspace #1 %%% blank line 
	                               \line { \sans {"NUN KOMM, DER HEIDEN HEILAND. "} \hspace #1 \roman {"(7 7. 7 7.)"}}
                                       \line { \italic {Very slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 46.}
                                  }
  }} 
  
  arranger = \markup { \small {\center-align { \line { \italic "Melody in Walther's" }
	                                       \line { "‘" \hspace #-1 \italic "Gesangbüchlein," \hspace #-1  "’" \italic "1524." } 
                                              \line { \italic "Adapted by" \smallCaps "J. S. Bach." }}
  }}

  tagline =""

}

%%% SATB voices

global = {
  \time 8/4
  \key bes \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  g'2 g f bes | a4(g) a2 g1^\fermata \bar "||" g4(a) bes2 c bes | c d bes1^\fermata \bar "||" \break
  bes2 c d4(c) bes2 | c4(bes) a2 g1^\fermata \bar "||" g2 g f bes | a4(g) a2 g1^\fermata \bar "||" 
}

alto = \relative c' { 
  d2 c d d4(ees8 f) | ees4(d) c2 bes1 \bar "||" d2. e4 f2. g4 | ees2 d ees1 \bar "||" \break
  f2 f f4(fis) g2 | a4(g) fis2 d1 \bar "||" cis4(d) e2 d d | ees!4(bes) c2 bes1 \bar "||" 
}

tenor = \relative c' { \clef bass 
  bes2 a4(g) a2 g | g2. fis4 d1 \bar "||" bes'4(a) g2 a bes | a bes4(aes) g1 \bar "||" \break
  f2 c' bes4(a) g2 | ees'2 a, bes1 \bar "||" a2 a a g | g2. fis4 g1 \bar "||" 
}

bass = \relative c { \clef bass 
  g'4(f) ees2 d4(c) bes(g) | c(bes) c(d) g,1_\fermata \bar "||" g2 g' f4(ees) d(ees) | c2 bes ees1_\fermata \bar "||" \break
d4(c) bes(a) bes2 ees4(d) | c2 d g,1_\fermata \bar "||" a4(b) cis(a) d(c) bes(g) | c(ees) d2 g,1_\fermata \bar "||" 
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

%%% Score block
	
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

%%% Hymn Midi	

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 46 2)}} 

} %%% Score bracket

%%% Hymn Note markup

\markup { \hspace #22 \smallCaps "Note" \hspace #-1.2 ".—" \italic "This hymn may also be sung to" \smallCaps "Redhead 47" "(" \hspace #-1 \italic "No. 513" \hspace #-1 ")."} 

\markup { \hspace #38 \italic "See also 737" "The Reproaches." } 

\markup { \hspace #70 \small \italic "Bishop R. Mant, 1776-1848." } 

%%% Main lyrics markup block
  
\markup { \hspace #32 %%add space as necc. to center the column
	          \column {  %%% a super column for entire block of lyrics  
                      \column { %%% verse 1 is a column of 2 lines  
                          \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "S" }   %%Drop Cap goes here
                                  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
                                  \column  { \raise #0.0  "EE the destined day arise!" 
                                                         "  See, a willing sacrifice," } }          
                          \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
                                   \lower  #1.56  %%adjust this until the line spacing looks right
                                   \column {   
					   "To redeem our fatal loss,"
					   "Jesus hangs upon the Cross!"
                                        }}
                               
                                   } %% finish verse 1   
				                 \hspace #1 
                \line { "2  "
                           \column {         
				   "Jesu, who but thou had borne,"
				   "Lifted on that Tree of scorn,"
				   "Every pang and bitter throe,"
				   "Finishing thy life of woe?"
                        }}
		 \hspace #1 
                \line { "3  "
                           \column {         
				   "Who but thou had dared to drain,"
				   "Steeped in gall, the cup of pain,"
				   "And with tender body bear"
				   "Thorns, and nails, and piercing spear?"
                        }}
		  } %%% end super column		
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
                \line { "4  "
                   \column {         
			   "Thence, poured forth, the water flowed,"
			   "Mingled from thy side with blood,—"
			   "Sign to all attesting eyes"
			   "Of the finished Sacrifice."
                        }}
                  \hspace #1 
                  \line { "5  "
                    \column {        
			    "Holy Jesu, grant us grace"
			    "In that Sacrifice to place"
			    "All our trust for life renewed,"
			    "Pardoned sin, and promised good."
                        }}
                \hspace #1 % adds vertical spacing between verses  
                \line { \hspace #-10 \italic "Unison.  " "6. "
                    \column {        
			    "Grant us grace to sing to thee,"
			    "In the Trinal Unity."
			    "Ever with the Sons of light,"
			    "Blessing, honour, glory, might.     Amen."
                }}
          }
} %%% lyric markup bracket

%%% Amen score block

\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne g'1 g  \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo c1 b \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree ees1 d \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  c1 g \bar "||" }}
			        >> 
  >>
  
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
      \context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       } %% close layout
%%% Amen Midi

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 46 2) }}

}


} %%% book bracket