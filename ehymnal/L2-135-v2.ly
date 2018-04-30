%%%% 221.png
%%%% Hymn 135 Savannah. Love's redeeming work is done
%%%% Rev 2.

\version "2.10"
\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - EASTERTIDE"
	\hspace #0.1 }}	
	
	title = "135"  
  
  poet = \markup { \small {  \line { \sans { \smallCaps "SAVANNAH (or HERRNHUT)."} \hspace #1 \roman {"(7 7. 7 7.)"}} }}
  
  meter = \markup { \small { \italic {Moderately fast} \general-align #Y #DOWN \note #"4" #0.5 = 100.} }
  
  arranger = \markup { \small \smallCaps "J. Wesley's" "‘" \hspace #-1.2 \italic "Foundery Collection" \hspace #-1.2 ",’ 1742." }
  
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/4
  \key ees \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {  
bes'4 bes8[ aes] g4 f | ees8[ f] g4 f2 | bes4 bes8[ aes] g4 f | ees8[ f] g4 f2 \breathmark \bar "||" \break
bes4 bes c bes8[ aes] | g4 a bes2 | c4 d ees g,8[ f] | g4 f ees2 \bar "||"
} 
   
alto = \relative c' {  
ees4 f ees d | ees ees d2 | ees4 d ees d | c ees d2 \bar "||"
ees4 ees ees f | ees ees d2 |  ees4 f ees ees | ees d ees2 \bar "||"
}

tenor = \relative c {\clef bass 
g'4 bes bes bes | bes bes bes2 | bes4 bes bes aes | g c f,2 \bar "||"
ees4 ees'8[ des] c4 f, | bes c f,2 | c'4 b c c | bes aes g2 \bar "||"
}

bass = \relative c {\clef bass 
ees4 d ees aes | g ees bes2 | g'4 f ees bes | c a bes( aes) \bar "||"
g g' aes d,! | ees8[ d] c4 bes2 | aes4 g c aes | bes bes ees2 \bar "||"
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
	\context Voice = altos    { \voiceTwo \global \alto }
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
	} %% close layout

%%% Hymn Midi	

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4)}} 
		
} %%% Score bracket


%%% Lyrics titles

\markup { \small { \hspace #78 \italic "C. Wesley, 1707-88." } }


%%% Main lyrics markup block
%%% Lyrics in 3 columns,  column 1 (verses), column 2 (a dividing line), column 3 (verses); centred last verse

\markup { \hspace #6 %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "L" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "OVE'S redeeming work is done;"
			                                 "  Fought the fight, the battle won:" } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Lo, our Sun's eclipse is o'er!"
					   "Lo, he sets in blood no more!"
			  		}}
			       
			           } %%% finish verse 1
		        \hspace #1 
           		\line { "2  "
			   \column {	     
				   "Vain the stone, the watch, the seal,"
				   "Christ has burst the gates of hell;"
				   "Death in vain forbids his rise;"
				   "Christ has opened Paradise."
			}}
		}  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -22 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
 
           		\line { "3  "
			  \column {	     
				  "Lives again our glorious King;"
				  "Where, O Death, is now thy sting?"
				  "Dying once, he all doth save;"
				  "Where thy victory, O grave?"
			}}
		        \hspace #1 
           		\line {"4  "
			  \column {	     
				  "Soar we now where Christ has led,"
				  "Following our exalted Head;"
				  "Made like him, like him we rise;"
				  "Ours the cross, the grave, the skies."
			}}
	    } %%% end column 3
     } %%% end master-line     
     
     %%% centred last verse
     		        \hspace #1 
           		\line {\hspace #26 "5. "
			  \column {	     
				  "Hail the Lord of earth and heaven!"
				  "Praise to thee by both be given:"
				  "Thee we greet triumphant now;"
				  "Hail, the Resurrection thou!"
			}}				  
   } %%% super column bracket
} %%% lyrics markup bracket


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne ees1 ees \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo c1 bes \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree aes'1 g  \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  aes1 ees' \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
      \context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       } %% close layout

%%% Amen Midi

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4) }} 

}
	
} %%% book bracket
