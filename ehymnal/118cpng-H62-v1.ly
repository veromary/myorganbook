﻿%%%118c.png
%%%Hymn 62 modern tune. Illsley. Maker of man, who from thy throne
%%%Version 1

\version "2.10"

\header {
	dedication = \markup { \center-align { \line {  "THE CHRISTIAN YEAR - FROM THE EPIPHANY TILL LENT" } 
					       \hspace #1
						} }	
  title = \markup { "62 " \large \smallCaps "(Modern Tune)" }
			       
  arranger = \markup { \small { \smallCaps "J. Bishop," \italic "c." "1665-1737."} }
  poet = \markup { \small { \sans  "ILLSLEY." \hspace #1 \roman { "(L. M.)"} } }
  meter = \markup { \small { \italic {Slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 56.} }
  tagline = ""
}


global = {
  \time 4/2 
  \key f \major 
  \set Staff.midiInstrument = "church organ"
}	   
	      
soprano = \relative c' {
  \partial 2 f2 | f2 c2 f4( g4) a2 | bes4( a4) g2 f2 ^\fermata \bar "||" 
      f2 | f2 c2 f4( g4) a4( b4) | c2 b2 c2 ^\fermata \bar "||" \break
  c2 | bes2 a2 d2. c4 | bes2 a2 g2 ^\fermata \bar "||" 
      g2 | a4( g4) f2 c'2 g2 | a2 g2 f2 ^\fermata \bar "||"
}

alto = \relative c' {
  c2 | c2 c2 d4( e4) f2 | d2 e2 f2 \bar "||" 
      c2 | c2 c2 d4( e4) f2 | g2 g2 g2 \bar "||" \break
  f2 | f2 f2 f2. e4 | f4( g4) f2 e2 \bar "||" 
      c2 | c2 d2 f2 f2 | f2 e2 f2 \bar "||"
}

tenor = \relative c { \clef bass
  a'2 | a2 g2 a2 c2 | d4( c4) bes2 a2 \bar "||" 
      a2 | a2 g2 a2 d2 | c2 d2 e2 \bar "||" \break
  a,2 | bes2 c2 bes2. g4 | d'2 c2 c2  \bar "||" 
      c2 | a2 a4( bes4) c2 d2 | c2. bes4 a2  \bar "||"  
}

bass = \relative c { \clef bass
  f2 | f2 e2 d2 a2 | g2 c2 f2 _\fermata \bar "||" 
      f2 | f2 e2 d2 d2 | e2 g2 c,2 _\fermata \bar "||" 
  f2 | d2 f2 bes,2. c4 | d4( e4) f2 c2 _\fermata \bar "||" 
      e2 | f2 d2 a2 bes2 | c2 c2 f,2 _\fermata \bar "||" 
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

%%% Score block
	
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

%%% Main midi	
	
\midi { 
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 56 2) }
       }	
} %%score bracket

%%% Lyric Titles

\markup {
	\column {
	    \line { \small { \hspace #4 \smallCaps "Office Hymn." \hspace #56 \italic "c. 7th cent.  Tr. J. D. Chambers" "‡." } }  
	    \line { \small { \hspace #6 \italic "Friday Evening." \hspace #20 "Plasmator hominis, Deus."} }
} }
   
%%% Lyrics in 3 columns,  column 1 (verses), column 2 (a dividing line), column 3 (verses); centred last verse

\markup { \hspace #4   %%add space as necc. to center the column
          \column { %% super column of everything
	    \line { %% a master line of 3 columns    
		\column { %% column 1
	        \hspace #1 % adds vertical spacing between verses
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "M" }   %%Drop Cap goes here
				  \hspace #-1.4    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "AKER of man, who from thy throne" "  Dost order all things, God alone;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "By whose decree the teeming earth"
					   "To reptile and to beast gave birth:"
			  		}}
			       
			           } %% finish verse 1
		\hspace #1 
           		\line { "2  "
			   \column {	     
				   "The mighty forms that fill the land,"
				   "Instinct with life at thy command,"
				   "Are given subdued to humankind"
				   "For service in their rank assigned."
			}}
		}  %%% end page column 1
		
	\hspace #4 %% adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -25 . -1) #0 }  %%% Column 2. This is the line dividing the columns 1 and 3. 
			   	   
	\hspace #4 %% adds horizontal space between columns 2 and 3	
	
	\column { %%% start page column 3		
 
	   \hspace #1 %% adds vertical spacing between verses
           		\line { "3  "
			  \column {	     
				  "From all thy servants drive away"
				  "Whate'er of thought impure to-day"
				  "Hath been with open action blent,"
				  "Or mingled with the heart's intent."
			}}
		\hspace #1 
           		\line {"4  "
			  \column {	     
				  "In heaven thine endless joys bestow,"
				  "And grant thy gifts of grace below;"
				  "From chains of strife our souls release,"
				  "Bind fast the gentle bands of peace."
			}}
	    } %%% end page column 3
     } %%% end master-line
    		\hspace #1 
		%%% centred last verse
           		\line { \hspace #30  "5. "
			  \column {	     
				  "O Father, that we ask be done,"
				  "Through Jesus Christ, thine only Son;"
				  "Who, with the Holy Ghost and thee,"
				  "Doth live and reign eternally.     Amen."
     			}}
}
} %%% lyric markup bracket	  


%%% Amen score block

\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f1 f1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo d1 c1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree bes'1 a1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  bes1 f1 \bar "||" }}
			        >> 
  >>			      

\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

%%% Amen midi         
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 56 2) }}       
       
}  

\markup { \hspace #18 "(" \italic "Until Candlemas the Doxology of No. 36 may be used for Nos. 50-62." ")" } 

} %%book bracket