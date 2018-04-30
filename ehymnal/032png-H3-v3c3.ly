%%% 032.png
%%% Hymn 3 Second Mode Melody "Behold the Bridegroom cometh"
%%% Version 3 fonts reset 


\version "2.10"


\header {
	dedication = \markup { \center-align { "THE CHRISTIAN YEAR - ADVENT"
		                              \hspace #0.1
	                     }}				     
	title="3"
	poet = \markup { \small {\sans "SECOND MODE MELODY." \hspace #1 \roman  (D. C. M.) }}
	meter = \markup { \small { \italic {"Moderately slow, dignified" \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 "= 69."} } }
	arranger = \markup { \small { \smallCaps "T. Tallis," \italic " c." "1515-1585."}}
	tagline = ""
}


global = {
 \time 4/2 
 \key g \major
 \set Staff.midiInstrument = "church organ"
}


%%generates the breathmarks above barlines
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}

%%make explicit accidentals transparent (they show up when timing is turned off
noacci = \once \override Accidental #'transparent = ##t


soprano = \relative c' { \once \override Staff.TimeSignature #'stencil = ##f
  e1 \bar "|" e2 fis2 g2 e2 \bar "|" fis2. fis4 e2 e2 \bar "|" d2 e2 fis2 fis2 \bar "|" e1. \bar "||" \break
  e2 \bar "|" a2 b2 c2 a2 \bar "|" b2 b2 a2 a2 \bar "|" g2 a2 b2 b2 \bar "|" a1. \breathmark \bar "||" \break
  d,2 \bar "|" g2 a2 b2 g2 \bar "|" a2 a2 g2 g2 \bar "|" \once \override Accidental #'transparent = ##t fis2 g2 a2 a2 \bar "|" g1. \bar "||" \break
  g2 \bar "|" fis2 g2 a2 fis2 \bar "|" g2 g2 fis2 e2 \bar "|" \time 3/1 e2 d2 e1 fis1 \bar "|" e1 \bar "||" 
}

alto = \relative c' {
  b1 \bar "|" b2 d2 d2 b2 \bar "|" d2 d2 c2 c2 \bar "|" b2 e2 e2 d2 \bar "|" 
      \once \override Dots #'transparent = ##t 
      \once \override NoteColumn #'force-hshift = #-0.05 e1. \bar "||"
  e2 \bar "|" e2 g2 g2 e2 \bar "|" g2 g2 f2 f2 \bar "|" e2 c2 e2 e2 \bar "|" c1. \bar "||"
  d2 \bar "|" b2 d2 d2 d2 \bar "|" e2 d2 b2 d2 \bar "|" d2 b2 d2. c4 \bar "|" b1. \bar "||"
  b2 \bar "|" d2 e2 e2 d2 \bar "|" d2 d2 d2 c \bar "|" c2 b2 c1 d1 \bar "|" \override NoteColumn #'force-hshift = #-0.05 e1 \bar "||"
}

tenor = \relative c { \clef bass \once \override Staff.TimeSignature #'stencil = ##f
  g'1 \bar "|" g2 a2 g2 g2 \bar "|" b2 a2 g2 g2 \bar "|" g2 g2 b2 b2 \bar "|" g1. \bar "||"
  b2 \bar "|" c d2 c2 c2 \bar "|" e2 d2 c2 c2 \bar "|" c2 a2 a2 g2 \bar "|" a1. \bar "||"
  g2 \bar "|" g2 \noacci fis2 g2 g2 \bar "|" c2 fis,2 g2 g2 \bar "|" a2 g2 g2 fis2 \bar "|" g1. \bar "||"
  g2 \bar "|" b2 b2 c a2 \bar "|" b2 b2 b2 g2 \bar "|" g2 g2 g1 b2( a2) \bar "|" g1 \bar "||"
}

