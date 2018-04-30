%%% 106png
%%% Hymn 50 This Day the first of days was made
%%% Version 4


\version "2.10"

\include "gregorian-init.ly"

\header {
  dedication = \markup { \center-align {  "THE CHRISTIAN YEAR - FROM THE EPIPHANY TILL LENT"
		\hspace #0.1 }}	
  title = "50"
  arranger = \markup { \small { "Mode iv." }}
  tagline =""
}

%%%%%%%%%%%%%%%%%% Macro Definitions

%% macro settings for stemless long note which is 2x duration of regular white note    
ln = {\once \override NoteHead #'duration-log = #0 
           \once \override Stem #'stencil = ##f
           \once \override NoteColumn #'force-hshift = #'0.4 }
	   
%%%%%%%%%%%%%%%%% End of macro definitions	   
	   
%%% plainsong voice

plainsong = \context VaticanaVoice  {  \relative c { 
	\clef "vaticana-do3"
	\set fontSize = #3
        \key c \major 
	
  d8 e8 f8 g8 \[ e8 \pes g8 \] f8 e8 f8 \bar "|" d8 e8 f8 g8 \bar "" \break
  \[ e8 \pes g8 \] f8 e8 \[ d8\melisma e8 d8\melismaEnd \] \bar "|" e8 c8 e8 \[ g8 \pes  a8 \] \override Accidental #'extra-offset = #'(-1.4 . 0 ) \[a8 \pes bes8 \] \bar "" \break
  a8 g8 a8 \bar "|" a8 a8 a8 g8 f8 g8 f8 e4 \bar "||" 
}
}

%%% SATB voices

global = {
  \key d \major 
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
	\autoBeamOff

  e8 fis8 g8 a8 fis8[ a8] g8 fis8 g8 \bar "|" e8 fis8 g8 a8 \bar ""
  fis8[ a8] g8 fis8 e8[ fis8 e8] \bar "|" fis8 d8 fis8 a8[ b8] b8[ c!8] \bar ""
  b8 a8 b8 \bar "|" b8 b8 b8 a8 g8 a8 g8 \ln fis4 \bar "||" 
}

alto = \relative c' {
	\autoBeamOff
	
  \ln b4. e8 \ln d4 ~ \ln d4 ~ d8 \bar "|" cis8 \ln d4 cis8 \bar "" 
  a8[ d8] \ln d4 \ln cis4. \bar "|" \ln d4 ~ d8 e8[ d8] \ln e4 \bar ""
  \ln d4 ~ d8 \bar "|" d8  
      \once \override NoteHead #'duration-log = #-1  
      \once \override NoteColumn #'force-hshift = #3
      d\breve*1/4
  fis8 e8 \ln cis4 \bar "||" 
}

tenor = \relative c { 
	\clef bass
	\autoBeamOff

  g'8 a8 b8 cis8 a8[ fis8] g8 a8 b8 \bar "|" a8 a8 g8 e8 \bar ""
  d8[ fis8] g8 a8 \ln a4. \bar "|" a8 fis8 a8 a8[ fis8] \ln g4 \bar ""
  g8 fis8 ~ fis8 \bar "|" fis8 \ln g4 fis8 g8 d'8 b8 \ln a4 \bar "||" 
}

bass = \relative c { 
	\clef bass
	\autoBeamOff
	
  \ln e4. a,8 \ln d4 b8 d8 g,8 \bar "|" a8 d8 b8 a8 \bar "" 
  \ln d4 b8 d8 a'8[ fis8 a8] \bar "|" \ln d,4. cis8[ b8] e8[ c!8] \bar ""
  g'8 d8 b8 \bar "|" b8 \ln g4 d'8 b8 d8 e8 \ln fis4 \bar "||" 
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

%%% Score block

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
  
  % *** Needed to produce beamed minims - which are quavers in disguise
  \context { \Staff \override NoteHead #'duration-log = #1 }
  \context { \Staff \override Stem #'flag-style = #'no-flag }
  
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

%%% A separate score block to generate midi minus the plainsong voice
%%% Since the minims are quavers in disguise, the tempo has to be adjusted accordingly. Tempo set for 2=80

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
  \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) }
       } 
}

%%% Lyrics markups

\markup {
	\column { \small {
		\line { \hspace #14 \smallCaps "Office Hymn." \italic "Sunday," "M." \hspace #45  \center-align { \italic "Ascribed to St. Gregory the Great,"
		                                                                                                      \italic "6th cent.  Tr. Y. H." } }
	    \line { \hspace #42 \small "Primo dierum omnium."}
} } } 

  
\markup { \hspace #30 %%add space as necc. to center the column
	              \column { %%% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HIS day the first of days was made,"  "  When God in light the world arrayed;"} }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Or when his Word arose again,"
					   "And, conquering death, gave life to men."
			  		}}
			       
			           } %%% finish verse 1			
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
%%% Continuation of lyrics

