%%%% 177.png
%%%% Hymn 107. Caton or Rockingham. "When I survey the wondrous Cross"
%%%% Rev 3

\version "2.10.23"
\header {

  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - PASSIONTIDE"

	\hspace #0.1 }}	

  title = "107"

  meter = \markup { \small { \column {  \hspace #1
	                                \line { \sans {"CATON"} \sans \smallCaps "or"  \sans {"ROCKINGHAM."} \hspace #1 \roman {"(L. M.)"}}
		                        \line { \italic {Very slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 63.} }
  	}}	
	

 arranger = \markup { \small  { \center-align { \line {\italic "Adapted by" \smallCaps "E. Miller, 1731-1807."}
	 					 \line {  \italic "Harmony chiefly from" \smallCaps "S. Webbe" }
	  					 \line { "(" \hspace #-1 \italic "A Collection of Psalm Tunes, 1820" \hspace #-1 ")." }
  	}}}
	  
tagline =""

}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01

%%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 

straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.6
              \once \override Stem #'X-offset = #-2.6 }

%%% same as above, but pulls note leftwards a smaller amount

smallstraddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.0
              \once \override Stem #'X-offset = #-2.0 }
	      
	      
	      
%% Used to pull an upstem note left. Used when a slurred note pair straddles a longer note below and when notecolumn force-hshift does not work 
topstraddle = { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.5 
              \once \override Stem #'X-offset = #-0.2 }	      
	      
	      
%%% push a note slightly to the right	      
	      
push = \once \override NoteColumn #'force-hshift = #0.6


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 6/4
  \key d \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
	
  \tag #'common {	
    \partial 2 d2 | fis(g) e |  d1 fis2 |  a1 b2 | a1 a2 | \push d1 cis2 | \break
    \push b1 a2 | \topstraddle a(g) fis | fis(e) \breathmark \bar "||" e | \push a1 b2 | cis1 a2 | \break }
  
  \tag #'webbemodified { d^\markup { "[" \lower #0.6 {\fontsize #2 "*" } "]" }(fis,)  gis | a1 d,2 | }
  \tag #'webbeoriginal { d'2 fis,  g^\markup { "("  \raise #0.5 \smaller \natural  ")"  } \bar "|" a1 d,2  \bar "|" } 
  
  \tag #'commonEnd { \push g1 fis2 | e1 d2 | d4(e fis2) e2 | d1 \bar "||" }
}

alto = \relative c' {
	
  \tag #'common {	
    \partial 2 d2 | \push d1 cis2 | \merge d1 d2 | d1 d2 | \straddle d4(e fis2) e | d(g2.) fis4 | \break
    fis2(e) fis | cis1 d2 | d(cis) \bar "||" cis4(b) | a2(e') e4(d) | \straddle cis(e a g!) fis(e) | \break }
  
  \tag #'webbemodified { \push d1 d2 | cis1 \straddle d4(cis) | }
  \tag #'webbeoriginal { d2.(cis4) b2 \bar "|" a fis'4(e) \smallstraddle d(cis)  \bar "|" }
  
  \tag #'commonEnd { b2.(cis4) d2 | b1 b2 | a(d) cis | \merge d1 \bar "||" }
}

tenor = \relative c { \clef bass 
	
  \tag #'common {	
    \partial 2 fis2 | a(b) a4(g) | fis1 a2 | a1 g2 | a(fis4 g) a2 | a(g) a | \break
    b(cis) d |  a1 a2 | a1 \bar "||" e4(d) | cis(e a2) gis | a1 a4(g) | \break }
  
  \tag #'webbemodified { fis2(b) b | \topstraddle a2.(g4) fis2 | }
  \tag #'webbeoriginal { fis4(e d2) e \bar "|" fis1 fis2 \bar "|" }
  
  \tag #'commonEnd { g(b) a | \topstraddle g2.(fis4) e2 | fis4(g a2) a4(g) | fis1 \bar "||" }
}

bass = \relative c { \clef bass 
	
  \tag #'common {	
    \partial 2 d2 | d(g,) a | d1 d2 | fis1 g2 | fis(d) cis | \push b1 a2 | \break
    g(g') fis |  e1 d2 | a1 \bar "||" a2 | a(cis) e | \merge a1 a,2 | \break }
  
  \tag #'webbemodified { \push b1 e2 | a,1 b2 | }
  \tag #'webbeoriginal { b2.(a4) g2 \bar "|" fis1 b2 \bar "|" }
  
  \tag #'commonEnd {  
      << { \voiceTwo \push e1 }  
      \new Voice = "pedals" { \once \override NoteColumn #'force-hshift = #0.8 
                          \voiceFour \set fontSize = #-3 e,1 } >> 
      fis2 | g1 gis2 | \push a1 a2 | d1 \bar "||" }
}      

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##t
}


\book {

%%% Main Score block	

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \removeWithTag #'webbeoriginal \soprano }
	\context Voice = altos    { \voiceTwo \global \removeWithTag #'webbeoriginal \alto }
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \removeWithTag #'webbeoriginal \tenor }
	\context Voice = basses { \voiceTwo \global \removeWithTag #'webbeoriginal \bass }
			        >>
>>
\layout {
		indent=0
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %% close layout

%%% Hymn Midi	

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 63 2)}} 

} %%% Score bracket

%%% Markup about alternate harmonization

\markup { \hspace #16 \smallCaps "Note" \hspace #-1.2 ".—" \italic "A different harmonization of this tune will be found at Hymn 320." }


%%% A separate score block to generate the score snippet with Webbe's original

\score{
\new ChoirStaff	
<<
    \set ChoirStaff.instrumentName = \markup { \column  {\left-align{  \small \italic "* Webbe's original    " 
	                                                                         \small \italic "   version of this" 
                                                                                 \small \italic "   passage is: " }}}

	\context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }
	               <<
	\context Voice = sopranos { \voiceOne \global \keepWithTag #'webbeoriginal \soprano }
	\context Voice = altos    { \voiceTwo \global \keepWithTag #'webbeoriginal \alto }
	               >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }
	                        <<
	\context Voice = tenors { \voiceOne \global \keepWithTag #'webbeoriginal \tenor }
	\context Voice = basses { \voiceTwo \global \keepWithTag #'webbeoriginal \bass }
			        >>
>>

\header { breakbefore = ##f piece = " " opus = " " }

\layout { 

      \context { \Score timing = ##f }
	ragged-bottom = ##t
        ragged-right = ##t 
	indent = 4\cm

	\context { \Staff \remove Time_signature_engraver }
        \context { \ChoirStaff \consists "Instrument_name_engraver"}
       } %%% close layout

} %%% Score bracket


%%% A separate score block to generate the hymn midi with Webbe's original arrangement

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \removeWithTag #'webbemodified \soprano }
	\context Voice = altos    { \voiceTwo \global \removeWithTag #'webbemodified \alto }
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \removeWithTag #'webbemodified \tenor }
	\context Voice = basses { \voiceTwo \global \removeWithTag #'webbemodified \bass }
			        >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 63 2)}} 

}

%%% Hymn note markup and lyric titles


\markup { \small { \hspace #70 \italic "I. Watts, 1674-1748."  } } 
                                                                                                    
		                                                                                                     
%%% Main lyric block

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %%% one super column for the entire block of lyrics
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "W" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HEN I survey the wondrous Cross,"
			                                 "  On which the Prince of glory died," } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "My richest gain I count but loss,"
					   "    And pour contempt on all my pride."
			  		}} 
			         } %%% finish verse 1	
		  	\hspace #1 
           		\line { "2  "
			   \column {	     
				   "Forbid it, Lord, that I should boast"
				   "    Save in the death of Christ my God;"
				   "All the vain things that charm me most."
				   "    I sacrifice them to his Blood."
			}}		
		        \hspace #1 
           		\line { "3  "
			  \column {	     
				  "See from his head, his hands, his feet."
				  "    Sorrow and love flow mingled down;"
				  "Did e'er such love and sorrow meet,"
				  "    Or thorns compose so rich a crown?"
			}}
			\hspace #1 
           		\line { "4  "
			  \column {	     
				  "His dying crimson like a robe,"
				  "    Spreads o'er his body on the Tree;"
				  "Then am I dead to all the globe,"
				  "    And all the globe is dead to me."
			}}
    		        \hspace #1 
           		\line {"5. "
			  \column {	     
				  "Were the whole realm of nature mine,"
				  "    That were a present far too small;"
				  "Love so amazing, so divine,"
				  "    Demands my soul, my life, my all."
			}}
	  }
} %%% lyric markup bracket

%%% Amen score block

\score{

  \new ChoirStaff

   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	         \context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne d1 d  \bar "||" }}
	         \context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo b1 a \bar "||" }}
	                      >>
	         \context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	         \context Voice = "tenors" { \relative c { \clef bass \global \voiceThree g'1 fis \bar "||" }}
	         \context Voice = "basses" { \relative c { \clef bass \global \voiceFour  g1 d' \bar "||" }}
			        >> 

  >>			      

\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
      \context { \Score timing = ##f }
	ragged-bottom = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       } %% close layout

%%% Amen Midi

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 63 2) }}
}

} %%% book bracket