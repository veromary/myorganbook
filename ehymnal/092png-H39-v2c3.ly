%%% 092.png
%%%Hymn 39 Dix "As with Gladness Men of Old"
%%% Version 2 Reset fonts

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - THE EPIPHANY"
		\hspace #0.1 }}	
  title = "39"
  meter = \markup { \small { \column {  \line { \sans {"DIX."} \hspace #1 \roman {"(7 7. 7 7. 7 7.)"}} 	          
	  \line { \italic {In moderate time} \fontsize #-5 \general-align #Y #DOWN \note #"4" #1 = 96.} } } }
  arranger = \markup { \small { \center-align { 
		 \line{ \italic {"Abridged from a Chorale, 'Treuer Heiland,'" } }
                 \line { \italic "by" \smallCaps "C. Kocher, 1786-1872."}}}}
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% end of macro definitions


global = {
 \time 4/4
 \key g\major 
 \set Staff.midiInstrument = "church organ" 
}


soprano = \relative c' { 
  \fdstartrepeat g'4 fis8 g8 a4 g4 | c4 c4 b2 \bar "||" e,4 fis4 g4 e4 | d4 d4 d2 \fdendrepeat |  \break
  b'4 a4 g4 b4 | d4. c8 b2 \bar "||" e,4 fis4 g4 c4 | b4 a4 g2 \bar "||"
}


alto = \relative c' {
  \fdstartrepeat d4 d4 d4 d4 | c4 d4 d2 \bar "||" e4 d4 d4 c4 | b4 a4 b2 \fdendrepeat | 
  d4 d4 d4 d4 | d4 d4 d2 | e4 d4 d4 c4 | d4. c8 b2 \bar "||"
}


tenor = \relative c { \clef bass
  \fdstartrepeat b'4 c8 b8 a4 b4 | g4 a4 g2 \bar "||" g4 a4 g4 g4 | g4 fis4 g2 \fdendrepeat | 
  g4 d'8 c8 b4 g4 | a4 fis4 g2 | g4 a4 g4 g4 | g4 fis4 g2 \bar "||"
}


bass = \relative c { \clef bass
  \fdstartrepeat g'4 a8 g8 fis4 g4 | e4 fis4 g2 \bar "||" c,4 c4 b4 c4 | d4 d4 g,2 \fdendrepeat | 
  g'4 fis4 g4 g4 | fis4 d4 g2 | c,4 c4 b4 e4 | d4 d4 g,2 \bar "||"
}


#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
  top-margin = 2\mm
  bottom-margin = 3\mm
  print-page-number = ##f
  between-system-space = #2
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
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	}
	
} %%score bracket


\markup { \hspace #4   %%add space as necc. to center the column
          \column { %% super column of everything
	    \line { \hspace #60 \small \italic {W. Chatterton Dix, 1837-98.}}
	    \line { %% a master line of 3 columns
              \column { %% column 1
	      \hspace #0.2 % adds vertical spacing between verses
          \column {
		  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "A" }   %%Drop Cap goes here
			 \hspace #-1.4    %% adjust this if other letters are too far from Drop Cap
			\column  { \raise #0.0 "S with gladness men of old" "  Did the guiding star behold," } }          
	          \line { \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
			\lower  #1.56  %%adjust this until the line spacing looks right
			\column {   
				"As with joy they hailed its light,"
				"Leading onward, beaming bright,"
				"So, most gracious God, may we"
				"Evermore be led to thee."
			  		}}
	           } %% finish stanza 1
		  
		   \hspace #0.2 % adds vertical spacing between verses
		   \line { "2  "
		       \column {	     
			       "As with joyful steps they sped,"
			       "To that lowly manger-bed,"
			       "There to bend the knee before"
			       "Him whom heaven and earth adore,"
			       "So may we with willing feet"
			       "Ever seek thy mercy-seat."
		   }}
		       }  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -37 . -1) #0 }       %%Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3
	   
	\column { %%start page column 3		
		\hspace #0.1 % adds vertical spacing between verses
		\line { "3  "
		    \column {	     
			    "As they offered gifts most rare"
			    "At that manger rude and bare,"
			    "So may we with holy joy,"
			    "Pure, and free from sin's alloy,"
			    "All our costliest treasures bring,"
			    "Christ, to thee our heavenly King."	   
	   }} 
	   	\hspace #0.1 % adds vertical spacing between verses
		\line { "4  "
		    \column {    
			    "Holy Jesu, every day"
			    "Keep us in the narrow way;"
			    "And, when earthly things are past,"
			    "Bring our ransomed souls at last"
			    "Where they need no star to guide,"
			    "Where no clouds thy glory hide."
 	   }}  
  
	  } %% end column 3
	  } %% master line bracket
	  
	  \hspace #0.2
	  \line { \hspace #26 "5. "
             \column {    
		     "In the heavenly country bright"
		     "Need they no created light;"
		     "Thou its Light, its Joy, its Crown,"
		     "Thou its Sun which goes not down:"
		     "There for ever may we sing"
		     "Alleluyas to our King."
 	   }} %% end last stanza
          } %% page super column bracket
} %%markup bracket



%%%%%%%%%%%%%%%% This next section of code is for
%%%%%%%%%%%%%%%% unfolding the repeats and generating the midi
%%%%%%%%%%%%%%%% Not needed for visual layout
                

\score { 
\new ChoirStaff 
<<

\new Staff = "soprano" {\relative c' {\clef treble \global  \set Staff.midiInstrument = "church organ"
  \unfoldRepeats  { \repeat volta 2 {g'4 fis8 g8 a4 g4 | c4 c4 b2 \bar "||" e,4 fis4 g4 e4 | d4 d4 d2 | }} \break
  b'4 a4 g4 b4 | d4. c8 b2 \bar "||" e,4 fis4 g4 c4 | b4 a4 g2 \bar "||"
}
}

\new Staff = "alto" {\relative c' {\clef treble \global  \set Staff.midiInstrument = "church organ"
  \unfoldRepeats {  \repeat volta 2 { d4 d4 d4 d4 | c4 d4 d2 \bar "||" e4 d4 d4 c4 | b4 a4 b2 | }}
  d4 d4 d4 d4 | d4 d4 d2 | e4 d4 d4 c4 | d4. c8 b2 \bar "||"
}	
}

\new Staff = "tenor" { \relative c {\clef bass \global  \set Staff.midiInstrument = "church organ"
  \unfoldRepeats { \repeat volta 2 { b'4 c8 b8 a4 b4 | g4 a4 g2 \bar "||" g4 a4 g4 g4 | g4 fis4 g2 | } }
  g4 d'8 c8 b4 g4 | a4 fis4 g2 | g4 a4 g4 g4 | g4 fis4 g2 \bar "||"
} 
}


\new Staff = "bass" { \relative c { \clef bass \global  \set Staff.midiInstrument = "church organ"
  \unfoldRepeats { \repeat volta 2 { g'4 a8 g8 fis4 g4 | e4 fis4 g2 \bar "||" c,4 c4 b4 c4 | d4 d4 g,2 | } }
  g'4 fis4 g4 g4 | fis4 d4 g2 | c,4 c4 b4 e4 | d4 d4 g,2 \bar "||"
}
}


>>
	
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 96 4)
            }
       }

} %% midi score bracket

%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                     << 
	\context Voice = "sopranos" { \relative c' { \time 4/2 \key g\major \set Staff.midiInstrument = "church organ" 
		                                     \voiceOne g'1 g1 \bar "||"
 }}
	\context Voice = "altos"    { \relative c' { \time 4/2 \key g\major \set Staff.midiInstrument = "church organ" 
		                                      \voiceTwo c1 b1 \bar "||"
 }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \time 4/2 \key g\major \set Staff.midiInstrument = "church organ" 
		                                  \clef bass \voiceThree e1 d1 \bar "||"
 }}
	\context Voice = "basses" { \relative c { \time 4/2 \key g\major \set Staff.midiInstrument = "church organ" 
	                                           \clef bass \voiceFour  c1 g1 \bar "||"
 }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }
       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 96 4) }}  %%Amen midi 

} 	
	

} %% book bracket