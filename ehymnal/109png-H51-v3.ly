%%%109.png
%%%Hymn 51(Modern) Lucis Creator O blest creator of the light
%%%Version 3

\version "2.10"

\header {
  dedication = \markup { \center-align { \line {  "THE CHRISTIAN YEAR - FROM THE EPIPHANY TILL LENT" } 
					       \hspace #1
						} }	
  title = \markup { "51 " \large \smallCaps "(Modern Tune)" }
			       
  arranger = \markup { \small { \italic "Angers Church Melody."} }
  poet = \markup { \small { \sans  "LUCIS CREATOR." \hspace #1 \roman { "(L. M.)"} } }
  meter = \markup { \small { \italic {In moderate time} \fontsize #-5 \general-align #Y #DOWN \note #"4" #1 = 144.} }
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%% Macro to push notes rightwards
push = { \once \override Dots #'transparent = ##t
	\once \override NoteColumn #'force-hshift = #0.6 }

%%%%%%%%%%%%%%%%%%%%%%%% End of Macro Definitions
	
global = {
  \time 3/4
  \key e \minor 
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
  \partial 4 e4^\markup { \italic "To be sung in unison." } | e2 g4 | e2 d4 | g2 a4 | b2 \bar "||" a4 | d2 e4 | \break 
  d4( cis4) b4 | a2 b4 | b2 \bar "||" e,4 | b'4( c4) b4 | a2 fis4 | \break
  g4( fis4) e4 | fis2 \bar "||" d4 | < fis a >4( <g b>4) <fis a>4 | g2 fis4 | e2 d4 | e2. \bar "||" 
}

alto = \relative c' {
  s4 | s2. | s2. | s2 <d fis>4 | <d g>2 \bar "||" <d fis>4 | < fis a >2 <a cis>4 | 
  <fis b>4 < fis a >4 <d g>4 | <d fis>2 < d fis >4 | <d fis>2 \bar "||" s4 | < e g >2 <d g>4 | <d fis>2 < a d >4 |
  < b d ~ >4 < a ~ d >4 < a cis >4 | <a d>2 \bar "||" s4 | d2. | < b ~ e >2 <b d>4 | s2. | s2. \bar "||" 
}

tenor = \relative c { \clef bass
  <g' b>4 | <g b>2 <g b>4 | < g c >2 <g b>4 | <g b>2 s4 | s2 \bar "||" s4 | s2. | 
  s2. | s2. | s2 \bar "||" <g b>4 | s2. | s2. | 
  s2. | s2 \bar "||" <fis a>4 | s2. | s2. | < g ~ c >2 <g b>4 | < g b >2. \bar "||" 
}

bass = \relative c { \clef bass
  e4 | e2 e4 | c2 g4 | e'2 d4 | g2 \bar "||" d4 | d2 \stemUp a4 | 
  b4 \stemDown fis'4 g4 | \stemUp d2 b4 | b2 \bar "||" \stemDown e4 | e4 \stemUp c4 \stemDown g'4 | d2 d4 | 
  \stemUp g,4 d'4 a4 | d2 \bar "||" \stemDown d4 | d4 g4 d4 | e2 b4 | c2 g4 | e2. \bar "||"  
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

\midi { 
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 144 4) }
       }	
} %%% score bracket


%%% Beginning of lyrics block

\markup {
	\column {
		\line { \small { \hspace #16 \smallCaps "Office Hymn." \italic " Sunday," "E." \hspace #24 \italic "6th cent.  Tr. J. M. Neale."  } }  
	        \line { \small { \hspace #44 "Lucis Creator optime."} }
} }


\markup { \hspace #30 %% add space here as necc. to center the entire block of lyrics
          \column { %% whole block of lyrics goes into one super column with sub-columns as necessary
	              \column { %% column for verse 1, a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "  BLEST Creator of the light,"  
			                                 "  Who mak'st the day with radiance bright," 
			                }}          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "And o'er the forming world didst call"
					   "The light from chaos first of all;"
			  		}}
			           } %% finish verse 1	
				   
		    \hspace #1  % adds vertical spacing between verses   
		    \line { "2  "
		    \column {	     
			    "Whose wisdom joined in meet array"
			    "The morn and eve, and named them Day:"
			    "Night comes with all its darkling fears;"
			    "Regard thy people's prayers and tears,"
			}}
		} %% end of super column  
} %% end of markup	  
			
%%second page
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

%%% Continuation of lyrics

\markup { \hspace #30  %% add space here as necc. to center the entire block of lyrics
          \column {  %% whole block of lyrics goes into one super column with sub-columns as necessary
		  \line { "3  "
		    \column {	     
			    "Lest, sunk in sin, and whelm'd with strife,"
			    "They lose the gift of endless life;"
			    "While thinking but the thoughts of time,"
			    "They weave new chains of woe and crime."
			}}
		  \hspace #1  % adds vertical spacing between verses  
		  \line { "4  "
		    \column {	     
			    "But grant them grace that they may strain"
			    "The heavenly gate and prize to gain:"
			    "Each harmful lure aside to cast,"
			    "And purge away each error past."
			}}
		 \hspace #1  % adds vertical spacing between verses  		    
           	 \line { "5. "
		   \column {	     
			   "O Father, that we ask be done,"
			   "Through Jesus Christ, thine only Son;"
			   "Who, with the Holy Ghost and thee,"
			   "Doth live and reign eternally.     Amen."
			}}
	  } %% end of super column
} %% lyric markup bracket


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne e2 ( fis2 e2 d2 e2 ) e1  \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo s1. s1 s1 \bar "||" }}
	                      >>
	
	\context Lyrics \lyricsto "sopranos" {	\override LyricText #'font-size = #-1 "A       -       -       -" men. }	      
	%\context Lyrics \lyricmode { \override LyricText #'font-size = #-1 "A"2 "-"2 "-"2 "-"2 "-"2 "men."2 }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree  < g' c >2 < b d >2 < g c >2 \push < g b >1 < g b >1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour   c2 b2 c2 g2 e2 e1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 13\cm
	\context { \Staff \remove Time_signature_engraver }
       }
       
%%% Amen midi       
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 144 4) }}  
       
}  

} %%book bracket