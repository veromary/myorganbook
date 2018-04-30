%%% 035.png
%%%Hymn 5 Merton "Hark! A herald voice is calling"
%%% Version 2 035png-H5-v2.ly Fonts reset.

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - ADVENT"
		\hspace #0.1 }}	
  title = "5"
  poet =  \markup { \column {  \line { \small { \sans {"MERTON."} \hspace #1 \roman {"(8 7. 8 7.)"}} } }}
  meter = \markup { \small { \italic "Moderately slow" \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 "= 66." } }
  arranger =  \markup { \small \smallCaps "W. H. Monk, 1823-1889."}
  tagline =""
}


global = {
 \time 4/2
 \key e\major 
 \set Staff.midiInstrument = "church organ" 
}

soprano = \relative c' {
  e2 gis2 b2 b2 \bar "|" \noBreak a2 cis2 cis2 b2 \bar "||" \noBreak
  gis2 ais2 b2 b2 \bar "|" cis2 cis2 b1 \bar "||" \break
  b2 a2 gis2 b2 \bar "|" a2 gis2 fis2 e2 \bar "||" \noBreak
  fis2 gis2 a2 gis2 \bar "|" fis2 fis2 e1 \bar "||"
}

alto = \relative c' {
  b2 b2 b2 dis2 \bar "|" e2 e2 e2 e2 \bar "||"
  e2 e2 dis2 fis2 \bar "|" gis2 fis4 ( e4 ) dis1 \bar "||"
  dis2 e4 ( fis4 ) e2 fis2 \bar "|" e2 e2 dis2 e2 \bar "||"
  cis2 eis2 fis2 e!2 \bar "|" e2 dis2 \once \override NoteColumn #'force-hshift = #-0.05 e1 \bar "||"
}

tenor = \relative c { \clef bass
  gis'2 b2 fis2 fis2 \bar "|" e2 a2 a2 gis2 \bar "||"
  b2 e,2 fis2 b2 \bar "|" b2 ais2 b1 \bar "||"
  dis2 cis4 ( b4 ) b2 b2 \bar "|" cis2 b2 b4 ( a4 ) gis2 \bar "||"
  a2 b2 cis2 b2 \bar "|" cis2 b4 ( a4 ) gis1 \bar "||"
}

bass = \relative c {
  e2 e2 dis2 b2 \bar "|" cis2 a4 ( b4 ) cis4 ( dis4 ) e2 \bar "||"
  e2 cis2 b2 dis2 \bar "|" e2 fis2 b,1 \bar "||"
  b2 cis4 ( dis4 ) e2 dis2 \bar "|" cis2 e2 b2 cis2 \bar "||"
  a2 gis2 fis2 gis2 \bar "|" a2 b2 
      <<  { \voiceTwo e1 } 
    \new Voice = "pedals" {\once \override NoteColumn #'force-hshift = #0.1 \voiceFour \set fontSize = #-3 e,1  }  >> \bar "||"
}


#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
  top-margin = 0\mm
  bottom-margin = 0\mm
  print-page-number = ##f
  between-system-space = #0
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
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 66 2)
            }
       }
	
} %%score bracket


\markup { \hspace #4   %%add space as necc. to center the column
          \column { %% super column of everything
	    \hspace #0.2
	  \line { \hspace #60 \small { \italic {6th cent.  Tr. E. Caswall}"†." } }
	  \line { \hspace #34 \small {"Vox clara ecce intonat."}}
	    \line { %% a master line of 3 columns
              \column { %% column 1
	      \hspace #0.2 % adds vertical spacing between verses
          \column {
		  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "H" }   %%Drop Cap goes here
			 \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
			\column  { \raise #0.0 "ARK! a herald voice is calling:" "  'Christ is nigh,' it seems to say;"  } }          
	          \line { \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
			\lower  #1.56  %%adjust this until the line spacing looks right
			\column {   
				"'Cast away the dreams of darkness," 
				"    O ye children of the day!'" 
			  		}}
	           } %% finish stanza 1
		  
		   \hspace #0.2 % adds vertical spacing between verses
		   \line { "2  "
		       \column {	     
			       "Startled at the solemn warning," 
			       "    Let the earth-bound soul arise;" 
			       "Christ, her Sun, all sloth dispelling," 
			       "    Shines upon the morning skies."
		   }}
		       }  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -25 . -1) #0 }       %%Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3
	   
	\column { %%start page column 3		
		\hspace #0.1 % adds vertical spacing between verses
		\line { "3  "
		    \column {	     
			    "Lo! the Lamb, so long expected," 
			    "    Comes with pardon down from heaven;" 
			    "Let us haste, with tears of sorrow," 
			    "    One and all to be forgiven;"  	   
	   }} 
	   	\hspace #0.1 % adds vertical spacing between verses
		\line { "4  "
		    \column {    
			    "So when next he comes with glory," 
			    "    Wrapping all the earth in fear," 
			    "May he then as our defender" 
			    "    On the clouds of heaven appear." 
 	   }}  
  
	  } %% end column 3
	  } %% master line bracket
	  
	  \hspace #0.2
	  \line { \hspace #16 \small \italic "Unison." "    5. "
             \column {    
		     "Honour, glory, virtue, merit," 
		     "    To the Father and the Son," 
		     "With the co-eternal Spirit," 
		     "    While unending ages run.   Amen." 
 	   }} %% end last stanza
          } %% page super column bracket
} %%markup bracket

	   

%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                     << 
	\context Voice = "sopranos" { \relative c' { 
						     \global \voiceOne e1 e1 \bar "||"
 }}
	\context Voice = "altos"    { \relative c' { \global \voiceTwo cis1 b1 \bar "||"
 }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                        <<
	\context Voice = "tenors" { \relative c { \global \clef bass \voiceThree a'1 gis1 \bar "||"
 }}
	\context Voice = "basses" { \relative c { \global 
	                                           \clef bass \voiceFour  a1 e'1 \bar "||"
 }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2) }}  %%Amen midi 

} 	
	

} %% book bracket

