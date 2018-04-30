%%% 080.png
%%% Hymn 30 Winchester Old "While Shepherds watched"
%%% Version 4


\version "2.10"


\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - CHRISTMAS EVE"
		\hspace #0.1 }}	
  title = "30"
  poet = \markup { \small { \sans {"WINCHESTER OLD."} \hspace #1  \roman {"(C. M.)"} } }
  meter = \markup { \small { \italic {In moderate time} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 69.} }
  arranger =  \markup { \small \italic {"First appeared in Este's Psalter, 1592."}}
  tagline =""
}


%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% generates the breathmarks above barlines

breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}

%%% Macro to specify restart of a new measure in the middle of a piece.
%%% Needed to restart a new measure after a partial measure.
%%% In this case, the macro specifies that 2 1/2 notes in a 4/2 measure have past,

partmeasure =  \set Score.measurePosition = #(ly:make-moment 2 2)

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions


%%% SATB voices


global = {
  \time 4/2 	
  \key  f\major	
  \set Staff.midiInstrument = "church organ"
}


soprano = \relative c' { 
  \partial 2*2 f1  | a2. a4 g2 f2 | bes2 bes2 a1 \breathmark \bar "||"
      \partmeasure g1 | a2 c2 c2 b2 | c1 \breathmark \bar "||" \break
  a1 | d2 c2 \once \override Accidental #'transparent = ##t bes2 a2 | g2 f2 e1 \breathmark \bar "||"
      \partmeasure a1 | g2 f2 f2 e2 | f1 \bar "||"
}

alto = \relative c' { 
  c1 | f2. f4 e2 d2 | d2 f2 f1 \bar "||" 
      e1  | f2 e2 g2 g2  | e1 \bar "||"
  f1  | f2 f2 f2 f2  | e2 d2 cis1 \bar "||"  
      c!1 | e2 d2 d2 c2  | c1  \bar "||"
}

tenor = \relative c { \clef bass 
  a'1 | c2. c4 c2 a2 | bes2 d2 c1 \bar "||" 
      c1  | c2 c2 d2 d2  | c1 \bar "||" 
  c1  | bes2 a2 bes2 c2 | c2 a2 a1 \bar "||" 
      a1  | c2 a2 bes2 g2 | a1 \bar "||"
}


bass = \relative c { \clef bass 
  f1  | f2. f4 c2 d2  | bes2 bes2 f'1 \bar "||"
  c1  | f2 a2 g2 g2   | c,1 \bar "||"
  f1  | bes2 f2 d2 f2 | c2 d2 a1 \bar "||"
  f'1 |c2 d2 bes2 c2  |f1 \bar "||"

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
	} %% close layout

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 69 2) }}      
  		
} %%% Score bracket


%%% Lyric Attribution

\markup {\hspace #80 \small \italic "Nahum Tate, 1652-1715."}


%%% Lyrics in 3 columns. Columm 1 (verses), column 2 (dividing line) and column 3 (verses).

\markup { \hspace #0 %%% add space as necc. to center the entire block of lyrics
          \column {  %%% super column for entire block of lyrics
           \line { %%% master line of 3 columns
	   \column { %%% column 1
              \column { %%% verse 1 is a column of 2 lines
	        \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "W" }   %%Drop Cap goes here
		        \hspace #-1    %% adjust this if other letters are too far from Drop Cap
		        \column  { \raise #0.0 "HILE shepherds watched their flocks by night," 
		                               "  All seated on the ground," } }          
	        \line { \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
			\lower  #1.56  %%adjust this until the line spacing looks right
			\column {   
				"The Angel of the Lord came down,"
				"    And glory shone around."
			  		}}
			           } %%% finish verse 1      

	   \hspace #1 %%% adds vertical spacing between verses
           \line { "2  "
             \column {	     
		     "‘Fear not,’ said he (for mighty dread"
		     "    Had seized their troubled mind);"
		     "‘Glad tidings of great joy I bring"
		     "    To you and all mankind."
	   }}
	   \hspace #1 %%% adds vertical spacing between verses
           \line { "3  "
             \column {	     
		     "‘To you in David's town this day"
		     "    Is born of David's line"
		     "A Saviour, who is Christ the Lord;"
		     "    And this shall be the sign:"
	   }}	   
	  }  %%% end column 1
	 
	\hspace #2 %%% adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -36 . 1 ) #0 }     %%% Column 2. This is the line dviding the columns 1 and 3. 
    
	\hspace #2 %%% adds horizontal space columns 1 and 2   
        \column { %%% column 3
	     \line { "4  "
             \column {    
		     "‘The heavenly Babe you there shall find"
		     "    To human view displayed,"
		     "All meanly wrapped in swathing bands,"
		     "    And in a manger laid.’"
	   }}
	   \hspace #1 %%% adds vertical spacing between verses
           \line { "5  "
             \column { 
		     "Thus spake the Seraph; and forthwith"
		     "    Appeared a shining throng"
		     "Of Angels praising God, who thus"
		     "    Addressed their joyful song:"
	   }}
	  \hspace #1 %%% adds vertical spacing between verses
           \line { "6. "
             \column {    
		     "‘All glory be to God on high,"
		     "    And on the earth be peace;"
		     "Good-will henceforth from heaven to men"
		     "    Begin and never cease.’" 
	   }}
           }  %%% end column 3
	 } %%% end master line 
      } %%% end super column
} %%% end markup


%%% Amen score block

\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                     << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f1 f1 \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo d1 c1 \bar "||" }}	
	                      >>
			      
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree bes'1 a1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  bes1 f1 \bar "||" }}
			       >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout{
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }
       }
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 69 2) }}  %%%Amen midi     

}  

} %%% book bracket
