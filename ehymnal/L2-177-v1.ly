%%%% 286a.png
%%%% Hymn 177. University College. Captains of the saintly band
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "SAINTS' DAYS: GENERAL - APOSTLES AND EVANGELISTS"
	\hspace #0.1 }}	
	
  title = "177"   
  
  poet = \markup { \small {  \line { \sans { "UNIVERSITY COLLEGE."} \hspace #1 \roman {"(7 7. 7 7.)"}} }}
  
  meter = \markup { \small { \italic {Moderately quick} \general-align #Y #DOWN \note #"4" #0.5 = 108.} }
  
  arranger = \markup { \small \smallCaps "H. J. Gauntlett, 1805-76." }
  
  tagline = ""
}
	      

%%% SATB voices

global = {
  \time 4/4
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  a'4 f d' c \bar "|" bes a g2 \bar "||" a4 f c' c \bar "|" c b c2 \bar "||" \break
  a4 g f d' \bar "|" c bes a2 \bar "||" a4 a c a \bar "|" a g f2 \bar "||"
} 
   
alto = \relative c' {  
  f4 f f f \bar "|" g f e2 \bar "||" f4 f a g \bar "|" f f e2 \bar "||"
  f4 e f f \bar "|" f f8[ e] f2 \bar "||" e4 f e f \bar "|" f e f2 \bar "||"
}

tenor = \relative c {\clef bass 
  c'4 a bes c \bar "|" c c c2 \bar "||" c4 c c c \bar "|" d d g,2 \bar "||"
  a4 c8[ bes] a4 bes8[ a] \bar "|" g4 c c2 \bar "||" a4 f g a8[ bes] \bar "|" c4 c8[ bes] a2 \bar "||"
}

bass = \relative c {\clef bass 
  f4 f bes a \bar "|" e f c2 \bar "||" f4 a f e \bar "|" d d c2 \bar "||"
  f4 c d bes \bar "|" c c f2 \bar "||" cis4 d c! f \bar "|" c c f2 \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 108 4) }}      
  	
	
} %%% Score bracket

%%% Lyric titles and attributions

\markup { \hspace #18 \small {  \column { \line { \italic "Apostles." \hspace #38 \italic "J.-B. de Santeüil, 1630-97." } 
          	                         \line {   \hspace #50 \italic "Tr. Sir H. W. Baker." }    
					 \line { \hspace #22 "Caelestis aulae principes." }
}}}

%%% Lyrics

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "C" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "APTAINS of the saintly band,"
			                                 "  Lights who lighten every land," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Princes who with Jesus dwell,"
					   "Judges of his Israel:"
					   "          " %%% adds vertical spacing between verses
			  		}}
		      } %%% end verse 1	
           		\line { "2  "
			   \column {	     
				   "On the nations sunk in night"
				   "Ye have shed the Gospel light;"
				   "Sin and error flee away;"
				   "Truth reveals the promised day."
				   "          " %%% adds vertical spacing between verses
			}}
                           \line { "3  "
			   \column {	     
				   "Not by warrior's spear and sword,"
				   "Not by art of human word,"
				   "Preaching but the Cross of shame,"
				   "Rebel hearts for Christ ye tame."
				   "          " %%% adds vertical spacing between verses
			}}
			   \line { "4  "
			   \column {	     
				   "Earth, that long in sin and pain"
				   "Groaned in Satan's deadly chain,"
				   "Now to serve its God is free"
				   "In the law of liberty."
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

\markup { \hspace #30   %%add space as necc. to center the column  
		\column { 
			\hspace #1  % adds vertical spacing between verses  
           		\line { \hspace #-9.7 \italic "Unison. " "5  "
			   \column {	     
				   "Distant lands with one acclaim"
				   "Tell the honour of your name,"
				   "Who, wherever man has trod,"
				   "Teach the mysteries of God."
				   "          " %%% adds vertical spacing between verses
			}}  
           		\line { "6. "
			   \column {	     
				   "Glory to the Three in One"
				   "While eternal ages run,"
				   "Who from deepest shades of night"
				   "Called us to his glorious light.     Amen."
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 108 4) }}  %%Amen midi       
       
}  


} %%% book bracket

