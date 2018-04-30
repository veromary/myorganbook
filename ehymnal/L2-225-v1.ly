%%% 352.png
%%% Hymn 225. Hail harbinger of morn
%%% Rev 1.

\version "2.10.23"

\header {
	dedication = \markup { \center-align { "SAINTS' DAYS: ST. JOHN BAPTIST" \hspace #0.1 }}
	title = "225"
	poet = \markup { \small { \sans "HAIL HARBINGER OF MORN." \hspace #1 \roman  "(6 6. 10. D.)" } }
	meter =  \markup { \small { \italic "In Moderate time." \general-align #Y #DOWN \note #"2" #0.5 = 80.} }
	arranger = \markup { \small \smallCaps "W. H. Bell." }
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

%%creates optional organ notes
ogan = { \voiceFour \stemDown \override NoteColumn #'force-hshift = #0.5
\set fontSize = #-4
\override Stem #' length =#4 }

%%creates special organ notes column tweak
ogantw = { \once \override NoteColumn #'force-hshift = #1.5 }



%%%%%%%%%%%%%%%%%%%%%%%%%%%macro end

global = {
\time 4/2
\key bes \major
\set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {  
  \override TextScript #'padding = #1
  \partial 1 \push  f1^\markup {\italic Unison.}  \bar "|" bes,2 d f2. f4 \bar "|" \push g1 \bar "||" \push f1^\markup {\italic Harmony.} \bar "|" bes2 g d2. ees4 \bar "|" f2 \breathmark \bar "||" \break
  f2 g a \bar "|" bes g c f, \bar "|" a1 g \bar "|" \push f1. \bar "||" \break
  a2 \bar "|" bes c d2. bes4 \bar "|" c1 \bar "||" \push f,1 \bar "|" d'2 c  \dotsDown  bes2. a4 \bar "|" \break
  g2 \breathmark \bar "||" a2 bes g \bar "|" c ees d bes \bar "|" d1 c \bar "|" bes1 \bar "||" }
 
alto = \relative c' {  
  \partial 1 << { f1 \bar "|" bes,2 d f2. f4 \bar "|"  g1 } \new Voice = "organRH" { \ogan { <<c,1 a>> \bar "|" s2 \ogantw <<bes2 d>>  c2. c4 \bar "|" bes1 } } >> \bar "||" f'1 \bar "|" f2 ees d2. bes4 \bar "|" c2 \bar "||" \break
  c2 d f \bar "|" f d f d \bar "|" f1 e \bar "|"  f1. \bar "||" \break
  f2 \bar "|" f g f2. f4 \bar "|" f1 \bar "||"  f1 \bar "|" bes2 a g fis \bar "|" \break
  g2 \bar "||" f f ees \bar "|" g f f d \bar "|" f1 ees \bar "|" d1 \bar "||" }

tenor = \relative c { 
  \clef bass \partial 1 \push f1 \bar "|" bes,2 d f2. f4 \bar "|" \push g1 \bar "||" ees'1 \bar "|" d2 bes bes2. bes4 \bar "|" a2 \bar "||" \break
  a2 bes c \bar "|" bes bes c a \bar "|" c1 bes \bar "|" a1. \bar "||" \break
  c2 \bar "|" d ees bes2. g4 \bar "|" a1 \bar "||" c1 \bar "|" d2 ees d c \bar "|" \break
  bes2 \bar "||" c2 bes bes \bar "|" ees2 c bes bes \bar "|" bes1 a \bar "|" bes1 \bar "||" }

bass = \relative c { 
  \clef bass \partial 1 << { f1 \bar "|" bes,2 d f2. f4 \bar "|" g1 } \new Voice = "organLH" { \ogan { <<c,1 f,>> \bar "|" \ogantw <<bes2 d f>> \ogantw <<f2 bes,>> <<c2. a>> <<c4 a>> \bar "|" <<g1 d'>> } } >> \bar "||" a'1 \bar "|" bes2 ees, g2. g4 \bar "|" f2 \bar "||" \break
  f2 f ees \bar "|" d2 bes a d \bar "|" c1 c \bar "|" f1. \bar "||" \break
  f2 \bar "|" f2 f f2. f4 \bar "|" f1 \bar "||" a1 \bar "|" bes2 c d d, \bar "|" \break
  ees2 \bar "||" ees2 d ees \bar "|" c2 a bes g' \bar "|" f1 f \bar "|" bes,1 \bar "||" }

#(ly:set-option 'point-and-click #f)

\book {

\paper {
 #(set-paper-size "a4")
%% annotate-spacing = ##t
 print-page-number = ##f
 ragged-last-bottom = ##t
 ragged-bottom = ##t
}

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
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 2)}}%% midi score bracket

}%%score


%%% Lyric titles and attributions

\markup {  \small {  \column {       \line { \hspace #62 \italic "The Venerable Bede, 673-725." }  
	                             \line { \hspace #66 \italic "Tr. C. S. Culverley" "†."} 
			        \line { \hspace #42 "Praecursor altus luminis." }
                                \line { "                    "}
}}}

%%% Lyrics

\markup { \hspace #28 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "H" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "AIL, harbinger of morn:"
			                                 "    Thou that art this day born," } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "And heraldest the Word with clarion voice!"
					   "    Ye faithful ones, in him"
					   "    Behold the dawning dim"
					   "Of the bright day, and let your hearts rejoice."
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

\markup { \hspace #28 %%add space as necc. to center the column
          \column { %% super column of everything				 	 
		        \hspace #1  % adds vertical spacing between verses  
			   \line { "2  "
			   \column {	     
				   "    John;—by that chosen name"
				   "    To call him, Gabriel came"
				   "By God's appointment from his home on high:"
				   "    What deeds that babe should do"
				   "    To manhood when he grew,"
				   "God sent his Angel forth to testify."
				   "                " %%% adds vertical spacing between verses
				   "                " %%% adds vertical spacing between verses
				   "                " %%% adds vertical spacing between verses
			}}
			 \line { \hspace #-10.2  \italic "Unison."  "  3  "
			\column {	 
				"    There is none greater, none,"
				"    Than Zachariah's son;"
				"Than this no mightier prophet hath been born:"
				"    Of prophets he may claim"
				"    More than a prophet's fame;"
				"Sublimer deeds than theirs his brow adorn."
				 "                " %%% adds vertical spacing between verses
				 "                " %%% adds vertical spacing between verses
				 "                " %%% adds vertical spacing between verses
			 }}	   
			\line { "4  "
			\column {	     
				"    ‘Lo, to prepare thy way,’"
				"    Did God the Father say,"
				"‘Before thy face thy messenger I send,"
				"    Thy coming to forerun;"
				"    As on the orient sun"
				"Doth the bright daystar morn by morn attend.’"
				   "                " %%% adds vertical spacing between verses
				   "                " %%% adds vertical spacing between verses
				   "                " %%% adds vertical spacing between verses
			}}
           		\line { \hspace #-10.2  \italic "Unison."  "  5. "
			   \column {	     
				   "    Praise therefore God most high;"
				   "    Praise him who came to die"
				   "For us, his Son that liveth evermore;"
				   "    And to the Spirit raise,"
				   "    The Comforter, like praise,"
				   "While time endureth, and when time is o'er.        Amen."
			}}
	  } %%% end supercolumn
} %%% end markup	  



%%Amen score block
\score {
\new ChoirStaff
	<<
	\context Staff = upper \with { fontsize = #-3 \override StaffSymbol #'staff-space = #(magstep -2) }
		<<
		\context Voice = "sopranos" { \relative c' {\clef treble \global \voiceOne bes'1 bes \bar "||" }}
		\context Voice = "altos" { \relative c' {\clef treble \global \voiceTwo ees1 d \bar "||" }}
		>>
		\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	\context Staff = lower \with { fontsize = #-3 \override StaffSymbol #'staff-space = #(magstep -2) }
		<<
		\context Voice = "tenors" { \relative c {\clef bass \global \voiceOne g'1 f \bar "||" }}
		\context Voice = "basses" { \relative c {\clef bass \global \voiceTwo ees1 bes \bar "||" }}
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
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 2) }} %%Amen midi
}%%amen score

} %%%book bracket 

