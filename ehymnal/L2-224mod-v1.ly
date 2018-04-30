%%% 351b.png
%%% Hymn 224. (Modern Tune) Eén in thy childhood.
%%% Rev 1.

\version "2.10.23"

\header {
	dedication = \markup { \center-align { "SAINTS' DAYS: ST. JOHN BAPTIST" \hspace #0.1 } }
	title = \markup { "223" \large \smallCaps "(Modern Tune)"  }
	poet = \markup { \small { \sans "ISTE CONFESSOR" \hspace #1 \roman  "(11 11. 11 5.)" } }
	meter =  \markup { \small { \italic "In moderate time"  \general-align #Y #DOWN \note #"4" #0.5 = 96. } }
	arranger = \markup { \small \italic "Angers Church Melody." }
	tagline =""
			}
%% music function to allow lyrics to skip

skips = #(define-music-function (parser location times) (number?)
     #{
	     \repeat unfold $times { \skip 1}
     #})


global = {
\time 2/2
\key g \major
\set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
	\override TextScript #'padding = #1	
	\tag #'Tune { d2^\markup{ \italic "To be sung in unison."} g4 fis \bar "|" e2 d \bar "|" g4. fis8 g4 a \bar "|" b2 b2 \bar "||" d2 d4 b \bar "|" c2 b \bar "|" g4. a8 b4 c \bar "|" d2 d \bar "||" \break
  d,2 e4 fis \bar "|" g2 g \bar "|" b4. c8 d4 c4 \bar "|" b2 a \bar "||" b2 c4 b \bar "|" a2 g2 \bar "||" 
  }
  %%Amen
  \tag #'Amen { \cadenzaOn g2(a g fis) g1 \bar "||" \cadenzaOff }
}  
 
alto = \relative c' { 
  \tag #'Tune { b2 <<b4 d>> <<a d>> \bar "|" b2 b \bar "|" b4. <<b8 d>> <<b4 e>> <<d4 fis>> \bar "|" <<d2 g>> <<d g>> \bar "||" <<fis2 a>> <<fis4 a>> <<e g>> \bar "|" <<e2 g>> <<d g>> \bar "|" <<b,4. d>> <<d8 fis>> <<d4 g>> <<e g>> \bar "|" <<g2 b>> <<fis a>> \bar "||" \break
  b,2 b4 <<a4 d>> \bar "|" <<b2 d>> <<c e>> \bar "|" <<d4. g>> <<e8 g>> <<d4 g>> <<e g>> \bar "|" <<d2 g>> <<c, e>> \bar "||" <<e2 g>> <<e4 g>> <<d g>> \bar "|" <<d2 fis>> <<b, d>> \bar "||"
  }
  %%Amen
  \tag #'Amen { \cadenzaOn <<b2 e>> <<c e>> <<b d>> <<a d>> <<b1 d>> \bar "||" \cadenzaOff }
}  

tenor = \relative c { \clef bass 
  \tag #'Tune { g'2 s \bar "|" g2 fis \bar "|" g4. s8 s2 \bar "|" g,2 g \bar "||" s1 \bar "|" c2 s \bar "|" s2 s4 c4 \bar "|" g2 d' \bar "||" \break
  g2 g4 s \bar "|" g,2 c \bar "|" s4. c8 b4 c4 \bar "|" s1 \bar "||" s2 c4 s \bar "|" s2 g \bar "||"
  }
  %%Amen
  \tag #'Amen { \cadenzaOn s2 a2 b s2 s1 \bar "||" \cadenzaOff }
}  

bass = \relative c { \clef bass 
  \tag #'Tune { g2 g'4 d \bar "|" e2 b \bar "|" e4. b8 e4 d \bar "|" s1 \bar "||" d2 d4 e \bar "|" s2 g2 \bar "|" g4. d8 g4 s \bar "|" s1 \bar "||" \break
  g2 e4 d \bar "|" s1 \bar "|" g4. s8 s2 \bar "|" g2 a \bar "||" e2 s4 g4 \bar "|" d2 s2 \bar "||"
  }
  %%Amen
  \tag #'Amen { \cadenzaOn e2 s2 s d2 g,1 \bar "||" \cadenzaOff }
}  

wordsAmen = \lyricmode { { \skips #38 \override LyricText #' font-size = #-1  A -- } { \skips #3 \override LyricText #' font-size = #-1  men. } }

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
	\context Voice = altos { \voiceTwo \global \alto }
							>>

			\new Lyrics \lyricsto altos \wordsAmen


		\context Staff = lower <<
		\context Voice = tenors { \voiceOne \global \tenor }
		\context Voice = basses { \voiceTwo \global \bass}
								>>
		
>>

\layout {
	indent=0
	\context { \Score \remove "Bar_number_engraver" }
	\context { \Staff \remove "Time_signature_engraver" }
	\context { \Score \remove "Mark_engraver" }
		\context { \Staff \consists "Mark_engraver" }
	}

}%%score

%%% A separate score block to generate the midi for the Main tune without the Amen

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \removeWithTag #'Amen \soprano }
	\context Voice = altos    { \voiceTwo \global \removeWithTag #'Amen \alto }
	                      >>		      
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \removeWithTag #'Amen \tenor }
	\context Voice = basses { \voiceTwo \global \removeWithTag #'Amen \bass }
			        >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 96 4) }}      
  		
} %%% end score bracket


