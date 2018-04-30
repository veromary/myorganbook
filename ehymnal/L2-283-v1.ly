%%% 432.png
%%% Hymn 283. FARLEY CASTLE. Most glorious Lord of life 
%%% Rev 1.

\version "2.10.23"

\header {
	  dedication = \markup {  \center-align { "TIMES AND SEASONS.—SUNDAY"
	\hspace #0.1 }}	
	
	title = "283"
	
	subtitle = "SUNDAY"
	
	meter = \markup { \small { \column { 
		                       \line { \italic "Morning." }
		                       \line { \sans "FARLEY CASTLE." \hspace #1 \roman "(10 10. 10 10.)" } 
                                       \line { { \italic "In moderate time" \general-align #Y #DOWN \note #"2" #0.5 "= 72." }}}}}
 
	arranger = \markup { \small { \column { 
		 			\line { \italic  "Edmund Spenser, 1553-99." }
					\line { "               " }
				 	\line { \smallCaps "H. Lawes, 1596 - 1662." } }} }
 
	tagline = ""
			}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%macros begin
%%generates the breathmarks

breathmark = { 
	\override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup { \fontsize #4 "," }
	}


%%% prints a repeat sign glyph comprising 4 dots. Used only to begin a repeat at the start of a piece where \bar ":" does not work      

fdstartrepeat =  {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
                  \once \override Staff.BarLine #'text = \markup  { \line { \hspace #0 \override #'(baseline-skip . 1.0) 
                                                                    \raise #1.4 \column { \with-color #black { 
                                                                    \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
                  } }   
                 \bar "|:"}
   
%%% prints a repeat sign glyph comprising 4 dots and two thin bars

fdendrepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
                \once \override Staff.BarLine #'text = \markup  {  \line { \raise #1.4 \override #'(baseline-skip . 1.0)  \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
                                                                   \hspace #-1 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
                                                                   \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
        } }     
        \bar "||"} 

	
%%%%%%%%%%%%%%%%%%%%%%%%%%%macro end

global = {
\time 4/2
\key d \major
\set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \tag #'repeatpart { \fdstartrepeat  d1 fis2 g | a fis g a | b cis d1 \breathmark \bar "||" d1 cis2 b | d a b fis | \break 
  a gis a1 \breathmark \bar "||" a1 fis2 b | a g fis g | a d, e1 \breathmark \bar "||" e1 a2 fis | \break
  g b a d | d cis d1 ^\fermata \fdendrepeat } \tag #'vfour  { a1 fis2 b | a g fis g | a d, e1 \bar "||" \break
  e1 a2 fis | g b a d | d cis d1 \bar "||" } \tag #'Amen { \cadenzaOn d,1 d1 \bar "||" }
} 
   
alto = \relative c' {  
  \tag #'repeatpart { \fdstartrepeat a1 d2 d | e d d d | g g fis1 \bar "||" fis1 fis2 d | fis d d d | 
  e e4(d) cis1 \bar "||" e1 d2 d | d e a, d | d d cis1 \bar "||" cis1 e2 d | 
  d cis d fis | a a fis1 \fdendrepeat } \tag #'vfour  { e1 d2 d | d e a, d | d d cis1 \bar "||" 
  cis1 e2 d | d cis d fis | a a fis1 \bar "||" } \tag #'Amen { \cadenzaOn b,1 a1 \bar "||" }
} 

tenor = \relative c {\clef bass 
  \tag #'repeatpart { \fdstartrepeat fis1 a2 b | cis a b a | g g a1 \bar "||" d1 a2 b | a d g, a | 
  cis b a1 \bar "||" a1 a2 g | a b4(cis) d2 d | a gis a1 \bar "||" a1 a2 a | 
  b g a b | e e d1  \fdendrepeat } \tag #'vfour  { a1 a2 g | a b4(cis) d2 d | a gis a1 \bar "||" \break
  a1 a2 a | b g a b | e e d1 \bar "||" } \tag #'Amen { \cadenzaOn g,1 fis1 \bar "||" }
} 

bass = \relative c {\clef bass 
  \tag #'repeatpart { \fdstartrepeat d1 d2 b | a d g fis | e e d1 \bar "||" b'1 fis2 g | d fis g d | 
  cis e a,1 \bar "||" cis1 d2 g | fis e d b | fis b a1 \bar "||" a1 cis2 d | 
  g e fis b | a a d,1 _\fermata \fdendrepeat } \tag #'vfour  { cis1 d2 g | fis e d b | fis b a1 \bar "||"
  a1 cis2 d | g e fis b | a a d,1  \bar "||" } \tag #'Amen { \cadenzaOn g,1 d'1 \bar "||" }
} 

wordsOne = \lyricmode {
  \override LyricText #'font-size = #-1.
  \once \override LyricText #'self-alignment-X = #0.6	
  "1  Most" glo -- rious Lord of life, that on this day Didst make thy tri -- umph o -- ver
  death and sin,  And hav -- ing har -- rowed hell, didst bring a -- way Cap -- tiv -- i --
  ty thence cap -- tive, us to win:	
}	

wordsTwo = \lyricmode {
  \override LyricText #'font-size = #-1.		
  \once \override LyricText #'self-alignment-X = #0.8	
  "2  This" joy -- ous day, dear Lord, with joy be -- gin, And grant that we for whom thou
  did -- dest die, Be -- ing with they dear Blood clean washed from sin, May live for
  ev -- er in fe -- li -- ci -- ty:	
}

wordsThree = \lyricmode {
  \override LyricText #'font-size = #-1.		
  \once \override LyricText #'self-alignment-X = #0.85		
  "3  And" that thy love we weigh -- ing wor -- thi -- ly, May like -- wise love thee for the
  some a -- gain; And for thy sake, that all like dear didst buy, With love may
  one a -- no -- ther en -- ter -- tain; \once \override LyricText #'self-alignment-X = #1 "4.  So" let us live, dear lord, like as we ought;
  Love is the les -- son which the Lord has taught.  A -- men.	
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

\score{
\new ChoirStaff
<<
	\context Staff = upper <<
		\context Voice = sopranos { \voiceOne \global \soprano }
		\context Voice = altos { \voiceTwo \global \alto }
							>>
                \new Lyrics \lyricsto "sopranos" \wordsOne							
		\new Lyrics \lyricsto "sopranos" \wordsTwo
		\new Lyrics \lyricsto "sopranos" \wordsThree
	
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


%%% A separate score block to generate the midi	

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \keepWithTag #'repeatpart \soprano }
	\context Voice = altos    { \voiceTwo \global \keepWithTag #'repeatpart \alto }
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \keepWithTag #'repeatpart \tenor }
	\context Voice = basses { \voiceTwo \global \keepWithTag #'repeatpart \bass }
			        >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 72 2)}} 

} %%% Score bracket


%%% A separate score block to generate the midi	

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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 72 2)}} 

} %%% Score bracket

}%%book bracket 
