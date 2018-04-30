%%% 038-39.png
%%%Hymn 7 Helmsley "Lo! he comes with clouds descending"
%%% Version 2 Fonts reset

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - ADVENT"
		\hspace #0.1 }}	
  title = "7"
  poet = \markup { \small {  \line { \sans "HELMSLEY." \hspace #1 \roman "(8 7. 8 7. 4 7.)"} } }
  meter = \markup { \small { \italic {Moderately slow, very dignified} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 69.} }
  arranger =  \markup { \small \italic "English Melody of the 18th century."}
  tagline =""
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%macros

%%prints a repeat sign glyph comprising 4 dots and two thin bars
fdendrepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
	\once \override Staff.BarLine #'text = \markup  {  \line { \raise #1.4 \override #'(baseline-skip . 1.0)  \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
	                                                  \hspace #-1 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
							  \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
	
	} }	
        \bar "||"} 

%%prints a repeat sign glyph comprising 4 dots. Used only to begin a repeat at the start of a piece where \bar ":" does not work	
fdstartrepeat =  {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
	          \once \override Staff.BarLine #'text = \markup  { \line { \hspace #0 \override #'(baseline-skip . 1.0) 
	                                                 \raise #1.4 \column { \with-color #black { 
							                \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
	          } }	
                 \bar "|:"}




%%generates the percent sign used to indicate a repeat e.g. of lyrics
percentRepeat = \mark \markup { 
                          \fontsize #-2 { \rotate #'-31 ":" }  
                          {\fontsize #-5 \translate #(cons -1.2 0.4 ) \musicglyph #"noteheads.s2slash"} 
                          {\fontsize #-5 \translate #(cons -1.2 0.4 ) \musicglyph #"noteheads.s2slash"}  
                           \fontsize #-2  {\translate #(cons -1 -0.1 ) \rotate #'-30 ":" } 
                        }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% end of macro definitions

soprano = \relative c' { 
  \fdstartrepeat g'1 b2 ( d2 ) \bar "|" g,2 ( fis2 ) e2 ( d2 ) \bar "|" 
      e2. ( fis4 g2 ) fis4 ( e4 ) )\bar "|" d2. ( c4 ) b1 \bar "||" \break
  d1. d2 \bar "|" g1 \once \override NoteColumn #'force-hshift = #0.45 a1 \bar "|" 
      b2 ( d2 ) c2 ( b2 ) \bar "|" b1 ( a2 ) b2\rest \fdendrepeat \break
  a2. ( b4 a2 ) b2 \bar "|" c1 b1\percentRepeat \bar "|" 
      g2. ( a4 g2 ) c2  \bar "|" b2 ( a2 ) g1 \percentRepeat \bar "|" b2. ( c4 b2 ) d2 \bar "|" \break
  c2 ( b2 ) \once \override NoteColumn #'force-hshift = #1.6 a1 \bar "||" g1. a4 ( b4 ) \bar "|" 
      d,1 c'1 \bar "|" b1 a1 \bar "|" g\breve \bar "||" 
}

alto = \relative c' {
  \fdstartrepeat d1 d1 \bar "|" b2 ( d2 ) c2 ( d2 ) \bar "|" 
      c2. ( d4 e2 ) d4 ( c4 ) \bar "|" a1 g1 \bar "||" 
  a1. d2 \bar "|" d1 e2 ( fis2 ) \bar "|" 
      g2 ( b2 ) a2 ( g2 ) \bar "|" g1 ( fis2 ) s2 \fdendrepeat
  fis2. ( g4 fis2 ) d2 \bar "|" e2 ( fis2 ) g1 \bar "|" 
      d1 ( e2 ) e2 \bar "|" g2 ( fis2 ) e1 \bar "|" e1. d2 \bar "|" 
  fis2 ( g2 ) g2 ( fis2 ) \bar "||" d1. d2 \bar "|" 
      \once \override NoteColumn #'force-hshift = #-0.02 d1 g1 \bar "|" g1 fis1 \bar "|" g\breve \bar "||" 
}

tenor = \relative c { \clef bass
  \fdstartrepeat b'1 b2 ( a2 ) \bar "|" g2 ( b2 ) g4 ( a4 b2 ) \bar "|" 
      g1. g2 \bar "|" fis1 g1 \bar "||" 
  fis2 ( g2 fis2 ) fis2 \bar "|" g1 c1 \bar "|" 
      b1 e1 \bar "|" d1. d,2\rest \fdendrepeat
  d'1. d2 \bar "|" c1 d1 \bar "|" 
      b2. ( a4 b2 ) c2 \bar "|" d2. ( c4 ) b1 \bar "|" g2. ( a4 g2 ) g2 \bar "|"  
  a2 ( b4 c4 ) d1 \bar "||" b1. b2 \bar "|" 
      a1 g2 ( a2 ) \bar "|" b2 ( c2 ) d2 ( c2 ) \bar "|" b\breve  \bar "||" 
}

