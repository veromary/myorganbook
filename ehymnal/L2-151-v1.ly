%%% 242.png
%%% Hymn 151 Rejoice! the year upon its way.
%%% Ver 1

\version "2.10"

\include "gregorian-init.ly"

\header {
  dedication = \markup { \center-align {  "THE CHRISTIAN YEAR - WHITSUNTIDE"
		\hspace #0.1 }}	
  title = "151"
  
  arranger = \markup { \small { "Mode i." }}
  
  tagline =""
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%% macro settings for stemless long note which is 2x duration of regular white note    

ln = {\once \override NoteHead #'duration-log = #0 
           \once \override Stem #'stencil = ##f
           \once \override NoteColumn #'force-hshift = #0.4 }

%% a second set of macro settings for stemless long notes ( 2x duration of regular white note )
%% this one uses X-offset instead of force-hshift.
%% All long notes are offset slightly to the right with respect to any beamed notes which 
%% they are aligned with.  Normally, this is done with force-hshift.  
%% However, when 2 long notes occur one atop the other (i.e. in S + A pats or in T + B parts), then applying force-hshift
%% to both does not work.  Hence one note needs to be moved with the regular force-hshift in the \ln macro above,
%% while the other is moved with X-offset with the macro \lnb
%% In general force-hshift is preferred whenever possible as slurs are adjusted automatically, while X-offset especially
%% when used with a bottom slur often results in a slur starting too far to the left and which then needs manual adjustment. 

lnb = {\once \override NoteHead #'duration-log = #0 
           \once \override Stem #'stencil = ##f
           \once \override NoteHead #'X-offset = #0.8 }

%% macro settings for stemless long note which is 2x duration of regular white note. This one where a bit
%% more rightwards offset is needed.    

lnc = {\once \override NoteHead #'duration-log = #0 
           \once \override Stem #'stencil = ##f
           \once \override NoteColumn #'force-hshift = #1.6 }
	   
%%% settings to generate the double longnotes (breves)

brevenote = { \once \override NoteHead #'duration-log = #-1  
                \once \override NoteColumn #'force-hshift = #0.8 }

%%% same as \brevenote but modified for the same reason as \lnb is modified for \ln		
		
brevenoteb = { \once \override NoteHead #'duration-log = #-1  
                \once \override NoteHead #'X-offset = #1.6 }		

%% suprresses printing of accidental
noacci = \once \override Accidental #'transparent = ##t

%% moves plainsong accidentals leftwards so that they show up more clearly
moveacci = \once \override Accidental #'extra-offset = #'(-1.2 . 0 )


%%%%%%%%%%%%%%%%%%%%%%%% End of Macro definitions

%%% plainsong voice

plainsong = \context VaticanaVoice  {  \relative c { 
	\clef "vaticana-fa2"
	\set fontSize = #3
        \key c \major 

  \[ c8 \pes d \]  \[ d \pes a' \moveacci \virga bes \]  a a \[ a \flexa g \]  \[ g \pes a \]  g \[ g \flexa f \] \bar "|" a a g \bar "" \break

  \[ f \flexa e \]  d \[ e \pes f \]  \[ d \flexa c \]  \[ c \pes d \]  \bar "|" a \[ c \pes d \]  d \[ d \pes f \]  \[ f \flexa d \]  \bar "" \break

  e d c \bar "|" g' g f \[ g \pes a \flexa g \]  \[ e \flexa d \]  \[ e \pes f \]  \[ d \flexa c \]  \[ c \pes d \]  \bar "||"
} }
  

%%% SATB voices

global = {
  \key ees \major 
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
	\autoBeamOff
  ees8[ f] f[ c' des] c c c[ bes] bes[ c] bes bes[ aes] \bar "|" c c bes \bar "" \break
  aes[ g] f g[ aes] f[ ees] ees[ f] \bar "|" c ees[ f] f f[ aes] aes[ f] \bar "" \break
  g f ees \bar "|" bes' bes aes bes[ c bes] g[ f] g[ aes] f[ ees] ees[ f] \bar "||"
}

alto = \relative c' {
	\autoBeamOff
  \ln c4 \ln f4. ~ f8 aes aes[ ees] \ln ees4 ~ ees8 ees[ c] \bar "|" aes' aes g \bar "" \break
  \ln c,4 ~ c8 \ln ees4 des8[ c] bes[ aes] \bar "|" c \ln c4 ~ c8 ~ \brevenote c\breve *1/4 \bar "" \break
  ees8 d! ees \bar "|" ees ees c \ln ees4. ~ ees8[ c] \ln ees4 des8[ c] \ln c4 \bar "||"
}

tenor = \relative c { \clef bass
	\autoBeamOff
  \ln aes'4 \ln aes4. ~ aes8 c8 c8[ ees] ees[ aes, ~ ] aes8 g[ aes] \bar "|" ees' ees ees \bar "" \break
  \ln c4 ( aes8 ) \ln c4 \ln aes4 ees8[ c] \bar "|" aes'8 ~ \lnc aes4 ~ aes8 ~ \brevenote aes\breve *1/4 \bar "" \break
  bes8 ~ bes g \bar "|" g g f \ln g4. bes8[ aes] \ln c4 \ln aes4 g8[ aes] \bar "||"
}

bass = \relative c { \clef bass
	\autoBeamOff	
  aes'8[ f] \lnb f4( des8) f f f[ g] g[ aes] ees ees[ aes] \bar "|" aes aes ees \bar "" \break
  \lnb f4 ~ f8 \lnb c4 des8[ aes] g[ f] \bar "|" aes' ~ aes[ f ~ ] f  ~ \brevenoteb f\breve *1/4 \bar "" \break
  ees8 bes ees \bar "|" ees ees f \lnb ees4. ~ ees8[ f] \lnb c4 des8[ aes] c[ f,] \bar "||"
}


#(ly:set-option 'point-and-click #f)

\book {

\paper {
 #(set-paper-size "a4")
%% annotate-spacing = ##t
 print-page-number = ##f
 ragged-last-bottom = ##t
% ragged-bottom = ##t
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

%%% A separate score block to generate the midi minus the plainsong voice
%%% Since minims are quavers in disguise, tempo has to be set accordingly, tempo set to 2=80

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


%%% Lyric titles and attributions

\markup { \hspace #8 \small {  \smallCaps  "Office Hymn." \italic "Daily till Trinity Sunday." "E." \hspace #30 \italic "c. 4th cent.  Tr. R. E. R." } }

\markup { \hspace #44 \small "Beata nobis gaudia." }


%%% Lyrics

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "R" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "EJOICE! the year upon its way"
			                                 "  Has brought again that blessèd day," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "When on the chosen of the Lord"
					   "The Holy Spirit was outpoured."
			  		}}
		      } %%end verse 1
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
		  	\hspace #1  % adds vertical spacing between verses  
           		\line { "2  "
			   \column {	     
				   "On each the fire, descending, stood"
				   "In quivering tongues' similitude—"
				   "Tongues, that their words might ready prove,"
				   "And fire, to make them flame with love."
			}}
		        \hspace #1  % adds vertical spacing between verses 
			\line { "3  "
				\column {	     
					"To all in every tongue they spoke;"
					"Amazement in the crowd awoke,"
					"Who mocked, as overcome with wine,"
					"Those who were filled with power divine."
			}}
			\hspace #1 % adds vertical spacing between verses  
			\line {"4  "
				\column {	     
					"These things were done in type that day,"
					"When Eastertide had passed away,"
					"The number told which once set free"
					"The captive at the jubilee."
			}} 
			\hspace #1 % adds vertical spacing between verses  
			\line {"5  "
				\column {	     
					"And now, O holy God, this day"
					"Regard us as we humbly pray,"
					"And send us, from thy heavenly seat,"
					"The blessings of the Paraclete."
			}}
			\hspace #1 % adds vertical spacing between verses
			\line { "6. "
				\column {	     
					"To God the Father, God the Son,"
					"And God the Spirit, praise be done;"
					"May Christ the Lord upon us pour"
					"The Spirit's gift for evermore.     Amen."
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
	\clef "vaticana-fa2"
	\set fontSize = #3
	\override Staff.StaffSymbol #'staff-space = #1.6
	 
        \[ d8 \pes e8 \]   \[
	    \override NoteHead #'extra-offset = #'(0.0 . -0.1 ) d8 
            \override NoteHead #'extra-offset = #'(-0.38 . 0.0 ) \flexa  c8 \pes 
            \override NoteHead #'extra-offset = #'(0.02 . 0.05) d8 \] }} 
                    >> 
 \new Lyrics = "lyrics" { s1 }
 \new ChoirStaff
   <<
   \context Staff = upper \with {  fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
	                                              \voiceOne f8[ g] f8[ ees8 f8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  c8[ ees] des8 \ln c4 \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  aes'8[ c] \ln aes4. \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour f8[ c8] des8[ aes8 f8] \bar "||" }}
			        >> 
   >>
  \context Lyrics = "lyrics" \lyricsto "sopranos" { \override LyricText #'font-size = #-1  "  A   " -- _ "   men." }
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
	                                              \voiceOne f8[ g] f8[ ees8 f8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  c8[ ees] des8 \ln c4 \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  aes'8[ c] \ln aes4. \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour f8[ c8] des8[ aes8 f8] \bar "||" }}
			        >> 
   >>
   
\midi {  
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) } }
      }
   

} %% book bracket
