%%% 081.png
%%% Hymn 30 Alternative Version While Shepherds Watched
%%% Version 2 Reset fonts

\version "2.10.19"

%%generates the breathmarks above barlines
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}


\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - CHRISTMAS"
		\hspace #0.1 }}	
  title = "30"
  subtitle = \markup { \smallCaps "Alternative Version" }
  opus =  \markup { \small { \italic {"Harmonized by" } 
                   \smallCaps { "T. Ravenscroft" } \italic {"in his Psalter, 1621." } } }    
  tagline =""
}


global = {
  \time 4/2 	
  \key  f\major	
  \set Staff.midiInstrument = "church organ" 
}


people = \relative c' { 
  \once \override TextScript #'extra-offset = #'(-3.2 . 1.0)  	
  \partial 1 f1^\markup { \small \smallCaps "People's Part."} | a2. a4 g2 f2 | bes2 bes2 a1 \bar "||" 
      \partial 1 g1 | a2 c2 c2 b2 | c1 \bar "||" \break
  \partial 1 a1 | d2 c2 bes2 a2 | g2 f2 e1 \breathmark \bar "||" 
      \partial 1 a1 | g2 f2 f2 e2 | f1 \bar "||" 
}


soprano = \relative c' {
	\once \override TextScript #'staff-padding = #1.5
	\once \override TextScript #'extra-offset = #'(-3.2 . 0.0)
  b'2\rest ^\markup { \small \smallCaps "Choir or Organ."} a2 | c2. c4 c2 a2  | d2 d2 c1 \bar "||" 
      b2\rest c2 | c2 e,2 g2 g2   | g1 \bar "||"
  b2\rest f2  | bes2 a2 g2 f2 | e2 f2 g1 \bar "||"
      b2\rest f2 | c'2 a2 bes2 g2 | a1 \bar "||"
}

alto = \relative c' { 
  c1 | f2. f4 e2 f2    |  f2 f2 f1 \bar "||" e1 | f2 c2 d2 d2 | e1 \bar "||"
  c1 | f2 ees2 ees2 c2 |  c2 a2 c1 \bar "||" c1 | c2 c2 d2 c2 | c1 \bar "||"
}

tenor = \relative c { 
  \override DynamicText #'transparent = ##t	
  f1\ff | a2. a4 g2 f2  | bes2 bes2 a1 \bar "||" g1 | a2 c2 c2 b2 | c1 \bar "||"
  a1 | d2 c2 bes2 a2 |  g2 f2 e1    \bar "||" a1 | g2 f2 f2 e2 | f1 \bar "||"
}

bass = \relative c { \clef bass \set Staff.midiInstrument = "church organ"
  b2\rest f'2 | f2. f4 c2 d2    | bes2 bes2 f'1 \bar "||" c1 | f2 a2 g2 g2    | c,1 \bar "||"
  f1          |bes,2 c2 ees2 f2 | c2 d2 c1      \bar "||" f1 | e2 f2 bes,2 c2 | f,1 \bar "||"
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
 	\context Staff = people { \voiceOne \global \people } 
	\new GrandStaff
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

 >>
\layout {
		indent=0
		\context { \Score \remove "Bar_number_engraver" }
		\context { \GrandStaff \remove "Span_bar_engraver" }
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

\markup{ \hspace #8
  \override #'(line-width . 85)
  \small {\justify{ "    [" \italic {It is suggested that this version be used either
	  by the Choir alone, or with the people singing the melody, to verses 
	  2, 3, and 4.    The tenor part which has the melody should be made 
          prominent.} "]" }}}

\markup { "  "}	
	
\markup { \small { \hspace #51 \center-align {
	
	\line {\smallCaps "Note.--" 
		\italic {It is impossible to print all the tunes which are
	traditionally sung to this hymn. The} }

        \line {\italic {tune often used in Cornwall is printed in the Appendix.}}

	\line { \smallCaps "University"  \italic "(No. 93) and" 
	        \smallCaps "Crowle" \italic "(No. 463) are sometimes" }
		\line { \italic	"sung to this hymn." }
}}}

%%fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
\score{
{ s4 }
\header { breakbefore = ##f piece = " " opus = " " tagline = ##f }
\layout{
\context { \Staff
\remove Time_signature_engraver
\remove Key_engraver
\remove Clef_engraver
\remove Staff_symbol_engraver
}}}
	
%%second page

\markup { \hspace #5
       \fill-line { 
          \column {
	   \line { \hspace #46 \italic {"Nahum Tate, 1652-1715."}}
	   \line { " " }
          
           \column { %% stanza 1 column
	        \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "W" }   %%Drop Cap goes here
		        \hspace #-1    %% adjust this if other letters are too far from Drop Cap
		        \column  { \raise #0.0 "HILE shepherds watched their flocks by night," "All seated on the ground," } }          
	        \line { \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
			\lower  #1.56  %%adjust this until the line spacing looks right
			\column {   
				"The Angel of the Lord came down,"
				"    And glory shone around."
			  		}}
			           } %% finish stanza 1      

	   \hspace #0.2 % adds vertical spacing between verses
           \line { "2  "
             \column {	     
		     "'Fear not,' said he (for mighty dread"
		     "    Had seized their troubled mind);"
		     "'Glad tidings of great joy I bring"
		     "    To you and all mankind."
	   }}
	   \hspace #0.2 % adds vertical spacing between verses
           \line { "3  "
             \column {	     
		     "'To you in David's town this day"
		     "    Is born of David's line"
		     "A Saviour, who is Christ the Lord;"
		     "    And this shall be the sign:"
	   }}
	   \hspace #0.2 % adds vertical spacing between verses
           \line { "4  "
             \column {    
		     "'The heavenly Babe you there shall find"
		     "    To human view displayed,"
		     "All meanly wrapped in swathing bands,"
		     "    And in a manger laid.'"
	   }}
	   \hspace #0.2 % adds vertical spacing between verses
           \line { "5  "
             \column { 
		     "Thus spake the Seraph; and forthwith"
		     "    Appeared a shining throng"
		     "Of Angels praising God, who thus"
		     "    Addressed their joyful song:"
	   }}
	  \hspace #0.2 % adds vertical spacing between verses
           \line { "6. "
             \column {    
		     "'All glory be to God on high,"
		     "    And on the earth be peace;"
		     "Good-will henceforth from heaven to men"
		     "    Begin and never cease.'" 
	   }}
           }
           }
	} % stanza markup bracket
	
%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f1 f1 \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo d1 c1 \bar "||" }}	
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
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
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 69 2) }}  %%Amen midi       
}  

} %%book bracket