bass = \relative c { \clef bass
  \fdstartrepeat g'1 g2 ( fis2 ) \bar "|" e2 ( b2 ) c2 ( g2 ) \bar "|" 
      c1. c2 \bar "|" d1 g,1 \bar "||" 
  d'2 ( e2 d2 ) c2 \bar "|" b1 a1 \bar "|" 
      g1 c1 \bar "|" d1. s2 \fdendrepeat
  d1. b2 \bar "|" a1 g1 \bar "|" 
      g'2. ( fis4 e2 ) a,2 \bar "|" b4 ( c4 d2 ) e1 \bar "|" \once \override NoteColumn #'force-hshift = #0.2 e1. b2 \bar "|" 
  a2 ( g2 ) d'1 \bar "||" g1. g2 \bar "|" fis1 \once \override NoteColumn #'force-hshift = #0.7 e1 \bar "|" d1 d1 \bar "|" g,\breve \bar "||"
}
  
global = {
  \time 4/2 
  \key g \major 
   \set Staff.midiInstrument = "church organ"
}

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
  top-margin = 3\mm
  bottom-margin = 5\mm
  print-page-number = ##f
  between-system-space = #0.1
  ragged-last-bottom = ##t
  ragged-bottom = ##t
}

\book{

\score{
\new ChoirStaff	
 <<

	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \soprano }
	\context Voice = altos    {\voiceTwo \global \alto }
	                      >>
        
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \tenor }
	\context Voice = basses { \voiceTwo \global \bass }
			        >> 
			      

 >>
\layout {
		indent=0
		\context { \Score timing = ##f }
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	}

} %%score bracket

