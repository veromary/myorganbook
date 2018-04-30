%%% 098.png
%%% Hymn 44 Ein Kind Gebor'n What star is this
%%% Version 2

\version "2.10"

\header {
	dedication = \markup { \center-align { \line {  "THE CHRISTIAN YEAR - THE EPIPHANY" } 
					       \hspace #1
						} }	
   title = "44" 
			       
  arranger = \markup { \small \italic "Old German Carol."}
  poet = \markup { \small { \sans { "EIN KIND GEBOR'N." } \hspace #1 \roman { "(L. M.)"} } }
  meter = \markup { \small { \italic {Moderately fast} \fontsize #-5 \general-align #Y #DOWN \note #"4" #1 = 152.} }
  tagline = ""
}


global = {
  \time 3/4	
  \key  g \minor	
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 4 g'4 | g2 g4 | a2 a4 | bes2 g4 | f2 \bar "||" f4 | bes2 d4 | c2 c4 | bes2 bes4 | bes2 \bar "||" \break
  bes4 | d2 d4 | c2 c4 | bes2 a4 | g2 \bar "||" g4 | c2 c4 | d2 c4 | bes2 a4 | g2 \bar "||"
}


alto = \relative c' {
  \partial 4 d4 | d2 d4 | f2 f4 | f2 ees4 | d2 \bar "||" d4 | d2 f4 | g2 f4 | d2 ees4 | d2 \bar "||"
  f4 | f2 f4 | f2 f4 | d2 d4 | bes2 \bar "||" bes4 | ees2 f4 | f2 ees4 | d2 d4 | bes2 \bar "||"
}


tenor = \relative c { \clef bass
  \partial 4  bes'4 | bes2 bes4 | c2 c4 | bes2 bes4 | bes2 \bar "||" bes4 | bes2 bes4 | bes2 a4 | bes2 g4 | bes2 \bar "||"
  d4 | bes2 bes4 | a2 a4 | g2 fis4 | g2 \bar "||" g4 | g2 a4 | bes2 g4 | g4( e4) fis4 | g2 \bar "||"
}


bass = \relative c { \clef bass
  \partial 4 g'4 | g2 g4 | f2 f4 | d2 ees4 | bes2 \bar "||" bes'4 | g2 d4 | ees2 f4 | bes,2 ees4 | bes2 \bar "||"
  bes4 | bes2 d4 | f2 f4 | g2 d4 | ees2 \bar "||" ees4 | c2 f4 | bes,2 c4 | d2 d4 | g,2 \bar "||"   
}

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
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
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	}
	
\midi { 
   \context {
       \Score  tempoWholesPerMinute = #(ly:make-moment 152 4 ) }
       }
	
}


\markup { \hspace #0   %%add space as necc. to center the column
          \column { %% super column of everything
	    \hspace #0.2
	    \line { \small { \hspace #66 \italic "C. Coffin, 1676-1749.  Tr. J. Chandler" "†."    } }
	    \line { \hspace #40 \small {"Quae stella sole pulchrior."}}
	    \line { %% a master line of 3 columns
              \column { %% column 1
	      \hspace #0.2 % adds vertical spacing between verses
	        \column { %%stanza 1 is a column of 2 lines  
	          \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "W" }   %%Drop Cap goes here
			 \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
			\column  { \raise #0.0 "HAT star is this, with beams so bright," "  More lovely than the noonday light?" } }          
	          \line { \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
			\lower  #1.56  %%adjust this until the line spacing looks right
			\column {   
				"'Tis sent to announce a new-born King,"
				"Glad tidings of our God to bring."
			  		}}
	          } %% finish stanza 1
		  
	         \hspace #0.2 % adds vertical spacing between verses
                 \line { "2  "
                    \column {	     
			    "'Tis now fulfilled what God decreed,"
			    "'From Jacob shall a star proceed';"
			    "And lo! the eastern sages stand,"
			    "To read in heaven the Lord's command."	   
	         }}
	   
	         \hspace #0.2 % adds vertical spacing between verses
                 \line { "3  "
                   \column {	     
			   "While outward signs the star displays,"
			   "An inward light the Lord conveys,"
			   "And urges them, with force benign,"
			   "To seek the giver of the sign."	   
	         }}
	}  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -40 . -1) #0 }       %%Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3
	   
	\column { %%start page column 3		
 
	   \hspace #0.2 % adds vertical spacing between verses
	   \line { "4  "
             \column { 
		     "True love can brook no dull delay:"
		     "Through toils and dangers lies their way;"
		     "And yet their home, their friends, their all,"
		     "They leave at once, at God's high call."
	   }}
	   
	   \hspace #0.2 % adds vertical spacing between verses
           \line { "5  "
             \column {    
		     "O, while the star of heavenly grace"
		     "Invites us, Lord, to seek thy face,"
		     "May we no more that grace repel,"
		     "Or quench that light which shines so well!"
	   }}   
	   
	    \hspace #0.2 % adds vertical spacing between verses
           \line { "6. "
             \column {    
		     "To God the Father, God the Son,"
		     "And Holy Spirit, Three in One,"
		     "May every tongue and nation raise"
		     "An endless song of thankful praise!"	     
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
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo c1 b1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree ees1 d1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  c1 g1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 152 4 ) }}  %%Amen midi       
       
}  


} %% book bracket