%%%% 412.png
%%%% Hymn 265. St Peter. As now the sun's declining rays.
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—EVENING"
	\hspace #0.1 }}	
	
	title = "265"   
  
  poet = \markup { \small {  \line { \sans { "ST. PETER."} \hspace #1 \roman {"(C. M.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"2" #0.5 = 76.} }
  
  arranger = \markup { \small { \smallCaps "A. R. Reinagle," "1799-1877." }}
  
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% mergedotted. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 
%%% Turns one dot off as there is only one dot for the two merged notes.

mergedotted = { \once \override Dots #'transparent = ##t
          \once \override NoteColumn #'force-hshift = #-0.01 }

%%generates the breathmarks
breathmark = { 
	\override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup { \fontsize #4 "," }
	}
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key ees \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 2 bes'2 | ees2 d2 c2 bes2 | bes2 aes2 g2 \breathmark \bar "||" g2 | f2 ees2 aes2 g2 | f1. \bar "||" \break
  g2 | aes2 g2 c2 bes2 | bes2 aes2 g2 \breathmark \bar "||" ees2 | g2 f2 ees2 d2 | ees1. \bar "||" 
}
   
alto = \relative c' {  
  ees2 | g2 g2 ees2 ees2 | f2 d2 ees2 \bar "||" ees2 | c2 bes2 d2 ees2 | d1. \bar "||" 
  ees2 | ees2 ees2 ees2 ees2 | c2 d2 ees2 \bar "||" c2 | ees2 c2 bes2 bes4 ( aes4 -) | g1. \bar "||" 
}

tenor = \relative c {\clef bass 
  g'2 | bes2 bes2 aes2 bes2 | bes2 bes2 bes2 \bar "||" bes2 | aes2 bes2 bes2 bes2 | bes1. \bar "||" 
  bes2 | aes2 bes2 ees,2 ees2 | f2 f2 ees2 \bar "||" g2 | bes2 aes2 g2 f2 | \mergedotted ees1. \bar "||" 
}

bass = \relative c {\clef bass 
  ees2 | ees2 g2 aes2 g2 | d2 bes2 ees2 \bar "||" ees2 | aes2 g2 f2 ees2 | bes1. \bar "||" 
  ees4 ( des4 -) | c2 bes2 aes2 g2 | f2 bes2 c2 \bar "||" c2 | g2 aes2 bes2 bes2 | ees1. \bar "||" 
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

%%% Lyric attributions and titles

\markup { \small { \hspace #64 \italic "C. Coffin, 1676-1749.  Tr. J. Chandler" \hspace #-1 "‡." }}

\markup { \small { \hspace #34 "Labente jam solis rota." }}

%%% Main lyric block
%%% To fit on one page, lyrics are in 3 columns: column 1 (verses ), column 2 (a dividing line), column 3 (verses); centred last verse

\markup { \hspace #4  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "A" }   %%Drop Cap goes here
				  \hspace #-1.6    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "S now the sun's declining rays"
			                                 "    At eventide descend," } }     
	                  \line {  \hspace #2.0  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "E'en so our years are sinking down"
					   "    To their appointed end."
					   "             " %%% adds vertical spacing between verse
			  		}} 
			         } %%% finish verse 1

		}  %% finish Page column 1
		
	\hspace #2 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -10 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #2 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
			\line {"2  "
			   \column {	     
				   "Lord, on the Cross thine arms were stretched"
				   "    To draw the nations nigh;"
				   "O grant us then that Cross to love,"
				   "    And in those arms to die."
				   "             " %%% adds vertical spacing between verse
			}}

	    } %%% end column 3
     } %%% end master-line
     %%% centred last verse
			\line { \hspace #24 "3. "
			     \column {	     
				     "To God the Father, God the Son,"
				     "    And God the Holy Ghost,"
				     "All glory be from saints on earth,"
				     "    And from the Angel host.       Amen."
			}}
   } %%% super column bracket
} %%% lyrics markup bracket


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne ees1 ees1  \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo c1 bes1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree aes'1 g1  \bar "||" }}
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
