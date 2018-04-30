%%% 340b.png
%%% Hymn 215
%%% Version 1

\version "2.10"

\include "gregorian-init.ly"

\header {
  dedication = \markup { \center-align {  "SAINTS' DAYS: ST. MARY THE VIRGIN"
		\hspace #0.1 }}	

  title = "215"
  
  arranger = \markup { \small { "Mode ii." }}
  
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

%% moves plainsong accidentals leftwards so that they show up more clearly. Second one does the same but by a smaller amount
moveacci = \once \override Accidental #'extra-offset = #'(-1.2 . 0 )

moveaccib = \once \override Accidental #'extra-offset = #'(-0.8 . 0 )

%% music function to allow lyrics to skip a given number of note-syllables
%% skips #7 will skip over 7 music note-syllables. Needed to align lyrics which begin partway
%% through the music

skips = #(define-music-function (parser location times) (number?)
     #{
	     \repeat unfold $times { \skip 1}
       #})

%%%%%%%%%%%%%%%%%%%%%%%% End of Macro definitions

%%% plainsong voice

plainsong = \context VaticanaVoice  {  \relative c { 
	\clef "vaticana-do3"
	\set fontSize = #3
        \key c \major 

  g'8 \[ \virga g \inclinatum f \inclinatum e  f8 \] \[ d \flexa c \] f8 \[ g \pes \moveacci bes  \] \[ bes \flexa a \] g a \bar "|" c  \[ c \flexa \moveacci bes! \]  a \bar "" \break    

  \once \override Score.SeparationItem #'padding = #4 \[ \moveaccib bes! \flexa a \] g \[ a \flexa g \] \[ f \pes g \] g \bar "|" \[ g \pes c \] c  \[ c \flexa \moveacci bes! \] c \[ c \pes d \flexa c \] \[  bes \flexa a \] g4 \bar "" \break
  
  \[ g8 \pes a \inclinatum g \inclinatum f \] \bar "|" \[ \moveaccib bes! \flexa a \] \[ bes \pes c \] a \[ bes \flexa a \] g \[ a \flexa g \] \[ f \pes g \] g \bar "||" 
  
%%%Amen bit  
  
  \[ g \pes a \] \[
	    \override NoteHead #'extra-offset = #'(0.0 . -0.1 ) g8 
            \override NoteHead #'extra-offset = #'(-0.38 . 0.0 ) \flexa  f8 \pes 
            \override NoteHead #'extra-offset = #'(0.02 . 0.05) g8 \] \bar "||"
  
}}
  

%%% SATB voices

global = {
  \key f \major 
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
	\autoBeamOff
  \tag #'Tune { g'8 g[ f e f] d[c] f g[ bes] bes[ a] g a \bar "|" c c[ bes] a \bar "" \break
  bes[ a] g a[ g] f[ g] g \bar "|" g[ c] c c[ bes] c c[ d c] bes[ a] g[f] \bar "" \break
  g[ a g f] \bar "|" bes[ a] bes[ c] a bes[a] g a[ g] f[ g] g \bar "||" }
  
  \tag #'Amen { g[ a] a[f g] \bar "||" }
}

alto = \relative c' {
	\autoBeamOff
  \tag #'Tune { bes8 bes( \ln c4.) bes8[ a ~] a c[ d] d[ c] e f \bar "|" e \ln f4 ~ f8 \bar "" \break
  \ln f4 e8 f[ d] \ln d4 d8 \bar "|" d8[ f] f f[ d] f \ln f4. \ln d4 ~ d8 c] \bar "" \break
  d[ f e f] \bar "|" \ln f4 ~ f8[ g] f \ln f4 e8 \ln e4 d8[e] d \bar "||" }
  
  \tag #'Amen { d8[f] \ln d4. \bar "||" }
}

