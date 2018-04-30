%%%089.png
%%%Hymn 37 Innocents. Conquering kings their titles take.
%%%Version 3  089png-H37-v3.ly  Reset fonts

\version "2.10"


%% Macro for generating two augmentation dots for a notehead. When dotted notes from two vocal parts share a single notehead, 
%% Lilypond only inserts a single dot. In the image, two dots are used. 
%%This macro generates the two dots by replacing the normal dot glyph with a glyph comprising a column of 2 dots one above the other.

augdots = { 
  \once \override Voice.Dots #'stencil = #ly:text-interface::print 
  \once \override Voice.Dots #'text = \markup {  \hspace #0 \raise #1 
                                                 \line { \translate #(cons -0.2 0) 
                                                 \override #'(baseline-skip . 1 )  \column { 
                                                                                        \musicglyph #"dots.dot" 
                                                                                        \musicglyph #"dots.dot" } } }
 }

%%end of macro definitions


\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - THE CIRCUMCISION OF CHRIST"
		\hspace #0.1 }}	
  title = "37"
  meter = \markup { \small { \column {  \line { \sans {"INNOCENTS."} \hspace #1 \roman {"(7 7. 7 7.)"}}
                               \line { \italic {Moderately fast} \fontsize #-5 \general-align #Y #DOWN \note #"4" #1 = 100.}}}}   
  arranger =  \markup { \small { \center-align {
		            \line{ \italic {"Composed or adapted by" } }
			    \line { \smallCaps { "J. Smith, 1800-73."}}}}}
  tagline =""
}

 
global = {
  \time 4/4 
  \key d \major
  \set Staff.midiInstrument = "church organ" 
}


soprano = \relative c' { 
  fis4. g8 \bar "|" a4 d4 cis4 b4 \bar "|" a2 \bar "||" \noBreak
  d,4. e8 \bar "|" fis4 a4 g4 fis4 \bar "|" e2 \bar "||" \break
  fis4. g8 \bar "|" a4 d4 cis4 b4 \bar "|"  a2 \bar "||" \noBreak
  d,4. \augdots e8 \bar "|" fis4 g4 fis4 e4 \bar "|" d2 \bar "||" 
}

alto = \relative c' { 
  d4. cis8 \bar "|" d4 fis4 e4 d8 e8 \bar "|" fis2 \bar "||" 
  a,4. cis8 \bar "|" d4 e4 d4 d4 \bar "|" cis2 \bar "||" \break
  d4. cis8 \bar "|" d4 fis4 e4. d8 \bar "|"  cis2 \bar "||" 
  \augdots d4.  cis8 \bar "|" d4 e4 d4 cis4 \bar "|" d2 \bar "||" 
}

tenor = \relative c { \clef bass 
  a'4. g8 \bar "|" fis4 a4 g8[ a8] b8[ cis8] \bar "|" d2 \bar "||" 
  fis,4. g8 \bar "|" a4 cis4 b4 a4 \bar "|" a2 \bar "||" \break
  a4. g8 \bar "|" fis4 fis4 a4 gis4 \bar "|" a2 \bar "||" 
  a4. g8 \bar "|" a4 b4 a4 a4 \bar "|" fis2 \bar "||" 
}

bass = \relative c { \clef bass 
  d4. e8 \bar "|" fis4 d4 e8 fis8 g4 \bar "|" d2 \bar "||" 
  \augdots fis4. e8 \bar "|" d4 a4 b4 d4 \bar "|" a2 \bar "||" \break
  d4. e8 \bar "|" fis4 b,4 cis8 d8 e4 \bar "|"  \once \override NoteColumn #'force-hshift = #-1.7 a4 ( g!4 ) \bar "||" 
  fis4. e8 \bar "|" d4 g,4 a4 a4 \bar "|" d2 \bar "||" 
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
	\context Voice = tenors { \voiceThree \global \tenor }
	\context Voice = basses { \voiceFour \global \bass }
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
       tempoWholesPerMinute = #(ly:make-moment 100 4)
            }
       }
	
} %%score bracket


\markup { \hspace #4   %%add space as necc. to center the column
          \column { %% super column of everything
	    \hspace #0.2
	    \line { \small { \hspace #66  \italic {"c. 1736. Tr. J. Chandler"} "‡."} }
	    \line { \hspace #38 \small {"Victis sibi cognomina."}}
	    \line { %% a master line of 3 columns
              \column { %% column 1
	      \hspace #0.2 % adds vertical spacing between verses
	        \column { %%stanza 1 is a column of 2 lines  
	          \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "C" }   %%Drop Cap goes here
			 \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
			\column  { \raise #0.0 "ONQUERING kings their titles take" "  From the lands they captive make:" } }          
	          \line { \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
			\lower  #1.56  %%adjust this until the line spacing looks right
			\column {   
				"Jesu, thine was given thee" 
				"For a world thou madest free." 
			  		}}
	          } %% finish stanza 1
		  
	         \hspace #0.2 % adds vertical spacing between verses
                 \line { "2  "
                    \column {	     
		     "Not another name is given" 
		     "Power possessing under heaven," 
		     "Strong to call dead souls to rise" 
	   	     "And exalt them to the skies." 	   
	         }}
	   
	         \hspace #0.2 % adds vertical spacing between verses
                 \line { "3  "
                   \column {	     
		     "That which Christ so hardly wrought," 
		     "That which he so dearly bought," 
		     "That salvation, mortals, say," 
	   	     "Will ye madly cast away?" 	   
	         }}
	}  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -40 . -1) #0 }       %%Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3
	   
	\column { %%start page column 3		
	   \hspace #0.0 % adds vertical spacing between verses
           \line { "4  "
             \column {    
		     "Rather gladly for that name" 
		     "Bear the Cross, endure the shame;" 
		     "Joyfully for him to die" 
	   	     "Is not death but victory."
 	   }}  %}
	   
	   \hspace #0.2 % adds vertical spacing between verses
	   \line { "5  "
             \column { 
		     "Jesu, if thou condescend" 
		     "To be called the sinner's Friend," 
		     "Ours the joy and glory be" 
		     "Thus to make our boast of thee." 		     
	   }}
	   
	   \hspace #0.2 % adds vertical spacing between verses
           \line { "6. "
             \column {    
		    "Glory to the Father be," 
		    "Glory, Virgin-born, to thee," 
		    "Glory to the Holy Ghost," 
		    "Ever from the heavenly host.     Amen."
	   }}   
	  } %% end column 3
	  } %% master line bracket
	  \hspace #0.2
	  \line { \hspace #28 \small \italic "For the New-Year's Day hymns, see 285-6."}
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
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4) }}  %%Amen midi 

} 	
	

} %% book bracket
