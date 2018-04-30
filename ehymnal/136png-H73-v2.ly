%%%136.png
%%%Hymn 73 Aus der tiefe Forty days and forty nights
%%%Version 2

\version "2.10"

\header {
	dedication = \markup { \center-align { \line {  "THE CHRISTIAN YEAR - LENT" } 
					       \hspace #1
						} }	
  title = "73"
			       
  arranger = \markup { \small { \italic "Probably by" \smallCaps "Martin Herbst, 1654-81."} }
  poet = \markup { \small { \sans  "AUS DER TIEFE." \hspace #1 \roman { "(7 7. 7 7.)"} } }
  meter = \markup { \small { \italic {Slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 54.} }
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-0.8 
              \once \override Stem #'X-offset = #-0.8 }

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 
merge = \once \override NoteColumn #'force-hshift = #-0.01
		            
%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro definitions	   
	      
%%% SATB voices

global = {
  \time 4/2
  \key d \minor
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
  a'2 a d, e | f g a1 ^\fermata \bar "||" a2 a4( b4) c2 c | b2. a4 a1 ^\fermata \bar "||" \break
  a2 a bes! bes | g g a1 ^\fermata \bar "||" a2 a g f | e2. e4 d1 ^\fermata \bar "||"
}

alto = \relative c' {
  d2 d d cis | d2. e4 \straddle d2( cis) \bar "||" d2 d4( f4) e2 f | f4( e4) d2  cis1 \bar "||"
  fis2 fis g g4( f) | e4( d) c2 c1 \bar "||" c4( bes) c4( d) e2 d | d cis \merge d1 \bar "||"
}

tenor = \relative c { \clef bass
  f2 f4( g) a2 a | a2. g4 e1 \bar "||" f4( g) a4( d) c2 a | a gis a1 \bar "||"
  a2 d d d | c2. bes4 a1 \bar "||" a4( g) a4( bes) c2 a | a4( g) e2 f1 \bar "||"
}

bass = \relative c { \clef bass
  d2 d4( e) f2 a | d,4( c) bes2 a1 _\fermata \bar "||" d4( e) f4( g) a2 f4( e) | d2 e2 a,1 _\fermata \bar "||"
  d4( c) bes4( a) g2 bes | c e f1 _\fermata \bar "||" f2 f c d | a a d1 _\fermata \bar "||"
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

\midi { 
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 54 2) }
       }	
} %%score bracket

%%% Lyrics titles

\markup { \small { \hspace #66 \italic "G. H. Smyttan, 1825-70, and F. Pott."} }

%%% Lyrics in 3 columns,  column 1 (verses), column 2 (a dividing line), column 3 (verses)

\markup { \hspace #10  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "F" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ORTY days and forty nights"
			                                "  Thou wast fasting in the wild;" } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Forty days and forty nights"
					   "    Tempted, and yet undefiled:"
			  		}}
			       
			           } %%% finish verse 1
		        \hspace #1 
           		\line { "2  "
			   \column {	     
				   "Sunbeams scorching all the day;"
				   "    Chilly dew-drops nightly shed;"
				   "Prowling beasts about thy way;"
				   "    Stones thy pillow, earth thy bed."
			}}
			\hspace #1 
           		\line { "3  "
			   \column {	     
				   "Shall not we thy watchings share,"
				   "    And from earthly joys abstain,"
				   "Fasting with unceasing prayer,"
				   "    Glad with thee to suffer pain?"
			}}
	}  %% finish Page column 1
			
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -36 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
 
           		\line { "4  "
			  \column {	     
				  "And if Satan, vexing sore,"
				  "    Flesh or spirit should assail,"
				  "Thou, his vanquisher before,"
				  "    Grant we may not faint nor fail."
			}}
			\hspace #1 
			\line { "5  "
			  \column {	     
				  "So shall we have peace divine;"
				  "    Holier gladness ours shall be;"
				  "Round us too shall Angels shine,"
				  "    Such as ministered to thee."
			}}
		        \hspace #1 
           		\line {"6. "
			  \column {	     
				  "Keep, O keep us, Saviour dear,"
				  "    Ever constant by thy side;"
				  "That with thee we may appear"
				  "    At the eternal Eastertide."
			}}
	    } %%% end column 3
     } %%% end master-line
   } %%% super column bracket
} %%% lyrics markup bracket

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne d1 d1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo bes1 a1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree g'1 fis1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  g1 d'1 \bar "||" }}
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
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 54 2) }}   
       
}  

} %%book bracket