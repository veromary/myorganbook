%%%% 312.png
%%%% Hymn 195 WOHLAUF, THUT NICHT VERZAGEN.  Another year completed.
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "SAINTS' DAYS: GENERAL - FOR A PATRONAL FESTIVAL"
	\hspace #0.1 }}	
	
  title = "195"   
  
  poet = \markup { \small {  \column {
	        \line { \sans { "WOHLAUF, THUT NICHT" }}
		\line { \sans { "VERZAGEN."} \hspace #1 \roman {"(7 6. 7 6. D.)"}}
  }}}
  
  meter = \markup { \small { \italic {In moderate time, dignified} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 69.} }
  
  arranger = \markup { \small \smallCaps "B. Helder, 1585-1635." }
  
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% prints a repeat sign glyph comprising 4 dots. Used only to begin a repeat at the start of a piece where \bar ":" does not work      

fdstartrepeat =  {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
                  \once \override Staff.BarLine #'text = \markup  { \line { \hspace #0 \override #'(baseline-skip . 1.0) 
                                                                    \raise #1.4 \column { \with-color #black { 
                                                                    \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
                  } }   
                 \bar "|:"}
   
%%% prints a repeat sign glyph comprising 4 dots and two thin bars

fdendrepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
                \once \override Staff.BarLine #'text = \markup  {  \line { \raise #1.4 \override #'(baseline-skip . 1.0)  \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
                                                                   \hspace #-1 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
                                                                   \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
        } }     
        \bar "||"} 

%%generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}
	
%%% push a note slightly to the right	      
	      
push = \once \override NoteColumn #'force-hshift = #0.8

%%% same as above but uses X-offset. When two notes are stacked in one notecolumn and both need to be moved, force-hshift 
%%% does not work for both, so X-offset must be used for one of the two notes to be moved.

pushb = \once \override NoteHead #'X-offset = #1.6 
	
%%% music function to move a note various amounts of space. \movenote #0.4 moves is equivalent to force-hshift = #0.4

movenote = #(define-music-function (parser location vector) (number?)
     #{
	     \once \override NoteColumn #'force-hshift = #$vector
     #})

%%% shortens stems     
     
shortenStem = \once \override Stem #'length = #4.5
	
%%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 

straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-3.6
              \once \override Stem #'X-offset = #-3.6 }
	            
%%shortcut macro for small notes
smallnote = {  \once \set fontSize = #-3 
              \once \override Stem #'length = #5  }
	      
	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \tag #'repeatpart { \fdstartrepeat  \partial 2 g'2 | b2. b4 a2 g2 | c1 b2 \breathmark \bar "||" d2 | e2. d4 c2 a2 | b1. \breathmark \bar "||"  \fdendrepeat \break }
  \tag #'remainder {  d2 | d2 c2 b2 a2 | b2 ( a4 g4 ) a2 \breathmark \bar "||" fis2 | g2 a2 b2 cis2 | d1. \breathmark \bar "||" 
  a2 | b2 a2 g2 fis2 | e2 ( d4 c4 ) d2 \breathmark \bar "||" d2 | e2 g2 g2 fis2 | g1. \bar "||" }
} 
   
alto = \relative c' {  
  \tag #'repeatpart {  d2 | g2 g2 fis2 e2 | g1 g2 \bar "||" g2 g2 g2 e2 fis2 | g1. \bar "||" \fdendrepeat }
  \tag #'remainder {  g2 | fis2 g2 g2 e4 ( fis4 ) | g2 ( fis4 e4 ) fis2 \bar "||"  d2 | d2 fis2 g2  g2 | fis1. \bar "||" 
  fis2 | g2 fis2  e2 d2 | c2 ( b4 a4 ) b2 \bar "||"  d2 | d2 b4 ( c4 ) d2 d2 | d1. \bar "||"  }
}

tenor = \relative c {\clef bass 
  \tag #'repeatpart { \fdstartrepeat  b'2 | d2. d4 d2 b2 | e1 d2 \bar "||"  b2 | c2 b2 c2 d2 | d1. \bar "||" \fdendrepeat }
  \tag #'remainder {  b2 | a2 e'2 d2 c2 | \push d1 d2 \bar "||"  a2 | g2 d'2 d2 g,2 | a1. \bar "||" 
  d2 | d2 d2 b2 b2 | \push g1 g2 \bar "||"  g2 | g2 g2 a2 a2 | b1. \bar "||"  }
}

bass = \relative c {\clef bass 
  \tag #'repeatpart {  g'2 | g2 g2 d2 e2 | c1 g'2 \bar "||" g2 | c2 g2 a2 d,2 | g1. \bar "||"  \fdendrepeat }
  \tag #'remainder { g2 | d2 e4 ( fis4 ) g2 a2 | \pushb g1 d2 \bar "||" c2 | b2 d2 g2 e2 | d1. \bar "||" 
  d2 | g2 d2 e2 b2 | \pushb c1 g2 \bar "||" b2 | c2 e2 d2 d2 | g,1. \bar "||"  }
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
		
} %%% Score bracket


%%% A separate score block to unfold the repeat and generate the midi	

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \removeWithTag #'remainder \soprano \soprano }
	\context Voice = altos    { \voiceTwo \global \removeWithTag #'remainder \alto \alto }
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \removeWithTag #'remainder \tenor \tenor }
	\context Voice = basses { \voiceTwo \global \removeWithTag #'remainder \bass \bass }
			        >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 69 2)}} 

} %%% Score bracket


%%% Lyric titles and attributions

\markup { \hspace #18 \small {  \column { \line { \hspace #50 \italic "St. Paulinus of Nola," } 
          	                         \line { \hspace #52 \italic "353-431.  Tr. A. R." }    
					 \line { \hspace #26 "Ecce dies nobis." }
}}}


%%% Lyrics

\markup { \hspace #34 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "A" }   %%Drop Cap goes here
				  \hspace #-1.6    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "NOTHER year completed."
			                                 "   The day comes round once more" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Which with our patron's radiance"
					   "    Is bright as heretofore."
					   "Now, strong in hope, united"
					   "    His festival we greet;"
					   "He will present our troubles"
					   "    Before the mercy-seat."
			  		}}
		      }
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

\markup { \hspace #34   %%add space as necc. to center the column
	          \column { 
			\hspace #1  
			\line {"2  "
				\column {	     
					"The Scriptures tell how Moses"
					"    Did for the people pray,"
					"Appeased the Judge eternal,"
					"    And turned his wrath away;"
					"Elijah's prayer had power,"
					"    To close and open heaven:"
					"Such Saints as were aforetime,"
					"    Such Saints to us are given."
					 "                  " %%% blank space before next verse
			}}    
			\line {"3  "
				\column {	     
					"O Saint of God, beloved,"
					"    And placed on his right hand,"
					"Thy prayers be like a rampart"
					"    As 'gainst the foe we stand;"
					"For Abraham's God is thy God,"
					"    And Isaac's God is thine,"
					"Thine is the God of Jacob,"
					"    The Lord of power benign."
					"                  " %%% blank space before next verse
			}} 
			\line {"4. "
				\column {	     
					"For forty years his Israel"
					"    He fed with Angels' food;"
					"The flinty rock he opened"
					"    The streams of water flowed."
					"Entreat that Christ his people"
					"    May lead to victory:"
					"The God of Joshua's triumph"
					"    The Lord thy God is he."
			}}
	  }
} %%% lyric markup bracket


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne g'1 g1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo e1 d1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree c'1 b1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  c1 g1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 69 2) }}  %%Amen midi       
       
}  



} %%% book bracket
