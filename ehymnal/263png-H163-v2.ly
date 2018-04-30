%%%% 263.png
%%%% Hymn 163. Old 22nd O Unity of threefold light 
%%%% Rev 2.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "THE CHRISTIAN YEAR - TRINITY SUNDAY"
	\hspace #0.1 }}	
	
	title = "163"   
  
 
  meter = \markup { \small { \column { \line { \sans \smallCaps "OLD 22nd." \hspace #1 \roman " (D. C. M.)" } 
                            \line { { \italic "In moderate time, very dignified" \general-align #Y #DOWN \note #"2" #0.5 "= 76" "(" \general-align #Y #DOWN \note #"1" #0.5 "= 38)." } } }} }
 
  arranger = \markup { \small { \center-align { 
		 \line { \italic "Melody from Este's Psalter, 1592" }
				 \line { "(" \hspace #-1 \italic "also in Day's Psalter, 1563" \hspace #-1 ")." } }} }
 
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01

%%% generates the breathmarks
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}	      

%%% Insert a bar while forbidding line breaks - needed because this piece has very dense notation
nbbar = { \bar "|" \noBreak }


%%% hide implied accidentals
noacci = \once \override Accidental #'transparent = ##t

%%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 

straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.2
              \once \override Stem #'X-offset = #-1.2 }	      
	      
%% Used to pull an upstem note left. Used when a slurred note pair straddles a longer note below and when notecolumn force-hshift does not work 
topstraddle = { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.0 
              \once \override Stem #'X-offset = #0.3 }	      
	      

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key ees \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  ees1 ees2 f2 \nbbar g1 bes1 \nbbar aes2 aes2 g1.  \bar "||" \noBreak ees2 \bar "|" aes2 g2 f2 f2 \nbbar ees1 \breathmark \bar "||" \noBreak bes'1 c2 d2 \nbbar ees1 d1 \bar "|" \break
  c2 c2 bes1  \bar "||" g1 aes2 g2 \nbbar f1 f1 \nbbar ees1 ^\fermata  \bar "||" \noBreak ees'1 \nbbar d2 c2 bes2 c2 \nbbar d1 c1 \nbbar bes1  \bar "||" \break
  c1 \nbbar g2 aes2 bes2 c2 \nbbar bes1 \breathmark \bar "||" \noBreak g1 g2 f2 \nbbar g2 ees2 g2 a2 \nbbar bes1 \bar "||" \noBreak g1 f2 g2 \nbbar \noacci aes1 f1 \nbbar ees1 ^\fermata \bar "||"
} 
   
alto = \relative c' {  
  bes1 c2 d2 \nbbar ees1 ees1 \nbbar ees2 d2 ees1. \bar "||" ees2 \nbbar c2 ees2 ees2 d2 \nbbar \merge ees1 \bar "||" ees1 g2 f2 \nbbar ees1 f1 \bar "|"
  g2 f2 d1 \bar "||" ees1 c2 ees2 \nbbar ees1 d1 \nbbar \merge ees1 \bar "||" g1 \nbbar g2 ees2 ees2 ees2 \nbbar \straddle d2( f2) \straddle f2( ees2) \nbbar d1 \bar "||"
  c1 \nbbar ees2 f2 d2 f2 \nbbar d1 \bar "||" ees1 ees2 d2 \nbbar ees2 bes2 c2 c2 \nbbar d1 \bar "||" ees1 f2 des2 \nbbar c1 d1 \nbbar \merge ees1 \bar "||"
}

tenor = \relative c {\clef bass 
  g'1 g2 bes2 \nbbar bes1 bes1 \nbbar c2 aes2 bes1. \bar "||" c2 \nbbar c2 bes2 bes2 bes2 \nbbar g1 \bar "||" g1 g2 bes2 \nbbar c1 bes1 \bar "|"
  g2 a2 bes1 \bar "||" ees,1 f2 bes2 \nbbar c1 \topstraddle bes2( \noacci aes2) \nbbar g1 \bar "||" c1 \nbbar bes2 aes2 g2 a2 \nbbar bes1 a!1 \nbbar bes1 \bar "||"
  ees,1 \nbbar c'2 c2 bes2 a!2 \nbbar bes1 \bar "||" bes1 bes2 bes2 \nbbar bes2 g2 ees2 f2 \nbbar f1 \bar "||" g1 bes2 bes2 \nbbar c1 \topstraddle bes2( \noacci aes2) \nbbar g1 \bar "||"
}

bass = \relative c {\clef bass 
  ees1 c2 bes2 \nbbar ees1 g1 \nbbar f2 f2 ees1. \bar "||" c2 \nbbar aes2 ees'2 bes2 bes2 \nbbar ees1 \bar "||" ees1 ees2 d2 \nbbar c1 d1 \bar "|"
  ees2 f2 bes,1 \bar "||" c1 f,2 g2 \nbbar aes1 bes1 \nbbar ees1 _\fermata \bar "||" \merge c'1 \nbbar g2 aes2 ees2 c2 \nbbar \straddle bes2( d2) f1 \nbbar bes,1 \bar "||"
  aes1 \nbbar c2 f2 g2 f2 \nbbar bes,1 \bar "||" ees1 ees2 bes2 \nbbar ees2 ees4( d4) c2 f2 \nbbar bes,1 \bar "||" ees1 des2 bes2 \nbbar aes1 bes1 \nbbar ees1 _\fermata \bar "||"
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
		\context { \Score timing = ##f }
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %% close layout

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 76 2) }}      
  	
	
} %%% Score bracket

%%% Lyric attributions and titles

\markup { \small { \hspace #80 \center-align {
	 \italic "Metrophanes, Bishop of Smyrna,"
          \italic "c. 900.  Tr. J. M. Neale." }}}

\markup { \small { \hspace #40 "Τριφεγγὴς μονὰς θεαρχική."  "[Greek: Triphengês monas thearchikê.]"} }


%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 " UNITY of threefold light,"
			                                 "  Send out thy loveliest ray," } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "And scatter our transgressions' night,"
					   "    And turn it into day;"
					   "Make us those temples pure and fair"
					   "    Thy glory loveth well,"
					   "The spotless tabernacles, where"
					   "    Thou may'st vouchsafe to dwell."
			  		}} 
			         } %%% finish verse 1
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

\markup { \hspace #30   %%add space as necc. to center the column  
		\column { 
			\hspace #1 % adds vertical spacing between verses  
			\line {"2  "
			    \column {	     
				    "The glorious hosts of peerless might,"
				    "    That ever see thy face,"
				    "Thou mak'st the mirrors of thy light,"
				    "    The vessels of thy grace."
				    "Thou, when their wondrous strain they weave,"
				    "    Hast pleasure in the lay:"
				    "Deign thus our praises to receive,"
				    "    Albeit from lips of clay."
			}}	     
			\hspace #1 % adds vertical spacing between verses
			\line { "3. "
			     \column {	     
				     "And yet thyself they cannot know,"
				     "    Nor pierce the veil of light"
				     "That hides thee from the Thrones below,"
				     "    As in profoundest night."
				     "How then can mortal accents frame"
				     "    Due tribute to their King?"
				     "Thou, only, while we praise thy name,"
				     "    Forgive us as we sing."	     
     			}}
	  }
} %%% lyric markup bracket


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne ees1 ees1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo c1 bes1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree aes'1 g1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  aes1 ees'1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 76 2) }}  %%Amen midi       
       
}  

%%% alternative hymns also suitable

\markup {\hspace #32 \column {
	\line{ \hspace #2 \italic "The following are also suitable:"}
	\hspace #0.1 
	\small {
	"372  Bright the vision that delighted."
	"387  Father of heaven, whose love profound."
	"390  Firmly I believe and truly."
	"407  Immortal, invisible, God only wise."
	"501  Three in One, and One in Three."	
	}
}} 


} %%% book bracket
