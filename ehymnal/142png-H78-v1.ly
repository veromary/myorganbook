%%%142.png
%%%Hymn 78 First Mode Melody Lord, teach us how to pray aright
%%%Version 1

\version "2.10"

\header {
	dedication = \markup { \center-align { \line {  "THE CHRISTIAN YEAR - LENT" } 
					       \hspace #1
						} }	
  title = "78"
			       
  arranger = \markup { \small { \smallCaps "T. Tallis," \italic "c." "1515-85."} }
  poet = \markup { \small { \sans  "FIRST MODE MELODY." \hspace #1 \roman { "(D. C. M.)"} } }
  meter = \markup { \small { \italic {Moderately slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 84.} }
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%shortcut macro for small notes
smallnote = { \once \override NoteColumn #'force-hshift = #0.2 
	      \once \set fontSize = #-3 
              \once \override Stem #'length = #5  }

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 
merge = \once \override NoteColumn #'force-hshift = #-0.01
	      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro definitions

%%% SATB voices

global = {
  \time 3/2 
  \key f \minor
  \set Staff.midiInstrument = "church organ"
}	   
	      
soprano = \relative c' {
  \tag #'hymn { f2 f2 f2 | e1 f2 | aes1 g2 | g1 \bar "||" g2 | g1 c2 | c2 b1 | c1. ^\fermata \bar "||" \break
  
  c2 c2 c2 | bes1 bes2 | aes2.( g4) f2 | e1 \bar "||" f2 | g1 g2 | f1 e2 | f1. ^\fermata \bar "||" \break
  
  aes2 aes2 aes2 | aes1 aes2 | aes1 g2 | aes1 \bar "||" aes2 | ees'1 ees2 | bes2.( aes4) f2 | bes1. ^\fermata \bar "||" \break
  
  c2 c2 c2 | des1 c2 | bes2.( aes4) aes2 | g1 \bar "||" bes2 | aes1 g2 | f1 e2 | f1 \bar "||" }
      \tag #'amen  { \cadenzaOn f1 f1 \bar "||" }   
}

alto = \relative c' {
  \tag #'hymn { aes2 c2 c2 | c1 aes2 | f'1 d2 | ees1 \bar "||" ees2 | d2.( ees4) f2 | g1 g2 | << { g1. } 
      \new Voice = "alt" { \voiceFour \smallnote ees1. } >> \bar "||" 
      
  g2 g2 g2 | g1 d2 | ees2 c1 | c1 \bar "||" c2 | d1 ees2 | c1 c2 | << { c1. } 
      \new Voice = "alt" { \voiceFour  \smallnote aes1. } >> \bar "||"     
      
  f'2 f2 f2 | f1 f2 | f2 ees1 | << { ees1 } 
      \new Voice = "alt" { \voiceFour \smallnote c1 } >>  \bar "||"
      c2 | ees2.( f4) g2 | ees2( f2) f2 | g1. \bar "||"
      
  aes2 aes2 aes2 | aes1 aes2 | f1 des2 | ees1 \bar "||" ees2 | ees1 ees2 | c1 c2 | << { c1 } 
      \new Voice = "alt" { \voiceFour \smallnote aes1 } >>  }
      \tag #'amen { bes1 a1 \bar "||" }
}

tenor = \relative c { \clef bass
  \tag #'hymn { f2 aes2 aes2 | g1 f2 | c'1 bes2 | c1 \bar "||" g2 | bes1 c2 | d1 d2 | c1. \bar "||"
  
  ees2 ees2 ees2 | d1 bes2 | c2 aes1 | g1 \bar "||" aes2 bes1 g2 | aes2 g1 | f1.  \bar"||"
  
  c'2 c2 c2 | c1 c2 | des2 bes1 | aes1 \bar "||" aes2 | c1 bes2 | ees1 d2 | ees1. \bar "||"
  
  ees2 ees2 ees2 | f1 ees2 | des1 aes2 | bes1 \bar "||" g2 | c1 bes2 | aes2 g1 | f1 \bar "||" }
      \tag #'amen { 
      \once \override TextScript #'padding = #1
      des1^\markup {"A  -  men." } c1 \bar "||" }
}

