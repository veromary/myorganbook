%%%% 318.png
%%%% Hymn 201. Palms of Glory.  Palms of glory, raiment bright.
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "SAINTS' DAYS: GENERAL - FOR ANY SAINT'S DAY"
	\hspace #0.1 }}	
	
  title = "201"   
  
  poet = \markup { \small {  \line { \sans { "PALMS OF GLORY."} \hspace #1 \roman {"(7 7. 7 7.)"}} }}
  
  meter = \markup { \small { \italic {Moderately fast} \general-align #Y #DOWN \note #"4" #0.5 = 100.} }
  
  arranger = \markup { \small \smallCaps "Archbishop Maclagan." }
  
  tagline = ""
}


%%%%%%%%%%%%%%%%%%Macros

%%generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%%%%%%%%%%%%%%%%%End of Macro definitions

%%% SATB voices

global = {
  \time 4/4
  \key aes \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  ees4 ees4 aes4. bes8 | aes4 g4 aes2 \bar "||" bes4 c4 bes4. aes8 | g4 f4 ees2 \bar "||" \break
  des'4 des4 des4 c4 | bes4 aes4  aes4 ( g4 ) \breathmark \bar "||" aes4 ees'4 des4 bes4 | aes4 g4 aes2 \bar "||" 
}   

alto = \relative c' {  
  c4 ees4 c4. f8 | ees4. des8 c2 \bar "||" ees4 ees4 ees4. ees8 | ees4 d4 ees2 \bar "||" 
  aes4 ees4 ees4 ees4 | f4 f4 ees4. ( des8 ) \bar "||" c4 ges'4 f4 f4 | ees4 ees4 ees2 \bar "||" 
}

tenor = \relative c {\clef bass 
  aes'4 bes4 aes4. des8 | c4 bes4 aes2 \bar "||" g4 aes4 g4. aes8 | bes4. aes8 g2 \bar "||" 
  aes4 bes4 aes4 aes4 | f4 bes4 bes2 \bar "||" aes4 aes4 aes4 des4 | c4 bes4 c2 \bar "||" 
}


bass = \relative c {\clef bass 
  aes'4 g4 f4. des8 | ees4 ees4 aes2 \bar "||"  ees4 aes,4 ees'4. c8 | bes4 bes4 ees2 \bar "||" 
  f4 g4 aes4 aes,4 | des4 d4 ees2 \bar "||" f4 c4 des4 des4 | ees4 ees4 aes,2 \bar "||" 
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4) }}      
  	
	
} %%% Score bracket

%%% Lyric titles and attributions

\markup { \small { \hspace #80 \italic "J. Montgomery, 1771-1854." } }


%%% Main lyric block
%%% To fit on one page, lyrics are in 3 columns: column 1 (verses ), column 2 (a dividing line), column 3 (verses); centred last (fifth) verse.

\markup { \hspace #6  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "P" }   %%Drop Cap goes here
				  \hspace #-0.8    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ALMS of glory, raiment bright,"
			                                 "  Crowns that never fade away," } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Gird and deck the Saints in light,"
					   "    Priests, and kings, and conquerors they."
					   "                  " %%% blank space before next verse
			  		}} 
			         } %%% finish verse 1 
           		\line { "2  "
			   \column {	     
				  "Yet the conquerors bring their palms"
				  "    To the Lamb amidst the throne,"
				  "And proclaim in joyful psalms"
				  "    Victory through his Cross alone."
				  "                  " %%% blank space before next verse
			}}
		}  %% finish Page column 1
		
	\hspace #2 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -22 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #2 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
			\line {"3  "
			   \column {	     
				  "Kings for harps their crowns resign,"
				  "    Crying, as they strike the chords,"
				  "‘Take the kingdom, it is thine,"
				  "    King of kings, and Lord of lords.’"
                                   "                  " %%% blank space before next verse
			}} 
			\line {"4  "
			    \column {
				    "Round the altar priests confess,"
				    "    If their robes are white as snow,"
				    "'Twas the Saviour's righteousness,"
				    "    And his Blood, that made them so."
				    "                  " %%% blank space before next verse
			}}
	    } %%% end column 3
     } %%% end master-line
     			\line { \hspace #30 "5. "
			     \column {	     
				     "They were mortal too like us;"
				     "    Ah! when we like them must die,"
				     "May our souls translated thus"
				     "    Triumph, reign, and shine on high."				                                   
     			}}
   } %%% super column bracket
} %%% lyrics markup bracket
  
       
%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne aes'1 aes1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo f1 ees1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree des'1 c1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  des1 aes1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4) }}  %%Amen midi       
       
}  


} %%% book bracket
