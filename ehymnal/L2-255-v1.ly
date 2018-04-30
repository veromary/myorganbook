%%% 401.png
%%% Hymn 255  Come, Holy Ghost, with God the Son
%%% Version 1


\version "2.10"

\include "gregorian-init.ly"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—MORNING"
	                                        \hspace #0.1 }}	

  title = "255"
  
  arranger = \markup { \small { "Mode iv." }}
  
  tagline =""
}

%%%%%%%%%%%%%%%% Macros

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

%%% settings to generate the double longnotes (breves)

brevenote = { \once \override NoteHead #'duration-log = #-1  
                \once \override NoteColumn #'force-hshift = #0.4 }

%%% same as above but used for the bottom note when two breves are stacked one atop
%%% the other.
		
brevenoteb = { \once \override NoteHead #'duration-log = #-1  
                \once \override NoteHead #'X-offset = #0.8 }
		
	   
	   
%%% macro settings for  black notes 1/2 the duration of regular stemmed white notes    

crotchet = { \once \override NoteHead #'duration-log = #2  }

%% music function to allow lyrics to skip a given number of note-syllables
%% skips #7 will skip over 7 music note-syllables. Needed to align lyrics which begin partway
%% through the music

skips = #(define-music-function (parser location times) (number?)
     #{
	     \repeat unfold $times { \skip 1}
       #})


%%%%%%%%%%%%% End of Macro Definitions		
	

%%% plainsong voice

plainsong = \context VaticanaVoice  {  \relative c { 
	\clef "vaticana-do3"
	\set fontSize = #3
        \key c \major 

  e8 e \[ e \pes d \] e \[ d \flexa c \] d \[ d \pes e \] e \bar "|" \[ f f \flexa e \] d \[ d \pes a' \] a \[ a \flexa g \] \bar "" \break
  \[ f \flexa e \] \[ d \pes e \] e \bar "|" e \[ g \pes a \] \[ a \flexa g \] \[ a \pes c c \flexa b \] \[ a \flexa g \] a \[ g \flexa f \] e \bar "|" \break
  \[ f f \flexa e \] d \[ d \pes a' \] a g \[ f \flexa e \] \[ d \pes e \] e \bar "||"
  
  %%Amen
  \[ e \pes f \] 
    \override NoteHead #'extra-offset = #'(2.0 . -0.1 ) \[ e8 
    \override NoteHead #'extra-offset = #'(1.64 . 0.0 ) \flexa  d8 \pes 
    \override NoteHead #'extra-offset = #'(2.02 . 0.05) e8 \] 
   \bar "||"
}} 
  
%%% SATB voices

global = {
  \key ees \major 
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
	\autoBeamOff
  \tag #'main { g'8 g8 g8[ f8] g8 f8[ ees8] f8 f8[ g8] g8 \bar "|" aes8[ ~ aes8  g8] f8 f8[ c'8] c8 c8[ bes8] 
  aes8[ g8] f8[ g8] g8 \bar "|" g8 bes8[ c8] c8[ bes8] c8[ ees8 ~ ees8 d8] c8[ bes8] c8 bes8[ aes8] g8 \bar "|" 
  aes8[ ~ aes8 g8] f8 f8[ c'8] c8 bes8 aes8[ g8] f8[ g8] g8  \bar "||" }

  \tag #'Amen { g8[ aes8] g8[ f8 g8] \bar "||" }
}


alto = \relative c' {
	\autoBeamOff
  \tag #'main { d8 ees8 \ln d4 ~ d8 \ln c4 d8 d8[ ees8] ees8 \bar "|" \ln ees4. c8 c8[ f8] ees8 \ln g4 \bar "" 
  \ln c,4 d8[ ees8] ees8 \bar "|" ees8 \brevenote ees\breve * 1/4 ~ \brevenote ees\breve * 1/4 ~ ees8[ g8] g8 \ln f4 d8 \bar "|"
  \ln ees4. c8 des8[ ees8] ~ ees8 ees8 \ln ees4 c8[ d!8] d8 \bar "||" }
  
  \tag #'Amen { \ln ees4 ~ ees8 ( \ln d4 ) \bar "||" }
}


tenor = \relative c { \clef bass
	\autoBeamOff
  \tag #'main { bes'8 bes8 \ln bes4 ~ bes8 f8[ g8] bes8 ~ \ln bes4 ~ bes8 \bar "|" \ln aes4 ( c8 ) aes8 \ln aes4 g8 \ln g4 
  \ln aes4 aes8[ bes8] bes8 \bar "|" bes8 \brevenote g\breve * 1/4  ~ \brevenote g\breve * 1/4 aes8[ bes8] g8 \ln c4 bes8 \bar "|" 
  \ln aes4 c8 aes8 \ln aes4 ~ aes8 g8 aes8[ c8] c8[ bes8] bes8 \bar "||" }
  
  \tag #'Amen { bes8[ aes8] \ln bes4. \bar "||" }
}


bass = \relative c { \clef bass
	\autoBeamOff		
  \tag #'main { g'8 ees8 \lnb bes4 g8 aes8[ c8] bes8 bes8[ ees8] ees8 \bar "|" \lnb c4. f8 \lnb f4 c8 \lnb ees4 
  \lnb f4 f8[ ees8] ees8 \bar "|" g8 \brevenoteb ees\breve * 1/4  \brevenoteb c\breve * 1/4 c8[ ees8] ees8 \lnb f4 g8 \bar "|" 
  \lnb c,4. f8 des8[ c8] aes8 ees'8 \ln c4 aes'8[ g8] g8 \bar "||" }
  
  \tag #'Amen { ees8[ c8] ees8[ bes8 g8] \bar "||" }
}

inlinelyrics = \lyricmode {
  \override LyricText #'font-size = #-1.	
  \skips #32 A -- "     men."
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

%%% A separate score block to generate the midi minus the plainsong voice
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


%%% A separate score block to generate the midi minus the plainsong voice for the Amen only
%%% Since minims are quavers in disguise, tempo has to be set accordingly, tempo set to 2=80

\score {	
  \new ChoirStaff <<
   \new Staff = "upper" <<
      \context Voice = sopranos {\voiceOne \global \keepWithTag #'Amen \soprano }
      \context Voice = altos {\voiceTwo \global \keepWithTag #'Amen \alto }
                      >> 
   \new Staff = "lower" <<
      \context Voice = tenors {\voiceOne \global \keepWithTag #'Amen \tenor }
      \context Voice = bass {\voiceTwo \global \keepWithTag #'Amen \bass }
	             >> 
		 >>  

\midi { 
  \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) }
       } 
}



%%% Hymn Note markup

\markup { \hspace #54 \center-align { \line { \smallCaps "Note" \hspace #-1.2 ".—" \italic "If a Modern Tune is required for this hymn, it may be sung to" }
                          \line { \smallCaps "Melcombe" "(" \hspace #-1 \italic "No." "260)" \italic "or" \smallCaps "St. Venantius" "(" \hspace #-1 \italic "No." "18)." }}}

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

%%%% Lyric titles and attributions

\markup {
	\column {
	    \line { \small { \hspace #6 \smallCaps  "Office Hymn."  \italic "  Terce." \hspace #44 \italic "Ascribed to St. Ambrose, 340-97." } } 
	    \line { \small { \hspace #78 \italic "Tr. J. M. Neale." } } 
	    \line { \hspace #40 \small "Nunc Sancte nobis Spiritus." }
	
}} 

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "C" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "OME, Holy Ghost, with God the Son"
			                                 "  And God the Father, ever one;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Shed forth thy grace within our breast,"
					   "And dwell with us a ready guest."
			                   "               " %%% add vertical spacing between verses		
			  }}
		      }
		      	\line {"2  "
			   \column {	     
				  "By every power, by heart and tongue,"
				  "By act and deed, thy praise be sung;"
				  "Inflame with perfect love each sense,"
				  "That others' souls may kindle thence."
				   "               " %%% add vertical spacing between verses
			}}
			\line {"3. "
			   \column {	     
				   "O Father, that we ask be done,"
				   "Through Jesus Christ, thine only Son,"
				   "Who, with the Holy Ghost and thee,"
				   "Shall live and reign eternally.      Amen."
				   "               " %%% add vertical spacing between verses
			}}
	  }  %%% end super column
} %%% end markup

	
%%%End hymn note

\markup { \hspace #54 \center-align { \line { \italic "On Whitsunday and the three following days, at Terce"}
	                              \line { "154" \italic "Come, O Creator Spirit, come."}
}}				    
	

} %% book bracket
