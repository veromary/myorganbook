%%% 415.png
%%% Hymn 267 Alternative Version Glory to thee, my God, this night
%%% Version 1

\version "2.10"

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%%pull a rest leftwards slightly leaving the rest of the notecolumn alone	      
restleft =  { \once \override Score.SeparationItem #'padding = #3
              \once \override Rest #'X-offset = #-2.2
            }

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions	

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—EVENING"
	\hspace #0.1 }}	
  
  title = \markup { "267 " \large \smallCaps "(Alternative Version)" }
  
  %%% Note: the original image did not have a tune name or meter line. However since this is an alternative setting
  %%% of Hymn 267 proper and shares the same melody, the tune name, meter of Hymn 267 and Amen block have been copied over to make
  %%% this piece complete in and of itself
  
  poet = \markup { \small {  \line { \sans { "TALLIS' CANON."} \hspace #1 \roman {"(L. M.)"}} }}
  
  meter = \markup { \small { \italic {Slow and dignified} \general-align #Y #DOWN \note #"2" #0.5 = 52.} }
  
  arranger = \markup { \small { \italic "Ravenscroft's Psalter, 1621." }}
  
  tagline =""
}


global = {
  \time 4/2 	
  \key  g \major	
  \set Staff.midiInstrument = "church organ" 
}


people = \relative c' { 
  \partial 1 \stemUp g'1 | g2 fis2 g2 g2 | a2 a2 b2 g2 | \break
  \stemDown c2 c2 \stemUp b2 b2 | a2 a2 g2 \bar "||" \stemDown d'2 | c2 \stemUp a2 b2 b2 | \break
  a2 a2 g2 d2 | e2 fis2 g2 b2 |  a2 a2 g1 \bar "||" 
}



soprano = \relative c' {
  \restleft r2 d2 | d2 d2 d2 g2 | g2 fis2 g2 g2 |
  a2 a2 b2 g2 | c2 c2 b2 \bar "||" b2 | a2 a2 g2 d'2 | 
  c2 a2 b2 b2 | a2 a2 g2 d2 | e2 fis2 g1 \bar "||" 
}

alto = \relative c' { 
  b1 | a2 a2 b2 d2 | e2 d2 d2 d2 | 
  e2 fis2 g2 d2 | fis2. e4 d2 \bar "||" g2 | e2 d2 d2. g4 | 
  e2 fis2 g2 g2 | e2 d2 b2. d4 | c2 a2 b1 \bar "||" 
}

tenor = \relative c { 
  g'1 | g2 fis2 g2 g2 | a2 a2 b2 g2 | 
  c2 c2 b2 b2 | a2 a2 g2 \bar "||" d'2 | c2 a2 b2 b2 | 
  a2 a2 g2 d2 | e2 fis2 g2 b2 | a2 a2 g1 \bar "||"
}

bass = \relative c { \clef bass 
  g1 | d'2 d2 g,2 b2 | c2 d2 g,2 b2 | 
  a2 a2 g2 g'2 | g2 fis2 g2 \bar "||" g2 | a2 fis2 g2 g,2 | 
  c2 d2 g,2 b2 | c2 d2 e2 g2 | c,2 d2 g,1 \bar "||"
}

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
    <<
        \context Staff = people { \set Staff.instrumentName = \markup { \hcenter-in #16 {\center-align { \smallCaps "People's"  \smallCaps "Part." } } }
	                   \global \people } 

	\new PianoStaff  
	                  <<  
	    \set PianoStaff.instrumentName = \markup { \hcenter-in #14 {\center-align { \smallCaps "Choir"  \smallCaps "or" \smallCaps "Organ."  } } } 
	     \context Staff =  upper  
	                     << 
			     \context Voice = "sopranos" {  
			           \voiceOne \global \soprano }
	                      \context Voice = "altos"   { 
	                           \voiceTwo \global \alto }
	                      >>
	     \context Staff = lower <<
	     \context Voice = "tenors" { 
	                           \voiceOne \global \tenor }
	     \context Voice = "basses" { 
	                           \voiceTwo \global \bass }
			            >> 
		              >>	      
    >>
>> 
\layout {       
	        indent = 2.5\cm
		\context { \Score \remove "Bar_number_engraver" }		        
		\context { \PianoStaff \remove "Span_bar_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
		
		%%%Lilypond tended to put the staffs too close together. This next setting spreads it a little to match the image
		\context { \Staff \override VerticalAxisGroup #'minimum-Y-extent = #'(-4 . 6) }
	}
	
\midi {  \context { \Score  tempoWholesPerMinute = #(ly:make-moment 66 2) } }
	
}

\markup{ \hspace #6 \column {  \line { \italic "        This version may be used in connexion with the other for one or more verses, the people"} 
	\line { \italic "singing the melody as usual or the" \teeny " CHOIR  SINGING  ALONE." \italic "  Prominence should be given to the" }  
	\line { \italic "tenor part which in this version leads the canon."}   
}}

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
				    "      " %%% adds vertical spacing between verses
			}}	   
			\line {"5*" \hspace #-0.4
				\column {
					"When in the night I sleepless lie,"
					"My soul with heavenly thoughts supply;"
					"Let no ill dreams disturb my rest,"
					"No powers of darkness me molest."
					 "      " %%% adds vertical spacing between verses
			}}
			\line {"6*" \hspace #-0.4
				\column {
					"You, my blest guardian, whilst I sleep"
					"Close to my bed your vigils keep;"
					"Divine love into me instil,"
					"Stop all the avenues of ill."
					 "      " %%% adds vertical spacing between verses
			}}
			\line {"7. "
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
