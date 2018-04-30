%%%% 449.png
%%%% Hymn 299. GOSTERWOOD. When spring unlocks the flowers to paint the laughing soil
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—GENERAL"
	\hspace #0.1 }}	
	
	title = "299"   
  
  poet = \markup { \small {  \line { \sans { "GOSTERWOOD."} \hspace #1 \roman {"(13 13. 14 14.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"4" #0.5 = 96. }}
  
  arranger = \markup { \small { \italic "English Traditional Melody." }}
  
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%%% music function to allow lyrics to skip a given number of notes

skips = #(define-music-function (parser location times) (number?)
     #{
	     \repeat unfold $times { \skip 1}
       #})
	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/4
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \tag #'Tune { \partial 4 g'4 | g4. e8 fis4 g4 | a4 ( b4 ) g4 d'4 | c4 b4 a8 g8 a4 | g2. \bar "||" g4 | g4. e8 fis4 g4 | \break
  a4 ( b4 ) g4 d'4 | c4 b4 a8 g8 a4 | g2. \breathmark \bar "||" b8[ c8] | d4. c8 b4 a4 | b4 g4 e4 b'4 | \break
  c4 b4 a4 a8 fis8 | d2. \bar "||" e8 fis8 | g4. e8 fis4 g4 | a4. a8 b4 d4 | c4 b4 a8 g8 a4 | g2. \bar "||" }
      \tag #'Amen { \cadenzaOn g1 g1 \bar "||" }
}   

alto = \relative c' {  
  \tag #'Tune {  b4 | d4. c8 c4 d4 | e4 ( d4 ) g4 fis4 | e4 d4 c4 c4 | b2. \bar "||" b4 | d4. c8 c4 d4 |
  e4 ( d4 ) g4 fis4 | e4 d4 c4 c4 | b2. \bar "||" g'4 | g4. fis8 g4 fis4 | d4 d4 c4 d4 | 
  e4 d4 e4 c4 | d2. \bar "||" d4 | d4. d8 d4 d4 | g4 fis4 g4 f4 | e4 d4 c4 c4 | b2. \bar "||"  }
      \tag #'Amen { c1 b1 \bar "||"  }
}

tenor = \relative c {\clef bass 
  \tag #'Tune { g'4 | g4. g8 c4 b4 | a4 ( fis4 ) g4 g4 | g4 g4 g4 fis4 | g2. \bar "||" g4 | g4. a8 c4 b4 | 
  a4 ( fis4 ) g4 g4 | g4 g4 g4 fis4 | g2. \bar "||" d'4 | d4. a8 b4 d4 | g,4 g4 g4 gis4 | 
  a4 d4 a4 a4 | fis4 ( g4 fis4 ) \bar "||" a4 | g4. g8 a4 g4 | c4. c8 b4 g4 | g4 g4 g4 fis4 | g2. \bar "||" }
      \tag #'Amen { e1 d1 \bar "||" }
}

bass = \relative c {\clef bass 
  \tag #'Tune {  g4 | b4. c8 a4 b4 | c4 ( d4 ) e4 b4 | c4 d4 e4 d4 | g,2. \bar "||" g4 | b4. c8 a4 b4 |
  c4 ( d4 ) e4  b4 | c4 d4 e4 d4 | g,2. \bar "||" g'8 a8 | b4. a8 g4 d4 | b4 b4 c4 b4 | 
  a4 b4 c4 a4 | d4 ( e4 d4 ) \bar "||" c4 | b4. b8 c4 b4 | a4. a8 g4 b4 | c4 d4 e4 d4 | g,2. \bar "||"  }
      \tag #'Amen { c1 g1 \bar "||"  }
}

inlinelyrics = \lyricmode {
  \override LyricText #'font-size = #-1.	
  \skips #60 A -- men.
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
			      
	\new Lyrics \lyricsto sopranos { \override LyricSpace #'minimum-distance = #1 \inlinelyrics }      
			      
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
	
} %%% Score bracket


%%% A separate score block to generate the midi for the Main tune without the Amen

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \removeWithTag #'Amen \soprano }
	\context Voice = altos    { \voiceTwo \global \removeWithTag #'Amen \alto }
	                      >>		      
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \removeWithTag #'Amen \tenor }
	\context Voice = basses { \voiceTwo \global \removeWithTag #'Amen \bass }
			        >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 96 4) }}      
  	
	
} %%% end score bracket

%%% A separate score block to generate the midi for the Amen only

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \keepWithTag #'Amen \soprano }
	\context Voice = altos    { \voiceTwo \global \keepWithTag #'Amen \alto }
	                      >>		      
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \keepWithTag #'Amen \tenor }
	\context Voice = basses { \voiceTwo \global \keepWithTag #'Amen \bass }
			        >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 96 4) }}      
  	
	
} %%% Score bracket


%%% Lyric titles and attributions

\markup { "                " }

\markup {  \small {  \hspace #64 \italic "Bishop R. Heber, 1783-1826." }} 


%%% Lyrics

\markup { \hspace #18 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.4 \column { \lower #2.4 \fontsize #8 "W" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HEN spring unlocks the flowers to paint the laughing soil;"
			                                "  When summer's balmy showers refresh the mower's toil;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "When winter binds in frosty chains the fallow and the flood;"
					   "In God the earth rejoiceth still, and owns his Maker good."
					   "          " %%% adds vertical spacing between verses
			  		}}
		      } %%% end verse 1	
           		\line { "2  "
			   \column {	     
				   "The birds that wake the morning, and those that love the shade;"
				   "The winds that sweep the mountain, or lull the drowsy glade:"
				   "The sun that from his amber bower rejoiceth on his way,"
				   "The moon and stars--their Master's name in silent pomp display."
				   "          " %%% adds vertical spacing between verses
			}}
	  } %%% end supercolumn
} %%% end markup	  
       
      
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
%%% continuation of  lyrics

\markup { \hspace #18  %%add space as necc. to center the column  
		\column { 
			\hspace #1  % adds vertical spacing between verses  
			\line { "3  "
			   \column {	     
				   "Shall man, the lord of nature, expectant of the sky,"
				   "Shall man alone, unthankful, his little praise deny?"
				   "No; let the year forsake his course, the seasons cease to be."
				   "Thee, Master, must we always love, and, Saviour, honour thee."
				   "          " %%% adds vertical spacing between verses
			}}	   
			\line { "4. "
			   \column {	     
				   "The flowers of spring may wither, the hope of summer fade,"
				   "The autumn droop in winter, the birds forsake the shade;"
				   "The winds be lulled, the sun and moon forget their old decree;"
				   "But we, in nature's latest hour, O Lord, will cling to thee!"
			}}
	  }
} %%% lyric markup bracket


} %%% book bracket