tenor = \relative c { \clef bass
	\autoBeamOff
  \tag #'Tune { d8 d( \ln f4.) ~ \ln f4 ~ f8 e8[ d] d[ f] c' c \bar "|" a a[ bes] c \bar "" \break
  d[ c] ~ c c[ bes] a[ bes] bes \bar "|" bes[ a] a a[ g] a \ln a4. \ln bes4 ~ bes8[ c] \bar "" \break
  bes8[ c c a] \bar "|" \ln f4 ~ f8[ c'] ~ c d[ c] ~ c \ln c4 a8[ c] bes \bar "||" }
  
  \tag #'Amen { bes[ c] bes[ a bes] \bar "||" }
}

bass = \relative c { \clef bass
	\autoBeamOff	
  \tag #'Tune { g8 g \lnb a4. bes8[ f'] ~ f c[ g] g a] c f \bar "|" a f[ d] f \bar "" \break
  bes,[ f'] c f[ g] d[ g,] g \bar "|" g'[ f] f f[ g] f \lnb f4. \lnb g4 ~ g8[ a] \bar ""
  g[ f d f] \bar "|" \lnb d4 ~ d8[ e] f bes,[ f'] c a[ c] d[ c] g \bar "||" }
  
  \tag #'Amen { g'[ f] g[ d g,] \bar "||" }
}


inlinelyrics = \lyricmode {
  \override LyricText #'font-size = #-1.	
  \skips #32 A -- men.
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
		      
	\new Lyrics \lyricsto sopranos {  \set alignAboveContext = #"upper" \override LyricSpace #'minimum-distance = #1 \inlinelyrics } 
		      
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

%%% A separate score block to generate the midi minus the plainsong voice. This midi is for the main tune only.
%%% Since minims are quavers in disguise, tempo has to be set accordingly, tempo set to 2=80

\score {	
  \new ChoirStaff <<
   \new Staff = "upper" <<
     \context Voice = sopranos {\voiceOne \global \removeWithTag #'Amen \soprano }
     \context Voice = altos {\voiceTwo \global \removeWithTag #'Amen \alto }
                      >> 
   \new Staff = "lower" <<
     \context Voice = tenors {\voiceOne \global \removeWithTag #'Amen \tenor }
     \context Voice = bass {\voiceTwo \global \removeWithTag #'Amen \bass }
	             >> 
		 >>  

\midi { 
  \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) }
       } 
}


%%% A separate score block to generate the midi for the Amen only, again minus the plainsong voice.

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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) }}      
  	
	
} %%% Score bracket

\markup { "                 "  }  %%% force some blank space between score and lyrics
\markup { "                 "  }  %%% force some blank space between score and lyrics

%%% Lyric titles and attributions

\markup { \hspace #8 \small {  \column { \line {\smallCaps  "Office Hymn."  " M." \italic "Conception,"  \hspace #50 \italic "c. 9th cent." }    
	\line { \italic "Annunciation, Nativity, B.V.M." \hspace #52 \italic "Tr. P. D."  } 
	\line { \hspace #36 "O gloriosa Femina." }
}}}



%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.4 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 " GLORIOUS Maid, exalted far"
			                                "  Beyond the light of burning star," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "From him who made thee thou hast won"
					   "Grace to be Mother of his Son."
			  		}}
		      } 


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

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
		  	\hspace #1  % adds vertical spacing between verses  
			\line { "2  "
			   \column {
				   "That which was lost in hapless Eve"
				   "Thy holy Scion did retrieve:"
				   "The tear-worn sons of Adam's race"
				   "Through thee have seen the heavenly place."
				    "         " %%% adds blank spacing between verses
		       }}
			   \line { "3  "
			   \column {	     
				   "Thou wast the gate of heaven's high Lord."
				   "The door through which the light hath poured."
				   "Christians rejoice, for through a Maid"
				   "To all mankind is life conveyed!"
				  "           " %%% adds vertical spacing between verses
			}}	
			\line { "4. "
				\column {	     
					"All honour, laud, and glory be,"
					"O Jesu, Virgin-born to thee;"
					"All glory, as is ever meet,"
					"To Father and to Paraclete.   Amen."
     			}}

	  }
} %%% lyric markup bracket


} %% book bracket
