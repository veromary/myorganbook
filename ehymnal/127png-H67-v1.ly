%%% 127png
%%% Hymn 67 Modern Babylon's Streams Now is the Healing time decreed
%%% Version 1

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - LENT"
		\hspace #0.1 }}	
   title = \markup { "67 " \large \smallCaps "(Modern Tune)" }
  poet = \markup {  \small { \sans {"BABYLON'S STREAMS."}   \hspace #1 \roman {"(L. M.)"}} }
  meter = \markup { \small { \italic {Moderately slow, solemn} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 69.} }
  arranger =  \markup { \small { \smallCaps "T. Campion, 1575-1619." }}
  tagline =""
}

%%%%%%%%%%%%%%% Macro Definitions

%% generates the breathmarks
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}

%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB Voices

global = {
  \time 4/4
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 2 e2 | g2 a2 | b1 ~ | b2 b2 | a2 g2 | \cadenzaOn fis1. \bar "||" fis2 \bar "|" \cadenzaOff g2 a2 | \break  
  b2. b4 | a2 a2 | \cadenzaOn g1. \bar "||" b2 \bar "|" \cadenzaOff d2 b2 | a2 fis2 | \break
  g2 a2 | b2. \breathmark \bar "||" b4 | b2. b4 | b2 a4 ( g4 -) | fis2 fis2 | \cadenzaOn e1. \bar "||" }

alto = \relative c' { 
  b2 | e2 e2 | dis1 ~ | dis2 e2 | e2 e2 | dis1. \bar "||" dis!2 \bar "|" e2 fis2 | 
  g2. g4 | g2 fis2 | \once \override NoteColumn #'force-hshift = #-0.01 g1. \bar "||" g2 | g2 g2 | fis2 fis2 | 
  e2 e2 | dis2. \bar "||" dis!4 | e2 fis2 | e2 e2 | e2 dis2 | \once \override NoteColumn #'force-hshift = #-0.01 e1. \bar "||" 
}

tenor = \relative c { \clef bass
  g'2 | b2 e,2 | fis1 ~ | fis2 g2 | c2 b2 | b1. \bar "||" b2 \bar "|" b2 d2 | 
  d2. d4 | e2 d4 ( c4 -) | b1. \bar "||" d2 | b2 g2 | a2 b2 | 
  b2 e,2 | fis2. \bar "||" fis4 | g2 fis2 | g2 c2 | fis,2 b2 | g1. \bar "||" 
}

bass = \relative c { \clef bass
  e2 | e2 c2 | b1 ~ | b2 e2 | a,2 e'2 | b1. \bar "||" b2 \bar "|" e2 d2 | 
  g2. b,4 | c2 d2 | g1. \bar "||" g2 | g2 g2 | d2 d2 | 
  e2 c2 | b2. \bar "||" b4 | e2 dis2 | e2 a,2 | b2 b2 | e1. \bar "||" }

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##t
}


\book {

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
	} %%% close layout

%%% Hymn Midi	

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 69 2)}} 

} %%% Score bracket

%%% Hymn Note markup

\markup { \hspace #18 \smallCaps "Note" \hspace #-1.2 ".—" \italic "This hymn may also be sung to the Rouen Melody at Hymn 65." }

%%% Lyric titles

\markup { \small { \hspace #10 \smallCaps "Office Hymn." "  E." \italic "  Lent" "iii." \italic "till Passion Sunday." \hspace #20  \italic "Before 12th cent.  Tr. T. A. L." } }
	
\markup { \small { \hspace #42 \small "Ecce tempus idoneum."} }

%%% Main block of lyrics

\markup { \hspace #32 %%add space as necc. to center the column
	      \column { %%% super column for entire block of lyrics 
	              \column { %%% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "N" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "OW is the healing time decreed"
                                                         "  For sins of heart, of word or deed," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "When we in humble fear record"
					   "The wrong that we have done the Lord;"
			  		}}
			           } %% finish verse 1	 
		 \hspace #1  % adds vertical spacing between verses  	
		  \line { "2  "
		    \column {	     
			    "Who, alway merciful and good,"
			    "Has borne so long our wayward mood,"
			    "Nor cut us off unsparingly"
			    "In our so great iniquity."
			}}
	      }	%%% end super column	
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
%%% continuation of  lyrics

\markup { \hspace #32   %%add space as necc. to center the column
          \column { 
		\hspace #1  % adds vertical spacing between verses   
		\line { "3  "
		    \column {	     
			    "Therefore with fasting and with prayer,"
			    "Our secret sorrow we declare;"
			    "With all good striving seek his face,"
			    "And lowly hearted plead for grace."
		}}
                 \hspace #1  % adds vertical spacing between verses 
		  \line { "4  "
		    \column {	     
			    "Cleanse us, O Lord, from every stain,"
			    "Help us the meed of praise to gain,"
			    "Till with the Angels linked in love"
			    "Joyful we tread thy courts above."
			}}
		 \hspace #1  % adds vertical spacing between verses  	
		  \line { "5. "
		    \column {	     
			    "Father and Son and Spirit blest,"
			    "To thee be every prayer addrest,"
			    "Who art in threefold Name adored,"
			    "From age to age, the only Lord.     Amen."
			}}
	  }
} %%% lyric markup bracket

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne e1 e1  \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo c1 b1 \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree a'1 gis1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  a1 e'1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       } %%% close layout

%%% Amen Midi
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 69 2) }} 

}


} %%% book bracket