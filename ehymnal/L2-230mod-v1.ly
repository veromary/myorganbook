%%% 360b.png
%%% Hymn 230. (Modern Tune) Sing we all the joys and sorrows.
%%% Rev 1.

%%% Transcriber's Note:
%%% I am quite certain the white 1/2 note printed in the tempo indication is wrong and it 
%%% should be a black 1/4 note instead.  2=126 is blazingly fast, whereas 4=126 is
%%% about right for "in moderate time".  Code adjusted accordingly.

\version "2.10.23"

\header {
	dedication = \markup { \center-align { "SAINTS' DAYS: ST. MARY MAGDALENE" \hspace #0.1 }}
	title = \markup { "230" \large \smallCaps "(Modern Tune)" }
	poet = \markup { \small { \sans "COLLAUDEMUS." \hspace #1 \roman  "(8 7. 8 7. 8 7.)" } }
	meter =  \markup { \small { \italic "In moderate time." \general-align #Y #DOWN \note #"4" #0.5 = 126.} }
	arranger = \markup { \small \italic "French Carol." }
	tagline =""
			}
%%Generates nonbreaking bars
nbbar = { \bar "|" \noBreak }

global = {
\time 3/4
\key f \major
\set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {  f2 g4 \nbbar f4(e) f \nbbar g2 g4 \nbbar a2 f4 \nbbar a(bes) c \nbbar bes(a) g \nbbar f2 g4 \nbbar g2. \bar "||" \break
g4(a) bes \nbbar c2 c4 \nbbar f,(e) f \nbbar g2 g4 \nbbar a(bes) a \nbbar g2 g4 \nbbar f(d) e \nbbar f2. \bar "||" \break
g4(a) bes \nbbar c2 c4 \nbbar f,(e) f \nbbar g2 g4 \nbbar a(bes) a \nbbar g2 g4 \nbbar f(d) e \nbbar f2. \bar "||" }
 
alto = \relative c' {  c2 c4 \nbbar c2 c4 \nbbar e2 e4 \nbbar f2 c4 \nbbar f2 f4 \nbbar e(f) c \nbbar c2 b4 \nbbar c2. \bar "||" \break
g'4(f) e \nbbar f2 c4 \nbbar c2 b4 \nbbar c2 c4 \nbbar c(d) c \nbbar b2 b4 \nbbar bes!2 bes4 \nbbar a2. \bar "||" \break
g'4(f) e \nbbar f2 c4 \nbbar c2 b4 \nbbar c2 c4 \nbbar c(d) c \nbbar b2 b4 \nbbar bes!2 bes4 \nbbar a2. \bar "||"  }

tenor = \relative c { \clef bass a'2 bes4 \nbbar a(g) a \nbbar bes2 bes4 \nbbar c2 a4 \nbbar c2 c4 \nbbar c2 g4 \nbbar a2 f4 \nbbar e2. \bar "||" \break
c'2 c4 \nbbar c2 f,4 \nbbar a2 f4 \nbbar f2 e4 \nbbar f2 f4 \nbbar f2 f4 \nbbar g2 g4 \nbbar f2. \bar "||" \break
c'2 c4 \nbbar c2 f,4 \nbbar a2 f4 \nbbar f2 e4 \nbbar f2 f4 \nbbar f2 f4 \nbbar g2 g4 \nbbar f2. \bar "||"  }

bass = \relative c { \clef bass  f2 f4 \nbbar f2 f4 \nbbar c2 c4 \nbbar f2 f4 \nbbar f(g) a \nbbar g(f) e \nbbar d2 d4 \nbbar c2. \bar "||" \break
e4(f) g \nbbar a2 a,4 \nbbar d2 d4 \nbbar c2 c4 \nbbar f2 f4 \nbbar d2 d4 \nbbar c2 c4 \nbbar f,2. \bar "||" \break
e'4(f) g \nbbar a2 a,4 \nbbar d2 d4 \nbbar c2 c4 \nbbar f2 f4 \nbbar d2 d4 \nbbar c2 c4 \nbbar f,2. \bar "||" }

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
%%midi
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 126 4)}}%% midi score bracket

}%%score


\markup "                   "  %%% force blank space before start of lyrics

\markup "                   "

%%% Lyric titles and attributions

\markup { \hspace #18 \small {  \column { \line {\smallCaps  "Office Hymn."   " E." \hspace #34 \italic "Philippe de Grève, d. 1236." }   
	\line { \hspace #60 \italic "Tr. L. H." }				 
	\line { \hspace #22 "Collaudemus Magdalenae." }
                                        % \line { "                    "}
}}}


%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.6 \column { \lower #2.4 \fontsize #8 "S" }   %%Drop Cap goes here
				  \hspace #-1.0   %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ING we all the joys and sorrows"
			                                 "    Which in Mary's heart were found;" } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "To her fame our voices raising"
					   "    Let consenting praise abound:"
					   "So do birds of night and morning"
					   "    Make their mingled songs resound."
					   "                " %%% adds vertical spacing between verses
			}}
 			         } %%% finish verse 1

			
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

			\line { "2  " 
			   \column {	     
				   "Through the guest-throng at the banquet"
				   "    Undismayed she sought her Lord;"
				   "Cleansing tears and salving ointments"
				   "    Lowly on his feet she poured,—"
				   "Wiped them with her hair, obtaining"
				   "    By her love the great reward."
				   "                " %%% adds vertical spacing between verses
			}}
			\line { "3*" \hspace #-0.4
			\column {	     
				"Deigns the Cleanser to be cleansed;"
				"    Stoops the Source to find the flow;"
				"Drains the Flower in outpoured fragrance"
				"    Perfume which its heart let go:"
				"Heavens which have rained their bounty"
				"    Drink the dew from earth below!"
				"                " %%% adds vertical spacing between verses
			}}
			\line { "4  "
			\column {	     
				"There in box of alabaster,"
				"    Bearing nard of fragrance pure,"
				"She with gift of outpoured sweetness"
				"    Bids the mystic sign endure:"
				"Seeking from anointment healing,"
				"    Lo, the sick anoints the Cure!"
				"                " %%% adds vertical spacing between verses
			}}
			\line { "5  "
			\column {	     
				"Dearly then for that dear offering"
				"    Did our Lord in love repay:"
				"Since so perfect her devotion,"
				"    All her sins he put away:"
				"Made her be his own forerunner"
				"    On his Resurrection day."
				"                " %%% adds vertical spacing between verses
			}}
           		\line { "6. "
			   \column {	     
				   "Now be glory, laud, and honour"
				   "    Unto him the Paschal Host,"
				   "Who, in war with Death a Lion,"
				   "    As a Lamb gave up the ghost,"
				   "And the third day rose a Victor"
				   "    Crowned with spoils that Death had lost."
			}}
	  } %%% end supercolumn
} %%% end markup	  




%%Amen score block
\score {
\new ChoirStaff
	<<
	\context Staff = upper \with { fontsize = #-3 \override StaffSymbol #'staff-space = #(magstep -2) }
		<<
		\context Voice = "sopranos" { \relative c' {\clef treble \global \voiceOne f1 f \bar "||" }}
		\context Voice = "altos" { \relative c' {\clef treble \global \voiceTwo bes1 a \bar "||" }}
		>>
		\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	\context Staff = lower \with { fontsize = #-3 \override StaffSymbol #'staff-space = #(magstep -2) }
		<<
		\context Voice = "tenors" { \relative c {\clef bass \global \voiceOne d1 c \bar "||" }}
		\context Voice = "basses" { \relative c {\clef bass \global \voiceTwo bes1 f \bar "||" }}
		>>
>>

\header { breakbefore = ##f piece = " " opus = " " }
\layout {
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove "Time_signature_engraver" }
	}%%layout

%%Amen midi
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 126 4) }} %%Amen midi
}%%amen score

} %%% book bracket
