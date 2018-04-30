%%% 343.png
%%% Hymn 217. Her Virgin eyes saw God incarnate born.
%%% Rev 1.

\version "2.10.23"

\header {
	dedication = \markup { \center-align { "SAINTS' DAYS: ST. MARY THE VIRGIN" \hspace #0.1 }}
	title = "217"
	poet = \markup { \small { \sans "FARLEY CASTLE" \hspace #1 \roman  "(10 10. 10 10.)" } }
	meter =  \markup { \small { \italic "In moderate time"  \general-align #Y #DOWN \note #"2" #0.5 = 72.} }
	arranger = \markup { \smallCaps "H. Lawes, 1596 - 1662."}
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%macro end

global = {
\time 8/4
\key d \major
\set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { d1 fis2 g \bar "|" a fis g a \bar "|" b cis d1 \breathmark \bar "||" d1 cis2 b \bar "|" \break
d a b fis \bar "|" a gis a1 \breathmark \bar "||" a1 fis2 b \bar "|" a g fis g \bar "|" \break
 a d, e1 \breathmark \bar "||" e1 a2 fis \bar "|" g b a d \bar "|" d cis d1 \bar "||" }
 
alto = \relative c' { a1 d2 d \bar "|" e d d d \bar "|" g g fis1 \bar "||" fis1 fis2 d \bar "|" \break 
fis d d d \bar "|" e e4(d) cis1 \bar "||" e1 d2 d \bar "|" d e a, d \bar "|" \break
d d cis1 \bar "||" cis1 e2 d \bar "|" d cis d fis \bar "|" a a fis1 \bar "||" }

tenor = \relative c { \clef bass fis1 a2 b \bar "|" cis a b a \bar "|" g g a1 \bar "||" d1 a2 b \bar "|" \break 
a d g, a \bar "|" cis b a1 \bar "||" a1 a2 g \bar "|" a b4(cis) d2 d \bar "|" \break
a gis a1 \bar "||" a1 a2 a \bar "|" b g a b \bar "|" e e d1 \bar "||" }

bass = \relative c { \clef bass d1 d2 b \bar "|" a d g fis \bar "|" e e d1 \bar "||" b'1 fis2 g \bar "|" \break 
d fis g d \bar "|" cis e a,1 \bar "||" cis1 d2 g \bar "|" fis e d b \bar "|" \break
fis b a1 \bar "||" a1 cis2 d \bar "|" g e fis b \bar "|" a a d,1 \bar "||" }

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
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 72 2)}}%% midi score bracket

}%%score


%%lyric titles

\markup { \hspace #70 \small \italic "Bishop T. Ken, 1637-1711."}  


%%% Lyrics

\markup { \hspace #26 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "H" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ER Virgin eyes saw God incarnate born,"
			                               "    When she to Bethl'em came that happy morn;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "How high her raptures then began to swell,"
					   "None but her own omniscient Son can tell."
					   "             " %%% add vertical spacing between verses
			  		}}
		      } %%% end verse 1	
           		\line { "2  "
			   \column {	     
				   "As Eve when she her fontal sin reviewed."
				   "Wept for herself and all she should include,"
				   "Blest Mary with man's Saviour in embrace"
				   "Joyed for herself and for all human race."
				   "             " %%% add vertical spacing between verses
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

\markup { \hspace #26   %%add space as necc. to center the column  
		\column { 
			\hspace #1  % adds vertical spacing between verses  
			
			\line { "3  "
			   \column {	     
				   "All Saints are by her Son's dear influence blest,"
				   "She kept the very Fountain at her breast;"
				   "The Son adored and nursed by the sweet Maid"
				   "A thousandfold of love for love repaid."
				   "             " %%% add vertical spacing between verses
			}}
           		\line { "4. "
			   \column {	     
				   "Heaven with transcendent joys her entrance graced."
				   "Next to his throne her Son his Mother placed;"
				   "And here below, now she's of heaven possest,"
				   "All generations are to call her blest."
				   "             " %%% add vertical spacing between verses
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
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 72 2) }} %%Amen midi 



}%%amen score

}%%book bracket 
