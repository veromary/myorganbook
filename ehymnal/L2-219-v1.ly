%%% 346.png
%%% Hymn 219. Lord God of Hosts, within whose hand.
%%% Rev 1.

\version "2.10.23"

\header {
	dedication = \markup { \center-align { "SAINTS' DAYS: ST. GEORGE" \hspace #0.1 }}
	title = "219"
	poet = \markup { \small { \sans "FALKLAND." \hspace #1 \roman  "(8 8. 8 8. 8 8.)" } }
	meter =  \markup { \small { \italic "Moderately slow, dignified."  \general-align #Y #DOWN \note #"2" #0.5 = 66.} }
	arranger = \markup { \small { \italic "Melody by"  \smallCaps "H. Lawes," "1506-1662." } }
	tagline =""
			}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%macros begin

%% Macro to pull notes leftwards
merge = { \once \override Dots #'transparent = ##t
	\once \override NoteColumn #'force-hshift = #-0.01 }

%%generates the breathmarks

breathmark = { 
	\override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup { \fontsize #4 "," }
	}

%%deals with partial measures
par = \set Score.measurePosition = #(ly:make-moment 2 2)

%%%%%%%%%%%%%%%%%%%%%%%%%%%macro end

global = {
\time 4/2
\key f \major
\set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  c'1 a2 f \bar "|" bes a g g \bar "|"  \par f1 \bar "||"  f1 e2 c \bar "|" f g a bes \bar "|"  \par \once \override NoteColumn #'force-hshift = #0.6 c1 \breathmark \bar "||" \break
  c1 a2 d \bar "|" c bes a f \bar "|" \par g1 \bar "||" c1 b2 c \bar "|" d c c b \bar "|" \par c1 \breathmark \bar "||" \break
  g1 g2 g \bar "|" a f g a \bar "|" \par bes1 \bar "||"  \once \override Score.SeparationItem #'padding = #1 g1 a2 bes \bar "|" c g a g \bar "|" f1 \bar "||" }
 
alto = \relative c' { 
  f1 e2 d \bar "|" d4(e) f2 f e \bar "|" \par \merge f1 \bar "||"  c1 c2 c \bar "|" a c c f \bar "|" \par f(e) \bar "||" \break
  f1 f2 e \bar "|" f d e d \bar "|" \par e1 \bar "||" c1 f2 e \bar "|" d4(e) f2 g2. f4 \bar "|" \par e1 \bar "||" \break
  d1 e2 c \bar "|" c d g ees \bar "|" \par f1 \bar "||"  e!1 f2 f \bar "|" f4(e) d2 c c4(bes) \bar "|" a1 \bar "||" }

tenor = \relative c { 
  \clef bass a'1 c2 a \bar "|" g c d c \bar "|" \par a1 \bar "||"  f1 g2 e \bar "|" f e f f \bar "|" \par g1 \bar "||" \break
  a1 a2 bes \bar "|" c d c a \bar "|" \par c1 \bar "||" g1 d'2 c \bar "|" a c d d \bar "|" \par c1 \bar "||" \break
  bes1 c2 c4(bes) \bar "|" a2 bes bes c \bar "|" \par d1 \bar "||" c1 c2 f, \bar "|" f f f e \bar "|" f1 \bar "||" }

bass = \relative c { 
  \clef bass f1 c2 d \bar "|" g, a bes c \bar "|" \par  f,1 \bar "||"  a1 c2 c \bar "|" d c f d \bar "|" \par c1 \bar "||" \break
  f1 f,2 g \bar "|" a bes c d \bar "|" \par c1 \bar "||" e1 d2 a' \bar "|" f a g g \bar "|" \par c,1 \bar "||" \break
  g'1 c,2 e \bar "|" f d ees4(d) c2 \bar "|" \par bes1 \bar "||" c1 f2 d \bar "|" a bes c c \bar "|" f,1 \bar "||" }

#(ly:set-option 'point-and-click #f)


\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##f
}

\book{


\score{
\new ChoirStaff
<<
	\context Staff = upper <<
	\context Voice = sopranos { \voiceOne \global \soprano }
	\context Voice = altos { \voiceTwo \global \alto }
							>>
		\context Staff = lower <<
		\context Voice = tenors { \voiceOne \global \tenor }
		\context Voice = basses { \voiceTwo \global \bass}
								>>
>>

\layout {
	indent=0
	\context { \Score \remove "Bar_number_engraver" }
	\context { \Staff \remove "Time_signature_engraver" }
	\context { \Score \remove "Mark_engraver" }
		\context { \Staff \consists "Mark_engraver" }
	}
%%midi
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2)}}%% midi score bracket

}%%score


%%lyric titles

\markup { \hspace #60 \small \italic "Laurence Housman."}  


%%% Lyrics

\markup { \hspace #28 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "L" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ORD God of Hosts, within whose hand"
			                                 "    Dominion rests on sea and land," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Before whose word of life or death"
					   "The strength of nations is but breath:"
					   "O King, enthroned all thrones above,"
					   "Give strength unto the land we love."
					   "          " %%% adds vertical spacing between verses
			  		}}
		      } %%% end verse 1	
           		\line { "2  "
			   \column {	     
				   "Thou Breath of Life since time began,"
				   "Breathing upon the lips of man,"
				   "Hast taught each kindred race to raise"
				   "United word to sound thy praise:"
				   "So, in this land, join, we beseech,"
				   "All hearts and lips in single speech."
				%   "          " %%% adds vertical spacing between verses
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

\markup { \hspace #28  %%add space as necc. to center the column  
		\column { 
			\hspace #1  % adds vertical spacing between verses 
			
			   \line { "3  "
			   \column {	     
				   "To George our Saint thou gavest grace"
				   "Without one fear all foes to face,"
				   "And to confess by faithful death"
				   "That Word of Life which was his breath."
				   "O help us, Helper of Saint George,"
				   "To fear no bonds that man can forge."
				   "          " %%% adds vertical spacing between verses
			}} 
			
			   \line { \hspace #-9.7 \italic "Unison. " "4. "
			   \column {	     
				   "Arm us like him, who in thy trust"
				   "Beat down the dragon to the dust;"
				   "So that we too may tread down sin"
				   "And with thy Saints a crown may win."
				   "Help us, O God, that we may be"
				   "A land acceptable to thee."
				   "          " %%% adds vertical spacing between verses
			}}
	  }
} %%% lyric markup bracket


%%Amen score block
\score {
\new ChoirStaff
	<<
	\context Staff = upper \with { fontsize = #-3 \override StaffSymbol #'staff-space = #(magstep -2) }
		<<
		\context Voice = "sopranos" { \relative c' {\clef treble \global \voiceOne f1 f \bar "||" }}
		\context Voice = "altos" { \relative c' {\clef treble \global \voiceTwo bes1 a \bar "||" }}
		>>
		\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	\context Staff = lower \with { fontsize = #-3 \override StaffSymbol #'staff-space = #(magstep -2) }
		<<
		\context Voice = "tenors" { \relative c {\clef bass \global \voiceOne d1 c \bar "||" }}
		\context Voice = "basses" { \relative c {\clef bass \global \voiceTwo bes1 f \bar "||" }}
		>>
>>

\header { breakbefore = ##f piece = " " opus = " " }
\layout {
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove "Time_signature_engraver" }
	}%%layout

%%Amen midi
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2) }} %%Amen midi 



}%%amen score

}%% book bracket
