%%% 104png
%%% Hymn 49 Creator of the Earth and Sky
%%% Version 5


\version "2.10.19"

\include "gregorian-init.ly"

\header {
  dedication = \markup { \center-align {  "THE CHRISTIAN YEAR - FROM THE EPIPHANY TILL LENT"
		\hspace #0.1 }}	
  title = "49"
  
  arranger = \markup { \small { "Mode iv." }}
  
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%% Macro Definitions

%% macro settings for stemless long note which is 2x duration of regular white note    
ln = {\once \override NoteHead #'duration-log = #0 
           \once \override Stem #'stencil = ##f
           \once \override NoteColumn #'force-hshift = #'0.4 }

%% needed to prevent an accidental from showing	   
noacci = { \once \override Accidental #'transparent = ##t }
	   
%%%%%%%%%%%%%%%%%%%%%%% End of Macro Definitions

%%% plainsong voice

plainsong = \context VaticanaVoice  {  \relative c { 
	\clef "vaticana-do3"
	\set fontSize = #3
        \key c \major 
  f8 e8 g8 \[ a8 \flexa g8 \] f8 \[ g8 \pes a8 \] \[ \virga g8 \inclinatum f8 \inclinatum e8\] e8 \bar "|" 
      d8 \[ d8 \pes a'8 \] \bar "" \break
  a8 a8 \[ a8 \flexa g8 \] \[ a8 \pes c8 \] \[ a8 \flexa g8 \] \[ g8 \pes a8 \] \bar "|" 
      a8 a8 g8 \[ a8 \flexa  g8 \] \bar "" \break
  f8 g8 \[ f8 \flexa  e8 \] d8 \bar "|" f8 e8 g8 \[ a8 \flexa g8 \] f8 \[ g8 \pes a8 \] 
      \[ \virga g8 \inclinatum f8 \inclinatum e8\] e8 \bar "||" 	
  }
}

%%% SATB voices

global = {
  \key ees \major 
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
	\autoBeamOff

  aes'8 g8 bes8 c8[ bes8] aes8 bes8[ c8] bes8[ aes8 g8] g8 \bar "|" 
      f8 f8[ c'8] 
  c8 c8 c8[ bes8] c8[ ees8] c8[ bes8] bes8[ c8] \bar "|" 
      c8 c8 bes8 c8[ bes8 ]
  aes8 bes8 aes8[ g8] f8 \bar "|" 
      aes8 g8 bes8 c8[ bes8] aes8 bes8[ c8] bes8[ aes8 g8] g8 \bar "||" 
}

alto = \relative c' {
	\autoBeamOff
	
  ees8 ees8 ees8 \ln ees4 c8 \ln ees4 ~ \ln ees4. ~ ees8 \bar "|" 
      c8 \ln c4 
  f8 ees8 \ln ees4 ~ \ln ees4 ~ ees8[ g8] \ln g4 \bar "|" 
      ees8 ees8 g8 \ln g4 
  f8 g8 \ln ees4 d8 \bar "|" 
      ees8 ees8 ees8 \ln ees4 c8 \ln ees4 ~ \ln ees4. d8 \bar "||" 
}

tenor = \relative c { \clef bass
	\autoBeamOff

  aes'8 bes8 g8 aes8[ g8] aes8 \ln g4 ~ g8[ aes8 bes8] bes8 \bar "|" 
      aes8 \ln aes4 ~ 
  aes8 g8 aes8[ bes8] aes8[ c8] \ln ees4 d8[ ees8] \bar "|" ees8 ees8 ees8 \ln ees4 
  c8 ees8 c8[ bes8] bes8 \bar "|" 
        aes8 bes8 g8 \ln g4 aes8 \ln g4 ~ g8[ aes8 bes8] bes8 \bar "||" 
}

bass = \relative c { \clef bass
	\autoBeamOff
	
 c8 ees8 ees8 aes,8[ ees'8] f8 \ln ees4 ~ \ln ees4. ~ ees8 \bar "|" 
     f8 \ln f4 ~ 
 f8 c8 aes'8[ g8] \ln aes4 aes8[ ees8] g8[ c,8] \bar "|" aes'8 aes8 ees8 c8[ ees8] 
 f8 ees8 aes,8[ ees'8] bes8 \bar "|" 
     c8 ees8 ees8 c8[ ees8] f8 \ln ees4 ~ \ln ees4. g8 \bar "||" 
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

} %%% score bracket

%%% A separate score block minus the Vaticana staff to generate the midi
%%% Since the minims are quavers in disguise, the tempo has to be adjusted accordingly. A tempo of 2=80 is set.

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
	\column {
		\line { \small { \hspace #10 \smallCaps "Office Hymn." \italic "Saturday," "E." \hspace #25 \italic "St. Ambrose, 340-97.   Tr. C. B."  }  }
	    \line { \hspace #40 \small "Deus Creator omnium."}
} }
   
\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "C" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "REATOR of the earth and sky,"  "  Ruling the firmament on high,"} }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Clothing the day with robes of light,"
					   "Blessing with gracious sleep the night,"
			  		}}
			       
			           } %% end of verse 1	
		
		}  
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
			     "That rest may comfort weary men,"
			     "And brace to useful toil again,"
			     "And soothe awhile the harassed mind,"
			     "And sorrow's heavy load unbind:"
			}}
           	  \hspace #1  % adds vertical spacing between verses  
		  \line { "3  "
		    \column {	     
			    "Day sinks; we thank thee for thy gift;"
			    "Night comes; and once again we lift"
			    "Our prayer and vows and hymns that we"
			    "Against all ills may shielded be."
			}}
		\hspace #1 % adds vertical spacing between verses  
           	\line {"4  "
		    \column {	     
			    "Thee let the secret heart acclaim,"
			    "Thee let our tuneful voices name,"
			    "Round thee our chaste affections cling,"
			    "Thee sober reason own as King."
			}} 
		\hspace #1 % adds vertical spacing between verses  
           	\line {"5  "
		    \column {	     
			    "That when black darkness closes day,"
			    "And shadows thicken round our way,"
			    "Faith may no darkness know, and night"
			    "From faith's clear beam may borrow light."
		}}
		\hspace #1 % adds vertical spacing between verses  
           	\line {"6  "
		    \column {	     
			    "Rest not, my heaven-born mind and will;"
			    "Rest, all ye thoughts and deeds of ill;"
			    "May faith its watch unwearied keep,"
			    "And cool the dreaming warmth of sleep."
		}}
		\hspace #1 % adds vertical spacing between verses  
           	\line {"7  "
		    \column {	     
			    "From cheats of sense, Lord, keep me free,"
			    "And let my heart's depth dream of thee;"
			    "Let not my envious foe draw near,"
			    "To break my rest with any fear."
		}}
		\hspace #1 % adds vertical spacing between verses
           	\line { "8. "
		   \column {	     
			   "Pray we the Father and the Son,"
			   "And Holy Ghost: O Three in One,"
			   "Blest Trinity, whom all obey,"
			   "Guard thou thy sheep by night and day.     Amen." 
     			}}
	  }
} %%% lyric markup bracket

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
	                                              \voiceOne g'8[ aes8] g8[ f8 g8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo \ln ees4 ees8[ d8 d8] \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  bes'8[ c8] \ln bes4 ~ bes8 \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour ees8[ aes,8] ees'8[ bes8 g8] \bar "||" }}
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

%%% Separate score block for Amen midi minus plainsong voice
%%% Since the minims are quavers in disguise, the tempo has to be adjusted accordingly. A tempo of 2=80 is set.

\score {  	
 \new ChoirStaff
   <<
   \context Staff = upper \with {  fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
	                                              \voiceOne g'8[ aes8] g8[ f8 g8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo \ln ees4 ees8[ d8 d8] \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  bes'8[ c8] \ln bes4 ~ bes8 \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour ees8[ aes,8] ees'8[ bes8 g8] \bar "||" }}
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