\markup { \small {\hspace #34 "[" \italic "May be sung in unison throughout." "]" } }

\markup { \small { \hspace #26 \italic "This hymn is sometimes sung to " \hspace #-1.2 \smallCaps "St. Thomas"  \italic "(No. 623)."} }

%%fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
\score{
{ s4 }
\header { breakbefore = ##f piece = ##f opus = ##f }
\layout{
\context { \Staff
	\remove Time_signature_engraver
	\remove Key_engraver
	\remove Clef_engraver
	\remove Staff_symbol_engraver
}}}

\markup {  \hspace #2.4  %%add space as necc. to center the column
       \fill-line { 

          \column {
	%%next line is for attributions	  
	  \hspace #1
	  \line { \hspace #26 \small \italic {"C. Wesley (1758) and J. Cennick (1750)."}}
	  \hspace #0.2          
          \column {
		  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "L" }   %%Drop Cap goes here
			 \hspace #-2.0    %% adjust this if other letters are too far from Drop Cap
			\column  { \raise #0.0 "O! he comes with clouds descending," 
 	                                       "    Once for favoured sinners slain;"  } }          
	          \line { \hspace #2.7  %%adjust hspace until this line left edge is flush with Drop Cap
			\lower  #1.56  %%adjust this until the line spacing looks right
			\column {   
				"Thousand thousand Saints attending" 
				"    Swell the triumph of his train:" 
				"              Alleluya!" 
				"    God appears, on earth to reign." 
			  		}}
	           } %% finish stanza 1

	   \hspace #0.1 % adds vertical spacing between verses
           \line { "2  "
             \column {	     
		     "Every eye shall now behold him" 
		     "    Robed in dreadful majesty;" 
		     "Those who set at nought and sold him," 
		     "    Pierced and nailed him to the tree," 
		     "              Deeply wailing" 
		     "    Shall the true Messiah see."    
	   }}
	   \hspace #0.1 % adds vertical spacing between verses
           \line { "3  "
             \column {	     
		     "Those dear tokens of his passion" 
		     "    Still his dazzling body bears," 
		     "Cause of endless exultation" 
		     "    To his ransomed worshippers:" 
		     "              With what rapture" 
		     "    Gaze we on those glorious scars!" 	   
	   }}
	   \hspace #0.1 % adds vertical spacing between verses
           \line { \hspace #-10.9 \italic "Unison." "   4. "
             \column {    
		     "Yea, amen! let all adore thee," 
		     "    High on thine eternal throne;" 
		     "Saviour, take the power and glory:" 
		     "    Claim the kingdom for thine own:" 
		     "              O come quickly!" 
		     "    Alleluya! Come, Lord, come!" 
 	   }}
	  }
           }
} % stanza markup bracket	   


%%%%%%%%%%%%%%%% This next section of code is for
%%%%%%%%%%%%%%%% unfolding the repeats and generating the midi
%%%%%%%%%%%%%%%% Not needed for visual layout
                
\score { 
\new ChoirStaff 
<<

\new Staff = "soprano" {\relative c' {\clef treble \global  
  \unfoldRepeats  {   \repeat volta 2 { g'1 b2 ( d2 ) \bar "|" g,2 ( fis2 ) e2 ( d2 ) \bar "|" 
      e2. ( fis4 g2 ) fis4 ( e4 ) )\bar "|" d2. ( c4 ) b1 \bar "||" \break
  d1. d2 \bar "|" g1 \once \override NoteColumn #'force-hshift = #0.45 a1 \bar "|" 
      b2 ( d2 ) c2 ( b2 ) \bar "|" b1 ( a2 ) b2\rest } } \break
  a2. ( b4 a2 ) b2 \bar "|" c1 b1 \bar "|" 
      g2. ( a4 g2 ) c2 \bar "|" b2 ( a2 ) g1 \bar "|" b2. ( c4 b2 ) d2 \bar "|" \break
  c2 ( b2 ) \once \override NoteColumn #'force-hshift = #1.6 a1 \bar "||" g1. a4 ( b4 ) \bar "|" 
      d,1 c'1 \bar "|" b1 a1 \bar "|" g\breve \bar "||" 

}
}

\new Staff = "alto" {\relative c' {\clef treble \global  
  \unfoldRepeats {   \repeat volta 2 { d1 d1 \bar "|" b2 ( d2 ) c2 ( d2 ) \bar "|" 
      c2. ( d4 e2 ) d4 ( c4 ) \bar "|" a1 g1 \bar "||" 
  a1. d2 \bar "|" d1 e2 ( fis2 ) \bar "|" 
      g2 ( b2 ) a2 ( g2 ) \bar "|" g1 ( fis2 ) s2 } }
  fis2. ( g4 fis2 ) d2 \bar "|" e2 ( fis2 ) g1 \bar "|" 
      d1 ( e2 ) e2 \bar "|" g2 ( fis2 ) e1 \bar "|" e1. d2 \bar "|" 
  fis2 ( g2 ) g2 ( fis2 ) \bar "||" d1. d2 \bar "|" 
      \once \override NoteColumn #'force-hshift = #-0.02 d1 g1 \bar "|" g1 fis1 \bar "|" g\breve \bar "||" 

}	
}

\new Staff = "tenor" { \relative c {\clef bass \global 
  \unfoldRepeats {   \repeat volta 2 { b'1 b2 ( a2 ) \bar "|" g2 ( b2 ) g4 ( a4 b2 ) \bar "|" 
      g1. g2 \bar "|" fis1 g1 \bar "||" 
  fis2 ( g2 fis2 ) fis2 \bar "|" g1 c1 \bar "|" 
      b1 e1 \bar "|" d1. d,2\rest } }
  d'1. d2 \bar "|" c1 d1 \bar "|" 
      b2. ( a4 b2 ) c2 \bar "|" d2. ( c4 ) b1 \bar "|" g2. ( a4 g2 ) g2 \bar "|"  
  a2 ( b4 c4 ) d1 \bar "||" b1. b2 \bar "|" 
      a1 g2 ( a2 ) \bar "|" b2 ( c2 ) d2 ( c2 ) \bar "|" b\breve  \bar "||" 

} 
}

\new Staff = "bass" { \relative c { \clef bass \global  
  \unfoldRepeats {   \repeat volta 2 { g'1 g2 ( fis2 ) \bar "|" e2 ( b2 ) c2 ( g2 ) \bar "|" 
      c1. c2 \bar "|" d1 g,1 \bar "||" 
  d'2 ( e2 d2 ) c2 \bar "|" b1 a1 \bar "|" 
      g1 c1 \bar "|" d1. s2 } }
  d1. b2 \bar "|" a1 g1 \bar "|" 
      g'2. ( fis4 e2 ) a,2 \bar "|" b4 ( c4 d2 ) e1 \bar "|" \once \override NoteColumn #'force-hshift = #0.2 e1. b2 \bar "|" 
  a2 ( g2 ) d'1 \bar "||" g1. g2 \bar "|" fis1 \once \override NoteColumn #'force-hshift = #0.7 e1 \bar "|" d1 d1 \bar "|" g,\breve \bar "||"
}
}

>>

\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 69 2)
            }
       }
} %% midi score bracket


%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }
	                     <<
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne g'1 g1 \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo e1 d1 \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree c'1 b1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  c1 g1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 69 2) }}  %%Amen midi 

} 	
	

} %% book bracket