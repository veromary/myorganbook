%%%% 425.png
%%%% Hymn 276. St. Anatolius. The day is past and over;
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—EVENING"
	\hspace #0.1 }}	
	
	title = "276"   
  
  poet = \markup { \small {  \line { \sans { "ST. ANATOLIUS."} \hspace #1 \roman {"(7 6. 7 6. 8 8.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"2" #0.5 = 76.} }
  
  arranger = \markup { \small { \smallCaps "A. H. Brown." }}
  
  tagline = ""
}


%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%% Macro for generating two augmentation dots for a notehead. 
%% When dotted notes from two vocal parts share a single notehead, 
%% Lilypond only inserts a single dot. In the image, two dots are used. 
%% This macro generates the two dots by replacing the normal dot glyph 
%% with a new glyph comprising a column of 2 dots one above the other.
 
%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01		      

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key ees \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 2 bes'2 | c2 bes2 ees,2 aes2 | g1 f2 \breathmark \bar "||" ees2 | f2 g2 aes2 c2 | bes1. \bar "||" \break
  bes2 | c2 bes2 ees,2 aes2 | g1 f2 \breathmark \bar "||" ees2 | f2 aes2 g2 f2 | ees1. \bar "||" \break
  ees'2 | d2 c2 bes2 c2 | d2 c2 bes2 \breathmark \bar "||" bes2 | aes2 g2 f2 ees2 | ees2 d2 ees2 \bar "||"
}
   
alto = \relative c' {  
  ees2 | ees2 bes2 c2 f2 | ees1 d2 \bar "||" ees2 | c2 e2 f2 g2 | f1. \bar "||" 
  ees2 | ees2 bes2 c2 f2 | ees1 d2 \bar "||" ees2 | c2 f2 ees2 d2 | \merge ees1. \bar "||" 
  g2 | fis2 fis2 g2 g2 | f2. ees4 d2 \bar "||" des2 | c2 ees2 f2 c2 | bes2 bes2 bes2 \bar "||"
}

tenor = \relative c {\clef bass 
  g'2 | aes2 g2 g2 c2 | bes1 bes2 \bar "||" g2 | aes2 bes2 c2 g2 | bes1. \bar "||" 
  g2 | aes2 g2 g2 c2 | bes1 bes2 \bar "||" g2 | aes2 c2 bes2 aes2 | g1. \bar "||" 
  c2 | a2 a2 g2 g2 | bes2 a2 bes2 \bar "||" g2 | aes2 bes2 c2 aes4 ( g4 ) | f4 ( g4 ) aes2 g2 \bar "||"
}

bass = \relative c {\clef bass 
  ees2 | ees2 ees2 c2 aes2 | bes1 bes2 \bar "||" c2 | aes'2 g2 f2 ees2 | d1. \bar "||" 
  ees2 | ees2 ees2 c2 aes2 | bes1 bes2 \bar "||" c2 | aes2 f2 g4 ( aes4 ) bes2 | ees1. \bar "||" 
  c2 | d2 d2 ees2 e2 | f2 f2 bes,2 \bar "||" ees2 | f2 g2 aes2 aes,2 | bes2 bes2 ees2 \bar "||" 
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 76 2) }}      
 	
	
} %%% Score bracket

%%% Lyric titles and attributions

\markup { "                 "}

\markup {  \small { \column { \line {  \hspace #72 \italic "Ascribed to 6th cent.  Tr. J. M. Neale." } 
		\line { \hspace #42 "Τὴν ἡμέραν διελθών."  "[Greek: Tên hêmeran dielthôn.]"} 
	%	\line { "               " }
}}}


%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #4.6 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HE day is past and over;"
			                               "  All thanks, O Lord, to thee;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "    I pray thee that offenceless"
					   "        The hours of dark may be:"
					   "O Jesu, keep me in thy sight,"
					   "And guard me through the coming night."
					   "      " %%% adds vertical spacing between verses
			  		}}
		      } 
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

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
		  	\hspace #1  % adds vertical spacing between verses 
			\line {"2  " 
			   \column {	     
				"    The joys of day are over;"
				"        I lift my heart to thee,"
				"    And call on thee that sinless"
				"        The hours of dark may be:"
				"O Jesu, make their darkness light,"
				"And guard me through the coming night."
				   "               " %%% add vertical spacing between verses
			}}
           		\line { "3  "
			     \column {	     
				     "    The toils of day are over;"
				     "        I raise the hymn to thee,"
				     "    And ask that free from peril"
				     "        The hours of dark may be:"
				     "O Jesu, keep me in thy sight,"
				     "And guard me through the coming night."
				     "              " %%% add vertical spacing between verses
			}}
			\line { "4. "
			     \column {	     
				     "    Be thou my soul's preserver,"
				     "        O God! for thou dost know"
				     "    How many are the perils"
				     "        Through which I have to go:"
				     "Lover of men! O hear my call,"
				     "And guard and save me from them all."
			}}

	  }
} %%% lyric markup bracket



%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne  ees1 ees1  \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 76 2) }}  %%Amen midi       
       
}  


} %%% book bracket

