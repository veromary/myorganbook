%%% 246.png
%%% Hymn 154 Come, O Creator Spirit, come.
%%% Ver 3

\version "2.10"

\include "gregorian-init.ly"

\header {
  dedication = \markup { \center-align {  "THE CHRISTIAN YEAR - WHITSUNTIDE"
		\hspace #0.1 }}	
  title = "154"
  
  arranger = \markup { \small { "Mode viii." }}
  
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

%% macro settings for stemless long note which is 2x duration of regular white note but this one inserts more
%% offset to the right

lnc = {\once \override NoteHead #'duration-log = #0 
           \once \override Stem #'stencil = ##f
           \once \override NoteColumn #'force-hshift = #1.6 }

	   
	   
%%% settings to generate the double longnotes (breves)

brevenote = { \once \override NoteHead #'duration-log = #-1  
                \once \override NoteColumn #'force-hshift = #1.2 }

%%% same as \brevenote but modified for the same reason as \lnb is modified for \ln		
		
brevenoteb = { \once \override NoteHead #'duration-log = #-1  
                \once \override NoteHead #'X-offset = #1.6 }		

%% moves plainsong accidentals leftwards so that they show up more clearly
moveacci = \once \override Accidental #'extra-offset = #'(-1.2 . 0 )


%%%%%%%%%%%%%%%%%%%%%%%% End of Macro definitions

%%% plainsong voice

plainsong = \context VaticanaVoice  {  \relative c { 
	\clef "vaticana-do2"
	\set fontSize = #3
        \key c \major 

  g'8 a \[ g \flexa f \] g \[ a8 \flexa g \] c \[ d  \flexa c \] c \bar "|" c g a c \bar "" \break
  
  \[ d \flexa c \] \[ d \pes e \] \[ d \flexa c \] d \bar "|" c \[ d \pes e \] \[ c \flexa b \] \[ a \flexa g \] \[ c \pes d \] \bar "" \break

  g, a c \bar "|" \[ b \pes c \] \[ \virga a \inclinatum g \inclinatum f \] a \[ a \moveacci \pes  bes \flexa a \] g f g g \bar "||"
} }
  

%%% SATB voices

global = {
  \key bes \major 
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
	\autoBeamOff
  f8 g f[ ees] f g[ f] bes c[ bes] bes \bar "|" bes f g bes \bar "" \break
  c[ bes] c[ d] c[ bes] c \bar "|" bes c[ d] bes[ a] g[ f] bes[ c] \bar "" \break
  f, g bes \bar "|" a[ bes] g[ f ees] g g[ aes g] f ees f f \bar "||"
}

alto = \relative c' {
	\autoBeamOff
  d8 d d[ c] d \ln d4 d8 \ln g4 f8 \bar "|" d d ees f \bar "" \break
  \ln g4 \ln a4 \ln g4 g8 \bar "|" d8 \ln f4 \ln f4 ees8[ c] bes[ ees] \bar "" \break
  bes ~ bes d \bar "|" c[ bes] \ln bes4. ees8 \ln ees4. d8 c c c \bar "||"
}

tenor = \relative c { \clef bass
	\autoBeamOff
  bes'8 bes bes g bes \ln bes4 bes8 \ln ees4 d8 \bar "|" bes8 a c d \bar "" \break
  c8[ d] \ln f4 \ln d4 ees8 \bar "|" d \ln a4 \ln bes4 ~ bes8[ a] \lnc g4 \bar "" \break
  f8 ees f \bar "|" \lnc f4 \lnb g4. bes8 bes[ c bes] bes g a! a \bar "||"
}

bass = \relative c { \clef bass
	\autoBeamOff	
  bes8 g bes[ c] bes \lnb bes'4 g8 c,[ ees] bes \bar "|" g' d c bes \bar "" \break
  ees[ g] \lnb f4 \lnb g4 c,8 \bar "|" g' \lnb f4 \lnb d4 ees8[ f] g[ c,] \bar "" \break 
  d8 ees bes \bar "|" f'[ d] \brevenote ees\breve *1/4 ees8[ aes,! ees'] bes c f, f \bar "||"
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

\markup { \small { \hspace #15 \italic "Terce." \hspace #40 \italic "Before 10th cent.  Tr. and rev. Y. H." }} 
  
\markup { \hspace #40 \small "Veni, Creator Spiritus." }


%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "C" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "OME, O Creator Spirit, come,"
			                                 "  And make within our hearts thy home;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "To us thy grace celestial give,"
					   "Who of thy breathing move and live."
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
           		\line { "2  "
			   \column {	     
				   "O Comforter, that name is thine,"
				   "Of God most high the gift divine;"
				   "The well of life, the fire of love,"
				   "Our souls' anointing from above."
			}}
			\hspace #1  % adds vertical spacing between verses  
           		\line { "3  "
			   \column {	     
				   "Thou dost appear in sevenfold dower"
				   "The sign of God's almighty power;"
				   "The Father's promise, making rich"
				   "With saving truth our earthly speech."
			}}
			\hspace #1  % adds vertical spacing between verses  
           		\line { "4  "
			   \column {	     
				   "Our senses with thy light inflame,"
				   "Our hearts to heavenly love reclaim;"
				   "Our bodies' poor infirmity"
				   "With strength perpetual fortify."
			}}
			\hspace #1  % adds vertical spacing between verses  
           		\line { "5  "
			   \column {	     
				   "Our mortal foe afar repel,"
				   "Grant us henceforth in peace to dwell;"
				   "And so to us, with thee for guide,"
				   "No ill shall come, no harm betide."
			}}
			\hspace #1  % adds vertical spacing between verses  
           		\line { "6. "
			   \column {	     
				   "May we by thee the Father learn,"
				   "And know the Son, and thee discern,"
				   "Who art of both; and thus adore"
				   "In perfect faith for evermore.     Amen."
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
	\clef "vaticana-do2"
	\set fontSize = #3
	\override Staff.StaffSymbol #'staff-space = #1.6
	 
        \[ g'8 \pes a8 \flexa g8 \]  g4
	
  }}	
                    >> 
 \new Lyrics = "lyrics" { s1 }
 \new ChoirStaff
   <<
   \context Staff = upper \with {  fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
	                                              \voiceOne f8[ g f] \ln f4 \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  d8[ ees d] \ln c4 \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  \ln bes'4. \ln a4 \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour bes8[ ees, bes'] \ln f4 \bar "||" }}
			        >> 
   >>
  \context Lyrics = "lyrics" \lyricsto "sopranos" { \set ignoreMelismata = ##t \override LyricText #'font-size = #-1  A - - men. }
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

} %%% Amen score bracket


%%% Separate score block for Amen midi minus plainsong voice
%%% Since the minims are quavers in disguise, the tempo has to be adjusted accordingly. A tempo of 2=80 is set.

\score {  	
 \new ChoirStaff
   <<
   \context Staff = upper \with {  fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
	                                              \voiceOne f8[ g f] \ln f4 \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  d8[ ees d] \ln c4 \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  \ln bes'4. \ln a4 \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour bes8[ ees bes] \ln f4 \bar "||" }}
			        >> 
   >>
   
\midi {  
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) } }
      }
   

} %% book bracket
