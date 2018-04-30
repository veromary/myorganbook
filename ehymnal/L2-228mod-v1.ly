%%% 357.png
%%% Hymn 228. (Modern Tune) Oriel. Now in holy celebration.
%%% Rev 1.

\version "2.10.23"

\header {
	dedication = \markup { \center-align { "THE VISITATION" \hspace #0.1 }}
	title = \markup { "228" \large \smallCaps "(Modern Tune)" }
	poet = \markup { \small { \sans "ORIEL." \hspace #1 \roman  "(8 7. 8 7. 8 7.)" } }
	meter =  \markup { \small { \italic "Moderately slow." \general-align #Y #DOWN \note #"2" #0.5 = 66.} }
	arranger = \markup { \small \smallCaps "C. Ett," "‘" \hspace #-1 \italic "Cantica Sacra" \hspace #-1.2 ",’" \italic "1840." }
	tagline =""
			}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%macros begin
%%generates the breathmarks
breathmark = { 
	\override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup { \fontsize #4 "," }
	}

%% Macro to push notes rightwards
push = { \once \override Dots #'transparent = ##t
	\once \override NoteColumn #'force-hshift = #-0.07 }

%%%%%%%%%%%%%%%%%%%%%%%%%%%macros end

global = {
\time 4/2
\key a \major
\set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  a'2 a a a \bar "|" b cis d cis \bar "|" cis cis b a \bar "|" gis fis \push e1 \bar "||" \break
  a2 a a a \bar "|" b cis d cis \bar "|" cis cis b a \bar "|" gis fis \push e1 \breathmark \bar "||" \break
  gis2 gis cis gis \bar "|" gis a b a \bar "|" d d cis b \bar "|" a gis a1 \bar "||" }
 
alto = \relative c' { 
  cis2 fis e cis \bar "|" e e fis4(e) e2 \bar "|" e fis gis fis \bar "|" e dis e1 \bar "||" \break
  e2 fis e cis \bar "|" e e fis e \bar "|" e e4(fis) gis2 fis \bar "|" e dis e1 \bar "||" \break
  b2 bis cis dis \bar "|" e cis e4(d) cis2 \bar "|" fis fis e fis \bar "|" e e e1 \bar "||"  }

tenor = \relative c { \clef bass 
  a'2 a a a \bar "|" gis a a4(gis) a2 \bar "|" cis dis e cis \bar "|" \once \override NoteColumn #'force-hshift = #-0.5 b2. a4 gis1 \bar "||" \break
  a2 a a a \bar "|" gis a a a \bar "|" a4(b) cis(dis) e2 cis \bar "|" \once \override NoteColumn #'force-hshift = #-0.5 b2. a4 gis1 \bar "||" \break
  gis2 fis e gis \bar "|" cis a gis a \bar "|" fis4(gis) a(b) cis2 d \bar "|" cis b cis1 \bar "||" }

bass = \relative c { \clef bass 
  a2 d cis fis \bar "|" e cis b a \bar "|" a' a gis a \bar "|" b b, e1 \bar "||" \break
  cis2 d cis fis \bar "|" e a d, a \bar "|" a' a gis a \bar "|" b b, e1 \bar "||" \break
  e2 dis cis bis \bar "|" cis fis e fis \bar "|" d4(e) fis(gis) a2 d, \bar "|" e e a,1 \bar "||" }

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
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2)}}%% midi score bracket

}%%score

\markup "                   "  %%% force blank space before start of lyrics

\markup "                   "

%%% Lyric titles and attributions

\markup { \hspace #18 \small {  \column { \line {\smallCaps  "Office Hymn."   " E." \hspace #34 \italic "15th cent.   Tr. L. H." }   
					 \line { \hspace #24 "Festum Matris gloriosae." }
                                        % \line { "                    "}
}}}


%%% Lyrics

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.6 \column { \lower #2.4 \fontsize #8 "N" }   %%Drop Cap goes here
				  \hspace #-1.0   %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "OW in holy celebration"
			                                 "    Sing we of that Mother blest," } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "In whose flesh for men's salvation"
					   "    God incarnate deigned to rest,"
					   "When a kindred salutation"
					   "    Named in faith the mystic Guest."
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

\markup { \hspace #26 %%add space as necc. to center the column
          \column { %% super column of everything				 	 
		        \hspace #1  % adds vertical spacing between verses  

			\line { "2*" \hspace #-0.4
			   \column {	     
				   "Lo, the advent Word confessing,"
				   "    Spake for joy the voice yet dumb,"
				   "Through his mother's lips addressing"
				   "    Her, of motherhood the sum,—"
				   "Bower of beauty, blest and blessing,"
				   "    Crowned with fruit of Life to come."
				   "                " %%% adds vertical spacing between verses
			}}
			\line { "3  "
			\column {	     
				"‘Whence,’ she cried, at that fair meeting,"
				"    ‘Comes to me this great reward?"
				"For when first I heard the greeting"
				"    Of the Mother of my Lord,"
				"In my womb, the joy repeating,"
				"    Leapt my babe in sweet accord!’"
				   "                " %%% adds vertical spacing between verses
			}}
			\line { "4  "
			\column {	     
				"Lo, at that glad commendation"
				"    Joy found voice in Mary's breast"
				"While in holy exultation"
				"    She her Maker's power confest,"
				"At whose word each generation"
				"    Now henceforward names her blest."
				   "                " %%% adds vertical spacing between verses
			}}
           		\line { "5. "
			   \column {	     
				"Triune Godhead, health supplying,"
				"    Ruler of eternity,"
				"On the Fount of grace relying,"
				"    We uplift our hearts to thee,"
				"Praying that in realms undying"
			"    We at one with Life may be.      Amen."
			}}
	  } %%% end supercolumn
} %%% end markup	  


%%Amen score block
\score {
\new ChoirStaff
	<<
	\context Staff = upper \with { fontsize = #-3 \override StaffSymbol #'staff-space = #(magstep -2) }
		<<
		\context Voice = "sopranos" { \relative c' {\clef treble \global \voiceOne a'1 a \bar "||" }}
		\context Voice = "altos" { \relative c' {\clef treble \global \voiceTwo d1 cis \bar "||" }}
		>>
		\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	\context Staff = lower \with { fontsize = #-3 \override StaffSymbol #'staff-space = #(magstep -2) }
		<<
		\context Voice = "tenors" { \relative c {\clef bass \global \voiceOne fis1 e \bar "||" }}
		\context Voice = "basses" { \relative c {\clef bass \global \voiceTwo d1 a \bar "||" }}
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
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2) }} %%Amen midi
}%%amen score


} %%% book bracket
