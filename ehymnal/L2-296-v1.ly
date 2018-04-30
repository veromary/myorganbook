%%%% 445.png
%%%% Hymn 296. LYNE. Hark, my soul, how everything
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "SEASONS.—GENERAL"
	\hspace #0.1 }}	
	
	title = "296"   
  
  poet = \markup { \small {  \line { \sans { "LYNE."} \hspace #1 \roman {"(7 7. 7 7.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"4" #0.5 = 120. }}
  
  arranger = \markup { \small { "‘" \hspace #-1 \italic "Magdalen Hymns" \hspace #-1.2 ",’" \italic "1760" "(?)." }}
  
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%% Macro for generating two augmentation dots for a notehead. 
%% When dotted notes from two vocal parts share a single notehead, 
%% Lilypond only inserts a single dot. In the image, two dots are used. 
%% This macro generates the two dots by replacing the normal dot glyph 
%% with a new glyph comprising a column of 2 dots one above the other.
 
augdots = { 
 \once \override Voice.Dots #'stencil = #ly:text-interface::print 
 \once \override Voice.Dots #'text = \markup {  \hspace #0 \raise #1 
                                                \line { \translate #(cons -0.2 0) 
                                                \override #'(baseline-skip . 1 )  
                                                   \column { 
                                                     \musicglyph #"dots.dot" 
                                                     \musicglyph #"dots.dot" } } }
}
	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 3/4
  \key ees \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  ees2 f4 | g4. ( f8 -) ees4 | g2 a4 | bes2. | bes2 c4 | bes2 aes4 | g4. ( aes8 -) f4 | ees2. \bar "||" \break
 bes'4. ( aes8 -) g4 | bes2 ees,4 | g4. ( aes8 -) g4 | f2. | g4. ( aes8 -) bes4 | ees4 ( bes4 -) aes4 | g4 ( aes4 -) f4 | ees2. \bar "||"
}
   
alto = \relative c' {  
  ees2 bes4 | bes2 ees4 | ees2 ees4 | d2. | ees2 ees4 | ees2 ees4 | ees2 d4 | \augdots ees2. \bar "||" 
  f2 ees4 | ees2 ees4 | ees4. ( f8 -) ees4 | d2. | ees2 d4 | ees2 ees4 | ees4 ( f4 -) d4 | \augdots ees2. \bar "||"
}

tenor = \relative c {\clef bass 
  g'2 bes4 | bes2 bes4 bes2 c4 | d2. | bes2 aes4 | bes2 c4 | bes2 aes4 | g2. \bar "||"
  bes2 bes4 | bes2 bes4 | bes2 bes4 | bes2. | bes2 aes4 | g4 ( bes4 -) c4 | bes2 aes4 | g2. \bar "||" 
}

bass = \relative c {\clef bass 
  ees2 d4 | ees2 g4 | ees4 d4 c4 | bes4 ( bes'4 aes4 -) | g2 aes4 | g2 aes4 | bes2 bes,4 | ees2. \bar "||" 
  d2 ees4 | g2 g4 | ees2 g,4 | bes2. | ees2 f4 | g2 aes4 | bes2 bes,4 | ees2. \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4) }}      
  	
	
} %%% Score bracket

%%% Lyric titles and attributions

\markup { "                " }

\markup {  \small {  \hspace #74 \italic "J. Austin, d. 1669." }} 

%%% Lyrics

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "H" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ARK, my soul, how everything"
			                                 "  Strives to serve our bounteous King;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Each a double tribute pays,"
					   "Sings its part, and then obeys."
					   "      " %%% adds vertical spacing between verses
			  		}}
		      }  
			\line {"2  "
				\column {
					"Nature's chief and sweetest choir"
					"Him with cheerful notes admire;"
					"Chanting every day their lauds,"
					"While the grove their song applauds."
					 "      " %%% adds vertical spacing between verses
			}}
			\line {"3  "
				\column {
					"Though their voices lower be,"
					"Streams have too their melody;"
					"Night and day they warbling run,"
					"Never pause, but still sing on."
					 "      " %%% adds vertical spacing between verses
			}}
			\line {"4  "
				\column {
					"All the flowers that gild the spring"
					"Hither their still music bring;"
					"If heaven bless them, thankful, they"
					"Smell more sweet, and look more gay."
					 "      " %%% adds vertical spacing between verses
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

				\line {"5  "
				\column {
					"Only we can scarce afford"
					"This short office to our Lord;"
					"We, on whom his bounty flows,"
					"All things gives, and nothing owes."
					 "      " %%% adds vertical spacing between verses
			}}
				\line {"6  "
				\column {
					"Wake! for shame, my sluggish heart,"
					"Wake! and gladly sing thy part;"
					"Learn of birds, and springs, and flowers,"
					"How to use thy nobler powers."
					 "      " %%% adds vertical spacing between verses
			}}
				\line {"7  "
				\column {
					"Call whole nature to thy aid;"
					"Since 'twas he whole nature made;"
					"Join in one eternal song,"
					"Who to one God all belong."
					 "      " %%% adds vertical spacing between verses
			}}
           	        \line { \hspace #-10  \italic "Unison."  " 8. "
		                  \column {	     
					  "Live for ever, glorious Lord!"
					  "Live by all thy works adored,"
					  "One in Three; and Three in One,"
					  "Thrice we bow to thee alone.      Amen."
     			}}
	  }

} %%% lyric markup bracket


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne  \cadenzaOn ees1 ees1   \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo c1 bes1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree aes'1 g1   \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  aes1 ees'1  \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4) }}  %%Amen midi       
       
}  


} %%% book bracket

