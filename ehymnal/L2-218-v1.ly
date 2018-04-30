%%% 344.png
%%% Hymn 218. Ye who own the faith of Jesus.
%%% Rev 1.

\version "2.10.23"

\header {
	dedication = \markup { \center-align { "SAINTS' DAYS: ST. MARY THE VIRGIN" \hspace #0.1 }}
	title = "218"

        meter = \markup { \small { \column { 
				\line { \sans "DEN DES VATERS SINN"} 
				\line { "    GEBOREN." \hspace #1 \roman "(8 7. 8 7. 8 7. 6.)" } 
				\line { { \italic "Moderately slow"  \general-align #Y #DOWN \note #"2" #0.5 "= 66." } } }} }
 
        arranger = \markup { \small { \center-align { 
		 		\line { \italic "Melody by" }
				\line { \smallCaps "J. A. Frrylinghausen," "1670-1739."} 
				\line { \italic "Harmony from ‘Zions Harfe’" "(1855)."}
				}}}  			
	tagline =""

}			
			
%%%%%%%%%%%%%%%%%%%%%%%%%%%%macros begin

%% Macro to push notes rightwards
push = { \once \override Dots #'transparent = ##t
	\once \override NoteColumn #'force-hshift = #-0.01 }

%%generates the breathmarks

breathmark = { 
	\override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup { \fontsize #4 "," }
	}
%%%%%%%%%%%%%%%%%%%%%%%%%%%macro end

global = {
\time 4/2
\key d \major
\set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  d2 e fis g \bar "|" a a fis d \bar "|" b' a g fis \bar "|" e2. e4 d1 \breathmark \bar "||" \break
  fis2 e4(d) e2 a \bar "|" b cis4(d) cis2 a \bar "|" d cis b a \bar "|" a2. gis4 a1^\fermata \bar "||" \break
  b2 a4(g) fis2 g \bar "|" a g4(fis) e2 e \bar "|" d e fis g \bar "|" \break
  a b a1 \breathmark \bar "||" g!2(a) fis g \bar "|" fis e d1 \bar "||" 
}
 
alto = \relative c' { 
  d2 cis d d \bar "|" e cis d d \bar "|" d d d4(e) d2 \bar "|" d cis \push d1 \bar "||" \break
  d2. d4 d2 cis \bar "|" fis e e e \bar "|" fis e d e \bar "|" fis e e1 \bar "||" \break
  g2 e d d \bar "|" d d d cis \bar "|" d cis d d \bar "|" \break
  e e cis1 \bar "||" \once \override NoteColumn #'force-hshift = #0.5 e1 d2 d \bar "|" d cis \push d1 \bar "||" 
}

tenor = \relative c { 
  \clef bass fis2 a a b \bar "|" a a a fis \bar "|" g a b a \bar "|" a a fis1 \bar "||" \break
  a2 gis a a \bar "|" a gis a a \bar "|" a a gis a \bar "|" d b cis1 \bar "||" \break
  d2 cis d b \bar "|" a b e, a \bar "|" fis a a b \bar "|" \break
  a gis a1 \bar "||" b2(a) a b \bar "|" a a fis1 \bar "||" 
}

bass = \relative c { 
  \clef bass d2 a d b \bar "|" cis a d d \bar "|" g fis b,4(cis) d2 \bar "|" a' a, d1 \bar "||" \break
  d2 b a fis' \bar "|" d e a, cis \bar "|" d a b cis \bar "|" d e a,1_\fermata \bar "||" \break
  g2 a b g \bar "|" fis g a a \bar "|" b a d b \bar "|" \break
  cis e a,1 \bar "||" e'2(cis) d g, \bar "|" a a d1 \bar "||" 
}

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##f
}

\book{

	
%%% Score block	

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

%%% Hymn Note

\markup { \hspace #54 \center-align {
	\line {  \smallCaps "Note" \hspace #-1.2 ".—" \hspace #-1 \italic "By omitting the refrain of each verse this hymn may be sung to"  } 
        \line {  \smallCaps "Tantum Ergo (" \hspace #-1 \italic "No." "63)."  }
	 \line {  "              "  }
	 \line {  "              "  }
	 \line {  "              "  }
	 \line {  "              "  } %%% stuff a few blank lines otherwise music systems will be too spread out
	
}}


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


%%lyric titles

\markup { "                       "}  %% blank line to increase separation from page top

\markup { \hspace #70 \small \italic "V. S. S. C."}  


%%% Lyrics

\markup { \hspace #28 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "Y" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "E who own the faith of Jesus"
			                              "    Sing the wonders that were done," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "When the love of God the Father"
					   "    O'er our sin the victory won,"
					   "When he made the Virgin Mary"
					   "    Mother of his only Son."
					   \italic "                    Hail Mary, full of grace."
					   "             " %%% add vertical spacing between verses
			  		}}
		      } %%% end verse 1		 
		       \line { "2  "
			   \column {	     
				   "Blessèd were the chosen people"
				   "    Out of whom the Lord did come,"
				   "Blessèd was the land of promise"
				   "    Fashioned for his earthly home;"
				   "But more blessèd far the Mother"
				   "    She who bare him in her womb."
				   "             " %%% add vertical spacing between verses
			}}
           		\line { "3  "
			   \column {	     
				   "Wherefore let all faithful people"
				   "    Tell the honour of her name,"
				   "Let the Church in her foreshadowed"
				   "    Part in her thanksgiving claim;"
				   "What Christ's Mother sang in gladness"
				   "    Let Christ's people sing the same."
				   "             " %%% add vertical spacing between verses
			}}  
			\line { "4  "
			   \column {	     
				   "Let us weave our supplications,"
				   "    She with us and we with her,"
				   "For the advancement of the faithful,"
				   "    For each faithful worshipper,"
				   "For the doubting, for the sinful,"
				   "    For each heedless wanderer."
				   "             " %%% add vertical spacing between verses
			}}
           		\line { "5* "
			   \column {	     
				   "May the Mother's intercessions"
				   "    On our homes a blessing win,"
				   "That the children all be prospered,"
				   "    Strong and fair and pure within,"
				   "Following our Lord's own footsteps,"
				   "    Firm in faith and free from sin."
				   "             " %%% add vertical spacing between verses
			}}  
			\line { "6* "
			   \column {	     
				   "For the sick and for the agèd,"
				   "    For our dear ones far away,"
				   "For the hearts that mourn in secret,"
				   "    All who need our prayers to-day,"
				   "For the faithful gone before us,"
				   "    May the holy Virgin pray."
				   "             " %%% add vertical spacing between verses
			}}
	  } %%% end supercolumn
} %%% end markup			
			
\markup { "                       "}  

\markup { "                       "}  %%% blank lines to pad the bottom otherwise lyric author will be too far from lyric text



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


%%%Page 3 continuation of lyrics

\markup { \hspace #26   %%add space as necc. to center the column  
		\column { 
			\hspace #1  % adds vertical spacing between verses  
			  \line { "7. "
			   \column {	     
				   "Praise, O Mary, praise the Father,"
				   "    Praise thy Saviour and thy Son,"
				   "Praise the everlasting Spirit,"
				   "    Who hath made thee ark and throne"
				   "O'er all creatures high exalted,"
				   "    Lowly praise the Three in One.     Amen."
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
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2) }} %%Amen midi 



}%%amen score

}%%book bracket
