%%%% 279.png
%%%% Hymn 176mod. Auctoritate Saeculi.  Let the round world with songs rejoice.
%%%% Rev 2

\version "2.10"

\header {
  dedication = \markup {  \center-align { "SAINTS' DAYS: GENERAL - APOSTLES AND EVANGELISTS"
	\hspace #0.1 }}	
	
  title = \markup { "176 " \large \smallCaps "(Modern Tune)" }   
    
  poet = \markup { \small {  \line { \sans { "AUCTORITATE SAECULI." } \hspace #1 \roman {"(L. M.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"4" #0.5 = 144.} }
  
  arranger = \markup { \small \italic "Angers Church Melody." }
  	
	
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 3/4
  \key aes \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 4 c4 ^\markup { \hspace #-3 \italic "To be sung in unison." } \bar "|" f2 aes4 \bar "|" g2 f4 \bar "|" g4( f) ees \bar "|" f2 \breathmark \bar "||" f4 \bar "|" aes2 bes4 \bar "|" c2 aes4 \bar "|" bes2 bes4 \bar "|" c2 \breathmark \bar "||" \break
  aes4 \bar "|" c2 bes4 \bar "|" c2 aes4 \bar "|" bes4( aes) g \bar "|" f2 \breathmark \bar "||" c4 \bar "|" f2 aes4 \bar "|" g2 f4 \bar "|" g4( f) ees \bar "|" f2 \bar "||"
} 
   
alto = \relative c' {  
  s4 \bar "|" s2 <c f>4 \bar "|" <c ees>2 <aes c>4 \bar "|" <c ees> <aes des> <aes c> \bar "|" <aes c>2 \bar "||" <aes c>4 <c f>2 <ees g>4 \bar "|" <ees aes>2 ees4 \bar "|" f2 <ees g>4 \bar "|" <ees aes>2 \bar "||"
  <des f>4 \bar "|" <ees aes>2 <ees g>4 \bar "|" <ees g>2 <c f>4 \bar "|" <des f>2 ees4 \bar "|" <aes, des>2 \bar "||" aes4 \bar "|" <aes des>2 <c ees>4 \bar "|" <bes ees>2 <aes c>4 \bar "|" <c ees> <aes des> <aes c> \bar "|" <aes c>2 \bar "||"
}

tenor = \relative c {\clef bass 
  <f aes>4 \bar "|" <aes c>2 s4 \bar "|" c,2 s4 \bar "|" c4 s4 s4 \bar "|" s2 \bar "||" s4 \bar "|" s2. \bar "|" aes2 c4 \bar "|" s2. \bar "|" aes2 \bar "||"
  s4 \bar "|" aes2 s4 \bar "|" c2 s4 \bar "|" bes2 c4 \bar "|" s2 \bar "||" s4 \bar "|" s2 aes4 \bar "|" s2. \bar "|" c4 des aes \bar "|" <f f'>2 \bar "||"
}

bass = \relative c {\clef bass 
  f,4 \bar "|" f2 f'4 \bar "|" s2 f4 \bar "|" s4 des4 aes'4 \bar "|" f2 \bar "||" f4 \bar "|" f2 ees4 \bar "|" s2. \bar "|" des2 ees4 \bar "|" s2 \bar "||"
  des4 \bar "|" s2 ees4 \bar "|" s2 f4 \bar "|" s2. \bar "|" des2 \bar "||" f4 \bar "|" des2 s4 \bar "|" ees2 f4 \bar "|" s2. \bar "|" s2 \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 144 4) }}      
  
	
} %%% Score bracket


%%% Lyric titles and attributions

\markup { \hspace #8 \small {  \column { \line {\smallCaps  "Office Hymn."  \italic "  Common of Apostles and"  \hspace #21 \italic "c. 10th cent.  Tr. Bishop R. Mant" "‡." }    
	\line { \hspace #4 \italic "Evangelists.  "  "M." \italic "and" "E." } 
	\line { \hspace #32 "Exultet caelum laudibus." }
}}}


%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "L" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ET the round world with songs rejoice;"
			                                 "  Let heaven return the joyful voice;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "All mindful of the Apostles' fame,"
					   "Let heaven and earth their praise proclaim."
					  "           " %%% adds vertical spacing between verses 
			  		}}
		      } %%end verse 1
		                 		\line { "2  "
			   \column {	     
				  "Ye servants who once bore the light"
				  "Of Gospel truth o'er heathen night,"
				  "Still may your work that light impart,"
				  "To glad our eyes and cheer our heart."
				  "           " %%% adds vertical spacing between verses
			}}
			   \line { "3  "
			   \column {	     
				  "O God, by whom to them was given"
				  "The key that shuts and opens heaven,"
				  "Our chains unbind, our loss repair,"
				  "And grant us grace to enter there;"
				  "           " %%% adds vertical spacing between verses
			}} 
			  \line { "4  "
			   \column {	     
				  "For at thy will they preached the word"
				  "Which cured disease, which health conferred:"
				  "O may that healing power once more"
				  "Our souls to grace and health restore:"
				  "           " %%% adds vertical spacing between verses
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

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
		  	\hspace #1  % adds vertical spacing between verses  

			   \line { "5  "
			   \column {	     
				  "That when thy Son again shall come,"
				  "And speak the world's unerring doom,"
				  "He may with them pronounce us blest,"
				  "And place us in thy endless rest."
				  "           " %%% adds vertical spacing between verses
			}}
			\line { "6. "
				\column {	     
				  "To thee, O Father; Son, to thee;"
				  "To thee, blest Spirit, glory be!"
				  "So was it ay for ages past,"
				  "So shall through endless ages last.     Amen."
     			}}

	  }
} %%% lyric markup bracket




%% Amen score block

\score{

  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f2( g f ees f) f1  \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo <aes c>2 <c ees> <aes des> <aes ~ c> <aes c> <aes c>1 \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A - - - men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree s2 *7 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  f,2 c des aes' f f1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
      \context { \Score timing = ##f }
	ragged-right = ##t
	indent = 14\cm
	\context { \Staff \remove Time_signature_engraver }

       } %% close layout

%%% Amen Midi

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 144 4) }}

}


%%%% Office Hymns markup


\markup { \hspace #53 \center-align {
	\line { \italic "Office Hymn for Apostles and Evangelists during Eastertide. " "E." \italic "and" "M. 123," \italic "Part" "2;" }   
        \line { \italic "and for" "M."\italic "and" "E. 124," \italic "Part" "2." }
}}


} %%% book bracket
