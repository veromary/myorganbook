%%%% 182.png
%%%% Hymn 112 St Mary Magdalene. Forgive them O my Father
%%%% Rev 2.

\version "2.10"
\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - PASSIONTIDE: GOOD FRIDAY"
	\hspace #0.1 }}	
	
  title = "112"
  
  poet = \markup { \small {  \line { \sans {"ST. MARY MAGDALENE."} \hspace #1 \roman {"(7 6. 7 6.)"}} }}
  
  meter = \markup { \small { \italic {Slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 56.} }
  
  arranger = \markup { \small \smallCaps "H. A. Jeboult." }
  
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

push = \once \override NoteColumn #'force-hshift = #0.6

%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-3.0
              \once \override Stem #'X-offset = #-3.0 }
	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key g \minor
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 2 bes'2 | a4( bes4) c2 bes a4( g4) | fis4( g a2) d, \breathmark \bar "||" d | g f ees4( d) ees2 | d1.  \breathmark \bar "||" \break
  d'2 | c bes a bes | a( g) fis \breathmark \bar "||" d g f4( ees) d2 a' | g1. \bar "||"
} 
   
alto = \relative c' {
  bes4( c) | d2 g f ees | \push d1 d2 \bar "||" \straddle d4( a) | bes( c) d2 g, g4( a4) | bes1. \bar "||"
  f'2 | f4( ees) d( c) d2 d | ees( c) d \bar "||" a | d d4( c4) bes2 d4( c) | bes1. \bar "||"
}

tenor = \relative c {\clef bass 
  g'2 | a g4( a4) bes2 c4( bes) | a2( d4 c4) bes2 \bar "||" a | g4( a) bes2 c ees, | f1. \bar "||"
  bes2 | a g fis d' | c4( bes a g) a2 \bar "||" fis | g g g4( e) fis2 g1. \bar "||"
}

bass = \relative c {\clef bass 
  g'2 | f2 ees d c | d4( e fis2) g2 \bar "||" f | ees d c c | bes1. \bar "||" 
  bes'2 | f g d g,4( bes) | c2( ees) d \bar "||" d4( c4) | bes2 c d d | 
      << { g,1. } 
      \new Voice = "alt" { \voiceFour
      \set fontSize = #-3   \override NoteColumn #'force-hshift = #0.1 
      d'1. } >>
  \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 56 2)}} 

} %%% Score bracket

%%% Hymn Note and Lyric Attribution and title markup

\markup { \hspace #12 \smallCaps "Note" \hspace #-1.2 ".—" \italic "This hymn may also be sung to" \smallCaps "Christus, der ist mein Leben" "(" \hspace #-1 \italic "No. 232" \hspace #-1 ")." }  

\markup { \small { \hspace #74 \italic "Mrs. C. F. Alexander, 1823-95." } }

\markup { \hspace #30 \small "‘Father, forgive them, for they know not what they do.’" } 
%%% Main lyric block

\markup { \hspace #34 %%add space as necc. to center the column
          \column { %%% one super column for the entire block of lyrics
	                 \column { %%verse 1 is a column of 2 lines  
				 \line { \hspace #2.2 \column { \line { \fontsize #0 "‘" \hspace #-1.0 \lower #2.4 \fontsize #8 "F" }}   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ORGIVE them, O my Father,"
			                                 "  They know not what they do:’" } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "The Saviour spake in anguish,"
					   "    As the sharp nails went through."
			  		}} 
			         } %%% finish verse 1	
		  	\hspace #1 
           		\line { "2  "
			   \column {	     
				   "No pained reproaches gave he"
				   "    To them that shed his Blood,"
				   "But prayer and tenderest pity"
				   "    Large as the love of God."
			}}	
			\hspace #1 
           		\line { "3  "
			   \column {	     
				   "For me was that compassion,"
				   "    For me that tender care;"
				   "I need his wide forgiveness"
				   "    As much as any there."
			}}
						\hspace #1 
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

\markup { \hspace #34   %%add space as necc. to center the column
          \column { 
		        \hspace #1 
           		\line { "4  "
			  \column {	     
				  "It was my pride and hardness"
				  "    That hung him on the Tree;"
				  "Those cruel nails, O Saviour,"
				  "    Were driven in by me."
			}}
			\hspace #1 
           		\line { "5  "
			  \column {	     
				  "And often I have slighted"
				  "    Thy gentle voice that chid;"
				  "Forgive me too, Lord Jesus;"
				  "    I knew not what I did."
			}}			
    		        \hspace #1 
           		\line {"6. "
			  \column {	     
				  "O depth of sweet compassion!"
				  "    O love divine and true!"
				  "Save thou the souls that slight thee,"
				  "    And know not what they do."
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
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo c1 b \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree ees1 d \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  c1 g \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 56 2) }} 

}


%%% alternative hymns also suitable

\markup { \hspace #32 \italic "Or the following: " \small  "416  Jesu, meek and lowly." }

	
} %%% book bracket