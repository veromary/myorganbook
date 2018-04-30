%%%% 226.png
%%%% Hymn 139 St. Fulbert. Ye Choirs of new Jerusalem
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - EASTERTIDE"
	\hspace #0.1 }}	
	
	title = "139"  
  
  poet = \markup { \small {  \line { \sans { \smallCaps "ST. FULBERT."} \hspace #1 \roman {"(C. M.)"}} }}
  
  meter = \markup { \small { \italic {Moderately slow} \general-align #Y #DOWN \note #"2" #0.5 = 66.} }
  
  arranger = \markup { \small \smallCaps "H. J. Gauntlett, 1805-76." }
  
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros
	      
%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 
merge = \once \override NoteColumn #'force-hshift = #-0.01

%%% generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key ees \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {  
  \partial 2 bes'2 | bes ees, f c' | bes aes g \breathmark \bar "||" bes | \break
  g bes c ees | d1. \bar "||" ees2 | bes c bes ees, | \break
  aes aes g \breathmark \bar "||" g | f g aes f | ees1. \bar "||"
} 
   
alto = \relative c' {  
  f2 | ees ees ees d | ees f ees \bar "||" f | \break
  ees ees c c | f1. \bar "||" g2 | ees ees ees ees |
  ees d ees \bar "||" ees | ees ees ees d | \merge ees1. \bar "||"
}

tenor = \relative c {\clef bass 
  bes'2 | g bes c f | bes, bes bes \bar "||" bes | \break
  bes bes bes a | bes1. \bar "||" bes2 | bes aes bes bes | \break
  c bes bes \bar "||" c | c bes c aes | g1. \bar "||"
}

bass = \relative c {\clef bass 
  d2 | ees g aes aes | g d ees \bar "||" d | \break
  ees g f f | bes,1. \bar "||" ees2 | g aes g g | \break
  f bes, ees \bar "||" c | aes g f bes | ees1. \bar "||"
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

%%% Hymn Midi	

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2)}} 
		
} %%% Score bracket


%%% Lyrics titles

\markup { \small { \hspace #72 \center-align { \italic "St. Fulbert of Chartres, c. 1000." 
	\italic "Tr. R. Campbell." 
} } }

%%% Main lyric block

\markup { \hspace #34 %%add space as necc. to center the column
          \column { %%% one super column for the entire block of lyrics
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "Y" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "E choirs of new Jerusalem,"
			                                "  Your sweetest notes employ," } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "The Paschal victory to hymn"
					   "    In strains of holy joy."
					   "      " %%% extra spacing between verses
			  		}} 
			         } %%% finish verse 1	
           		\line { "2  "
			   \column {	     
				   "How Judah's Lion burst his chains,"
				   "    And crushed the serpent's head;"
				   "And brought with him, from death's domains,"
				   "    The long-imprisoned dead."
			}} 
	  } %%% end supercolumn
}	  
			
%%%fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
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
			

%%% second page
%%% continuation of  lyrics

\markup { \hspace #34   %%add space as necc. to center the column
          \column { 
			\hspace #1 
           		\line { "3  "
			   \column {	     
				   "From hell's devouring jaws the prey"
				   "    Alone our Leader bore;"
				   "His ransomed hosts pursue their way"
				   "    Where he hath gone before."
				   "      " %%% extra spacing between verses
			}}
           		\line { "4  "
			   \column {	     
				   "Triumphant in his glory now"
				   "    His sceptre ruleth all,"
				   "Earth, heaven, and hell before him bow,"
				   "    And at his footstool fall."
				   "      " %%% extra spacing between verses
			}}
           		\line { "5  "
			   \column {	     
				   "While joyful thus his praise we sing,"
				   "    His mercy we implore,"
				   "Into his palace bright to bring"
				   "    And keep us evermore."
				   "      " %%% extra spacing between verses
			}}
           		\line {"6. "
			  \column {	     
				  "All glory to the Father be,"
				  "    All glory to the Son,"
				  "All glory, Holy Ghost, to thee,"
				  "    While endless ages run.     Alleluya!     Amen."
			}}
	  }
} %%% lyric markup bracket

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne bes'2 bes2 \bar "|" c1 bes1 \bar "|" c1 ees1 \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo ees2 ees2 \bar "|" ees1 ees1 \bar "|" aes1 g1 \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  Al -- le -- lu -- ya! A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree g'2 g2 \bar "|" aes1 g1 \bar "|" <aes ees'>1 ees'1  \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  ees2 ees2 \bar "|" aes,1 ees'1 \bar "|" aes,1 ees'1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
      \context { \Score timing = ##f }
	ragged-right = ##t
	indent = 11\cm
	\context { \Staff \remove Time_signature_engraver }

       } %% close layout

%%% Amen Midi

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2) }} 

}


%%% alternative hymns also suitable

\markup {\hspace #36 \column {
	\line{ \hspace #2 \italic "The following are also suitable:"}
	\hspace #0.1 
	\small {
	"  93  The God of love my Shepherd is."
	"319  Lord, enthroned in heavenly splendour."
	"380  Come, ye faithful, raise the anthem."
	"461  O praise our great and gracious Lord."
	"490  The King of love my Shepherd is."
	"491  The Lord my pasture shall prepare."
	"494  The strain upraise of joy and praise."
	"519  Ye watchers and ye holy ones."
	"534  Praise the Lord of heaven."
	"535  Praise the Lord! ye heavens, adore him." 
	
	}
}} 


} %%% book bracket
