%%% 030.png
%%% Hymn 2 High Word of God
%%% Version 3


\version "2.10.19"

\include "gregorian-init.ly"

\header {
  dedication = \markup { \center-align {  "THE CHRISTIAN YEAR - ADVENT"
		\hspace #0.1 }}	
  title = "2"
  arranger = \markup { "Mode ii." } 
  tagline =""
}

global =  {
  \time 8/8
  \key d \major
  \set Staff.midiInstrument = "church organ"
}

longnote = {\once \override NoteHead #'duration-log = #0 
           \once \override Stem #'stencil = ##f
           \once \override NoteColumn #'force-hshift = #'0.4 }

soprano = \relative c' { \autoBeamOff
  fis8 d8 fis8 a8  b8 cis8 b8 b8 \bar "|" a8 b8 d8 d8  cis8[ a8] b8 cis8 b8 \bar "|" \break
  b8 b8 cis8 a8 fis8[ a8] g8 fis8 e8 \bar "|" fis8 d8 fis8 a8 b8 cis8 b8 b8 \bar "||"
}

alto = \relative c' { \autoBeamOff
  \longnote d4( d8) e8 d8 cis8 d8( d8) \bar "|"  \longnote d4 fis8 fis8 \longnote fis4 fis8 a8 fis8 \bar "|" 
  g8 fis8 a8 e8 d8[ e8] \longnote d4 b8 \bar "|" \longnote d4( d8) e8 d8 fis8 d8 d8 \bar "||"
}

tenor = \relative c { \clef bass
  \longnote a'4( a8) a8 fis8( fis8) fis8( fis8) \bar "|" fis8 g8 a8 b8 a8[ cis8] d8 e8 d8 \bar "|" 
  e8 d8 e8 a,8 \longnote a4 b8 a8 g8 \bar "|" b8 a8( a8) a8 fis8 a8 g8 fis8 \bar "||"
}

bass = \relative c { \clef bass
  d8 fis8 d8 cis8 b8 a8 b8 b8 \bar "|" d8 g8 d8 b8 \longnote fis'4 b8 a8 b8 \bar "|" 
  e,8 b'8 a8 cis,8 d8[ cis8] b8 d8 e8 \bar "|" b8 fis'8 d8 cis8 b8 fis8 g8 b8 \bar "||"
}

plainsong = \context VaticanaVoice  {  \relative c' { 
	\set Score.timing = ##f
	\override Staff.Accidental  #'transparent = ##t
	\clef "vaticana-do3"
	\set fontSize = #3
	\override Staff.StaffSymbol #'staff-space = #1.6
  e,8 c8 e8 g8 a8 b8 a8 a8 \bar "|" g8 a8 c8 c8 \[ b8 \flexa g8 \] a8 b8 a8 \bar "|"
  a8 a8 b8 g8 \[ e8 \pes g8 \] f8 e8 d8 \bar "|" e8 c8 e8 g8 a8 b8 a8 a8 \bar "||"
}}

#(ly:set-option 'point-and-click #f)

