%%%% 444.png
%%%% Hymn 295. DANBY. 'Tis winter now; the fallen snow
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—WINTER"
	\hspace #0.1 }}	
	
	title = "295"   
  
  poet = \markup { \small {  \line { \sans { "DANBY."} \hspace #1 \roman {"(L. M.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"4" #0.5 = 104 "("\general-align #Y #DOWN \note #"2" #0.5 = 52")." }}
  
  arranger = \markup { \small { \italic "English Traditional Melody." }}
  
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}
	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 3/2
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 2. d4 g4 fis4 | g2 ~ g4 d4 f4 e4 | d2 ~ d4 d4 g4 fis4 | \break
  g2 ~ g4 a8 b8 c4 b4 | a2 ~ a4 \breathmark \bar "||" g4 a4 d4 | d2 c4 ( b4 -) a4 d,4 | \break
  g2 ~ g4 g4 a4 b4 | a2 ~ a4 e4 d4 d4 | d2. \bar "||" 
}
   
alto = \relative c' {  
  b4 d4 d4 | d2 ~ d4 b4 d4 c4 | c2 ( b4 ) c4 d4 d4 | 
  b2 ~ b4 d4 e4 d4 | d2 ~ d4 \bar "||" d4 e4 fis4 | g2 d2 e4 d4 | 
  d2 ~ d4 b4 d4 d4 | e2 ~ e4 c8[ b8] a8[ b8] c4 | c2( b4) \bar "||" 
}

tenor = \relative c {\clef bass 
  g'4 g4 a4 | b2 ~ b4 g4 g4 g4 | g2 ~ g4 fis4 g4 a4 | 
  g2 ~ g4 fis4 g4 g4 | g2 ( fis4 ) \bar "||" g4 c4 b8 a8 | g2 a4 ( b4 -) c4 b8 a8 | 
  g2 ~ g4 g4 d'4 d4 | c4 ( b4 a4 ) g4 g4 fis4 | g2. \bar "||"
}

bass = \relative c {\clef bass 
  g4 b4 d4 | g2 ~ g4 g,8 a8 b4 c4 | g2 ~ g4 a4 b4 d4 | 
  e2 ~ e4 d4 c4 g'4 | d2 ~ d4 \bar "||" b4 c4 d4 | e2 fis4 ( g4 ) c,4 c4 | 
  b2 ~ b4 e4 fis4 g4 | c,2 ~ c4 c4 d4 d4 | g,2. \bar "||"
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
%%%		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %% close layout

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 104 4) }}      
  	
	
} %%% Score bracket

%%% Lyric titles and attributions

\markup { "                " }

\markup {  \small {  \hspace #66 \italic "S. Longfellow, 1819-92." }} 


%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "'T" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "IS winter now; the fallen snow"
			                                "Has left the heavens all coldly clear;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Through leafless boughs the sharp winds blow,"
					   "And all the earth lies dead and drear."
					   "          " %%% adds vertical spacing between verses
			  		}}
		      } %%% end verse 1	
           		\line { "2  "
			   \column {	     
				   "And yet God's love is not withdrawn;"
				   "His life within the keen air breathes;"
				   "His beauty paints the crimson dawn,"
				   "And clothes the boughs with glittering wreaths."
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
			\line { "3  "
			   \column {	     
				   "And though abroad the sharp winds blow,"
				   "And skies are chill, and frosts are keen,"
				   "Home closer draws her circle now,"
				   "And warmer glows her light within."
				   "          " %%% adds vertical spacing between verses
			}}	   
			\line { "4. "
			   \column {	     
				   "O God! who giv'st the winter's cold,"
				   "As well as summer's joyous rays,"
				   "Us warmly in thy love enfold,"
				   "And keep us through life's wintry days."
			}}
	  }
} %%% lyric markup bracket



%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne  \cadenzaOn e1 d1   \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo c1 b1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree g'1 g1   \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 104 4) }}  %%Amen midi       
       
}  


} %%% book bracket

