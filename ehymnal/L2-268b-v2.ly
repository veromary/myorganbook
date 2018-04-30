%%%% 286b.png
%%%% Hymn 178. Old 104th. Disposer supreme, and Judge of the earth. 
%%%% Rev 2.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "SAINTS' DAYS: GENERAL - APOSTLES AND EVANGELISTS"
	\hspace #0.1 }}	
	
  title = "178"   
  
  poet = \markup { \small {  \line { \sans { \smallCaps "OLD 104th."} \hspace #1 \roman {"(5 5. 5 5. 6 5. 6 5.)"}} }}
  
  meter = \markup { \small { \italic {Slow and dignified} \general-align #Y #DOWN \note #"2" #0.5 = 69.} }
  
  arranger = \markup { \small \italic "Ravenscroft's Psalter, 1621." }
  
  tagline = ""
}


%%%%%%%%%%%%% Macros
 
%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01

%%generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}



%%%%%%%%%%%%%%%%%%% End of Macro Definitions


%%% SATB voices

global = {
  \time 3/2
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 2 d2 | f e d | a'1 f2 | g bes a | g1 \breathmark \bar "||" g2 | a c b! | \break
  c1 f,2 | a g g | f1 ^\fermata \breathmark \bar "||" f2 | f f g | a f f | \break
  g2 bes a | g1 \breathmark \bar "||" d'2 ^\fermata | c f, bes | a g f | 
      \once \override TextScript #'padding = #1   
  g ^\markup { \italic "Much slower." } a e | d1 \bar "||"
} 
   
alto = \relative c' {  
d2 | d a a | cis1 d2 | d2. e4 f2 | e1 \bar "||" e2 | f e g |
g1 f2 | f f e | \merge f1 \bar "||" c2 | d c e | f c d |
d g fis | \merge g1 \bar "||" f2 | f f e | f e d | d2. cis8[ b] cis2 | \merge d1 \bar "||"
}

tenor = \relative c {\clef bass 
f2 | a a f | e1 bes'2 | bes bes c | c1 \bar "||" c2 | c c d |
e1 d2 | c d c | a1 \bar "||" a2 | bes c bes | c a bes | 
bes d d | bes1 \bar "||" bes2 | c d bes | c2. bes4 a2 | bes a a4( g) | f1 \bar "||"
}

bass = \relative c {\clef bass 
d2 | d cis d | a1 bes2 | g g' f | c1 \bar "||" c2 | f a g |
c,1 d2 | f bes, c | f,1 _\fermata \bar "||" f'2 | bes a g | f f bes |
g2 g d | g1 \bar "||" bes2 _\fermata | a2 bes g | f c d | g, f4( g) a2 | d1 \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 60 2) }}      
  	
	
} %%% Score bracket

%%% Lyric titles and attributions

\markup { \hspace #18 \small {  \column { \line { \hspace #46 \italic "J.-B. de Santeüil, 1630-97." } 
          	                         \line {   \hspace #50 \italic "Tr. I. Williams" "‡." }    
					 \line { \hspace #22 "Supreme, quales, Arbiter." }
}}}

%%% Lyrics

\markup { \hspace #26 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "D" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ISPOSER supreme, and Judge of the earth,"
			                                 "    Who choosest for thine the weak and the poor;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "To frail earthen vessels, and things of no worth,"
					   "    Entrusting thy riches which ay shall endure;"

					   "          " %%% adds vertical spacing between verses
			  		}}
		      } %%% end verse 1	
           		\line { "2  "
			   \column {	     
				   "Those vessels soon fail, though full of thy light,"
				   "    And at thy decree are broken and gone;"
				   "Then brightly appeareth the arm of thy might,"
				   "    As through the clouds breaking the lightnings have shone."

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

\markup { \hspace #26  %%add space as necc. to center the column  
		\column { 
			\hspace #1  % adds vertical spacing between verses  
			   \line { \hspace #-9.7 \italic "Unison. " "3  "
			   \column {	     
				   "Like clouds are they borne to do thy great will,"
				   "    And swift as the winds about the world go;"
				   "All full of thy Godhead, while earth lieth still,"
				   "    They thunder, they lighten, the waters o'erflow."

				   "          " %%% adds vertical spacing between verses
			}}
			   \line { "4* "
			   \column {	     
				   "Their sound goeth forth, ‘Christ Jesus is Lord!’"
				   "    Then Satan doth fear, his citadels fall:"
				   "As when the dread trumpets went forth at thy word,"
				   "    And one long blast shattered the Canaanites' wall."

				   "          " %%% adds vertical spacing between verses
			}} 
			   \line { "5  "
			   \column {	     
				   "O loud be their trump, and stirring the sound,"
				   "    To rouse us, O Lord, from sin's deadly sleep;"
				   "May lights which thou kindlest in darkness around"
				   "    The dull soul awaken her vigils to keep!"
				   "          " %%% adds vertical spacing between verses
			}}
           		\line { \hspace #-9.7 \italic "Unison. " "6. "
			   \column {	     
				   "All honour and praise, dominion and might,"
				   "    To thee, Three in One, eternally be,"
				   "Who pouring around us thy glorious light,"
				   "    Dost call us from darkness thy glory to see.     Amen."
				   "          " %%% adds vertical spacing between verses
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
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo bes1 a1 \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 60 2) }}  %%Amen midi       
       
}  


} %%% book bracket