\book {

\paper {
 #(set-paper-size "a4")
 between-system-padding = 2\mm
 before-title-space = 0\mm
 after-title-space = 1\mm
 top-margin = 1\mm
 bottom-margin = 2\mm
 print-page-number = ##f
 ragged-last-bottom = ##t
 ragged-bottom = ##t
}


\score {	
  <<
 \new VaticanaStaff {\plainsong }
 \new ChoirStaff <<
 \new Staff = "upper" <<
 \context Voice = sopranos {\voiceOne \global \soprano }
 \context Voice = altos {\voiceTwo \global \alto }
                      >> 
 \new Staff = "lower" <<
 \context Voice = tenors {\voiceOne \global \tenor }
	\context Voice = bass {\voiceTwo \global \bass }
	              >>
		 >>	 
  >>

\layout {
	
  ragged-right = ##f
  ragged-last = ##f
  \context { \Score timing = ##f }
  \context { \Score \override TimeSignature #'transparent = ##t }
%% \context { \Score \override SystemStartBar #'stencil = ##f } %% uncomment this if you want to remove system start bar
 % \context { \Staff \override VerticalAxisGroup #'minimum-Y-extent = #'(-2 . 0) }
  \context { \Staff \override NoteHead #'duration-log = #1 }
  \context { \Staff \override Stem #'flag-style = #'no-flag }
  \context { \VaticanaStaff %%customize vaticana staff context 
	          \revert StaffSymbol #'color
		  \revert LedgerLineSpanner #'color
		  \override BarLine #'transparent = ##f 
		  \remove Custos_engraver
 	}
	
 }
}
 
%%%This next score block generates the midi, exluding the plainsong voice.
\score {	
 \new ChoirStaff <<
 \new Staff = "upper" <<
 \context Voice = sopranos {\voiceOne \global \soprano }
 \context Voice = altos {\voiceTwo \global \alto }
                      >> 
 \new Staff = "lower" <<
 \context Voice = tenors {\voiceOne \global \tenor }
	\context Voice = bass {\voiceTwo \global \bass }
	              >>
		 >>	  
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 80 8)
            }
       }
}

\markup {   \hspace #3  %% use \hspace or \halign to centre the 3-column group   
	  \override #'(line-width . 100)
	  \column { %% super column of everything
		  \line { \hspace #0.1     }	  
	 \fill-line { \smallCaps "Office Hymn. M."   \italic "c. 10th cent.  Tr. Charles Bigg." }
	 \override #'(baseline-skip . 2 ) %add a small amount of line spacing
	           { \column {  
	                 \line {\hspace #40 \small "Verbum supernum prodiens." }
	                 \line {"  " } }}
	 \line { %% Master Line - of 3 page columns 
	        \column { %%start page column 1		    
		    \column { %% stanza 1 is a column of 2 lines. Redundant if only 1 stanza
			  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "H" }   %%Drop Cap goes here
					 \hspace #-1    %% adjust this if other letters are too far from Drop Cap
				         \column  { \raise #0.0 "IGH Word of God, who once didst come," "  Leaving thy Father and thy home,"} }          	       
			 \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
					 \lower  #1.56  %%adjust this until the line spacing looks right
					\column {   
						"To succour by thy birth our kind,"
			 			"When, towards thy advent, time declined," }	}
			       
			           } %% finish stanza 1
				   
			\hspace #0.5 % adds vertical spacing between verses
			\line { "2  "
			    \column {
				    "Pour light upon us from above,"
				    "And fire our hearts with thy strong love,"
				    "That, as we hear thy Gospel read,"
				    "All fond desires may flee in dread;"
				} }
			  } %%finish page column 1
		           
	                   \hspace #4 %%adds horizontal space columns 1 and 2   
			   
			   \column { \filled-box #'(0.0 . 0.1) #'( -22 . -0) #0 }       %%Column 2. This is the line dviding the columns 1 and 3. 
			   	   
			   \hspace #4 %%adds horizontal space between columns 2 and 3
			   
			\column { %%start page column 3
			\line { "3  "
			    \column {
				    "That when thou comest from the skies,"
				    "Great Judge, to open thine assize,"
				    "To give each hidden sin its smart,"
				    "And crown as kings the pure in heart,"
				} }
			  						
			\hspace #0.5 % adds vertical spacing between verses
			\line { "4  "
				\column {
					"We be not set at thy left hand,"
					"Where sentence due would bid us stand,"
					"But with the Saints thy face may see,"
					"For ever wholly loving thee."
				} }	
			     } %% end page column 3 
	} % end master line	
	\column { \hspace #0.5
	     %%center column for last verse
			\line { \hspace #32 "5. "
			    \column {
"Praise to the Father and the Son,"
"Through all the ages as they run;"
"And to the holy Paraclete"
"Be praise with them and worship meet.    Amen."
				} }
			  		
	}
   } % super-column bracket
} %% end markup

\score {	
  <<
    <<
  \new VaticanaStaff <<
  \context VaticanaVoice = "plainsongamen"  {  \relative c' { 
	\set Score.timing = ##f
	\clef "vaticana-do3"
	\set fontSize = #3
	\override Staff.StaffSymbol #'staff-space = #1.6
	\overrideProperty #"Score.NonMusicalPaperColumn"
                                                #'line-break-system-details #'((Y-offset . 135)
                                                        (alignment-offsets . (0 -4.4 -8.6 -18)))
     \[ a8 \pes b8 \] 
     \[  \override NoteHead #'extra-offset = #'(0.0 . -0.2) a8 
         \override NoteHead #'extra-offset = #'(-0.38 . 0) \flexa  g8 \pes 
          \override NoteHead #'extra-offset = #'(0.02 . 0.0) a8 \] }}
                    >>
  
 \new Lyrics = "lyrics" { s1 }
 \new ChoirStaff
   <<
   \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -1) } 
                              << 
	\context Voice = "sopranos" { \relative c' { \override NoteHead #'duration-log = 1  	
	                                              \clef treble \global
	                                              \voiceOne b'8[ cis8] b8[ a8 b8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { \override NoteHead #'duration-log = 1  
	                                              \global
	                                              \voiceTwo \longnote fis4 \longnote d4. \bar "||" }}
	                      >>
			  
	
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -1) } 
	                      <<
	\context Voice = "tenors" { \relative c { \override NoteHead #'duration-log = 1  
		                                  \clef bass \global
	                                          \voiceThree d'8[ a8] g8[ fis8( fis8)]   \bar "||" }}
	\context Voice = "basses" { \relative c { \override NoteHead #'duration-log = 1  
	                                          \clef bass \global
						  \voiceFour b8[ fis'8] g8[ d8 b8]\bar "||" }}
			        >> 
   >>
  \context Lyrics = "lyrics" \lyricsto "altos" { \override LyricText #'font-size = #-1  A -- men. }
  >>
>>

\layout {
   % #(layout-set-staff-size 5)
     indent = 13\cm
     raggedright = ##t
     packed = ##f
     \context { \Score \override TimeSignature #'transparent = ##t }
     \context { \Score \override SeparationItem #'padding = #2 }	 
     \context { \Score \remove "Bar_number_engraver"
		timing = ##f 
     }
  \context { \VaticanaStaff %%customize vaticana staff context 
	          \revert StaffSymbol #'color
		  \revert LedgerLineSpanner #'color
		  \override BarLine #'transparent = ##f 
		  \remove Custos_engraver
 	} 
} 

%%Amen midi
%%Score comprises 1/8 notes masquerading as 1/2 notes, so tempo has to be adjusted accordingly
\midi {  
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 80 8)
            }
       }

}
 


} %book bracket
