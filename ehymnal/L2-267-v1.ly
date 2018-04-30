%%%% 414.png
%%%% Hymn 267. Tallis' Canon. Glory to thee, my God, this night
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—EVENING"
	\hspace #0.1 }}	
	
	title = "267"   
  
  poet = \markup { \small {  \line { \sans { "TALLIS' CANON."} \hspace #1 \roman {"(L. M.)"}} }}
  
  meter = \markup { \small { \italic {Slow and dignified} \general-align #Y #DOWN \note #"2" #0.5 = 52.} }
  
  arranger = \markup { \small { \smallCaps "T. Tallis," \italic "c." "1515-85." }}
  
  tagline = ""
}


%%% SATB voices

global = {
  \time 4/2
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 1 g'1 | g2 fis2 g2 g2 | a2 a2 b2 g2 | c2 c2 b2 b2 | a2 a2 g2 \bar "||" \break
  d'2 | c2 a2 b2 b2 | a2 a2 g2 d2 | e2 fis2 g2 b2 | a2 a2 g1 \bar "||" 
}
   
alto = \relative c' {  
  d1 | d2 d2 b2 d2 | e2 d2 d2 g2 | e2 fis2 g2 d2 | e2 d2 d2 \bar "||" 
  g2 | e2 d2 d2 d2 | e2 fis2 g2 g,2 | e'2 d2 b2 d2 | c2 a2 b1 \bar "||" 
}

tenor = \relative c {\clef bass 
  b'1 | a2 a2 g2 g2 | g2 fis2 g2 g2 | a2 a2 b2 g2 | c2 c2 b2 \bar "||" 
  b2 | a2 a2 g2 d'2 | c2 a2 b2 b2  | a2 a2 g2 d2 | e2 fis2 g1 \bar "||"
}

bass = \relative c {\clef bass 
  g1 | d'2 d2 e2 b2 | c2 d2 g,2 b2 | a2 a2 g2 g'2 | g2 fis2 g2 \bar "||" 
  g2 | a2 fis2 g2 g,2 | c2 d2  g,2 b2 | c2 d2 e2 b2 | c2 d2 g,1 \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 52 2) }}      
  	
	
} %%% Score bracket

%%% Lyric attributions and titles

\markup { \small { \hspace #64 \italic "Bishop T. Ken, 1637-1711." }}

%%% Lyrics

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "G" }   %%Drop Cap goes here
				  \hspace #-1.6    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 " LORY to thee, my God, this night"
			                                 "  For all the blessings of the light;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Keep me, O keep me, King of kings,"
					   "Beneath thy own almighty wings."
					   "      " %%% adds vertical spacing between verses
			  		}}
		      }  
		       \line {  "2  "
			   \column {
				   "Forgive me, Lord, for thy dear Son,"
				   "The ill that I this day have done,"
				   "That with the world, myself, and thee,"
				   "I, ere I sleep, at peace may be."
				    "      " %%% adds vertical spacing between verses
		       }}
			\line { "3  "
				\column {
				   "Teach me to live, that I may dread"
				   "The grave as little as my bed;"
				   "Teach me to die, that so I may"
				   "Rise glorious at the awful day."
			           "      " %%% adds vertical spacing between verses
			}}
			\line {"4  "
				\column {
				   "O may my soul on thee repose,"
				   "And with sweet sleep mine eyelids close,"
				   "Sleep that may me more vigorous make"
				   "To serve my God when I awake."
			}}	   
	  } %%% end super column
}

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
%%% Continuation of lyrics

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
			\hspace #1 % adds vertical spacing between verses
			\line {"5* "
				\column {
					"When in the night I sleepless lie,"
					"My soul with heavenly thoughts supply;"
					"Let no ill dreams disturb my rest,"
					"No powers of darkness me molest."
					 "      " %%% adds vertical spacing between verses
			}}
			\line {"6* "
				\column {
					"You, my blest guardian, whilst I sleep"
					"Close to my bed your vigils keep;"
					"Divine love into me instil,"
					"Stop all the avenues of ill."
					 "      " %%% adds vertical spacing between verses
			}}
			\line {"7.  "
				\column {
					"Praise God, from whom all blessings flow,"
					"Praise him, all creatures here below,"
					"Praise him above, ye heavenly host,"
					"Praise Father, Son, and Holy Ghost.        Amen."
					 "      " %%% adds vertical spacing between verses
			}}
	  }

} %%% lyric markup bracket

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne  g'1 g1  \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo c1 d1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree e1 d1   \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  c1 g1  \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 52 2) }}  %%Amen midi       
       
}  


} %%% book bracket
