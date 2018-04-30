%%%100.png
%%%Hymn 46 Tallis' Ordinal. In stature grows the heavenly Child
%%%Version 2

\version "2.10"

\header {
	dedication = \markup { \center-align { \line {  "THE CHRISTIAN YEAR - FROM EPIPHANY TILL SEPTUAGESIMA" } 
					       \hspace #1
						} }	
  title = "46" 
			       
  arranger = \markup { \small { \smallCaps "T. Tallis," \italic "c. 1515-85."} }
  poet = \markup { \small { \sans  "TALLIS' ORDINAL." \smallCaps "('9th tune')."  \hspace #1 \roman { "(C. M.)"} } }
  meter = \markup { \small { \italic {Moderately slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 66.} }
  tagline = ""
}

%%generates the breathmarks
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}


soprano = \relative c' {
  \partial 2 d2 | fis2 g2 a2 a2 | b2 b2 a2 \breathmark \bar "||" a2 | d2 cis2 b2 b2 | a1. \breathmark \bar "||" \break
  d,2 | fis2 g2 a2 a2 | b2 b2 a2 \breathmark \bar "||" d,2 | g2 fis2 e2 e2 | \once \override Dots #'transparent = ##t d1. \bar "||"
}

alto = \relative c' {
  d2 | d2 d2 e2 fis2 | g2 g2 fis2 \bar "||" fis2 | fis2 e2 e2 e2 | cis1. \bar "||"
  d2 | d2 d2 cis2 a2 | d2 d2 d2 \bar "||" d2 | d2 d2 d2 cis2 | \once \override NoteColumn #'force-hshift = #-0.01 d1. \bar "||"
}

tenor = \relative c { \clef bass
  fis2 | a2 b2 cis2 a2 | d2 d2 d2 \bar "||" d,2 | fis2 a2 a2 gis2 | a1. \bar "||"
  fis2 | a2 d,2 e2 fis2 | g2 g2 fis2 \bar "||" fis2 | b2 a2 a2 a2 | fis1. \bar "||"
}

bass = \relative c { \clef bass
  d2 | d2 b2 a2 d2 | g,2 g2 d'2 \bar "||" d2 | d2 a2 e'2 e2 | a,1. \bar "||"
  d2 | d2 b2 a2 d2 | g,2 g2 d'2 \bar "||" d2 | g,2 d'2 a2 a2 | d1. \bar "||"
}

global = {
  \time 4/2
  \key d \major 
  \set Staff.midiInstrument = "church organ"
}

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  print-page-number = ##f
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
%		\context { \Score timing = ##f }
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	}

\midi { 
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2) }
       }	
} %%score bracket


\markup { \hspace #5 %%add space as necc. to center the column
          \column { %% super column of everything
		  \line { \hspace #55 \small \italic "J.-B. de Santeüil, 1630-97.  Tr. J. Chandler."  }   
		  \hspace #1
		  \line { \hspace #36 \small "Divine crescebas Puer." }
	                \line { %% a master line of 3 columns
              \column { %% column 1
	      \hspace #0.2 % adds vertical spacing between verses
	        \column { %%stanza 1 is a column of 2 lines  
	          \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "I" }   %%Drop Cap goes here
			 \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
			\column  { \raise #0.0 "N stature grows the heavenly Child," "  With death before his eyes;" } }          
	          \line { \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
			\lower  #1.56  %%adjust this until the line spacing looks right
			\column {   
				"A Lamb unblemished, meek and mild,"
				"    Prepared for sacrifice."
			  		}}
	          } %% finish stanza 1
		  
	         \hspace #0.2 % adds vertical spacing between verses
                 \line { "2  "
                    \column {	     
			    "The Son of God his glory hides"
			    "    With parents mean and poor;"
			    "And he who made the heaven abides"
			    "    In dwelling-place obscure." 
	         }}
	}  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -26 . -1) #0 }       %%Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3
	   
	\column { %%start page column 3		
 
	   \hspace #0.2 % adds vertical spacing between verses
	   \line { "3  "
             \column { 
		     "Those mighty hands that stay the sky"
		     "    No earthly toil refuse;"
		     "And he who set the stars on high"
		     "    An humble trade pursues."  
	   }}
	    \hspace #0.2 % adds vertical spacing between verses
           \line { "4  "
             \column {    
		     "He before whom the angels stand,"
		     "    At whose behest they fly,"
		     "Now yields himself to man's command,"
		     "    And lays his glory by."
	   }}   
	  } %% end column 3
	  } %% master line bracket
\column { \hspace #0.2
	  \line { \hspace #30 "5. "
             \column {    
		     "Jesu, the Virgin's holy Son,"
		     "    We praise thee and adore,"
		     "Who art with God the Father one,"
		     "    And Spirit evermore.  Amen."
	   }}   
}
	  } %% page super column bracket
} %% markup bracket




%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne d1 d1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo b1 a1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree g'1 fis1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  g1 d'1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2) }}  %%Amen midi       
       
}  

} %%book bracket