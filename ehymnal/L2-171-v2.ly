%%%% 274.png
%%%% Hymn 171 St. Edmund.  O Word of God above.
%%%% Rev 2.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "THE CHRISTIAN YEAR - DEDICATION FESTIVAL"
	\hspace #0.1 }}	
	
	title = "171"   
  
  meter = \markup { \small { \column {  
	                                \line { \sans {"ST. EDMUND."}  \hspace #1 \roman {"(S. M.)"}}
		                        \line { \italic {Moderately slow} \general-align #Y #DOWN \note #"2" #0.5 = 90.} }
  	}}	
	

 arranger = \markup { \small  { \center-align { \line { \italic "Adapted from Hymn Melody by" }	 				
	  					\line { \smallCaps "E. Gilding," \italic "d." "1782." }
  	}}}
  
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%generates the breathmarks
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}	      

%% Used to pull an upstem note left. Used when a slurred note pair straddles a longer note below and when notecolumn force-hshift does not work 
topstraddle = { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.5 
              \once \override Stem #'X-offset = #-0.2 }	      
	      

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 3/2
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 2 g'2 | g1 b2 | a( g) fis | g1 \bar "||" a2 | b1 d2 | c1 b2 | a1 \breathmark \bar "||" \break
  a2 | a1 b2 | c1 b2 | a1 g2 | \topstraddle g( fis) ^\fermata \bar "||" d2 | g1 b2 | a( g) fis | g1 \bar "||" 
} 
   
alto = \relative c' {  
  d2 | e1 g2 | e( d) d | d1 \bar "||" d2 | d1 g2 | g1 g2 | fis1 \bar "||" \break 
  d2 | e1 d2 | c1 d2 | e1 b2 | d1  \bar "||" d2 | d1 g2 | e( d) d | d1 \bar "||" 
}

tenor = \relative c {\clef bass 
  b'2 | b1 d2 | c( b) a | b1 \bar "||" fis2 | g1 d'2 | e1 d2 | d1 \bar "||" \break 
  fis,2 | a1 gis2 | a1 g!2 | c1 g2 | a1  \bar "||" fis2 | g1 d'2 | c( b) a | b1 \bar "||" 
}

bass = \relative c {\clef bass 
  g'2 | e1 b2 | c( d) d | g,1 \bar "||" d'2 | g,1 b2 | c1 g'2 | d1 \bar "||" \break 
  d2 | c1 b2 | a1 b2 | c1 e2 | d1 _\fermata  \bar "||" d2 | b1 g2 | c( d) d | g1 \bar "||" 
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 90 2) }}      
  	
	
} %%% Score bracket

%%% Lyric attributions and titles

\markup { \small { \hspace #64 \italic "C. Guiet, 1601-64.  Tr. I. Williams" \hspace #-1 "‡." }}

\markup { \small { \hspace #38 "Patris aeterni suboles coaeva." }}

%%% Lyrics
%%% Strange Lilypond behaviour. Some blank lines (vertical spacing) were narrower than others so \lower #0.4 was used to adjust.

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #4.6 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 " WORD of God above,"
			                                 "  Who fillest all in all," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Hallow this house with thy sure love,"
					   "    And bless our festival."
					   "      " %%% adds vertical spacing between verses
			  		}}
		      }  
		       \line { \lower #0.4 { "2  "
			   \column {
				   "    Grace in this font is stored"
				   "    To cleanse each guilty child;"
				   "The Spirit's blest anointing poured"
				   "    Brightens the once defiled."
				    "      " %%% adds vertical spacing between verses
		       }}}
			\line { "3  "
				\column {
					"    Here Christ of his own Blood"
					"    Himself the chalice gives,"
					"And feeds his own with Angels' food,"
					"    On which the spirit lives."
					 "      " %%% adds vertical spacing between verses
			}}
			\line {"4  "
				\column {
					"    For guilty souls that pine"
					"    Sure mercies here abound,"
					"And healing grace with oil and wine"
					"    For every secret wound."
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

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
			\hspace #1 % adds vertical spacing between verses
			\line {"5  "
				\column {
					"    God from his throne afar,"
					"    Comes in this house to dwell;"
					"And prayer, beyond the evening star,"
					"    Builds here her citadel."
					 "      " %%% adds vertical spacing between verses
			}}
			\line { \lower #0.4 { \hspace #-9.7 \italic "Unison. " "6. "
				\column {
					"    All might, all praise be thine,"
					"    The God whom all adore;"
					"The Father, Son, and Spirit divine,"
					"    Both now and evermore.     Amen."
     			}}}
	  }
} %%% lyric markup bracket


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne g'1 g1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo e1 d1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree c'1 b1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  c1 g1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 90 2) }}  %%Amen midi       
       
}  
 

} %%% book bracket
