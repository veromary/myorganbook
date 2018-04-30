%%%% 188.png
%%%% Hymn 116 Arfon. Throned upon the awful tree
%%%% Rev 2

\version "2.10"
\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - PASSIONTIDE: GOOD FRIDAY"
	\hspace #0.1 }}	
	
  title = "116"
  
  poet = \markup { \small {  \line { \sans {"ARFON."} \hspace #1 \roman {"(7 7. 7 7. 7 7.)"}} }}
  
  meter = \markup { \small { \italic {Moderately slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 66.} }
  
  arranger = \markup { \small \italic "Welsh Hymn Melody." }
  
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% generates the breathmarks

breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%% push a note slightly to the right

push = \once \override NoteColumn #'force-hshift = #0.4

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01		  

	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key g \minor
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  d2 g g4( fis4) e( d) | g2 a bes1 | c2 bes a g | bes4( a) g( fis) g1 \breathmark \bar "||" \break
  d'2 d4( c) bes2 d | c bes a1 | d2 d4( c) bes2 d | c bes bes( a) \breathmark \bar "||" \break
  d, g g4( fis) e( d) | g2 a bes1 | c2 bes a g | bes4( a) g( fis) g1 \bar "||"
} 
   
alto = \relative c' {
  d2 g g4( fis4) e( d) | d2 d d1 | d2 d d bes | ees d bes1 \bar "||" 
  d2 d g g | g4( fis) g2 fis1 | g2 g4( fis) g2 g | g ees \push d1 \bar "||"
  a2 d c a | d d d1 | d2 d d bes | ees d d1 \bar "||"
}

tenor = \relative c {\clef bass 
  d2 g g4( fis) e( d) | g2 fis g1 | a2 g fis! g | g4( a) bes( a) g1 \bar "||"
  bes2 a d bes | c d d1 | d2 bes4( c) d2 bes | g g g( fis) \bar "||" 
  fis g d e4( fis) | g2 fis g1 | a2 g fis! g | g4( a) bes( c) bes1 \bar "||"
}

bass = \relative c {\clef bass 
  d2 g g4( fis) e( d) | bes2 d \merge g1 | fis2 g d ees | c d g,1 \bar "||"
  g'2 fis g bes | a g d1 | bes'2 bes4( a4) g2 f | ees c \push d1 \bar "||"
  c2 bes a c | bes d \merge g1 | fis2 g d ees | c d g,1 \bar "||"
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

%%% Hymn Note and Lyric Attribution and title markup

\markup { \hspace #20 \smallCaps "Note" \hspace #-1.2 ".—" \italic "This hymn may also be sung to" \smallCaps "Redhead 76" "(" \hspace #-1 \italic "No. 477" \hspace #-1 ")." }  

\markup { \small { \hspace #74 \italic "J. Ellerton, 1826-93." } }

\markup { \hspace #32 \small "‘My God, my God, why hast thou forsaken me?’" } 
%%% Main lyric block

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %%% one super column for the entire block of lyrics
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HRONED upon the awful Tree,"
			                                 "  King of grief, I watch with thee;" } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Darkness veils thine anguished face,"
					   "None its lines of woe can trace,"
					   "None can tell what pangs unknown"
					   "Hold thee silent and alone;"
			  		}} 
			         } %%% finish verse 1		
    }	%%% end super column  
}	


%%% fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
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

\markup { \hspace #32   %%add space as necc. to center the column
          \column { 
		  	\hspace #1 
           		\line { "2  "
			   \column {	     
				   "Silent through those three dread hours,"
				   "Wrestling with the evil powers,"
				   "Left alone with human sin,"
				   "Gloom around thee and within,"
				   "Till the appointed time is nigh,"
				   "Till the Lamb of God may die."
			}}      
			\hspace #1 
           		\line { "3  "
			  \column {	     
				  "Hark that cry that peals aloud"
				  "Upward through the whelming cloud!"
				  "Thou, the Father's only Son,"
				  "Thou his own anointed One,"
				  "Thou dost ask him—can it be?—"
				  "‘Why hast thou forsaken me?’"
			}}			
    		        \hspace #1 
           		\line {"4. "
			  \column {	     
				  "Lord, should fear and anguish roll"
				  "Darkly o'er my sinful soul,"
				  "Thou, who once wast thus bereft"
				  "That thine own might ne'er be left,"
				  "Teach me by that bitter cry"
				  "In the gloom to know thee nigh."
			}}
	  }
} %%% lyric markup bracket

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne g'1 g  \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo ees1 d \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree c'1 b \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  c1 g' \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
      \context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       } %% close layout

%%% Amen Midi

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2) }} 

}


%%% alternative hymns also suitable

\markup { \hspace #44 \italic "Or the following: " }

\markup { \hspace #36 \small  "103  O sinner, raise the eye of faith." }
	
	
} %%% book bracket