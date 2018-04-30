%%% 216png
%%% Hymn 131 Ave Virgo Virginum Come ye faithful, raise the strain
%%% Version 1

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - EASTERTIDE"
		\hspace #0.1 }}	
  title = "131"
  meter = \markup { \small {\column { 
	                               \line { \sans {"AVE VIRGO VIRGINUM."} \hspace #1 \roman {"(7 6. 7 6. D.)"}}
                                       \line { \italic {In moderate time} \general-align #Y #DOWN \note #"4" #0.5 = 100.}
                                  }
                  }}
 
  arranger =  \markup { \small {\center-align { 
		                                \line { \smallCaps "Leisentritt's" "‘" \hspace #-1.2 \italic "Gesangbuch" \hspace #-1.2 ",’ 1584" }
			                        \line { "(" \hspace #-1 \italic "rhythm of bar 7 slightly simplified" \hspace #-1 ")" }
  		} } }
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

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

%%% Push notecolumn a little to the right

push = { \once \override NoteColumn #'force-hshift = #1.7 }
              
%%% Moves a note slightly to the left to produce those partially merged whole notes.

merge = \once \override NoteColumn #'force-hshift = #-0.01

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro Definitions


%%% SATB Voices

global = {
  \time 3/2
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \tag #'repeatpart { \fdstartrepeat g'4 g d d g a  | b1. \bar "||" e2 d c4 b | \push a2 g1 \fdendrepeat } \break
  \tag #'remainder { d'2 e d4 c | b b a1 \bar "||" b2 a g4 fis | \push e2 d1 \bar "||" \break
  g4 g d d g a | b1. \bar "||" e2 d2 c4 b | \push a2 g1 \bar "||" }
}

alto = \relative c' { 
  \tag #'repeatpart { d4 d a d d fis | g1. \bar "||" g2 g g4 g | g( fis) \merge g1 \bar "||" }
  \tag #'remainder { g2 g fis4 g | g g fis1 \bar "||" g2 e d4 d | d(  cis) \merge d1 \bar "||"
  b4 b d d d fis | g1. \bar "||" g2 f4( e) e g | g4( fis) \merge g1 \bar "||" }
}

tenor = \relative c { \clef bass
  \tag #'repeatpart { \fdstartrepeat b'4 g g fis g d' | d1. \bar "||" c2 d e4 d | e( d) b1 \fdendrepeat }
  \tag #'remainder { d2 c a4 g | b d d1 \bar "||" d2 cis b4 a | b( a) fis1 \bar "||"
  g4 g fis fis g d' | d1. \bar "||" c2 a4( gis) a d | e( d) b1 \bar "||" }
}

bass = \relative c { \clef bass
  \tag #'repeatpart { g4 b d c b d | g1. \bar "||" c,2 b a4 b | c( d) g,1 \bar "||" }
  \tag #'remainder { b2 c d4 e | g b, d1 \bar "||" g,2 a b4 d | g,( a) d1 \bar "||"
  e4 e d c b d | g,1. \bar "||" c2 d4( e) a, b | c( d) g,1 \bar "||" }
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
	} %%% close layout
} %%% Score bracket

%%% A separte score block to unfold the repeat and generate the Hymn Midi	

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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4)}} 

}

%%% Lyric attribution

\markup { \hspace #78 \small { \center-align { \line { \italic "St. John Damascene, c. 750." }  
                                               \line { \italic "Tr. J. M. Neale." }
}}}

\markup { \small { \hspace #42 "Αἴσωμεν πάντες λαοί."  "[Aisômen pantes laoi.]" } }

%%% Main lyrics markup block
  
\markup { \hspace #32 %%add space as necc. to center the column
                      \column { %%% verse 1 is a column of 2 lines  
                          \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "C" }   %%Drop Cap goes here
                                  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
                                  \column  { \raise #0.0 "OME, ye faithful, raise the strain"
                                                         "  Of triumphant gladness;" } }          
                          \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
                                   \lower  #1.56  %%adjust this until the line spacing looks right
                                   \column {   
					   "God hath brought his Israel"
					   "    Into joy from sadness;"
					   "Loosed from Pharaoh's bitter yoke"
					   "    Jacob's sons and daughters;"
					   "Led them with unmoistened foot"
					   "    Through the Red Sea waters."
                                        }}
		      		} %% finish verse 1 
}  %%% end markup       



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
				"'Tis the Spring of souls to-day;"
				"    Christ hath burst his prison,"
				"And from three days' sleep in death"
				"    As a Sun hath risen;"
				"All the winter of our sins,"
				"    Long and dark, is flying"
				"From his Light, to whom we give"
				"    Laud and praise undying."
				"     " %%% adds vertical spacing between verses
                        }}  
                \line { "3  "
                           \column {         
				   "Now the Queen of seasons, bright"
				   "    With the Day of splendour,"
				   "With the royal Feast of feasts,"
				   "    Comes its joy to render;"
				   "Comes to glad Jerusalem,"
				   "    Who with true affection"
				   "Welcomes in unwearied strains"
				   "    Jesu's Resurrection."
				   "     " %%% adds vertical spacing between verses
                        }}
                \line {"4. "
			\column {        
				"Neither might the gates of death,"
				"    Nor the tomb's dark portal,"
				"Nor the watchers, nor the seal,"
				"    Hold thee as a mortal;"
				"But to-day amidst the twelve"
				"    Thou didst stand, bestowing"
				"That thy peace which evermore"
				"    Passeth human knowing."
                }}
          }
} %%% lyric markup bracket

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne g'1 g1  \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo e1 d1 \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree c'1 b1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  c1 g1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       } %%% close layout

%%% Amen Midi
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4) }} 

}


} %%% book bracket
