%%%% 244.png
%%%% Hymn 152. Down Ampney. Come down, O Love divine.
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "THE CHRISTIAN YEAR - WHITSUNTIDE"
	\hspace #0.1 }}	
	
	title = "152"   
  
  poet = \markup { \small {  \line { \sans { "DOWN AMPNEY."} \hspace #1 \roman {"(6 6. 11. D.)"}} }}
  
  meter = \markup { \small { \italic {Moderately slow} \general-align #Y #DOWN \note #"4" #0.5 = 88  "(" \general-align #Y #DOWN \note #"2" #0.5 = 44 ")." } }
  
  arranger = \markup { \small \smallCaps "R. Vaughan-Williams." }
  
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%generates the breathmarks
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}	      
	      
%%% push a note slightly to the right	      
	      
push = \once \override NoteColumn #'force-hshift = #1.6
	      
	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 2/2
  \key d \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  d2 e4 fis4 | a2 b | a1 \bar "||" a2 b4 a | d( cis) b2 | a \breathmark \bar "||" \break
  a2 | b4 a g fis | e d e fis8[ g] | \push e2 d ^\fermata \bar "||" d' cis4 b | a2 b | a1 \bar "||" \break
  c2 b4 a | g2 fis | e ^\fermata \bar "||" e | a4 b a g | fis d e fis8[ g] | \push e2 d ^\fermata \bar "||"
} 
   
alto = \relative c' {  
  a2 a4 d | d( cis) b( cis) | d1 \bar "||" fis2 fis4 e | d( e) d2 | cis2 \bar "||" 
  d2 | d4 cis d d | b d d d | d( cis) d2 \bar "||" fis fis4 d | fis2 e4( d) | cis1 \bar "||"
  e2 d4 d | b( cis) d2 | a2 \bar "||" cis2 | d4 d cis d8[ e] | a,4 d d d |  d( cis) d2 \bar "||"
}

tenor = \relative c {\clef bass 
  fis2 a4 d, | e2 g4( e) | fis1 \bar "||" a2 d,4 e | fis( a) a( gis) | a2 \bar "||" \break
  fis2 | g4 e g a | g a b b | a4.( g8) fis2 \bar "||" b a4 b | d( cis) b2 | cis1 \bar "||" \break
  g4( a) b fis | g2 a4( b) | cis2 \bar "||" a | a4 g e b' | a a b g | a4.( g8) fis2 \bar "||"
}

bass = \relative c {\clef bass 
  d2 cis4 d | a2 g | d'1 \bar "||" d2 d4 cis | b( cis) e2 | a, \bar "||"
  d2 | g,4 a b d | g fis g e | a,2 d _\fermata \bar "||" b'2 fis4 g | d( fis) gis2 | a1 \bar "||"
  e4( fis) g d | e2 fis4( g) | a2 _\fermata \bar "||" a,4( g) | fis g a b8[ cis] | d4 fis g e | a,2 d _\fermata \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 44 2) }}      
  	
	
} %%% Score bracket

%%% Lyric attributions and titles

\markup { \hspace #60 \small \italic "Bianco da Siena, d. 1434.  Tr. R. F. Littledale."}  

\markup { \hspace #42 \small "Discendi, Amor santo."}  



\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #4.8 \column { \lower #2.4 \fontsize #8 "C" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "OME down, O Love divine,"
			                               "  Seek thou this soul of mine," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "And visit it with thine own ardour glowing;"
					   "    O Comforter, draw near,"
					   "    Within my heart appear,"
					   "And kindle it, thy holy flame bestowing."
			  		}}
		      } %%% end verse 1			
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
			\hspace #1  % adds vertical spacing between verses  
           		\line { "2  "
			   \column {	     
				   "    O let it freely burn,"
				   "    Till earthly passions turn"
				   "To dust and ashes in its heat consuming;"
				   "    And let thy glorious light"
				   "    Shine ever on my sight,"
				   "And clothe me round, the while my path illuming."
			}}
			\hspace #1  % adds vertical spacing between verses  
           		\line { "3  "
			   \column {	     
				   "    Let holy charity"
				   "    Mine outward vesture be,"
				   "And lowliness become mine inner clothing;"
				   "    True lowliness of heart,"
				   "    Which takes the humbler part,"
				   "And o'er its own shortcomings weeps with loathing."
			}}
			\hspace #1  % adds vertical spacing between verses  
           		\line { "4. "
			   \column {	     
				   "    And so the yearning strong,"
				   "    With which the soul will long,"
				   "Shall far outpass the power of human telling;"
				   "    For none can guess its grace,"
				   "    Till he become the place"
				   "Wherein the Holy Spirit makes his dwelling."
			}}
	  }
} %%% lyric markup bracket


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne d1 d1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo b1 a1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree g'1 fis1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  g1 d'1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 44 2) }}  %%Amen midi       
       
}  


} %%% book bracket
