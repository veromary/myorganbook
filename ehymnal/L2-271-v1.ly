%%%% 419.png
%%%% Hymn 271. Welwyn. O strength and stay upholding all creation.
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—EVENING"
	\hspace #0.1 }}	
	
	title = "271"   
  
  poet = \markup { \small {  \line { \sans { "WELWYN."} \hspace #1 \roman {"(11 10. 11 10.)"}} }}
  
  meter = \markup { \small { \italic {Moderately slow} \general-align #Y #DOWN \note #"4" #0.5 = 96.} }
  
  arranger = \markup { \small { \smallCaps "A. Scott-Gatty." }}
  
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% Merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = { \once \override NoteColumn #'force-hshift = #-0.01 }

%%generates the breathmarks
breathmark = { 
	\override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup { \fontsize #4 "," }
	}

%%% music function to move a note various amounts of space. \movenote #0.4 moves is equivalent to force-hshift = #0.4

movenote = #(define-music-function (parser location vector) (number?)
     #{
	     \once \override NoteColumn #'force-hshift = #$vector
     #})
	
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/4
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  a'2 g4 f4 | e2. f4 | g4 bes4 a4 g4 | f2 e2 \bar "||" f2 d'4 d4 | \break 
  c2. f,4 | bes4 c4 a4 c8 bes8 | a2 ( g4 -) \breathmark \bar "||" g4 | a2 \movenote #2 c,2 | d2 e4 ( f4 -) | \break
  bes4 a4 g4 f4 | a2 g2 \bar "||" c2 bes4 a4 | d2. c4 | bes4 a4 g4 a4 | f1 \bar "||" 
}
   
alto = \relative c' {  
  c2 c4 c8 b8 | c2. c4 | d4 d4  d4 d4 | c2 c2 \bar "||" c2 d4 e4 | 
  f2. f4 | d4 e4 c4 d4 | f2 ( e4 -) \bar "||" e4 | c2 bes4 ( a4 -) | c2 bes4 ( a4 -) | 
  bes4 c4 d4 d4 | f2 e2 \bar "||" f2 e4 f4 | f2 ( e4 -) f4 | f4 f4 f4 e4 | \merge f1 \bar "||"
}

tenor = \relative c {\clef bass 
  f2 g4 g4 | g2. f4 | d4 g4 fis4 g4 | a2 g2 \bar "||" f2 f4 g4 | 
  a2. a4 | g4 g4 a4 g4 | a4 ( b4 c4 -) \bar "||" c4 | a2 e4 ( f4 -) | a2 g4 ( f4 -) | 
  d4 fis4 g4 g4 | f4 ( a4 -) c2 \bar "||" c2 c4 c4 | bes2 ( g4 -) c4 | d4 c4 d4 c4 | a1 \bar "||" 
}

bass = \relative c {\clef bass 
  f2 e4 d4 | c2 ( bes4 -) a4 | bes4 g4 a4 bes4 | c2 c4 ( bes4 -) \bar "||" a2 bes4 bes4 | 
  a2. d4 | g4 c,4 f4 bes,4 | c2. \bar "||" c4 | f,2 g4 ( a4 -) | bes2 c4 ( d4 -) | 
  g,4 a4 bes4 b4 | c2 c4 ( bes!4 -) \bar "||" a4 ( a'4 -) g4 f4 | bes,2. a4 | g4 a4 bes4 c4 | f,1 \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 96 4) }}      
  	
	
} %%% Score bracket

%%% Lyric titles and attributions

\markup { \hspace #18 \small {  \column { \line { \hspace #48 \italic "Ascribed to St. Ambrose, 340-97." } 
          	                         \line {   \hspace #50 \italic "Tr. J. Ellerton, F. J. A. Hort." }    
					 \line { \hspace #22 "Rerum Deus tenax vigor." }
}}}

%%% Lyrics

\markup { \hspace #26 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 " STRENGTH and Stay upholding all creation,"
			                                "    Who ever dost thyself unmoved abide," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Yet day by day the light in due gradation"
					   "    From hour to hour through all its changes guide;"
					   "          " %%% adds vertical spacing between verses
			  		}}
		      } %%% end verse 1	
           		\line { "2  "
			   \column {	     
				   "Grant to life's day a calm unclouded ending,"
				   "    An eve untouched by shadows of decay,"
				   "The brightness of a holy death-bed blending"
				   "    With dawning glories of the eternal day."
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

\markup { \hspace #26   %%add space as necc. to center the column  
		\column { 
			\hspace #1  % adds vertical spacing between verses  
           		\line { "3. "
			   \column {	     
				   "Hear us, O Father, gracious and forgiving,"
				   "    Through Jesus Christ thy co-eternal Word,"
				   "Who, with the Holy Ghost, by all things living"
				   "    Now and to endless ages art adored.        Amen."
			}}
	  }
} %%% lyric markup bracket



%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne  \cadenzaOn f1 f1   \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo d1 c1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree bes'1 a1   \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  bes1 f'1  \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 96 4) }}  %%Amen midi       
       
}  


} %%% book bracket


%%%   Transcriber's Notes
%%%
%%% While the image shows a tempo of 2=96 (ditto the 1933 ed.), this is much too fast to be "Moderately slow"
%%% I changed it to 4=96 and this sounds about right. 
