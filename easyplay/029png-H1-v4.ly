%%% 029.png
%%% Hymn 1 Creator of the stars of night
%%% Version 4


\version "2.10"

\include "gregorian-init.ly"

\header {
  dedication = \markup { \center-align { \smallCaps "Part I" 
	  "THE CHRISTIAN YEAR - ADVENT"
		\hspace #0.1 }}	
  title = "1"
  arranger =  \markup { "Mode iv."}
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%% macro settings for stemless long note which is 2x duration of regular white note (Here it only happens in the Amen block)    

ln = {\once \override NoteHead #'duration-log = #0 
           \once \override Stem #'stencil = ##f
           \once \override NoteColumn #'force-hshift = #0.4 }

%%%%%%%%%%%%%%%%%%%%%%%% End of Macro definitions

%%% plainsong voice

plainsong = \context VaticanaVoice  {  \relative c' { 
	\override Staff.Accidental  #'transparent = ##t
	\clef "vaticana-do2"
	\set fontSize = #3
	\override Staff.StaffSymbol #'staff-space = #1.6
  b2 g b d e e c d  \bar "|" d e c d  c b a b \bar "|"
  d  c a b c b a g  \bar "|" g b c d  c b a b \bar "||"
 
}}

%%% SATB voices

global = { 
 \time 8/2 
 \key ees \major
 \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \once \override Score.SeparationItem #'padding = #2
  g'2 ees g bes  c c aes bes \bar "|" \noBreak bes c aes bes aes g f g \bar "|" \break
  \once \override Score.SeparationItem #'padding = #4 
  bes aes f g aes g f ees    \bar "|" \noBreak ees g aes bes aes g f g \bar "||"
}

alto = \relative c' {
  d2 c c d ees ees ~ ees d      \bar "|" ees ees c d ees ees d ees  \bar "|"
  ees ees bes ees ees ees d c \bar "|" ees d c bes ees ees d d    \bar "||"
}

tenor = \relative c { \clef bass 
  bes'2 g ees f aes aes ~ aes f \bar "|" g g aes f c' bes1 ~ bes2   \bar "|"
  g aes bes bes c bes bes g   \bar "|" g g ees ees c' bes1 ~ bes2 \bar "||"
}

bass = \relative c { \clef bass
  g2 c c bes aes aes c bes    \bar "|" ees c f bes, c ees bes ees \bar "|"
  ees c d ees aes, ees' bes c \bar "|" c bes aes g aes ees' bes g \bar "||"
}


#(ly:set-option 'point-and-click #f)

\book {

\paper {
 #(set-paper-size "a4")
%% annotate-spacing = ##t
 print-page-number = ##f
 ragged-last-bottom = ##t
 ragged-bottom = ##t
}


\score {	
  <<
 \new VaticanaStaff {\plainsong }
 \new ChoirStaff <<
 \new Staff = "upper" <<
     \context Voice = sopranos {\voiceOne \global \soprano }
     \context Voice = altos {\voiceTwo \global \alto }
                      >> 
 \new Staff = "lower" <<
     \context Voice = tenors {\voiceOne \global \tenor }
     \context Voice = bass {\voiceTwo \global \bass }
	              >>
		 >>	 
  >>

\layout {
	
  ragged-right = ##f
  ragged-last = ##f
  \context { \Score timing = ##f }
  \context { \Score \override TimeSignature #'transparent = ##t }
  \context { \Score \remove "Mark_engraver" }
  \context { \Staff \consists "Mark_engraver" }
  
  %% *** Needed to produce beamed minims - which are quavers in disguise (not needed in this piece except for the Amen)
  %% \context { \Staff \override NoteHead #'duration-log = #1 }
  %% \context { \Staff \override Stem #'flag-style = #'no-flag }
  
  \context { \VaticanaStaff
           % *** Increases distance between lines of staff  
           \override StaffSymbol #'staff-space = #1.6            
           % *** Changes staff to black instead of default red
           \revert StaffSymbol #'color
           % *** Makes clef bigger       
           \override Clef #'font-size = #3
           % *** Would make ledger lines black, if there were any
           \revert LedgerLineSpanner #'color
           % *** Makes terminal barline visible 
           \override BarLine #'transparent = ##f 
  	   % *** Remove custos
	   \remove Custos_engraver
	   % needed for certain tweaks
	   \consists "Mark_engraver"
           }
     }
}
 
%%%This next score block generates the midi, exluding the plainsong voice.
\score {	
 \new ChoirStaff <<
 \new Staff = "upper" <<
     \context Voice = sopranos {\voiceOne \global \soprano }
     \context Voice = altos {\voiceTwo \global \alto }
                      >> 
 \new Staff = "lower" <<
     \context Voice = tenors {\voiceOne \global \tenor }
     \context Voice = bass {\voiceTwo \global \bass }
	              >>
		 >>	  
\midi { 
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 2) } }
   
} %%% midi score bracket


%%% Hymn Note markup

\markup { \hspace #52
	\override #'(line-width . 95) \center-align { 
		\line { \italic "If a modern tune is required for this hymn it may be sung to" \smallCaps "Angels' Song" "(" \hspace #-1 \italic "No." "259)" } 
                \line {\italic "or" \smallCaps "St. Ambrose" "(" \hspace #-1 \italic "No." "215)."} } }

%%% Lyric attributions and titles

\markup { \hspace #18 \small \smallCaps  "Office Hymn. E." \hspace #30 \italic "c. 7th cent.  Tr. J. M. Neale." }  
                                    
\markup { \hspace #40 \small "Conditor alme siderum." }
  

%%% Main lyric block

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %%% one super column for the entire block of lyrics
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "C" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "REATOR of the stars of night,"
			                                "  Thy people's everlasting light," } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
						"Jesu, Redeemer, save us all,"
			 			"And hear thy servants when they call."
			  		}} 
			         } %%% finish verse 1	
			\hspace #1 
           		\line { "2  "
			   \column {	     
				    "Thou, grieving that the ancient curse"
				    "Should doom to death a universe,"
				    "Hast found the medicine, full of grace,"
				    "To save and heal a ruined race."
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

\markup { \hspace #30   %%add space as necc. to center the column
          \column { 
			\hspace #1 
			\line { "3  "
				\column {
				    "Thou cam'st, the Bridegroom of the bride,"
				    "As drew the world to evening-tide;"
				    "Proceeding from a virgin shrine,"
				    "The spotless Victim all divine:"
			}}	
			\hspace #1 
           		\line { "4  "
				\column {
				  "At whose dread name, majestic now,"
				  "All knees must bend, all hearts must bow;"
				  "And things celestial thee shall own,"
				  "And things terrestrial, Lord alone."
			}}
			\hspace #1 
           		\line { "5  "
				\column {
				  "O thou whose coming is with dread"
				  "To judge and doom the quick and dead,"
				  "Preserve us, while we dwell below,"
				  "From every insult of the foe."
			}}
			\hspace #1 
           		\line { "6.  "	     
				\column {
				  "To God the Father, God the Son,"
				  "And God the Spirit, Three in One,"
				  "Laud, honour, might, and glory be"
				  "From age to age eternally.     Amen."
			}} 

	  }
} %%% lyric markup bracket

%%% Amen score block
%%% Note the beamed 1/2 notes. These are reproduced by using quavers with tails suppressed and noteheads replaced.

\score {  	
  <<
    <<
  \new VaticanaStaff <<
  \context VaticanaVoice = "plainsongamen"  {  \relative c { 	  
	\set Score.timing = ##f
	\override Staff.Clef #'#'font-size = #3
	\clef "vaticana-do2"
	\set fontSize = #3
	\override Staff.StaffSymbol #'staff-space = #1.6
	 
        \[ b'8 \pes c8 \]   \[
	    \override NoteHead #'extra-offset = #'(0.0 . -0.1 ) b8 
            \override NoteHead #'extra-offset = #'(-0.38 . 0.0 ) \flexa  a8 \pes 
            \override NoteHead #'extra-offset = #'(0.02 . 0.05) b8 \] }} 
                    >> 
 \new Lyrics = "lyrics" { s1 }
 \new ChoirStaff
   <<
   \context Staff = upper \with {  fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
	                                              \voiceOne g'8[ aes] g8[ f8 g8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  \ln ees4 ees8[ d d] \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  \ln c'4  \ln bes4. \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
			         \voiceFour c8[ aes8] ees'8[ bes8 g8] \bar "||" }}
			        >> 
   >>
  \context Lyrics = "lyrics" \lyricsto "tenors" { \override LyricText #'font-size = #-1  A -- men. }
  >>
>>

\header { breakbefore = ##f piece = " " opus = " " }

\layout {
     indent = 13\cm
     raggedright = ##t
     packed = ##f
     \context { \Score \override TimeSignature #'transparent = ##t }
     \context { \Score \override SeparationItem #'padding = #2 }
     \context { \Staff \override VerticalAxisGroup #'minimum-Y-extent = #'( -5 . 4) }
     \context { \Score \remove "Bar_number_engraver"
		timing = ##f 
              }
     \context { \Staff \override NoteHead #'duration-log = #1 }
     \context { \Staff \override Stem #'flag-style = #'no-flag }
     \context { \VaticanaStaff %%customize vaticana staff context 
	          \revert StaffSymbol #'color
		  \revert LedgerLineSpanner #'color
		  \override BarLine #'transparent = ##f 
		  \remove Custos_engraver
 	} 
} 

}

%%% Separate score block for Amen midi minus plainsong voice
%%% Since the minims are quavers in disguise, the tempo has to be adjusted accordingly. A tempo of 2=80 is set.

\score {  	
 \new ChoirStaff
   <<
   \context Staff = upper \with {  fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
	                                              \voiceOne g'8[ aes] g8[ f8 g8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  \ln ees4 ees8[ d d] \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  \ln c'4  \ln bes4. \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
			          \voiceFour c8[ aes8] ees'8[ bes8 g8] \bar "||" }}
			        >> 
   >>
   
\midi {  
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) } }
      }
	

} %book bracket