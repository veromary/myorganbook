%%%059.png
%%%Hymn 20 This Endris Nyght. Behold the great Creator makes.
%%%Version 3 059png-H20-v3.ly Fonts reset

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - CHRISTMAS"
		\hspace #0.1 }}	
  title = "20"
  poet = \markup { \small {  \line { \sans {"THIS ENDRIS NYGHT."} \hspace #1 \roman {"(C. M.)"}} }}
  meter = \markup { \small { \italic {Moderately slow} \fontsize #-5 \general-align #Y #DOWN \note #"4" #1 = 120.} }
  arranger =  \markup { \small \italic "Ancient English Carol. 15th cent."}
  tagline =""
}


global = {
  \time 6/4 
  \key d \major 
  \set Staff.midiInstrument = "church organ"
}

singlebar = { \bar "|" \noBreak } %%macro to generate a nobreak bar

soprano = \relative c' {  
  \partial 4 d4 \singlebar fis2 g4 a2 a4 \singlebar b^( cis) b a2 a4 \singlebar d2 cis4 b8.^( a16 b4) g \singlebar fis2. ~ fis2 \bar "||" \break
  fis4 \singlebar b2 b4 a2 a4 \singlebar g2 g4 fis2 fis4 \singlebar a2 fis4 g e2 \singlebar d2. ~ d2^\fermata \bar "||"
}

alto = \relative c' {
  \partial 4 d4 \singlebar d2 d4 cis2 d4 \singlebar d2 g4 e2 e4 \singlebar d2 fis4 g2 b,4 \singlebar b2. ~ b2 \bar "||" \break
  b4 \singlebar b2 cis4 d2 fis4 \singlebar e2 d4 cis2 d4 \singlebar d2 d4 d cis2 \singlebar d2. ~ d2 \bar "||"
}

tenor = \relative c { \clef bass
  \partial 4 fis4 \singlebar a2 g4 e2 fis4 \singlebar g^( a) b cis2 cis4 \singlebar a2 a4 b2 e4 \singlebar d2. ~ d2 \bar "||" \break
  d4 \singlebar d2 g,4 a2 b4 \singlebar b^( cis) b ais2 b4 \singlebar \override Accidental #'transparent = ##t a2 b4 b a^( g) \singlebar fis2. ~ fis2 \bar "||"
}

bass = \relative c { \clef bass
  \partial 4 d4 \singlebar d2 b4 a2 d4 \singlebar g2 g,4 a2 g'4 \singlebar fis2 d4 g2 e4 \singlebar b2. ~ b2 \bar "||" \break
  b'4 \singlebar g2 e4 fis2 d4 \singlebar e2 e4 fis2 b,4 \singlebar fis2 b4 g a2 \singlebar d2. ~ d2_\fermata \bar "||"
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
	\context Voice = altos    { \voiceTwo \global \alto }
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
       tempoWholesPerMinute = #(ly:make-moment 120 4)
            }
       }
	
} %%score bracket

\markup { \hspace #4   %%add space as necc. to center the column
          \column { %% super column of everything
	    \hspace #0.2
	    \line { \small { \hspace #-5 \italic {"Suitable till Candlemas."} \hspace #60 \italic {"T. Pestel, 1584-1659."}} }
	    \line { %% a master line of 3 columns
              \column { %% column 1
	      \hspace #0.2 % adds vertical spacing between verses
          \column {
		  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "B" }   %%Drop Cap goes here
			 \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
			\column  { \raise #0.0 "EHOLD the great Creator makes" "Himself a house of clay,"  } }          
	          \line { \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
			\lower  #1.56  %%adjust this until the line spacing looks right
			\column {   
				"A robe of Virgin flesh he takes" 
				"    Which he will wear for ay." 
			  		}}
	           } %% finish stanza 1
		  
		   \hspace #0.2 % adds vertical spacing between verses
		   \line { "2  "
		       \column {	     
			       "Hark, hark, the wise eternal Word," 
			       "    Like a weak infant cries!" 
			       "In form of servant is the Lord," 
			       "    And God in cradle lies."
		   }}
		       }  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -25 . -1) #0 }       %%Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3
	   
	\column { %%start page column 3		
		\hspace #0.1 % adds vertical spacing between verses
		\line { "3  "
		    \column {	     
			    "This wonder struck the world amazed," 
			    "    It shook the starry frame;" 
			    "Squadrons of spirits stood and gazed," 
			    "    Then down in troops they came."  	   
	   }} 
	   	\hspace #0.1 % adds vertical spacing between verses
		\line { "4  "
		    \column {    
			    "Glad shepherds ran to view this sight;" 
			    "    A choir of Angels sings," 
			    "And eastern sages with delight" 
			    "    Adore this King of kings." 
 	   }}  
  
	  } %% end column 3
	  } %% master line bracket
	  
	  \hspace #0.2
	  \line { \hspace #27 "5. "
             \column {    
		     "Join then, all hearts that are not stone," 
		     "    And all our voices prove," 
		     "To celebrate this holy One" 
		     "    The God of peace and love." 
 	   }} %% end last stanza
          } %% page super column bracket
} %%markup bracket


%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne d1 d1 \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo b1 a1 \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4) }}  %%Amen midi 

} 	
	

} %% book bracket
