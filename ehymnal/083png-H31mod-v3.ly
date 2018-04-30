%%%083png
%%%Hymn 31 Modern. St Thomas  "Saint of God, elect and precious"
%%%Version 3

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - ST. STEPHEN'S DAY"
		                         \hspace #0.1 }}	
  
  title = \markup { "31" \large \smallCaps " (Modern Tune)" }
  
  meter = \markup { \small {\column {  \line { \sans {"ST. THOMAS."} \hspace #1 \roman {"(8 7. 8 7. 8 7.)"}}
                                       \line { \italic {Moderately slow, dignified} \general-align #Y #DOWN \note #"2" #0.5 = 66.}
  }}}
 
  arranger =  \markup { \small {\center-align {
		            \line{ \italic "Melody from" \smallCaps "S. Webbe's"}
			    \line { "‘" \hspace #-1.2 \italic "Motetts or Antiphons" \hspace #-1.2 ",’ 1792."}			    
  }}}
  
  tagline =""
}


%%%%%%%%%%%%%%%%%%%%%%%%% Macros 

%%generates a parenthesis large enough to enclose two noteheads. Use extra-offset to position it.
%%uaing it because regular parentheses are too small and faint
parens = \markup { \fontsize #2 \musicglyph #"accidentals.leftparen" \hspace #0.8 \fontsize #1 \musicglyph #"accidentals.rightparen"}

%%%%%%%%%%%%%%%%%%%%%%%%%e nd of Macro definitions

%%%% SATB voices

soprano = \relative c' {
  d2 e2 fis2 d2 | e2 fis2 g2 fis2 \bar "||" b2 a2 g2 fis2 | e2 e2 d1 \bar "||" \break
  d'2 cis2 d2 a2 | b2 a2 g2 fis2 \bar "||" b2 cis2 d2 cis2 | b2 b2 a1 \bar "||" \break
  a2 a2 fis2 d2 | e2 fis2 g2 fis2 \bar "||" a2 fis2 b2 a4 ( g4 ) | fis2 e2 d1 \bar "||" 
}

alto = \relative c' {
  a2 cis2 d2 d2 | a2 d2 cis2 d2 \bar "||" d2 d2 d4 ( cis4 ) d2 | d2 cis2 
      \once \override NoteColumn #'force-hshift = #-0.01  d1 \bar "||" 
  fis2 e2 d2 d2 | d2 d2 cis2 d2 \bar "||" fis2. e4 d2 e2 | e2. d4 cis1 \bar "||" 
  d2 e2 d2 d2 | cis2 d2 d4 ( cis4 ) d2 \bar "||" d2. cis4 b4 ( cis4 ) d2 | d2 cis2 
      \once \override NoteColumn #'force-hshift = #-0.01 d1 \bar "||" 
}

tenor = \relative c { \clef bass
  fis2 a2 a2 a2 | a2 a2 a2 a2 \bar "||" g2 a2 b4 ( g4 ) a2 | a2. g4 fis1 \bar "||" 
  a2 g2 fis2 fis2 | g2 a2 a2 a2 \bar "||" d2 cis2 b2 a!2 | a2 gis2 a1 \bar "||" 
  a2 a2 a2 a2 | a2 a2 g2 a2 \bar "||" a2 a2 g2 a4 ( b4 ) | a2. g4 fis1 \bar "||" 
}

bass = \relative c { \clef bass
  d2 a2 d2 fis2 | cis2 d2 e2 d2 \bar "||" g2 fis2 e2 d2 | a2 a2 d1 \bar "||" 
  d2 e2 fis2 d2 | g2 fis2 e2 d2 \bar "||" b2 ais2 b2 cis4 ( d4 ) | 
       e2 << { e2 } 
       \new Voice = optional { \voiceFour 
	   \once \override NoteColumn #'force-hshift = #0.45    
           \set fontSize = #-3 e,2 } >> 
	   \once \override TextScript #'padding = #0
	   \once \override TextScript #'extra-offset = #'( -7.0 . 0.0 )
	   a1_\parens \bar "||" 
  fis'2 cis2 d2 fis2 | g2 fis2 e2 d2 \bar "||" fis2 d2 g2 fis4 ( g4 ) | 
        \once \override NoteColumn #'force-hshift = #0.45   
        a2 a,2 d1 \bar "||" 
}

global = {
 \time 4/2 
 \key d \major
 \set Staff.midiInstrument = "church organ"  
}

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
  top-margin = 1\mm
  bottom-margin = 1\mm
  print-page-number = ##f
  between-system-space = #0.2
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
%%		\context { \Score timing = ##f }
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

%%% Lyric titles and attributions

\markup { \hspace #16 \small \smallCaps "Office Hymn. M. and E."  \hspace #26 \small \italic "10th-16th cent.  Tr. J. M. Neale."  }

\markup { \hspace #42 \small "Sancte Dei pretiose." }


%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "S" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "AINT of God, elect and precious," 
			                                 "  Protomartyr Stephen, bright" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "With thy love of amplest measure,"
					   "    Shining round thee like a light;"
					   "Who to God commendedst, dying,"
					   "    Them that did thee all despite:"
			  		}}
		      } %%% end verse 1	
		      \hspace #1  % adds vertical spacing between verses  
		          \line { "2  "
			  \column {	     
				  "Glitters now the crown above thee,"
				  "    Figured in thy sacred name:"
				  "O that we, who truly love thee,"
				  "    May have portion in the same;"
				  "In the dreadful day of judgement"
				  "    Fearing neither sin nor shame."
			}}
	  } %%% end super column
}		      
		      
		      
%%fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
\score{
	{s4 }
\header { breakbefore = ##f piece = ##f opus = ##f tagline = ##f }
\layout{	
	\context { \Staff
		\remove Time_signature_engraver
		\remove Key_engraver
		\remove Clef_engraver
		\remove Staff_symbol_engraver
}}}

%%% Second page
%%% Continuation of lyrics		      
		      
\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything		      
			\hspace #1  % adds vertical spacing between verses  
           		\line { "3. "
			   \column {	     
				  "Laud to God, and might, and honour,"
				  "    Who with flowers of rosy dye"
				  "Crowned thy forehead, and hath placed thee"   
				  "    In the starry throne on high:"
				  "He direct us, he protect us"
				  "    From death's sting eternally.     Amen." 
			}}
	  } %%% end supercolumn
} %%% end markup	  
       

%%% Amen score block
\score{
		
	
 \new ChoirStaff
 <<
 \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
                      << 
        \context Voice = "sopranos" { \relative c' { \global \voiceOne  d1 d1 \bar "||" }}
	\context Voice = "altos" { \relative c'    { \global \voiceTwo b1 a1 \bar "||" }}
	 		>>
			 
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                 <<
	\context Voice = "tenors" { \relative c {  \global \clef bass \voiceThree g'1 fis1 \bar "||" }}
	\context Voice = "basses" { \relative c {  \global \clef bass \voiceFour g1 d'1 \bar "||" }}
			 >> 
 >>			 
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
	ragged-right = ##t
         indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

 }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2) }} %%Amen midi 

} 	

} %%book bracket
