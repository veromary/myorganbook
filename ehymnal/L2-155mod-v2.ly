%%%% 251.png
%%%% Hymn 155 modern. Veni sancte spiritus.  Come, thou holy Paraclete.
%%%% Rev 2.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "THE CHRISTIAN YEAR - WHITSUNTIDE"
	\hspace #0.1 }}	
	
  title = \markup { "157 " \large \smallCaps "(Modern Tune)"}  
  
  poet = \markup { \small {  \line { \sans { "VENI SANCTE SPIRITUS."} \hspace #1 \roman {"(7 7 7. D.)"}} }}
  
  meter = \markup { \small { \italic {Slow} \general-align #Y #DOWN \note #"2" #0.5 = 58. } }
  
  arranger = \markup { \small { \smallCaps "S. Webbe" "the elder, 1740-1816." } }
  
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01
	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  f2 f f g | a2. g4 f1 \bar "||" g2 a g c | c b c1 \bar "||" \break
  d2 c bes a | g2. f4 f1 ^\fermata \bar "||" f2 bes a bes4( c) | d2 c bes1 \bar "||" \break
  a2 c bes a | g f e1 \bar "||" g2 bes a g | f e f1 \bar "||"
} 
   
alto = \relative c' {  
  f2 f f f | f e \merge f1 \bar "||" c2 f g g | g g4( f) e1 \bar "||"
  f2 f f4( e) f2 | f e \merge f1 \bar "||" f2 f ees f \bar "||" f ees d1 \bar "||"
  f2 c d4( e) f2 | d d c1 \bar "||" e2 f4( g) f2 d | c2. bes4 a1 \bar "||"
}

tenor = \relative c {\clef bass 
  a'2 d c d | c bes a1 \bar "||" c2 c c e | d d c1 \bar "||"
  bes2 c d4( bes) c2 | c bes a1 \bar "||" bes2 bes c d4( c) | bes2 a bes1 \bar "||"
  c2 a bes c | d bes g1 \bar "||" g2 d'4( c) c2 bes | a g f1 \bar "||"
}

bass = \relative c {\clef bass 
  f,2 bes a bes | c c f1 \bar "||" e2 f e c | g' g c,1 \bar "||"
  bes'2 a g f | c c f,1 _\fermata \bar "||" d'2 d c bes | f' f bes,1 \bar "||"
  f'2 a g f | bes, g c1 \bar "||" c2 d4( e) f2 bes, | c c f,1 \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 58 2) }}      
  	
	
} %%% Score bracket

%%% Lyric attributions and titles

\markup { \column {
	\line { \small { \hspace #10 \italic "The Golden Sequence." \hspace #40 \italic "13th cent.  Tr. J. M. Neale." }}  
        \line { \small { \hspace #42 "Veni, sancte Spiritus."}}
}}	


\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.3 \column { \lower #2.4 \fontsize #8 "C" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "OME, thou holy Paraclete,"
			                               "  And from thy celestial seat"} }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "    Send thy light and brilliancy:"
					   "Father of the poor, draw near;"
					   "Giver of all gifts, be here;"
					   "    Come, the soul's true radiancy:"
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

\markup { \hspace #32   %%add space as necc. to center the column  
		\column { 
			\hspace #1  % adds vertical spacing between verses  
           		\line { "2  "
			   \column {	     
				   "Come, of comforters the best,"
				   "Of the soul the sweetest guest,"
				   "    Come in toil refreshingly:"
				   "Thou in labour rest most sweet,"
				   "Thou art shadow from the heat,"
				   "    Comfort in adversity."
			}}
			\hspace #1  % adds vertical spacing between verses  
           		\line { "3  "
			   \column {	     
				   "O thou Light, most pure and blest,"
				   "Shine within the inmost breast"
				   "    Of thy faithful company."
				   "Where thou art not, man hath nought;"
				   "Every holy deed and thought"
				   "    Comes from thy Divinity."
			}}
			\hspace #1  % adds vertical spacing between verses  
           		\line { "4  "
			   \column {	     
				   "What is soilèd, make thou pure;"
				   "What is wounded, work its cure;"
				   "    What is parchèd, fructify;"
				   "What is rigid, gently bend;"
				   "What is frozen, warmly tend;"
				   "    Strengthen what goes erringly."
			}}
			\hspace #1  % adds vertical spacing between verses  
           		\line { "5. "
			   \column {	     
				   "Fill thy faithful, who confide"
				   "In thy power to guard and guide,"
				   "    With thy sevenfold Mystery."
				   "Here thy grace and virtue send:"
				   "Grant salvation to the end,"
				   "    And in heaven felicity."
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
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo bes1 a1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree d1 c1 \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 58 2) }}  %%Amen midi       
       
}  


} %%% book bracket
