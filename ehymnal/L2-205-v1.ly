%%% 323.png
%%% Hymn 205 Merton "Jesus calls us!--o'er the tumult"
%%% Rev 1

\version "2.10"

\header {
  dedication = \markup { \center-align { "SAINTS' DAYS: ST. ANDREW"
		\hspace #0.1 }}	
  title = "205"
  poet =  \markup { \column {  \line { \small { \sans {"MERTON."} \hspace #1 \roman {"(8 7. 8 7.)"}} } }}
  meter = \markup { \small { \italic "Moderately slow"  \general-align #Y #DOWN \note #"2" #0.5 "= 66." } }
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


%%% lyric attributions


\markup { "                     " }

\markup { \small { \hspace #6 "(" \hspace #-1 \italic "O. H. 174-6." \hspace #-1 ")" \hspace #54 \italic "Mrs. C. F. Alexander, 1823-95."  }}


%%% Main lyric block
%%% To fit on one page, lyrics are in 3 columns: column 1 (verses ), column 2 (a dividing line), column 3 (verses); centred last (fifth) verse.
	  	  
\markup { \hspace #6  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "J" }   %%Drop Cap goes here
				  \hspace #-0.8    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ESUS calls us!—o'er the tumult"
			                                 "    Of our life's wild restless sea" } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Day by day his sweet voice soundeth,"
					   "    Saying, ‘Christian, follow me’:"
					   "                  " %%% blank space before next verse
			  		}} 
			         } %%% finish verse 1 
           		\line { "2  "
			   \column {	     
				  "As of old Saint Andrew heard it"
				  "    By the Galilean lake,"
				  "Turned from home, and toil, and kindred,"
				  "    Leaving all for his dear sake."
				  "                  " %%% blank space before next verse
			}}
		}  %% finish Page column 1
		
	\hspace #2 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -22 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #2 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
			\line {"3  "
			   \column {	     
				  "Jesus calls us from the worship"
				  "    Of the vain world's golden store,"
				  "From each idol that would keep us,"
				  "    Saying, ‘Christian, love me more.’"
                                   "                  " %%% blank space before next verse
			}} 
			\line {"4  "
			    \column {
				    "In our joys and in our sorrows,"
				    "    Days of toil and hours of ease,"
				    "Still he calls, in cares and pleasures,"
				    "    ‘Christian, love me more than these.’"
				    "                  " %%% blank space before next verse
			}}
	    } %%% end column 3
     } %%% end master-line
     			\line { \hspace #30 "5. "
			     \column {	     
				     "Jesus calls us!—by thy mercies,"
				     "    Saviour, may we hear thy call,"
				     "Give our hearts to thy obedience,"
				     "    Serve and love thee best of all."			                                   
     			}}
   } %%% super column bracket
} %%% lyrics markup bracket
  

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