%%% A separate score block to generate the midi for the Amen only

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \keepWithTag #'Amen \soprano }
	\context Voice = altos    { \voiceTwo \global \keepWithTag #'Amen \alto }
	                      >>		      
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \keepWithTag #'Amen \tenor }
	\context Voice = basses { \voiceTwo \global \keepWithTag #'Amen \bass }
			        >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 96 4) }}      
  	
	
} %%% Score bracket

%%% Hymn Note markup

\markup { \hspace #16 \smallCaps "Note" \hspace #-1.2 ".—" \italic "Another harmonization of this tune will be found at Hymn" "188."  }

\markup "                   "  %%% force blank space before start of lyrics
%\markup "                   "


%%% Lyric titles and attributions

\markup { \hspace #8 \small {  \column { \line {\smallCaps  "Office Hymn."   " M." \hspace #38 \italic "Paulus Diaconus, 8th cent.  Tr. R. E. R." }   
					 \line { \hspace #36 "Antra deserti." }
                                         \line { "                    "}
}}}

%%% Lyrics

\markup { \hspace #26 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "E" }   %%Drop Cap goes here
				  \hspace #-1.4    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 " 'EN in thy childhood, 'mid the desert places,"
			                                 "  Thou hadst a refuge from the city gained," } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Far from all slander and its bitter traces"
                                           "                                            Living unstained."
				 "                " %%% adds vertical spacing between verses
			  		}} 
 			         } %%% finish verse 1

			\line { "2  "
			   \column {	     
				   "Often had prophets in the distant ages"
				   "Sung to announce the Daystar and to name him;"
				   "But as the Saviour, last of all the sages,"
				   "                                            Thou didst proclaim him."
				   "                " %%% adds vertical spacing between verses
			}}
			\line { "3  "
			\column {	 
				"Than John the Baptist, none of all Eve's daughters"
				 "E'er bore a greater, whether high or lowly:"
				 "He was thought worthy, washing in the waters"
				 "                                            Jesus the holy."
				 "                " %%% adds vertical spacing between verses
			 }}	
						\line { "4. "
			\column {	     
				   "Angels in orders everlasting praise thee,"
				   "God, in thy triune Majesty tremendous;"
				   "Hark to the prayers we, penitents, upraise thee:"
				   "                                            Save and defend us.      Amen."
				%   "                " %%% adds vertical spacing between verses
			}}
	  } %%% end super column
} %%%lyric markup bracket

} %%% book bracket
