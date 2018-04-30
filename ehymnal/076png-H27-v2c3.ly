%%% 076.png
%%% Hymn 27 St. Michael "Let sighing cease and woe"
%%% Version 2 076png-H27-v2.ly Reset fonts

\version "2.10.19"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - CHRISTMAS"
		\hspace #0.1 }}	
  title = "27"
  meter = \markup { \small \column {  \line { \sans {"ST. MICHAEL (OLD 134" \hspace #-1.0 \smallCaps "th" ")."} \hspace #1 \roman { "(S. M.)"} }
                               \line { \italic {In moderate time} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 69.}}}   
  arranger =  \markup { \small {\center-align {
		            \line{ \italic {"Melody from Este's Psalter, 1592."} }
			    \line { \italic { "(Modern form of last line.)"}}}}}
  tagline =""
}

%%generates the breathmarks above barlines
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}


global = {
  \time 4/2 	
  \key  g\major	
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  d1 \bar "|"  g2 b2 a2 a2 \bar "|" b1 \bar "||" 
  d1 \bar "|" c2 b2 a2  a2 \bar "|" g1 \bar "||" \break
  g1 \bar "|" fis2 e2 d2 g2 \bar "|" g2 a2 b1 \breathmark \bar "||"
  b1 \bar "|" a2 g2 g2 fis2 \bar "|" g1 \bar "||"
}


alto = \relative c' {
  b1 \bar "|" e2 g2 g2 fis2 \bar "|" g1  \bar "||"
  a1 \bar "|" g2 g2 g2 fis2 \bar "|" \once \override NoteColumn #'force-hshift = #-0.05 g1  \bar "||"
  e1 \bar "|" d2 c2 b2 d2   \bar "|" e2 e2 dis1 \bar "||"
  d1 \bar "|" c2 d2 e2 d2   \bar "|" d1 \bar "||"
}


tenor = \relative c { \clef bass
  g'1 \bar "|" b2 d2 e2 d2  \bar "|" d1  \bar "||"
  d1  \bar "|" e2 d2 d2. \once \override Score.SeparationItem #'padding = #0 c4  \bar "|" b1  \bar "||"
  b1  \bar "|" b2 g2 g2 g2  \bar "|" b2 a2 fis1  \bar "||"
  g1  \bar "|" e4( fis4) g2  c2 a2 \bar "|" b1 \bar "||"
}


bass = \relative c { \clef bass
  \once \override NoteColumn #'force-hshift = #-0.05 g'1  \bar "|" e2 b2 c2 d2 \bar "|" g1  \bar "||"
  fis1 \bar "|" e2 g2 d2 d2 \bar "|" g,1  \bar "||"
  e'1  \bar "|" b2 c2 g2 b2 \bar "|" e2 c2 b1  \bar "||"
  g1  \bar "|" a2 b2 c2 d2  \bar "|" g,1 \bar "||"
    
}

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
  top-margin = 3\mm
  bottom-margin = 5\mm
  print-page-number = ##f
  between-system-space = #0.2
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
	
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 69 2)
            }
       }
	
}

\markup { \hspace #4   %%add space as necc. to center the column
          \column { %% super column of everything
	    \hspace #0.2
	    \line { \hspace #66 \small \italic {"C. Coffin, 1676-1749.  Tr. W. J. Blew."}}
	    \line { \hspace #36 \small {"Jam desinant suspiria."}}
	    \line { %% a master line of 3 columns
              \column { %% column 1
	      \hspace #0.2 % adds vertical spacing between verses
	        \column { %%stanza 1 is a column of 2 lines  
	          \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "L" }   %%Drop Cap goes here
			 \hspace #-1.8    %% adjust this if other letters are too far from Drop Cap
			\column  { \raise #0.0 "ET sighing cease and woe," "  God from on high hath heard," } }          
	          \line { \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
			\lower  #1.56  %%adjust this until the line spacing looks right
			\column {   
				"Heaven's gate is opening wide, and lo!"
				"    The long-expected Word."
			  		}}
	          } %% finish stanza 1
		  
	         \hspace #0.2 % adds vertical spacing between verses
                 \line { "2  "
                    \column {	     
			    "    Peace! through the deep of night"
			    "    The heavenly choir breaks forth,"
			    "Singing, with festal songs and bright,"
			    "    Our God and Saviour's birth." 	   
	         }}
	   
	         \hspace #0.2 % adds vertical spacing between verses
                 \line { "3  "
                   \column {	     
			   "    The cave of Bethlehem"
			   "    Those wakeful shepherds seek:"
			   "Let us too rise and greet with them"
			   "    That infant pure and meek."	   
	         }}
		 
		 \hspace #0.0 % adds vertical spacing between verses
		 \line { "4  "
		    \column {    
			    "    We enter—at the door"
			    "    What marvel meets the eye?"
			    "A crib, a mother pale and poor,"
			    "    A child of poverty."
 	   }} 
	}  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -40 . -1) #0 }       %%Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3
	   
	\column { %%start page column 3		
 
	   \hspace #0.2 % adds vertical spacing between verses
	   \line { "5  "
             \column { 
		     "    Art thou the eternal Son,"
		     "    The eternal Father's ray?"
		     "Whose little hand, thou infant one,"
		     "    Doth lift the world alway?"
 		     
	   }}
	   
	   \hspace #0.2 % adds vertical spacing between verses
           \line { "6  "
             \column {    
		     "  Yea—faith through that dim cloud,"
		     "  Like lightning, darts before,"
		     "And greets thee, at whose footstool bowed"
		     "Heaven's trembling hosts adore."
	   }}   
	   
	    \hspace #0.2 % adds vertical spacing between verses
           \line { "7  "
             \column {    
		     "    Chaste be our love like thine."
		     "    Our swelling souls bring low,"
		     "And in our hearts, O Babe divine"
		     "    Be born, abide, and grow."
		     
	   }}  
	   
	    \hspace #0.2 % adds vertical spacing between verses
           \line { "8. "
             \column {    
		     "    So shall thy birthday morn,"
		     "    Lord Christ, our birthday be,"
		     "Then greet we all, ourselves new-born."
		     "    Our King's nativity."
	   }}   
	  } %% end column 3
	  } %% master line bracket
	  
          } %% page super column bracket
} %%markup bracket


%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne g'1 g1 \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo e1 d1 \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1 A -- men. }
	
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
%}	

} %% book bracket