\markup { \hspace #30   %%add space as necc. to center the column
          \column { 
           	\line { "2  "
		   \column {	     
			"Slumber and sloth drive far away;"
			"Earlier arise to greet the day;"
			"And ere its dawn in heaven unfold"
			"The heart's desire to God be told:"
			}}
		  \hspace #1 % adds vertical spacing between verses  
		  \line { "3  "
		    \column {	     
			    "Unto our prayer that he attend,"
			    "His all-creating power extend,"
			    "And still renew us, lest we miss"
			    "Through earthly stain our heavenly bliss."
			}}
		\hspace #1 % adds vertical spacing between verses  
           	\line {"4  "
		    \column {	     
			    "That us, who here this day repair"
			    "To keep the Apostles' time of prayer,"
			    "And hymn the quiet hours of morn,"
			    "With blessèd gifts he may adorn."
			}} 
		\hspace #1 % adds vertical spacing between verses  
           	\line {"5  "
		    \column {	     
			    "For this, Redeemer, thee we pray"
			    "That thou wilt wash our sins away,"
			    "And of thy loving-kindness grant"
			    "Whate'er of good our spirits want:"
		}}
		\hspace #1 % adds vertical spacing between verses  
           	\line {"6  "
		    \column {	     
			    "That exiles here awhile in flesh"
			    "Some earnest may our souls refresh"
			    "Of that pure life for which we long,"
			    "Some foretaste of the heavenly song."
		}}
		\hspace #1 % adds vertical spacing between verses  
           	\line {"7. "
		    \column {	     
			    "O Father, that we ask be done,"
			    "Through Jesus Christ, thine only Son;"
			    "Who, with the Holy Ghost and thee,"
			    "Doth live and reign eternally.     Amen."
		}}
	  }
} %% lyric markup bracket

%%% Amen score block

\score {  	
  <<
    <<
  \new VaticanaStaff <<
  \context VaticanaVoice = "plainsongamen"  {  \relative c { 	  
	\set Score.timing = ##f
	\override Staff.Clef #'#'font-size = #3
	\clef "vaticana-do3"
	\set fontSize = #3
	\override Staff.StaffSymbol #'staff-space = #1.6
	 
        \[ e8 \pes f8 \]   \[
	    \override NoteHead #'extra-offset = #'(0.0 . 0.0 ) e8 
            \override NoteHead #'extra-offset = #'(-0.38 . 0) \flexa  d8 \pes 
            \override NoteHead #'extra-offset = #'(0.02 . 0.05) e8 \] }} 
                    >>
  
 \new Lyrics = "lyrics" { s1 }
 \new ChoirStaff
   <<
   \context Staff = upper \with {  fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
	                                              \voiceOne fis8[ g8] fis8[ e8 fis8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo \ln d4 d8( \ln cis4) \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  a'8[ b8] \ln a4. \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour d8[ g,8] d'8[ a8 fis8] \bar "||" }}
			        >> 
   >>
  \context Lyrics = "lyrics" \lyricsto "altos" { \override LyricText #'font-size = #-1  A -- men. }
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

%%% A separate score block for the Amen midi minus the plainsong voice
%%% Since the minims are quavers in disguise, the tempo has to be adjusted accordingly. Tempo set for 2=80


\score {  	
 \new ChoirStaff
   <<
   \context Staff = upper \with {  fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
	                                              \voiceOne fis8[ g8] fis8[ e8 fis8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo \ln d4 d8( \ln cis4) \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  a'8[ b8] \ln a4. \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour d8[ g,8] d'8[ a8 fis8] \bar "||" }}
			        >> 
   >>

\midi {  
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 80 8)
            }
       }
}
	
} %% book bracket
