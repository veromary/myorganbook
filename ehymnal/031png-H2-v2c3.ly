%%%031.png
%%%Hymn 2 Mechlin Melody
%%%Version 2 Fonts sizes reset.

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - ADVENT"
		\hspace #0.1 }}	
  title = "2"
  subtitle = \markup { \smallCaps "Mechlin Melody" }
  meter = \markup { \column {  \line { \small { \sans "VERBUM SUPERNUM." \hspace #1 \roman "(L. M.)" }}
	                       \line { \small { \italic "In free rhythm" \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 "= 80." \italic "   To be sung in unison."} } }}   
  arranger =  \markup { \column {
		            \line { \small  \italic "From the 'Antiphonarium Romanum,' Mechlin."  }
			    \line {  \hspace #32  \small "Mode viii."  } }}
  tagline =""
}


global =  {
  \time 3/2 
  \key c \major
  \set Staff.midiInstrument = "church organ"
}

bd = \bar "dashed"

moveleft = \once \override NoteColumn #'force-hshift = #-0.45

moveright = \once \override NoteHead #'X-offset = #1

soprano = \relative c' { 
  g'2 \bd \moveleft a2( g2) a2 \bd <a c>2( <g b>2) a2 \bd g2( \moveleft e2) f2 \bd g1^\fermata \bar "||" \break
  g2 b2 c2 \bd d2( c2) b2 g2 a2 \bd c1^\fermata \bar "||" a2 \bd c2 b2 c2 g2 \bd \break
  a2( g2) f2 \bd g1^\fermata \bar "||" g2 \bd a2( g2) a2 \bd c2( b2) a2 \bd g2( e2.) f4 \bd g1^\fermata \bar "||" 
}

alto = \relative c' {
  <c e>2 \bd e1 <f d>2 \bd s2 s2 <f c>2 \bd <d b>2 <a c>1 \bd d1 \bar "||"
  <b d>2 <d g>2 <f a>2 \bd <f a>2 <e g>2 <d g>2 c2 f2 \bd e1 \bar "||" <c f>2 \bd <c g'>2 <d g>2 <c e>2 e2 \bd 
  <c f>2 <b d>2 c2 \bd b1 \bar "||" <b d>2 \bd <c f>2 <b d>2 f'2 \bd \moveright e1 c2 \bd b2 \moveright c1 \bd \moveleft c2 b2 \bar "||"
}

tenorA = \relative c' { \clef treble 
  s2 \bd c2 b2 s2 \bd e1 s2 \bd s2 s1 \bd c2 b2 \bar "||"
  s2 s2 s2 \bd s2 s2 s2 s2 s2 \bd s1 \bar "||" s2 \bd s2 s2 s2 s2 \bd 
  s2 s2 s2 \bd s1 \bar "||" s2 \bd s2 s2 s2 \bd s2 s2 s2 \bd s2 s1 \bd s1 \bar "||"
}

tenorB = \relative c { \clef bass
  s2 \bd s2 s2 s2 \bd s1 s2 \bd s2 s1 \bd \once \override NoteHead #'X-offset = #2 g'1 \bar "||"
  s2 s2 s2 \bd s2 s2 s2 s2 f2 \bd g1 \bar "||" s2 \bd s2 s2 s2 g2 \bd 
  s2 s2 f2 \bd d1 \bar "||" s2 \bd s2 s2 a'2 \bd a2 g2 f2 \bd d2 a'1 \bd d,1 \bar "||" 	
} 	


bass = \relative c { \clef bass
  c2 \bd a2 e'2 d2 \bd a2 e2 f2 \bd <g g'>2 \moveright a1 \bd \once \override NoteHead #'X-offset = #2 g1_\fermata \bar "||"
  g'2 g2 f4 e4 \bd d2 e2 g2 e2 d2 \bd c1_\fermata \bar "||" f,2 \bd e2 g2 a2 c2 \bd 
  f,2 g2 a2 \bd g1_\fermata \bar "||" g2 \bd f2 g2 d'2 \bd a2 <e e'>2 f2 \bd g2 a1 \bd g1_\fermata \bar "||" 
}

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
  top-margin = 2\mm
  bottom-margin = 2\mm
  print-page-number = ##f
  head-separation = 1\mm
  between-system-padding = 2\mm
  between-system-space = #0.1
  ragged-last-bottom = ##t
  ragged-bottom = ##t
}

\book{

\score{
\new ChoirStaff	
 <<

	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne  \global \soprano }
	\context Voice = altos    { \voiceTwo  \global \alto }
	\context Voice = tenorUp  { \voiceFour \global \tenorA }
	                      >>
        
	\context Staff = lower <<
	\context Voice = tenordown { \voiceOne \global \tenorB }
	\context Voice = basses { \voiceFour \global \bass }
			        >> 
			      

 >>
\layout {
		indent=0
		\context { \Score \remove "Bar_number_engraver"
		           timing = ##f
		}
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	}

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 2) }}  %%Amen midi       
 		
} %%score bracket

\markup {   \hspace #3  %% use \hspace or \halign to centre the 3-column group   
	  \override #'(line-width . 100)
	  \column { %% super column of everything  
	  \fill-line { \small { \smallCaps "Office Hymn. M."   \italic "c. 10th cent.  Tr. Charles Bigg." } }
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


%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne g'2( a2) g2( f2 g1)^\fermata \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo e1. d2 d1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "sopranos" { \override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree c'1. a2 b1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  c2 a2 c2 d2 <g, g'>1_\fermata \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = ##f opus = ##f }
\layout { 
	ragged-right = ##t
	\context { \Score timing = ##f }
	indent = 13\cm
%	#(layout-set-staff-size 5)
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 2) }}  %%Amen midi       
       
}  

} %%book bracket