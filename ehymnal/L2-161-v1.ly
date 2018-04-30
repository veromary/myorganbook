%%%% 260.png
%%%% Hymn 161. St. Flavian. Have mercy on us, God most high
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "THE CHRISTIAN YEAR - TRINITY SUNDAY"
	\hspace #0.1 }}	
	
	title = "161"   
  
 
  meter = \markup { \small { \column { \line { \sans "ST. FLAVIAN." \hspace #1 \roman " (C. M.)" } 
                            \line { { \italic "Moderately slow" \general-align #Y #DOWN \note #"2" #0.5 "= 66." } } }} }
 
  arranger = \markup { \small { \center-align { 
		 \line { \italic "Adapted from Psalm 132" }
				 \line { \italic "in ‘Day's Psalter,’ 1563." } }} }
 
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01

%%generates the breathmarks
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}	      

%%% macro to specify a partial measure in the middle of a piece.
%%% Manual does not recommend using \partial in the middle of a piece.
%%% In this case, the macro specifies that 2 1/2 notes in a 4/2 measure have past,
%%% hence we are halfway through the measure
halfmeasure =  \set Score.measurePosition = #(ly:make-moment 2 2)

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 1 f1 | f2 e f a | g g f1 \breathmark \bar "||" \halfmeasure f1 | bes2 a f g | a1 ^\fermata \bar "||" \break
  a1 | a2 bes c a | f2 g a1 \breathmark \bar "||" \halfmeasure a1 | g2 f f e | f1 ^\fermata \bar "||"
} 
   
alto = \relative c' {  
  c1 | c2 c c f | f e \merge f1 \bar "||"  c1 | f2 f f d | e1 \bar "||"
  f1 | f2 f c c | d e f1 \bar "||"  f1 | e2 f d c | c1 \bar "||"
}

tenor = \relative c {\clef bass 
  a'1 | g2 g a c | d c4( bes) a1 \bar "||"  a1 | bes2 c d d | cis1 \bar "||"
  c!1 | c2 bes g a | a c c1 \bar "||"  c1 | c2 c bes4( a) g2 | a1 \bar "||"
}

bass = \relative c {\clef bass 
  f1 | c2 c f a, | bes c f,1 \bar "||"  f'1 | d2 f bes, bes | a1 _\fermata \bar "||"
  f'1 | f2 d e f | d c f1 \bar "||"  f1 | c2 a bes c | f,1 _\fermata \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2) }}      
  	
	
} %%% Score bracket

%%% Lyric attributions and titles

\markup { \small { \hspace #4 \italic "Suitable also for other occasions." \hspace #48 \italic "F. W. Faber, 1814-63." }}


%%% Lyrics

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "H" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "AVE mercy on us, God most high,"
			                                 "  Who lift our hearts to thee;" } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Have mercy on us, worms of earth,"
					   "    Most holy Trinity."
					   "         " %%% adds vertical spacing between verses
			  		}} 
			         } %%% finish verse 1 
           		\line { "2  "
			   \column {	     
				   "Most ancient of all mysteries,"
				   "    Before thy throne we lie;"
				   "Have mercy now, most merciful,"
				   "    Most holy Trinity."
				   "         " %%% adds vertical spacing between verses
			}} 
           		\line { "3  "
			   \column {	     
				   "When heaven and earth were yet unmade,"
				   "    When time was yet unknown,"
				   "Thou in thy bliss and majesty"
				   "    Didst live and love alone."
				   "         " %%% adds vertical spacing between verses
			}}  
			\line {"4  "
			   \column {	     
				   "Thou wert not born: there was no fount"
				   "    From which thy Being flowed;"
				   "There is no end which thou canst reach;"
				   "    But thou art simply God."
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

\markup { \hspace #32   %%add space as necc. to center the column  
		\column { 
			\hspace #1 % adds vertical spacing between verses  
			\line {"5  "
			    \column {	     
				    "How wonderful creation is,"
				    "    The work which thou didst bless,"
				    "And O! what then must thou be like,"
				    "    Eternal loveliness!"
				    "         " %%% adds vertical spacing between verses
			}}
			\line { "6  "
			     \column {	     
				     "How beautiful the Angels are,"
				     "    The Saints how bright in bliss;"
				     "But with thy beauty, Lord, compared,"
				     "    How dull, how poor is this!"
				     "         " %%% adds vertical spacing between verses
			}}	     
			\line { "7  "
			     \column {	     
				     "O listen then, most pitiful,"
				     "    To thy poor creature's heart:"
				     "It blesses thee that thou art God,"
				     "    That thou art what thou art."
				     "         " %%% adds vertical spacing between verses
			}}	     
			\line { "8. "
			     \column {	     
				     "Most ancient of all mysteries,"
				     "    Still at thy throne we lie:"
				     "Have mercy now, most merciful,"
				     "    Most holy Trinity."	     
     			}}
	  }
} %%% lyric markup bracket


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f1 f1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo d1 c1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree bes'1 a1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  bes1 f1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2) }}  %%Amen midi       
       
}  


} %%% book bracket
