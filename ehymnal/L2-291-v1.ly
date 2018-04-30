%%%% 440.png
%%%% Hymn 291. 67th PSALM O sing to the Lord, whose bountiful hand
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "SEASONS.—HARVEST"
	\hspace #0.1 }}	
	
	title = "291"   
  
  poet = \markup { \small {  \line { \sans { \smallCaps  "67th" "PSALM."} \hspace #1 \roman {"(10 10. 10 10.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time, with vigour} \general-align #Y #DOWN \note #"2" #0.5 = 88. }}
  
  arranger = \markup { \small { \italic "Scottish Psalter, 1615." }}
  
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% pushes notecolumn slightly to the right

push = \once \override NoteColumn #'force-hshift = #0.4

%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-0.8
              \once \override Stem #'X-offset = #-0.8 }

%% Used to pull an upstem note left. Used when a slurred note pair straddles a longer note below and when notecolumn force-hshift does not work 
topstraddle = { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.5 
              \once \override Stem #'X-offset = #-0.2 }

%%% generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01		      


%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 1 d1 | \push g1 a2 a2 | b1 a1 | b1 c2 c2 | d1 \breathmark \bar "||" \push c1 | \push b1 a2 g2 | \break
  fis1 g1 | c2 c2 a1 | g1 \breathmark \bar "||" d1 | g2 g2 \push fis1 |  e1 d1 | \break
  g1 a2 a2 | b1 \breathmark \bar "||" g1 | d'2 c2 \push b1 | a1 g1 | c2 c2 a1 | g1 ^\fermata \bar "||" 
}
   
alto = \relative c' {  
  \merge d1 | d2 ( e2 ) fis2 fis2 | g1 fis1 | g1 g2 g2 | fis1 \bar "||" e2 ( d2 ) | d2 ( e2 ) fis2 cis2 | 
  d1 \merge g1 | e2 e2 \straddle d2 ( c2 ) b1 \bar "||" \merge d1 | d2 b2 c2 ( d2 ) | \straddle c2 ( b2 ) a1 | 
  d1 e2 fis2 | d1 \bar "||" e1 | g2 fis4 ( e4 ) d2 ( e2 ) | fis1 \merge g1 | a2 g2 fis1 | \merge g1 \bar "||"
}

tenor = \relative c {\clef bass 
  \push d'1 | \push d1 c2 c2 | d1 d1 | d1 g,2 g2 | a1 \bar "||" g2 ( a2 ) | b2 ( cis2 ) d2 g,2 | 
  a1 g1 | a2 a2 fis1 | g1 \bar "||" fis1 | g2 b2 \push a1 | g1 fis1 | 
  g2 ( d'2 ) c2 c2 | b1 \bar "||" b1 | b2 c2 d2 ( g,2 ) | \topstraddle d'2 ( c2 ) b1 | e2 e2 \topstraddle d2 ( c2 ) | b1 \bar "||"
}

bass = \relative c {\clef bass 
  d2 ( c2 ) | b2 ( c2 ) b2 a2 | \straddle g2 ( b2 ) d1 | \straddle g2 ( fis2 ) e2 e2 | d1 \bar "||" e2 ( fis2 ) | \push g1 fis2 e2 | 
  \straddle d2 ( c!2 ) b1 | a2 a2 d1 | g,1 \bar "||" \straddle d'2 ( c2 ) | b2 g2 a2 ( b2 ) | c1 c1 | 
  b1 a2 a2 | g1 \bar "||" e'1 | b2 a2 b2 ( c2 ) | d1 e1 | a,2 a2 d1 | g1 _\fermata \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 88 2) }}      
  	
	
} %%% Score bracket

%%% Lyric titles and attributions

\markup { "                " }

\markup {  \small {  \hspace #74 \italic "R. F. Littledale, 1833-90." }} 

%%% Lyrics

\markup { \hspace #26 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 " SING to the Lord, whose bountiful hand"
			                                 "    Again doth accord his gifts to the land." } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "His clouds have shed down their plenteousness here,"
					   "His goodness shall crown the hopes of the year."
					   "      " %%% adds vertical spacing between verses
			  		}}
		      }  
			\line {"2  "
				\column {
					"In clefts of the hills the founts he hath burst."
					"And poureth their rills through valleys athirst."
					"The river of God the pastures hath blest,"
					"The dry, withered sod in greenness is drest."
					 "      " %%% adds vertical spacing between verses
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
			\hspace #1 % adds vertical spacing between verses
			\line {"3  "
				\column {
					"And every fold shall teem with its sheep,"
					"With harvests of gold the fields shall be deep;"
					"The vales shall rejoice with laughter and song,"
					"And man's grateful voice the music prolong."
					 "      " %%% adds vertical spacing between verses
			}}
			\line {"4. "
				\column {
					"So too may he pour, the Last and the First."
					"His graces in store on spirits athirst,"
					"Till, when the great day of harvest hath come,"
					"He takes us away to garner at home."
					 "      " %%% adds vertical spacing between verses
     			}}
	  }

} %%% lyric markup bracket


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne  \cadenzaOn g'1 g1   \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo e1 d1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree c'1 b1   \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  c1 g1  \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 88 2) }}  %%Amen midi       
       
}  


} %%% book bracket

