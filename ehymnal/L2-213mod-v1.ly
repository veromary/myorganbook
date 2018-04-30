%%% 339.png
%%% Hymn 213. (Modern Tune) Hail, O Star that pointest.
%%% Rev 1.

\version "2.10.23"

\header {
	dedication = \markup { \center-align { "THE ANNUNCIATION" \hspace #0.1 }}
	title = \markup { "213" \large \smallCaps "(Modern Tune)" }
	poet = \markup { \small { \sans "AVE MARIS STELLA." \hspace #1 \roman  "(6 6. 6 6.)" } }
	meter =  \markup { \small { \italic "Slow" \general-align #Y #DOWN \note #"2" #0.5 = 58.} }
	arranger = \markup { \small \italic "18th Century Melody."}
	tagline =""
			}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%macros begin

%%% Macro to push notes rightwards
push = { \once \override Dots #'transparent = ##t
	\once \override NoteColumn #'force-hshift = #-0.07 }

%%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.2
              \once \override Stem #'X-offset = #-1.2 }

%%% Used to pull an upstem note left. Used when a slurred note pair straddles a longer note below and when notecolumn force-hshift does not work 
topstraddle = { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.5 
              \once \override Stem #'X-offset = #-0.2 }	
%%%%%%%%%%%%%%%%%%%%%%%%%%%macro end


global = {
  \time 8/4
  \key e \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { e2 e fis gis \bar "|" \once \override NoteColumn #' force-hshift = #1.3 fis1 e \bar "||" gis2 fis gis4(a) b2 \bar "|" cis1 b \bar "||" \break
b2 b cis b \bar "|" a1 gis \bar "||" fis2 gis a gis \bar "|"  \once \override NoteColumn #' force-hshift = #1.3 fis1 e \bar "||" }
 
alto = \relative c' { b2 cis dis e \bar "|" e(dis) \once \override NoteColumn #'force-hshift = #-0.01 e1 \bar "||" e2 fis e dis \bar "|" \straddle fis2.(e4) dis1 \bar "||" \break
e2 e e4(fis) gis2 \bar "|" \straddle cis,2(dis) e1 \bar "||" e2 e dis e \bar "|"  e2(dis2) \once \override NoteColumn #'force-hshift = #-0.01 e1 \bar "||" }

tenor = \relative c { \clef bass gis'2 gis b b \bar "|" cis(b4 a) gis1 \bar "||" b2 b b b \bar "|" \topstraddle b(ais) b1 \bar "||" \break
gis2 gis a gis \bar "|" a1 cis \bar "||" cis2 b a b \bar "|" cis(b4 a) gis1 \bar "||" }

bass = \relative c { \clef bass e2 cis b e \bar "|" a,(b) e1 \bar "||" e2 dis e4(fis) gis2 \bar "|" fis1 b, \bar "||" \break
e2 d cis4(dis) e2 \bar "|" fis1 cis \bar "||" a'2 gis fis e \bar "|" a,(b) e1 \bar "||" }

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
	
%%% Hymn Midi

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 58 2)}}%% midi score bracket

} %%% Score bracket


%%% Hymn note markup

\markup { \hspace #54 \center-align {
	\line {  \smallCaps "Note" \hspace #-1.2 ".—" \hspace #-1 \italic "This hymn may also be sung to" \smallCaps " St. Martin (" \hspace #-1 \italic "No." "416)" \italic "which was"  } 
        \line {  \italic "originally composed for it."  }
	\line {"                "}  %%% force blank space before start of lyrics if needed
	\line {"                "}  %%% and more blank space if needed
	\line {"                "}  %%% and more blank space if needed.
}}

%%% Lyric Titles

%%% Lyric titles and attributions

\markup { \hspace #8 \small {  \column { \line {\smallCaps  "Office Hymn." " E." \italic " Conception, Annunciation," \hspace #30 \italic "c. 9th cent.  Tr. A. R." } 
          	                         \line { \hspace #6 \italic "Nativity, B.V.M." }    
					 \line { \hspace #36 "Ave, maria Stella." }
}}}



%%% Lyrics

\markup { \hspace #34 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "H" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "AIL, O Star that pointest"
			                                 "    Towards the port of heaven," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Thou to whom as maiden"
					   "    God for Son was given."
					   "           " %%% adds vertical spacing between verses
			  		}}
		      } %%end verse 1
		           \line { "2  "
			   \column {	     
				  "When the salutation"
				  "    Gabriel had spoken,"
				  "Peace was shed upon us,"
				  "    Eva's bonds were broken."
				  "           " %%% adds vertical spacing between verses
			}}
			   \line { "3  "
			   \column {	     
				  "Bound by Satan's fetters,"
				  "    Health and vision needing,"
				  "God will aid and light us"
				  "    At thy gentle pleading."
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

\markup { \hspace #34 %%add space as necc. to center the column
          \column { %% super column of everything
		  	\hspace #1  % adds vertical spacing between verses  
			   \line { "4  "
			   \column {	     
				  "Jesu's tender Mother,"
				  "    Make thy supplication"
				  "Unto him who chose thee"
				  "    At his Incarnation;"
				  "           " %%% adds vertical spacing between verses
			}} 
			
			\line { "5  "
			   \column {	     
				  "That, O matchless Maiden,"
				  "    Passing meek and lowly,"
				  "Thy dear Son may make us"
				  "    Blameless, chaste and holy."
				  "           " %%% adds vertical spacing between verses
			}} 
			
			\line { "6  "
			   \column {	     
				  "So, as now we journey,"
				  "    Aid our weak endeavour,"
				  "Till we gaze on Jesus,"
				  "    And rejoice for ever."
				  "           " %%% adds vertical spacing between verses
			}} 
			
			\line { "7. "
			  \column {	     
				"Father, Son and Spirit,"
				"    Three in One confessing,"
				"Give we equal glory,"	
				"    Equal praise and blessing.     Amen."
     			}}

	  }
} %%% lyric markup bracket


%%Amen score block
\score {
\new ChoirStaff
	<<
	\context Staff = upper \with { fontsize = #-3 \override StaffSymbol #'staff-space = #(magstep -2) }
		<<
		\context Voice = "sopranos" { \relative c' {\clef treble \global \voiceOne e1 e \bar "||" }}
		\context Voice = "altos" { \relative c' {\clef treble \global \voiceTwo cis1 b \bar "||" }}
		>>
		
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontsize = #-3 \override StaffSymbol #'staff-space = #(magstep -2) }
		<<
		\context Voice = "tenors" { \relative c {\clef bass \global \voiceOne a'1 gis \bar "||" }}
		\context Voice = "basses" { \relative c {\clef bass \global \voiceTwo a1 e' \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 58 2) }} %%Amen midi 


}%%amen score block

} %%% book bracket