bass = \relative c { \clef bass
  e1 \bar "|" e2 d2 b2 e2 \bar "|" b2 b2 c2 c2 \bar "|" g2 c2 b2 b2 \bar "|" e1. \bar "||"
  g2 \bar "|" a2 g2 e2 a2 \bar "|" e2 e2 f2 f2 \bar "|" c2 f!2 e2 e2 \bar "|" a,1. \bar "||"
  b2 \bar "|" e2 d2 g,2 b2 \bar "|" c d2 e2 b2 \bar "|" d2 e2 d2 d2 \bar "|" g,1. \bar "||"
  e'2 \bar "|" b2 e2 a,2 d2 \bar "|" g,2 g2 b2 c2 \bar "|" c2 g2 c1 b1 \bar "|" 
 
 <<  { \voiceTwo e1 } 
    \new Voice {\once \override NoteColumn #'force-hshift = #0.1 \voiceFour \set fontSize = #-3 e,1 }  >> \bar "||"

}


#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
  top-margin = 2\mm
  bottom-margin = 3\mm
  between-system-padding = 2\mm
  before-title-space = 0\mm
  after-title-space = 1.5\mm
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
%		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	}
	
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 69 2)
            }
       }	
}

\markup {  \hspace #2.4  %%add space as necc. to center the column
       \fill-line { 

          \column {
	%%next line is for attributions	  
	  \hspace #1
	  	  \line { \hspace #36 \small \italic "Horologion.  c. 8th cent.  Tr. G. Moultrie."}
		  \hspace #0.2
		  \line { \small {\hspace #20 "Ἰδοὺ ὀ Νυμφἱος ἔρΧεται.  [Idou o Numphios erchetai.]"} }
	  \hspace #0.2          
          \column {
		  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "B" }   %%Drop Cap goes here
			 \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
			\column  { \raise #0.0 "EHOLD the Bridegroom cometh in the middle of the night,"
                                               "  And blest is he whose loins are girt, whose lamp is burning bright;" } }          
	          \line { \hspace #2.7  %%adjust hspace until this line left edge is flush with Drop Cap
			\lower  #1.56  %%adjust this until the line spacing looks right
			\column {   
				"But woe to that dull servant, whom the Master shall surprise"
				"With lamp untrimmed, unburning, and with slumber in his eyes."
			  		}}
	           } %% finish stanza 1

	   \hspace #0.1 % adds vertical spacing between verses
           \line { "2  "
             \column {	     
		     	"Do thou, my soul, beware, beware, lest thou in sleep sink down,"
			"Lest thou be given o'er to death, and lose the golden crown;"
			"But see that thou be sober, with a watchful eye, and thus"
			"Cry—'Holy, holy, holy God, have mercy upon us.' "
	   }}

	  }
      } 
}   

%%fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
\score{
{ s4 }
\header { breakbefore = ##f piece = " " opus = " " }
\layout{
\context { \Staff
\remove Time_signature_engraver
\remove Key_engraver
\remove Clef_engraver
\remove Staff_symbol_engraver
}}}

%%second page	

\markup { \hspace #0   %%add space as necc. to center the column  
	 \fill-line { 

          \column {

           \line { "3  "
             \column { 
		     "That day, the day of fear, shall come; my soul, slack not thy toil,"
		     "But light thy lamp, and feed it well, and make it bright with oil;"
		     "Who knowest not how soon may sound the cry at eventide,"
		     "'Behold, the Bridegroom comes! Arise! Go forth to meet the bride.'"  
	   }}
	  
	   \hspace #0.1 % adds vertical spacing between verses   
          \line { "4. "
             \column {	     
		     "Beware, my soul; beware, beware, lest thou in slumber lie,"
		     "And, like the Five, remain without, and knock, and vainly cry;"
		     "But watch, and bear thy lamp undimmed, and Christ shall gird thee on"
		     "His own bright wedding-robe of light—the glory of the Son."
	   }}
	  }
    }	  
}

%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne e1 e1 \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo c1 b1 \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                        <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree a'1 gis1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  a1 e'1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = ##f tagline = ##f }

\layout { 
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 69 2) }}  %%Amen midi 

} 	

} %% book bracket