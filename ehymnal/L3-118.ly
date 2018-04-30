%%%% 190.png
%%%% Hymn 118. Jesu Meines Glaubens Zier. It is finished! Christ hath known.
%%%% Rev 1.

\version "2.10"
\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - PASSIONTIDE: GOOD FRIDAY"
	\hspace #0.1 }}	
	
  title = "118"
  
  poet = \markup { \small {  \line { \sans { \smallCaps "JESU MEINES GLAUBENS ZIER."} \hspace #1 \roman {"(7 8. 8 7. 8 7. 8 7.)"}} }}
  
  meter = \markup { \small { \italic {Very slow and solemn} \general-align #Y #DOWN \note #"2" #0.5 = 46.} }
  
  arranger = \markup { \small \smallCaps "J. S. Bach, 1685-1750." }
  
  tagline =""
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

%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-3.0
              \once \override Stem #'X-offset = #-3.0 }

%% same as above but smaller movement		 
smallstraddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.6
              \once \override Stem #'X-offset = #-1.6 }
	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {  
  \tag #'maintune { a'2 g bes a4( g) | a2 g4.( f8) f1 \bar "||" a2 a g a | bes bes4( c4) a2 g \breathmark \bar "||" \break
  a2 a g a | bes bes4( c) a2 g \breathmark \bar "||" c g a g4( f) | e2 d4( c) c1 ^\fermata \bar "||" \break
  g'2 a bes bes | a g fis d \breathmark \bar "||" d' a bes a4( g) | g2. fis4 g1 \breathmark \bar "||" \break
  g2 c a c | bes4( a) g( f) e2 c \breathmark \bar "||" g' a bes a4( g) | a2 g4( f) f1^\fermata \bar "||" }
      \tag #'amen { f1 f1 \bar "||" }
} 
   
alto = \relative c' {  
  \tag #'maintune { f2 g f f | f e4.( f8) \merge f1 \bar "||" f2 f e f | g g f e \bar "||"
  f f e f | g g f e \bar "||" g4( f) \straddle g4( e) f2 c | c b4( c) \merge c1 \bar "||"
  e2 fis g g | ees ees d d \bar "||" a'4( g) \straddle a4( fis) g2 ees | d d d1 \bar "||"
  e4( f) g4( e) f4( g) f4( e) | f2 d c c \bar "||" e f f4( g) f2 | f e4( f) \merge f1 \bar "||" }
      \tag #'amen { d1 c1 \bar "||" }
}

tenor = \relative c {\clef bass  
  \override TextScript #'staff-padding = #2	
  \tag #'maintune { c'2 c d d | c bes a1 \bar "||" c2 c c c | d c c c \bar "||"
  c c c c | d c c c \bar "||" c c c c | g f e1 \bar "||"
  c'2 c d ees | ees c4( bes) a2 fis \bar "||" d' d d c4( b) | a4( bes) c2 bes1 \bar "||"
  c2 c c c | f, bes4( a) g2 e \bar "||" c' c bes4( c) c4( d) | c2 bes a1 \bar "||" }
      \tag #'amen { bes1^\markup { "A  -  men."} a1 \bar "||" }
}

bass = \relative c {\clef bass 
  \override Stem #'length = #5 %%% shorten stems slightly to avoid clash with pedal notes		
  \tag #'maintune { f2 e d bes | c c f,1 \bar "||" f'4( g) a4( bes) c2 \straddle bes4( a) | g4( f) e2 f c \bar "||"
  f4( g) a4( bes) c2 \straddle bes4( a) | g4( f) e2 f c \bar "||" e4( d) \smallstraddle e4( c) f4( g) a2 | g g, c1_\fermata \bar "||"
  c4( c') \straddle bes4( a) g4( f) ees4( d) | c4( d) ees4( c) d2 d \bar "||" fis4( e) \smallstraddle fis4( d) g2 c, | d d g,1 \bar "||" 
  c4( d) e4( c) f2 a, | d bes c c \bar "||" c4( d) ees4( c) d4( e) f4( bes,) | c2 c f,1_\fermata \bar "||" }
      \tag #'amen { bes1 f1 \bar "||" }
}

pedals = \relative c { \clef bass
  \set fontSize = #-3 \override Stem #'length = #4 
  \override NoteColumn #'force-hshift = #0.2	
  s1 s1 | s1 s1 \bar "||" f,4( g) a( bes) c2 \straddle bes4( a) | g( f) e2 f s2 \bar "||"
  f4 g a bes c2 \straddle bes4 a | g f e2 f2 s2 \bar "||" s1 s1 | s1 s1 \bar "||"
  s1 * 16 \bar "||" 
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
        \context Voice = pedals    { \voiceFour \global \pedals }
			        >>
>>
\layout {
		indent=0
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %% close layout

} %%% Score bracket

	
%%% A separate score block to generate Hymn Midi without the Amen	

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \removeWithTag #'amen \soprano }
	\context Voice = altos    { \voiceTwo \global \removeWithTag #'amen \alto }
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \removeWithTag #'amen \tenor }
	\context Voice = basses { \voiceTwo \global \removeWithTag #'amen \bass }
        \context Voice = pedals    { \voiceFour \global \pedals }
			        >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 46 2)}} 

}

%%% A separate score block to generate Amen midi only	

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \removeWithTag #'maintune \soprano }
	\context Voice = altos    { \voiceTwo \global \removeWithTag #'maintune \alto }
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \removeWithTag #'maintune \tenor }
	\context Voice = basses { \voiceTwo \global \removeWithTag #'maintune \bass }
			        >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 46 2)}} 

}

%%% fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
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


%%% second page
%%% Lyric Attribution 

\markup { \small { \hspace #64 \italic "Gabriel Gillett." } }

\markup { \hspace #44 \small "‘It is finished.’" } 

%%% Main lyric block

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %%% one super column for the entire block of lyrics
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "I" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "T is finished! Christ hath known"
			                                 "  All the life of men wayfaring,"} }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Human joys and sorrows sharing,"
					   "    Making human needs his own."
					   "Lord, in us thy life renewing,"
					   "    Lead us where thy feet have trod,"
					   "Till, the way of truth pursuing."
					   "    Human souls find rest in God."
			  		}} 
			         } %%% finish verse 1	
		  	\hspace #1 
           		\line { "2  "
			   \column {	     
				   "    It is finished! Christ is slain,"
				   "On the altar of creation,"
				   "Offering for a world's salvation"
				   "    Sacrifice of love and pain."
				   "Lord, thy love through pain revealing,"
				   "    Purge our passions, scourge our vice,"
				   "Till, upon the Tree of Healing,"
				   "    Self is slain in sacrifice."
			}}     
    		        \hspace #1 
           		\line {"3. "
			  \column {	     
				  "    It is finished! Christ our King"
				  "Wins the victor's crown of glory;"
				  "Sun and stars recite his story,"
				  "    Floods and fields his triumph sing."
				  "Lord, whose praise the world is telling,"
				  "    Lord, to whom all power is given,"
				  "By thy death, hell's armies quelling,"
				  "    Bring thy Saints to reign in heaven."
			}}
	  }
} %%% lyric markup bracket
	
%%% alternative hymns also suitable

\markup { ""} %%% a bit of extra space before the next line

\markup { \hspace #26 \italic "Or the following: " \small  "107  When I survey the wondrous Cross." }

} %%% book bracket
