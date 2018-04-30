%%% 348.png
%%% Hymn 221. The winter's sleep was long and deep
%%% Rev 1.

\version "2.10.23"

\header {
	dedication = \markup { \center-align { "SAINTS' DAYS: ST. PHILIP AND ST. JAMES" \hspace #0.1 }}
	title = "221"
	poet = \markup { \small { \sans "KING'S LANGLEY." \hspace #1 \roman  "(C. M., Irreg.)" } }
	meter =  \markup { \small { \italic "In Moderate time." \general-align #Y #DOWN \note #"4" #0.5 = 92.} }
	arranger = \markup { \small \italic "English Traditional May-Day Carol." }
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

%%generates no beam macro
nb = \noBeam

%%%%%%%%%%%%%%%%%%%%%%%%%%%macro end

global = {
\time 4/4
\key d \major
\set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 4 fis8 g \bar "|" a4 a fis fis \bar "|" g g8 fis e4 \bar "||" e \bar "|" fis4 fis8(g\nb) a ~ a\nb d4 \bar "|" a2. \breathmark \bar "||" \break
  b8 b\nb \bar "|" a4 g fis e8 e\nb \bar "|" d4 d d'^\fermata \bar "||" d8 ~ d\nb \bar "|" a4 a8(g\nb) fis ~ fis\nb e4 \bar "|" d2. \bar "||" }
 
alto = \relative c' { 
  \partial 4 d4 \bar "|" d d d d \bar "|" e d cis \bar "||" cis \bar "|" d d8(cis\nb) d ~ d\nb d4 \bar "|" d(cis d) \bar "||" \break
  d8 d\nb \bar "|" e4 d8 e fis4 cis8 cis\nb \bar "|" d4 d d \bar "||" g8 ~ g\nb \bar "|" a4 d,8 ~ d\nb d ~ d\nb cis4 \bar "|" d2. \bar "||" }

tenor = \relative c { 
  \clef bass \partial 4 a'4 \bar "|" a a a a \bar "|" a a a \bar "||" a \bar "|" a a8 ~ a\nb a ~ a\nb b4 \bar "|" a(g fis) \bar "||" \break
  fis8 fis\nb \bar "|" a4 a a g8 g\nb \bar "|" a4 g8 a b4 \bar "||" b8 ~ b\nb \bar "|" d4 b8 ~ b\nb a ~ a\nb g4 \bar "|" fis2. \bar "||" }

bass = \relative c { 
  \clef bass \partial 4 d8 e \bar "|" fis4 fis d d \bar "|" cis d a \bar "||" a' d, d8(e\nb) fis ~ fis\nb g4 \bar "|" fis(e d) \bar "||" \break
  b8 b\nb \bar "|" cis4 b8 cis d4 e8 e\nb \bar "|" fis4 e8 fis g4_\fermata \bar "||" e8 ~ e\nb \bar "|" fis4 g8 ~ g\nb a ~ a\nb a,4 \bar "|" d2. \bar "||" }

#(ly:set-option 'point-and-click #f)


\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##f
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
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 92 4)}}%% midi score bracket

}%%score


%%% Lyric attributions and titles

\markup { \small { \hspace #10 "(" \hspace #-1 \italic "O. H.," "123," \italic "Pt." "2; 124," \italic "Pt." "2.)"  \hspace #48 \italic "P. D." }}


%%% Lyrics

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HE winter's sleep was long and deep,"
			                                 "    But earth is awakened and gay;" } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "For the life ne'er dies that from God doth rise,"
					   "    And the green comes after the grey."
					   "         " %%% adds vertical spacing between verses
			  		}} 
			         } %%% finish verse 1 
           		\line { "2  "
			   \column {	     
				   "So God doth bring the world to spring;"
				   "    And on this holy day"
				   "Doth the Church proclaim her Apostles' fame,"
				   "    To welcome the first of May."
				   "         " %%% adds vertical spacing between verses
			}} 
           		\line { "3  "
			   \column {	     
				   "Two Saints of God went by the road"
				   "    That leadeth on to light;"
				   "And they gave up all at their Master's call,"
				   "    To work in their Master's sight."
				   "         " %%% adds vertical spacing between verses
			}}  
			\line {"4  "
			   \column {	     
				   "Would Philip's mind the Father find?"
				   "    Lo, he hath found the Way;"
				   "For to know the Son is to know the One"
				   "    Whom the earth and the heavens obey."
				    "         " %%% adds vertical spacing between verses
			}}
	  } %%% end supercolumn
} %%% end markup	  
       
       
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
%%% continuation of  lyrics

\markup { \hspace #32   %%add space as necc. to center the column  
		\column { 
			\hspace #1 % adds vertical spacing between verses  
			\line {"5  "
			    \column {	     
				    "And, James, 'twas thine by grace divine"
				    "    To preach the Christian life,"
				    "Where our faith is shown by our works alone,"
				    "    And love overcometh strife."
				    "         " %%% adds vertical spacing between verses
			}}
			\line { "6. "
			     \column {	     
				     "Lord, grant that we may brethren be—"
				     "    As Christians live in deed;"
				     "For it is but so we can learn to know"
				     "    The truth that to thee doth lead."
				     "         " %%% adds vertical spacing between verses
			}}	     
	  }
} %%% lyric markup bracket


%%Amen score block
\score {
\new ChoirStaff
	<<
	\context Staff = upper \with { fontsize = #-3 \override StaffSymbol #'staff-space = #(magstep -2) }
		<<
		\context Voice = "sopranos" { \relative c' {\clef treble \global \voiceOne d1 d \bar "||" }}
		\context Voice = "altos" { \relative c' {\clef treble \global \voiceTwo b1 a \bar "||" }}
		>>
		\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	\context Staff = lower \with { fontsize = #-3 \override StaffSymbol #'staff-space = #(magstep -2) }
		<<
		\context Voice = "tenors" { \relative c {\clef bass \global \voiceOne g'1 fis \bar "||" }}
		\context Voice = "basses" { \relative c {\clef bass \global \voiceTwo g1 d' \bar "||" }}
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
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 92 4) }} %%Amen midi
}%%amen score


}%%book bracket