bass = \relative c { \clef bass
  \tag #'hymn { f2 f2 f2 | c1 f2 | f1 g2 | c,1 \bar "||" c2 | g'1 aes2 | g1 g2 | c,1. _\fermata \bar "||"
	  
  c2 c2 c2 | g'1 g2 | c,2( f2) f2 | c1 \bar "||" f2 | bes,1 ees2 | f2 c1 | \merge f1. _\fermata \bar "||"
  
  f2 f2 f2 | f1 f2 | des2 ees1 | aes,1 \bar "||" aes'2 | aes1 ees2 | g2 f1 |ees1. _\fermata \bar "||"
  
  aes2 aes2 aes2 | des,1 aes'2 | des,2 f1 | ees1 \bar "||" ees2 | c2.( des4) ees2 | aes,2 c1 | \merge f1 \bar "||" }
      \tag #'amen { bes,1 f1 \bar "||" }
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
	\context Voice = altos    {\voiceTwo \global \alto }
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \tenor }
	\context Voice = basses { \voiceTwo \global \bass }
			        >> 
 >>
 
\layout {
		indent=0
%		\context { \Score timing = ##f }
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	}
	
} %%score bracket

%%% Score block to generate hymn midi without Amen
\score{
\new ChoirStaff	
 <<

	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \removeWithTag #'amen \soprano }
	\context Voice = altos    { \voiceTwo \global \removeWithTag #'amen \alto }
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \removeWithTag #'amen \tenor }
	\context Voice = basses { \voiceTwo \global \removeWithTag #'amen \bass }
			        >> 
 >>
	
\midi { 
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 84 2) }
       }

}

%%% Separate score block to generate Amen midi on its own 
\score{
\new ChoirStaff	
 <<

	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \keepWithTag #'amen \soprano }
	\context Voice = altos    { \voiceTwo \global \keepWithTag #'amen \alto }
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \keepWithTag #'amen \tenor }
	\context Voice = basses { \voiceTwo \global \keepWithTag #'amen \bass }
			        >> 
 >>
	
\midi { 
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 84 2) }
       }

}

%%% Hymn Note markup

\markup { \hspace #52 \center-align { \line { \smallCaps "Note" \hspace #-1.2 ".—" \italic "This hymn may also be sung to a" "C. M." \italic "tune.    "  
	                                          \smallCaps "Windsor" "(" \italic "No. 332" ")" \italic "or" }  
                                      \line { \smallCaps "St. Peter" "(" \italic "No. 265" ")" \italic "are suitable." }} }
  
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

%%% page 2
%%% Lyric attribution

\markup { \hspace #60 \small \italic "J. Montgomery, 1771-1854." }  
	
%%% Main block of lyrics

\markup { \hspace #30 %%add space as necc. to center the column
	        \column {  %% one super column for entire block of lyrics
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "L" }   %%Drop Cap goes here
				  \hspace #-1.4    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ORD, teach us how to pray aright"  
			                                 "  With reverence and with fear;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Though dust and ashes in thy sight,"
					   "    We may, we must draw near."
			  		}}
			       
			           } %% finish verse 1	
		  \hspace #1  % adds vertical spacing between verses		   
		  \line { "2  "
		    \column {	     
			    "We perish if we cease from prayer;"
			    "    O grant us power to pray;"
			    "And when to meet thee we prepare,"
			    "    Lord, meet us by the way."
			}}
		 \hspace #1  % adds vertical spacing between verses  	
		  \line { "3  "
		    \column {	     
			    "God of all grace, we come to thee"
			    "    With broken contrite hearts;"
			    "Give, what thine eye delights to see,"
			    "    Truth in the inward parts;"
			}}
		\hspace #1  % adds vertical spacing between verses   
		\line { "4  "
		    \column {	     
			    "Faith in the only sacrifice"
			    "    That can for sin atone;"
			    "To cast our hopes, to fix our eyes,"
			    "    On Christ, on Christ alone;"
			}}
		\hspace #1  % adds vertical spacing between verses   
		\line { "5  "
		    \column {	     
			    "Patience to watch, and wait, and weep,"
			    "    Though mercy long delay;"
			    "Courage our fainting souls to keep,"
			    "    And trust thee though thou slay."
			}}
           	\hspace #1  % adds vertical spacing between verses  		  
           	\line { "6. "
		   \column {	     
			   "Give these, and then thy will be done;"
			   "    Thus, strengthened with all might,"
			   "We, through thy Spirit and thy Son,"
			   "    Shall pray, and pray aright."
     			}}
	  }
} %% lyric markup bracket

} %% book bracket