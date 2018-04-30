%%%% 305.png
%%%% Hymn 191 Modern Tune. Ut Queant Laxis. Son of a Virgin, Maker of thy mother.
%%%% Rev 1.

\version "2.10"

\header {
	
  dedication = \markup { \center-align {  "SAINTS' DAYS: GENERAL - VIRGINS"
		\hspace #0.1 }}	

  title = \markup { "191 " \large \smallCaps "(Modern Tune)"}   
  
  poet = \markup { \small {  \line { \sans { "UT QUEANT LAXIS."} \hspace #1 \roman {"(11 11. 11 5.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"4" #0.5 = 96.} }
  
  arranger = \markup { \small { \italic "Rouen Church Melody." }}
  
  tagline = ""
}


%%% SATB voices

global = {
  \time 4/4
  \key bes \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \override TextScript #'padding = #1	
  g'4 ^\markup {\hspace #-3 \italic "To be sung in unison." } f g( bes) | bes( a) g( a) | g4. f8 g4 a | bes2 bes \bar "||" \break
  c4( bes) c d | c( bes) c2 | bes4. a8 g4 a | g2 f \bar "||" bes g4 f | \break
  bes2 bes | c4. d8 c4 bes | a2 g \bar "||" bes a4 g | f2 g \bar "||"
} 
   
alto = \relative c' {  
  <bes d>4 <a d> <bes d>2 | <d g>4 <d f> <bes ees> <d f> | <bes ees>4. <bes d>8 <bes d>4 <c f> | <d f>2 <d f> \bar "||"
  <f a>4 <d g> <f a>2 | <f a>4 <d g> <f a>2 | <d f>4. <c f>8 <c e>4 <c f> | <c e>2 c2 \bar "||" <d f>2 <bes ees>4 <a c> | 
  <d f>2 <d f> | f4. f8 <f a>4 <d g> | <d f>2 <bes d> \bar "||" <d g> <d f>4 <bes ees> | <bes d>2 <bes d> \bar "||"
}

tenor = \relative cis {\clef bass 
  s1 | s1 | s1 | bes2 bes \bar "||"
  s1 | s1 | bes4. s8 c4 s4 | c2 s2 \bar "||" bes2 s4 s4 | 
  bes2 bes2 | a4. bes8 s4 s4 | s1 \bar "||" s1 | bes2 g \bar "||"
}

bass = \relative cis {\clef bass 
  g'4 d g2 | g4 d ees d | ees4. bes'8 g4 f | s1 \bar "||" 
  f4 g f d | f g f2 | s4. f8 s4 f4 | s2 f2 \bar "||" s2 ees4 f |
  s1 | s4. s8 f4 g | d2 g \bar "||" g d4 ees | s1 \bar "||"
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

%%% Hymn Midi	

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 96 4)}} 
		
} %%% Score bracket


%%% Lyric Titles


%%% Lyric titles and attributions

\markup { \hspace #12 \small {  \column { \line {\smallCaps  "Office Hymn. " \italic "Common of a Virgin." } 
          	                         \line { \hspace #2 "(" \hspace #-1 \italic "in full" \hspace #-1 ").  E." \italic "and" "M." \hspace #45 \italic "8th cent.  Tr. L. H."  }
		                         \line { \hspace #2 \italic "Part 2.  For a Matron. " "(" \hspace #-1 \italic "York." \hspace #-1 ")" }    
					 \line { \hspace #34 "Virginis Proles." }
}}}


%%% Lyrics

\markup { \hspace #26 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "S" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ON of a Virgin, Maker of thy mother,"
			                                 "Thou, Rod and Blossom from a Stem unstainèd," } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Now while a Virgin fair of fame we honour,"
					   "                                          Hear our devotion!"
			   "                " %%% adds vertical spacing between verses		
			  }} 
			         } %%% finish verse 1
			\line { "2  "
			   \column {	     
				   "Lo, on thy handmaid fell a twofold blessing,"
				   "Who, in her body vanquishing the weakness,"
				   "In that same body, grace from heaven obtaining,"
				   "                                          Bore the world witness."
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

\markup { \hspace #26 %%add space as necc. to center the column
          \column { %% super column of everything				 	 
		        \hspace #1  % adds vertical spacing between verses  
			\line { "3  "
			 \column {	     
				 "Death, nor the rending pains of death appalled her"
				 "Bondage and torment found her undefeated:"
				 "So by the shedding of her life attained she"
				 "                                          Heavenly guerdon."
				   "                " %%% adds vertical spacing between verses
			 }}
			\line { \hspace #20 \italic "Part 2."
			\column {	     
				   "                " %%% adds vertical spacing between verses
				  "                " %%% adds vertical spacing between verses
			}}
			\line { "4  "
			\column {	     
				"Fountain of mercy, hear the prayers she offers;"
				"Purge our offences, pardon our transgressions,"
				"So that hereafter we to thee may render"
				"                                          Praise with thanksgiving."
				"                " %%% adds vertical spacing between verses
			}}
           		\line { "5. "
			   \column {	     
				   "Thou, the All-Father, thou the One-Begotten,"
				   "Thou Holy Spirit, Three in One co-equal,"
				   "Glory be henceforth thine through all the ages,"
				   "                                          World without ending.     Amen."
			}}
	  } %%% end supercolumn
} %%% end markup	  


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne g'2( a g f g) \bar "|" g1  \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo <bes d>2 <d f> <bes ees> <bes d> <bes d> \bar "|" <bes d>1 \bar "||" }}
		>>
			      
	\context Lyrics \lyricsto "sopranos" { \override LyricText #'font-size = #-1 "A     -      -      -      -  " men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree s2 *5 \bar "|" s1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  g'2 d ees bes g \bar "|" g1 \bar "||" }}
		        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 12\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 96 4) }}  %%Amen midi       
       
} %%% end Amen score block


} %%% book bracket
