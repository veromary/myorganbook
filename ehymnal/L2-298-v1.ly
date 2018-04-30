%%%% 448.png
%%%% Hymn 298. LONDON (OR ADDISON'S) The spacious firmament on high
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—GENERAL"
	\hspace #0.1 }}	
	
	title = "298"   
  
  poet = \markup { \small {  \line { \sans { \smallCaps "NEW 113th."} \hspace #1 \roman {"(8 8. 8 8. 8 8.)"}} }}
  
  meter = \markup { \small { \italic {Moderately slow} \general-align #Y #DOWN \note #"2" #0.5 = 88.} }
  
  arranger = \markup { \small { \smallCaps "W. Hayes," "1706-1777." }}
  
  tagline = ""
}


%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01		      



%% nobreak bar - prevents linebreaking at this point

nbb = { \bar "|" \noBreak }

%% Used to pull an upstem note left. Used when a slurred note pair straddles a longer note below and when notecolumn force-hshift does not work 
topstraddle = { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.0 
              \once \override Stem #'X-offset = #0.3 }

	      %%% Push notecolumn a little to the right

push = { \once \override NoteColumn #'force-hshift = #0.8 }
    
	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 3/2
  \key a \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 2 a'2 \nbb \topstraddle gis2. ( fis4 ) e2 \nbb a2 ( b2 ) cis2 \nbb \topstraddle cis2 ( b2 ) a2 \nbb \topstraddle a2 ( gis2 ) \breathmark \bar "||" \noBreak  
          gis2 \nbb a2 ( b2 ) cis2 \nbb \topstraddle b4. ( cis8 d2 ) cis2 \nbb b2 ( a2 ) gis2 \nbb a1 \breathmark \bar "||" \break
  cis2 \nbb b1 cis2 \nbb a1 gis2 \nbb a2 ( gis2 ) fis2 \nbb cis'1 \bar "||" \noBreak 
          gis2 \nbb  a1 a2 \nbb a1 a4. ( b8 ) \nbb cis2 ( b2 ) a2 \nbb gis1 \breathmark \bar "||" \break
  gis2 \nbb \topstraddle gis2 ( a2 ) b2 \nbb e,1 fis2 \nbb \topstraddle g2 ( fis2 ) e2 \nbb fis1 \bar "||" \noBreak 
          b2 \nbb  gis1 a2 \nbb fis2 ( d'2 ) cis2 \nbb b2 ( a2 ) gis2 \nbb a1 \bar "||"
}
   
alto = \relative c' {  
  cis2 | d1 b2 | e2 ( gis2 ) a2 | fis1 fis2 | e1 \bar "||" e2 | e2 ( d2 ) cis2 | e1 e2 | d2 ( cis2 ) b2 | cis1 \bar "||" 
  e2 | e1 cis2 | cis1 eis2 | fis2 ( cis2 ) fis2 | eis1 \bar "||" eis2 | fis1 fis2 e1 fis4. ( gis8 ) | a2 ( e2. ) dis4 | e1 \bar "||" 
  e2 | e1 e2 | \merge e1 d2 | d1 cis2 | d1 \bar "||" fis2 | e1 e2 fis2 ( gis2 ) a2 | fis2 ( e2 ) e2 | e1 \bar "||"
}

tenor = \relative c {\clef bass 
  e2 | e1 gis2 | a2 ( d2 ) e2 | d1 d2 | b1 \bar "||" b2 | a2 ( gis2 ) a2 | b1 a2 | fis1 b2 | a1 \bar "||" 
  a2 | b1 gis2 | fis1 cis'2 | \push cis1 cis4 ( b4 ) | gis1 \bar "||" cis2 | cis1 d2 | a1 d2 | \push e1 a,2 | b1 \bar "||"
  b2 | b1 gis2 | a1 d2 | b1 cis2 | a1 \bar "||" b2 | b1 e2 | \push d1 e2 | d2 ( cis2 ) b2 | cis1 \bar "||"
}

bass = \relative c {\clef bass 
  a2 | b1 d2 | cis2 ( b2 ) a2 | d1 b2 | e1 \bar "||" d2 | cis2 ( b2 ) a2 | gis1 a2 | d1 e2 | a,1 \bar "||" 
  a'2 | gis1 eis2 | \merge fis1 cis2 | fis2 ( e!2 ) d2 | cis1 \bar "||" cis2 | fis1 d2 | cis1 b2 | a4 ( a'4 gis2 ) fis2 | e1 \bar "||" 
  e2 | e1 d2 | cis1 d2 | e1 a,2 | d1 \bar "||" d2 | d1 cis2 | cis2 ( b2 ) a2 | d2 ( e2 ) e2 | a,1 \bar "||"
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

%% Lyric titles and attributions

\markup { "                " }

\markup {  \small {  \hspace #64 \italic "Thomas Moore, 1779-1852." }} 

%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.4 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HOU art, O God, the life and light"
			                                 "    Of all this wondrous world we see;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Its glow by day, its smile by night,"
					   "    Are but reflections caught from thee:"
					   "Where'er we turn, thy glories shine,"
					   "And all things fair and bright are thine."
					   "      " %%% adds vertical spacing between verses
			  		}}
		      }  

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
			\hspace #1 % adds vertical spacing between verses
			\line {"2  "
				\column {
					"When day with farewell beam delays"
					"    Among the opening clouds of even,"
					"And we can almost think we gaze"
					"    Through golden vistas into heaven,—"
					"Those hues that make the sun's decline"
					"So soft, so radiant, Lord, are thine."
					 "      " %%% adds vertical spacing between verses
			}}
			\line {"3  "
				\column {
					"When night with wings of starry gloom"
					"    O'ershadows all the earth and skies,"
					"Like some dark beauteous bird whose plume"
					"    Is sparkling with unnumbered eyes,—"
					"That sacred gloom, those fires divine,"
					"So grand, so countless, Lord, are thine."
					 "      " %%% adds vertical spacing between verses
			}}
			\line {"4. "
				\column {
					"When youthful spring around us breathes,"
					"    Thy Spirit warms her fragrant sigh,"
					"And every flower the summer wreathes"
					"    Is born beneath that kindling eye,—"
					"Where'er we turn, thy glories shine."
					"And all things fair and bright are thine."
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
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne  a'1 a1  \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo fis1 e1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree d'1 cis1   \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  d1 a1  \bar "||" }}
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
