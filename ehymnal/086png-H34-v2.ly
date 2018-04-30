%%% 086.png
%%% Hymn 34 Sarratt All Hail, ye little
%%% Version 2

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - INNOCENTS' DAY"
		\hspace #0.1 }}	
  title = "34"
  
  meter = \markup {  \small { \column {  \line { \sans {"SARRATT."} \hspace #1 \roman {"(L. M.)"}}
                                        \line { \italic {Moderately slow} \fontsize #-5 \general-align #Y #DOWN \note #"4" #1 = 112.}}}}   
  
  arranger =  \markup {  \small \center-align {
		            \line{ " " } 
  			    \line { \smallCaps "G. C. E. Ryley."}}}
  tagline =""
}

%%% SATB voices

global = {
  \time 3/4 
  \key f \major 
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
  \tag #'Tune { \partial 4 a'4 | a2 f4 | bes4.( a8) g4 | c2 d4 | c2. \bar "||" c4 d4 a4 | \break
  bes2 c4 | a4.( g8) f4 | g2. \bar "||" g4 a4 e4 | f2 f4 | \break
  f4.( e8) d4 | g2 \bar "||" c4 | f,2 g4 | a4.( bes8) c4 | a2 g4 \bar "|"
      \set Score.measurePosition = #(ly:make-moment 1 4)
	f2 \bar "||" }
  \tag #'Amen {\time 4/2 \new Voice = "Amen" { f1 f1 } }\oneVoice \bar "||"

}

alto = \relative c' {
  \tag #'Tune { \partial 4 f4 | f2 f4 | f2 f4 | f2 e4 | f2. \bar "||" f4 fis4 fis4 |
  g4.( f!8) e4 | f4.( e8) d4 | e2. \bar "||" d4 cis4 cis4 | d2 c!4 |
  b2 b4 | c2 \bar "||" e4 | f2 c4 | f2 f4 | f2 e4 \bar "|"
      \set Score.measurePosition = #(ly:make-moment 1 4)
      f2 \bar "||" }
  \tag #'Amen { d1 c1 } \bar "||" 
}

tenor = \relative c { \clef bass
  \tag #'Tune { \partial 4 c'4 | c2 a4 | d4.( c8) bes4 | a2 g4 | a2. \bar "||" a4 a4 d4 |
  d2 c4 | c4.( bes8) a4 | g2. \bar "||" d4 e4 a4 | a2 a4 |
  a4.( g8) f4 | e2 \bar "||" bes'!4 | a2 c4 | c2 c4 | c2 bes4 \bar "|"
      \set Score.measurePosition = #(ly:make-moment 1 4)
      a2 \bar "||" }
  \tag #'Amen { bes1 a1 }\bar "||"
}

bass = \relative c { \clef bass
  \tag #'Tune { \partial 4 f4 | f2 f4 | f2 f4 | f2 f4 | f2. \bar "||" f4 d4 d4 |
  g2 c,4 | f2 f4 | c2. \bar "||" bes4 a4 a4 | d2 d4 |
  g,2 d'4 | c2 \bar "||" c4 | d2 e4 | f2 a,4 | c2 c4 \bar "|"
      \set Score.measurePosition = #(ly:make-moment 1 4)
      f2 \bar "||" }
  \tag #'Amen { bes,1 f'1 } \bar "||"
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
	\new Lyrics \lyricsto "Amen" { \override LyricText #'font-size = #-1 A -- men. }
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

	
} %%score bracket

%%%% score block to generate tune midi without Amen

\score {
\new ChoirStaff	
 <<

	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \removeWithTag #'Amen \soprano }
	\context Voice = altos    {\voiceTwo \global \removeWithTag #'Amen \alto }
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \removeWithTag #'Amen \tenor }
	\context Voice = basses { \voiceTwo \global \removeWithTag #'Amen \bass }
			        >>
 >>
	
\midi {    \context { \Score tempoWholesPerMinute = #(ly:make-moment 112 4) } }

} 

%%% score block to generate Amen midi without main tune

\score {
\new ChoirStaff	
 <<

	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \removeWithTag #'Tune \soprano }
	\context Voice = altos    {\voiceTwo \global \removeWithTag #'Tune \alto }
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \removeWithTag #'Tune \tenor }
	\context Voice = basses { \voiceTwo \global \removeWithTag #'Tune \bass }
			        >>
 >>
	
\midi {    \context { \Score tempoWholesPerMinute = #(ly:make-moment 112 4) } }

} 

%%% Hymn Note

\markup { \hspace #18 \smallCaps "Note." "—" \italic "This hymn may also be sung to the Rouen Melody, No. 18." } 

%%% Lyric titles and attributions

\markup { \hspace #7 \small {  "(" \hspace #-1 \italic "Office Hymns, 182, 183." \hspace #-1 ")" \hspace #44 \italic "Prudentius, b. 348.  Tr. A. R."  }  } 

\markup { \hspace #46 \small "Salvete flores martyrum." }

%%% Main lyric block
%%% To fit on one page, lyrics are in 3 columns: column 1 (verses ), column 2 (a dividing line), column 3 (verses)

\markup { \hspace #5 %%add space as necc. to center the column
          \column { %% super column of everything
            \line { %% a master line of 3 columns
              \column { %% column 1
	      \hspace #0.2 % adds vertical spacing between verses
	        \column { %%stanza 1 is a column of 2 lines  
	          \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "A" }   %%Drop Cap goes here
			 \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
			\column  { \raise #0.0 "LL hail, ye little Martyr flowers," "  Sweet rosebuds cut in dawning hours!" } }          
	          \line { \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
			\lower  #1.56  %%adjust this until the line spacing looks right
			\column {   
				"When Herod sought the Christ to find"
				"Ye fell as bloom before the wind."
			  		}}
	          } %% finish stanza 1
		  
	         \hspace #0.2 % adds vertical spacing between verses
                 \line { "2  "
                    \column {	     
			    "First victims of the Martyr bands,"
			    "With crowns and palms in tender hands,"
			    "Around the very altar, gay"
			    "And innocent, ye seem to play."  
	         }}
	}  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -26 . -1) #0 }       %%Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3
	   
	\column { %%start page column 3		
 
	   \hspace #0.2 % adds vertical spacing between verses
	   \line { "3  "
             \column { 
		     "What profited this great offence?"
		     "What use was Herod's violence?"
		     "A Babe survives that dreadful day,"
		     "And Christ is safely borne away."    
	   }}
	    \hspace #0.2 % adds vertical spacing between verses
           \line { "4. "
             \column {    
		     "All honour, laud, and glory be,"
		     "O Jesu, virgin-born, to thee;"
		     "All glory, as is ever meet"
		     "To Father and to Paraclete."
		     "                                                  Amen."
	   }}   
	  } %% end column 3
	  } %% master line bracket
	  
          } %% page super column bracket
} %%markup bracket

	
} %%book bracket

