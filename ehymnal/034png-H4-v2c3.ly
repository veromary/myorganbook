%%% 034.png
%%% Hymn 4 Luther's Hymn "Great God what do I see and hear!"
%%% Version 2  034png-H4-v2.ly Reset fonts

\version "2.10"

\header {
 dedication = \markup { \center-align { "THE CHRISTIAN YEAR - ADVENT"
		\hspace #0.1 }}	
 title = "4"
 meter = \markup { \column {  \line { \small \sans "LUTHER'S HYMN  (NUN FREUT"} 
		              \line { \hspace #2 \small \sans  "EUCH).  (8 7. 8 7. 8 8 7.)" } 
			      \line { \small { \italic "Slow" \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 "= 50." } } }}
 arranger = \markup { \center-align { \hspace #0.2 %insert blank line
		         \line { \small \italic "Present form of melody by"  }
			 \line { \small \smallCaps "Martin Luther, 1483-1546." } }}
 tagline =""
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%macros

%%%%%%%%%%%%%%%%%%%%%%%%macros

%%generates the breathmarks which are placed on top of barlines
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}	      

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
	
%%%%%%%%%%%%%%%%%%%%%%%%%%end of macro definitions


soprano = \relative c' { 
  \partial 2 \fdstartrepeat g'2 \bar "|" g2 b2 a2 g2 \bar "|" a2 a2  b2 ^\fermata \bar "||" 
      g2 \bar "|" b2 c2 d2 b2 \bar "|" \break
  \once \override NoteColumn #'force-hshift = #2 a1 g2 ^\fermata \fdendrepeat  b2 \bar "|" c2 b2 a2 g2 \bar "|" 
      fis2 g2 a2 ^\fermata \bar "||" b2 \bar "|" g2 fis2 g2 d2 \bar "|" \break
  g2 a2 b2 ^\fermata \bar "||" g2 \bar "|" 
      b2 c2 d2 b2 \bar "|" \once \override NoteColumn #'force-hshift = #2  a1 g2 ^\fermata \bar "||" 
}

alto = \relative c' {
   d2 \bar "|" d2 g2 fis2 g2 \bar "|" g2 fis2  g2  \bar "||" 
      d2 \bar "|" d2 g2 fis2 g2 \bar "|" 
  g2 ( fis2 ) g2 \breathmark \fdendrepeat     g2 \bar "|" g2 g2 fis2 e2 \bar "|" 
      dis2 e2 fis2  \bar "||" d!2 \bar "|" d2 c2 d2 d2 \bar "|" 
  b2 e2 dis2  \bar "||" e2 \bar "|" 
    fis2 e2 d2 g2 \bar "|" g2 ( fis2 ) g2  \bar "||" 
}

tenor = \relative c { \clef bass
   \fdstartrepeat b'2 \bar "|" g2 d'2 d2 b2 \bar "|" e2 d2  d2  \bar "||" 
      b2 \bar "|" d2 g,2 a2 g2 \bar "|" 
  e'2 ( d4 c4 ) b2 \fdendrepeat d2 \bar "|" e2 d2 d2 b2 \bar "|" 
      b2 b2 d!2  \bar "||" d2 \bar "|" b2 c2 b2 b4 ( a4 ) \bar "|" 
  g2 e2 fis2  \bar "||" g2 \bar "|" 
      fis2 g2 d'2 e2 \bar "|" e2 ( d4 c4 ) b2  \bar "||" 
}

bass = \relative c { \clef bass
   g2 \bar "|" b2 g2 d'2 e2 \bar "|" c2 d2  g,2 _\fermata \bar "||" 
      g'2 \bar "|" g2 e2 d2 e2 \bar "|" 
  c2 ( d2 ) g,2 _\fermata  \fdendrepeat  g'2 \bar "|" e2 g2 d2 e2 \bar "|" 
      b2 e2 d2 _\fermata \bar "||" g2 \bar "|" b2 a2 g2 g4 ( fis4 ) \bar "|" 
  e4 ( d4 ) c2 b2 _\fermata \bar "||" e2 \bar "|" 
     d2 c2 b2 e4 ( d4 ) \bar "|" c2 ( d2 ) g,2 _\fermata \bar "||" 
}

global = {
  \time 4/2 
  \key g \major 
}

#(ly:set-option 'point-and-click #f)

\paper {
 #(set-paper-size "a4")
 between-system-padding = 0\mm
 before-title-space = 0\mm
 after-title-space = 1\mm
 top-margin = 1\mm
 bottom-margin = 1\mm
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
	\context Voice = altos {\voiceTwo \global \alto }
	 >>
 
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \tenor }
	\context Voice = basses { \voiceTwo \global \bass }
			 >> 
 >>
\layout {
		indent=0
		\context { \Score timing = ##t }
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver" }
		\context { \Staff \consists "Mark_engraver" }
	}
} %%score bracket


\markup {  \hspace #16  %%add space as necc. to center the column
       \fill-line { 

          \column {
	%%next line is for attributions	  
	  \hspace #1
	  \line { \hspace #10 \small \italic {Anon. (1802), W. B. Collyer (1812), T. Cotterill (1819), and others.}}
	  \line { \hspace #2  \italic "Unison."}        
          \column {
		  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 " G" }   %%Drop Cap goes here
			 \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
			\column  { \raise #0.0 "REAT God, what do I see and hear!" " The end of things created:"} }          
	          \line { \hspace #2.7  %%adjust hspace until this line left edge is flush with Drop Cap
			\lower  #1.56  %%adjust this until the line spacing looks right
			\column {   
				"The Judge of mankind doth appear," 
				"    On clouds of glory seated;" 
				"The trumpet sounds, the graves restore" 
				"The dead which they contained before:" 
				"    Prepare, my soul, to meet him!"
			  		}}
	           } %% finish stanza 1

	   \hspace #0.1 % adds vertical spacing between verses
           \line { "2  "
             \column {	     
			 "The dead in Christ shall first arise" 
			 "    At that last trumpet's sounding," 
			 "Caught up to meet him in the skies," 
			 "    With joy their Lord surrounding;" 
			 "No gloomy fears their souls dismay;" 
			 "His presence sheds eternal day" 
			 "    On those prepared to meet him."  
	   }}	   
  } %% fill-line bracket
 }  %% column-bracket
} %% markup bracket
	   
%%fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
\score{
{ s4 }
\header { breakbefore = ##t piece = " " opus = " " }
\layout{
\context { \Staff
\remove Time_signature_engraver
\remove Key_engraver
\remove Clef_engraver
\remove Staff_symbol_engraver
}}}
	
%%second page	

\markup { \hspace #0.6   %%add space as necc. to center the column  
	 \fill-line { 
           \column {
            \line { "3  "
             \column { 
			 "The ungodly, filled with guilty fears," 
			 "    Behold his wrath prevailing;" 
			 "For they shall rise, and find their tears" 
			 "    And sighs are unavailing:" 
			 "The day of grace is past and gone;" 
			 "Trembling they stand before his throne," 
			 "    All unprepared to meet him."   
	   }}
	  \hspace #0.1 % adds vertical spacing between verses   
          \line { "4. "
             \column {	     
			 "Great Judge, to thee our prayers we pour," 
			 "    In deep abasement bending;" 
			 "O shield us through that last dread hour," 
			 "    Thy wondrous love extending." 
			 "May we, in this our trial day," 
			 "With faithful hearts thy word obey," 
			 "    And thus prepare to meet thee." 
	   }} 
	  }
    }	  
}

%%%%%%%%%%%%%%%% This next section of code is for
%%%%%%%%%%%%%%%% unfolding the repeats and generating the midi
%%%%%%%%%%%%%%%% Not needed for visual layout
                

\score { 
\new ChoirStaff 
<<

\new Staff = "soprano" {\relative c' {\clef treble \global  \set Staff.midiInstrument = "church organ"
  \unfoldRepeats  {\partial 2 \repeat volta 2 { g'2 \bar "|" g2 b2 a2 g2 \bar "|" a2 a2   b2 ^\fermata \bar "||" 
       g2 \bar "|" b2 c2 d2 b2 \bar "|" \break
  a1  g2 ^\fermata } }\bar "|"b2 \bar "|" c2 b2 a2 g2 \bar "|" 
      fis2 g2  a2 ^\fermata \bar "||" b2 \bar "|" g2 fis2 g2 d2 \bar "|" \break
  g2 a2  b2 ^\fermata \bar "||" g2 \bar "|" 
      b2 c2 d2 b2 \bar "|" a1  g2 ^\fermata \bar "||" 
}
}

\new Staff = "alto" {\relative c' {\clef treble \global  \set Staff.midiInstrument = "church organ"
  \unfoldRepeats {\repeat volta 2 { d2 \bar "|" d2 g2 fis2 g2 \bar "|" g2 fis2   g2 _\fermata \bar "||" 
      d2 \bar "|" d2 g2 fis2 g2 \bar "|" 
  g2 ( fis2 )  g2 _\fermata } } \bar "|"g2 \bar "|" g2 g2 fis2 e2 \bar "|" 
      dis2 e2  fis2 _\fermata \bar "||" d!2 \bar "|" d2 c2 d2 d2 \bar "|" 
  b2 e2  dis2 _\fermata \bar "||" e2 \bar "|" 
    fis2 e2 d2 g2 \bar "|" g2 ( fis2 )  g2 _\fermata \bar "||" 
}	
}

\new Staff = "tenor" { \relative c {\clef bass \global  \set Staff.midiInstrument = "church organ"
  \unfoldRepeats {\repeat volta 2 { b'2 \bar "|" g2 d'2 d2 b2 \bar "|" e2 d2   d2 ^\fermata \bar "||" 
       b2 \bar "|" d2 g,2 a2 g2 \bar "|" 
  e'2 ( d4 c4 )  b2 ^\fermata } } \bar "|"d2 \bar "|" e2 d2 d2 b2 \bar "|" 
      b2 b2  d!2 ^\fermata \bar "||" d2 \bar "|" b2 c2 b2 b4 ( a4 ) \bar "|" 
  g2 e2  fis2 ^\fermata \bar "||" g2 \bar "|" 
      fis2 g2 d'2 e2 \bar "|" e2 ( d4 c4 )  b2 ^\fermata \bar "||"
} 
}


\new Staff = "bass" { \relative c { \clef bass \global  \set Staff.midiInstrument = "church organ"
  \unfoldRepeats {\repeat volta 2 { g2 \bar "|" b2 g2 d'2 e2 \bar "|" c2 d2   g,2 _\fermata \bar "||" 
       g'2 \bar "|" g2 e2 d2 e2 \bar "|" 
  c2 ( d2 )  g,2 _\fermata } } \bar "|"g'2 \bar "|" e2 g2 d2 e2 \bar "|" 
      b2 e2  d2 _\fermata \bar "||" g2 \bar "|" b2 a2 g2 g4 ( fis4 ) \bar "|" 
  e4 ( d4 ) c2  b2 _\fermata \bar "||" e2 \bar "|" 
     d2 c2 b2 e4 ( d4 ) \bar "|" c2 ( d2 )   g,2 _\fermata \bar "||"  
}
}


>>

\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 50 2)
            }
       }
} %% midi score bracket


%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                     << 
	\context Voice = "sopranos" { \relative c' { \set Staff.midiInstrument = "church organ"
	                              \clef treble \global \voiceOne g'1 g1 \bar "||" }}
	\context Voice = "altos"    { \relative c' { \set Staff.midiInstrument = "church organ"
	                              \clef treble \global \voiceTwo e1 d1 \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                        <<
	\context Voice = "tenors" { \relative c { \set Staff.midiInstrument = "church organ"
	                                          \clef bass \global \voiceThree c'1 b1 \bar "||" }}
	\context Voice = "basses" { \relative c { \set Staff.midiInstrument = "church organ"
	                                          \clef bass \global \voiceFour  c1 g1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 50 2) }}  %%Amen midi 

} 	


} %% book bracket