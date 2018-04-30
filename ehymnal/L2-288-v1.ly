%%%% 437.png
%%%% Hymn 288 SOLL'S SEIN. The summer days are come again
%%%% Rev 1.

\version "2.10"

\header {
	
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—SUMMER"
	                                        \hspace #0.1 }}	
	
  title = "288"   
  
  meter = \markup { \small { \column { \line { \sans "SOLL'S SEIN." \hspace #1 \roman "(D. C. M.)" } 
                                       \line { { \italic "Slow" \general-align #Y #DOWN \note #"2" #0.5 "= 88." }}}}}
	  
  arranger = \markup { \small { \center-align { 
		 \line { \italic "Melody in" "‘" \hspace #-1 \italic "Drei schöne neue" }
		 \line { \italic "geistliche Lieder," \hspace #-1 "’" \italic "Munchen, 1637."}}}}
 
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
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

%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.4
              \once \override Stem #'X-offset = #-2.4 }

%% same as above but smaller movement		 
smallstraddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.0
              \once \override Stem #'X-offset = #-1.0 }
	            
%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01		      

%%% turns a dot in a dotted note transparent: used when a pair of merged notes has only 1 dot for the 2 noteheads

transparentdot = \once \override Dots #'transparent = ##t

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 3/2
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \tag #'repeatpart { \fdstartrepeat    a'2 c2 g2 | a1 g2 | f1 g2 | e1 e2 | f2 ( g2 ) a2 | bes2 g1 | \transparentdot f1.  \fdendrepeat \break }  
  \tag #'remainder  {  fis2 fis2 g2 | a1 d2 | bes1 c2 | a1 fis2 | g2 ( a2 ) bes2 | c1 a2 | g1. \breathmark \bar "||"  \break
  a2 c2 bes2 | a1 g2 | f1 g2 | e1 e2 f2 ( g2 ) a2 | bes2 g1 | \transparentdot \merge f1. ^\fermata \bar "||" 
}} 
   

alto = \relative c' {  
  \tag #'repeatpart { f2 c2 d4 ( e4 ) | f1 c2 | d1 d2 | c1 c2 | c2 ( e2 ) f2 | f2 \straddle f2 ( e2 ) | \merge f1.  \fdendrepeat } 
  \tag #'remainder  { d2 d2 d2 | d1 d2 | d1 g2 | fis1 d2 | d2 ( fis2 ) g2 | g1 fis2 | \merge g1. \bar "||" 
  f!2 g2 d4 ( e4 ) | f1 c2 | d1 d2 | c1 c2 | c2 ( d4 e4 ) f2 | f2 \straddle f2 ( e2 ) | f1. \bar "||"  
}}


tenor = \relative c {\clef bass 
  \tag #'repeatpart { \fdstartrepeat  c'2 a2 bes2 | c1 g2 | a1 g2 | g1 g2 | f2 ( bes2 ) c2 | d2 c1 | a1. \fdendrepeat  }  
  \tag #'remainder  { a2 a2 g2 | g2 ( fis2 ) a2 | bes1 ees2 | d1 d2 | d2 ( c2 ) d2 | ees1 d2 | bes1. \bar "||" 
  d2 g,2 bes2 | c1 c2 | a1 g2 | g1 g2 | f2 ( bes2 ) c2 | d2 c1 | a1. \bar "||"  
}}


bass = \relative c {\clef bass 
   \tag #'repeatpart { f2 a2 g2 | f1 e2 | \smallstraddle d2 ( c2 ) b2 | c1 bes!2 | a2 ( g2 ) f2 | bes2 c1 | f,1. \fdendrepeat  }  
   \tag #'remainder  { d'2 d2 bes2 | d1 fis2 | g1 c,2 | d1 c'2 | bes2 ( a2 ) g2 | c,1 d2 | g1. \bar "||" 
   d2 e2 g2 | f1 e2 | \smallstraddle d2 ( c2 ) b2 | c1 bes!2 | a2 ( g2 ) f2 | bes2 c1 | f,1. _\fermata \bar "||"
}}

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
		
} %%% Score bracket


%%% A separate score block to unfold the repeat and generate the midi	

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \keepWithTag #'repeatpart \soprano \soprano }
	\context Voice = altos    { \voiceTwo \global \keepWithTag #'repeatpart \alto \alto }
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \keepWithTag #'repeatpart \tenor \tenor }
	\context Voice = basses { \voiceTwo \global \keepWithTag #'repeatpart \bass \bass }
			        >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 88 2)}} 

} %%% Score bracket


%%% Lyric titles and attributions

\markup { "                " }

\markup {  \small {  \hspace #64 \italic "S. Longfellow" "‡," \italic "1819-92." }} 

%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #3.0 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HE summer days are come again;"
			                                "    Once more the glad earth yields" } }          
	                  \line {  \hspace #3.0  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Her golden wealth of ripening grain,"
					   "    And breath of clover fields,"
					   "And deepening shade of summer woods,"
					   "    And glow of summer air,"
					   "And winging thoughts, and happy moods"
					   "    Of love and joy and prayer."
					   "          " %%% adds vertical spacing between verses
			  		}}
		      } %%% end verse 1	
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

\markup { \hspace #30   %%add space as necc. to center the column  
		\column { 
			\hspace #1  % adds vertical spacing between verses  
			\line { "2. "
			   \column {	     
				   "The summer days are come again;"
				   "    The birds are on the wing;"
				   "God's praises, in their loving strain,"
				   "    Unconsciously they sing."
				   "We know who giveth all the good"
				   "    That doth our cup o'erbrim;"
				   "For summer joy in field and wood"
				   "    We lift our song to him."
			}}
	  }
} %%% lyric markup bracket



%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f1 f1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo d1 c1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree bes'1 a1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  bes1 f1 \bar "||" }}
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
