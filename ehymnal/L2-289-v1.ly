%%%% 438.png
%%%% Hymn 289. ST. GEORGE. Come, ye thankful people, come
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—HARVEST"
	\hspace #0.1 }}	
	
	title = "289"   
  
  poet = \markup { \small {  \line { \sans { "ST. GEORGE."} \hspace #1 \roman {"(7 7. 7 7. D.)"}} }}
  
  meter = \markup { \small { \italic {Brightly} \general-align #Y #DOWN \note #"4" #0.5 = 100.} }
  
  arranger = \markup { \small { \smallCaps "G. J. Elvey," "1816-93." }}
  
  tagline = ""
}


%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%% Macro for generating two augmentation dots for a notehead. 
%% When dotted notes from two vocal parts share a single notehead, 
%% Lilypond only inserts a single dot. In the image, two dots are used. 
%% This macro generates the two dots by replacing the normal dot glyph 
%% with a new glyph comprising a column of 2 dots one above the other.
 
augdots = { 
 \once \override Voice.Dots #'stencil = #ly:text-interface::print 
 \once \override Voice.Dots #'text = \markup {  \hspace #0 \raise #1 
                                                \line { \translate #(cons -0.2 0) 
                                                \override #'(baseline-skip . 1 )  
                                                   \column { 
                                                     \musicglyph #"dots.dot" 
                                                     \musicglyph #"dots.dot" } } }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/4
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  a'4. a8 c4 a4 | f4 g4 a2 \bar "||" a4. a8 c4 a4 | f4 g4 a2 \breathmark \bar "||" a4. a8 bes4 bes4 | \break
  g4. g8 a2 \bar "||" a4  b4 c4 f,4 | e4 d4 c2 \breathmark \bar "||" e4. e8 g4 e4 | f4 g4 a2 \bar "||" \break
  a4. a8 c4 a4 | bes4 c4 d2 \breathmark \bar "||" d4. d8 bes4 g4 | \noBreak c4. c8 a2 \bar "||" bes4 d4 c4 f,4 | a4 g4 f2 \bar "||" 
}
   
alto = \relative c' {  
  c4. c8 c4 c4 | d4 e4 f2 \bar "||" c4. c8 c4 c4 | d4 d4 cis2 \bar "||" d4.  d8 d4 d4 |
  c4 c4 c2 \bar "||" c4 d4 c4 d4 | c4 b4 c2 \bar "||" c4. c8 c4 c4 | c4 bes4 c2 \bar "||" 
  c4. c8 f4  f4 | f4 ees4 d2 \bar "||"d4 fis4 g4 d4 | c4 e4 f2 \bar "||" f4 f4 f4 f4 | f4 e4 f2 \bar "||"
}

tenor = \relative c {\clef bass 
  \override Staff.NoteCollision #'merge-differently-dotted = ##t		
  f4. f8 g4 a4 | a4 c4 c2 \bar "||" f,4. f8 g4 f4 | a4 bes4 e,2 \bar "||" f4. f8 g4 g4 |
  e4 e4 f2 \bar "||" f4 f4 g4 a4 | g4. f8 e2 \bar "||" g4 g4 e4 g4 | f4. e8 f2 \bar "||" 
  f4. f8 a4 c4 | bes4. a8 bes2 \bar "||" a4 d4 d4 bes4 | g4 c4 c2 \bar "||" bes4 bes4 c4 a4 | c4. bes8 a2 \bar "||" 
}

bass = \relative c {\clef bass 
  \augdots  f4. f8 e4 f4 | d4 c4 f2 \bar "||" f4. f8 e4 f4 | d4 bes4 a2 \bar "||" d4. d8 g,4  g4 |
  c4 c4 f,2 \bar "||" f'4 d4 e4 f4 | g4 g,4 c2 \bar "||" c4. c8 c4 bes4 | a4 g4 f2 \bar "||" 
  f4. f8 f'4 ees4 | d4 c4 bes2 \bar "||" fis'4 d4 g4. g8 | e4 c4 f2 \bar "||" d4 bes4 a4 d4 | c4 c4 f,2 \bar "||" 
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

%%% Lyric attributions and titles

\markup { \small { \hspace #64 \italic "H. Aljord, 1810-71." }}

%%% Lyrics

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "C" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "OME, ye thankful people, come,"
			                                 "  Raise the song of harvest-home!" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "All is safely gathered in,"
					   "Ere the winter storms begin;"
					   "God, our Maker, doth provide"
					   "For our wants to be supplied;"
					   "Come to God's own temple, come;"
					   "Raise the song of harvest-home!"
					   "      " %%% adds vertical spacing between verses
			  		}}
		      }  

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

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
			\hspace #1 % adds vertical spacing between verses
			\line {"2  "
				\column {
					"We ourselves are God's own field,"
					"Fruit unto his praise to yield;"
					"Wheat and tares together sown,"
					"Unto joy or sorrow grown;"
					"First the blade and then the ear,"
					"Then the full corn shall appear;"
					"Grant, O harvest Lord, that we"
					"Wholesome grain and pure may be."
					 "      " %%% adds vertical spacing between verses
			}}
			\line {"3  "
				\column {
					"For the Lord our God shall come,"
					"And shall take his harvest home;"
					"From his field shall purge away"
					"All that doth offend, that day;"
					"Give his Angels charge at last"
					"In the fire the tares to cast."
					"But the fruitful ears to store"
					"In his garner evermore."
					 "      " %%% adds vertical spacing between verses
			}}
           	        \line { \hspace #-10  \italic "Unison."  " 4. "
		                  \column {	     
					  "Then, thou Church triumphant, come,"
					  "Raise the song of harvest-home;"
					  "All are safely gathered in,"
					  "Free from sorrow, free from sin;"
					  "There for ever purified"
					  "In God's garner to abide:"
					  "Come, ten thousand Angels, come,"
					  "Raise the glorious harvest-home!"
     			}}
	  }

} %%% lyric markup bracket

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne  f1 f1  \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4) }}  %%Amen midi       
       
}  


} %%% book bracket
