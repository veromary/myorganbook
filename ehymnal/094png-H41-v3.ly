%%%094.png
%%%Hymn 41 Liebster Immanuel Brightest and Best of the sons of the morning.
%%%Version 3

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - THE EPIPHANY"
		\hspace #0.1 }}	
  title = "41"
  meter = \markup {  \small { \column {  \line { \sans {"LIEBSTER IMMANUEL."} \hspace #1 \roman {"(11 10. 11 10.)"}}
                                        \line { \italic {Slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 72.}}}}   
  arranger =  \markup {  \small \center-align {
		            \line{ \italic {"Melody from 'Himmels-Lust,' 1679." } }
			    \line { \italic  "Adapted by" \smallCaps "J. S. Bach."}}}
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%macros

%%generates the breathmarks which are placed on top of barlines
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}	      

%%%%%%%%%%%%%%%%%%%%%%%%%%end of macro definitions



soprano = \relative c' {
  d'2  d2 d2 | cis2. b4 a2 | b2 g2 fis2 | \once \override NoteColumn #'force-hshift = #1.6 e1 d2 \breathmark \bar "||" a'2 a2 fis2 | \break
  \once \override NoteColumn #'force-hshift = #1.0  b2. cis4 d2 | 
      d,2 e2. fis4 | fis1. \breathmark \bar "||" fis2 fis2 g2 | a2 fis2. fis4 | b2 ais2 b2 | \break
  cis2 fis,1 \breathmark \bar "||" d'2 cis2  b2 | ais2. fis4 b2 | cis4 ( d4 ) ais2. b4 | b1. \bar "||" 
}

alto = \relative c' {
 fis2 fis2 eis4 ( fis4 ) | gis2 eis2 fis2 | d2 d4 ( cis4 ) d2 | d2 ( cis2 ) a2 \bar "||" d2 d2 d2 | 
 \once \override NoteHead #'X-offset = #1.4
     \once \override Stem #'X-offset = #1.46 d2 g2 fis2 | 
     b,2  b4 ( d4 ) cis4 ( b4 ) | cis1. \bar "||" d2 d2  d2 | e2 d2. d4 | fis2 e2 fis2 | 
 fis2 \once \override NoteColumn #'force-hshift = #-0.02 fis1 \bar "||" 
     fis2 g2 e2 | fis2. fis4 fis2 | g2 fis2 fis2 | fis1. \bar "||" 
}

tenor = \relative c {
  b'2  b2 b4 ( a4 ) | gis2 cis2 cis2 | b2 b2 a2 | a2. g4 fis2 \bar "||" a2 a2 a2 | 
  g4 ( a4 ) b2 b2 | 
      b2 b2 ais4 ( b4 ) |   ais1. \bar "||" b2 b2 b2 | a2 a2. a4 | b2 cis2 d2 | 
  ais2 ais1 \bar "||" b2 ais2 b2 | cis2. cis4 b2 | e4 ( d4 ) cis2 cis2 | d1. \bar "||" 
}

bass = \relative c { \clef bass
  b2  
      \once \override NoteHead #'X-offset = #-2.8
      \once \override Stem #'X-offset = #-2.8
      b'4 ( a4 ) gis4 ( fis4 ) | eis2 cis2 fis2 | g!2 e2 fis2 | a2 ( a,2 ) d2 \bar "||" fis2 fis2 d2 | 
  g2 e2 b2 | g2 g2 g'2 | fis1. \bar "||" b,2 b2 e2 | cis2 d2. d4 | d2 cis2 b2 | 
  fis'2 fis1 \bar "||" b2 e,2 g2 | fis2 e2 d2 | e2 fis2 fis,2 | b1. \bar "||" 
}

global = {
  \time 3/2 
  \key d \major 
  \set Staff.midiInstrument = "church organ"
}


#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
 % annotate-spacing = ##t
 % top-margin = 3\mm
 % bottom-margin = 5\mm
 % after-title-space = 1\mm
 % between-system-space = #0.1
 % between-system-padding = 2\mm
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
%		\context { \Score timing = ##f }
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	}
	
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 72 2)
            }
       }
	
} %%score bracket

\markup { \hspace #22 \smallCaps "Note" ".—" \italic  "A major tune for this hymn will be found in the Appendix."  } 

\markup {  \small { \hspace #72 \italic "Bishop R. Heber, 1783-1826." }  }

\markup { \hspace #26 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "B" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "RIGHTEST and best of the sons of the morning,"  "   Dawn on our darkness and lend us thine aid;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Star of the East, the horizon adorning,"
					   "    Guide where our infant Redeemer is laid."
			  		}}
			       
			           } %% finish stanza 1	
		       \hspace #1 
           		\line { "2  "
			   \column {	     
				   "Cold on his cradle the dew-drops are shining,"
				   "    Low lies his head with the beasts of the stall:"
				   "Angels adore him in slumber reclining,"
				   "    Maker and Monarch and Saviour of all."
			}}		
		}  
}	  
	
%%second page
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

\markup { \hspace #26   %%add space as necc. to center the column
          \column { 
           	\line { "3  "
		    \column {	     
				  "Say, shall we yield him, in costly devotion,"
				  "    Odours of Edom and offerings divine?"
				  "Gems of the mountain and pearls of the ocean,"
				  "    Myrrh from the forest or gold from the mine?"
			}}
		\hspace #1 % adds vertical spacing between verses  
           	\line {"4  "
		    \column {	     
			    "Vainly we offer each ample oblation,"
			    "    Vainly with gifts would his favour secure;"
			    "Richer by far is the heart's adoration,"
			    "    Dearer to God are the prayers of the poor."
			}}  
		\hspace #1 % adds vertical spacing between verses
           	\line { \hspace #-10  \italic "Unison."  "  5. "
		   \column {	     
			   "Brightest and best of the sons of the morning,"
			   "    Dawn on our darkness and lend us thine aid;"
			   "Star of the East, the horizon adorning,"
			   "    Guide where our infant Redeemer is laid."
     			}}
	  }
}% stanza markup bracket

%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne b'1 b1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo e1 dis1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree g'1 fis1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  e1 b1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 72 2) }}  %%Amen midi       
       
}  


} %%book bracket