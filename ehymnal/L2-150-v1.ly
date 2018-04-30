%%% 240.png
%%% Hymn 150 When Christ our Lord had passed once more.


\version "2.10"

\include "gregorian-init.ly"

\header {
  dedication = \markup { \center-align {  "THE CHRISTIAN YEAR - WHITSUNTIDE"
		\hspace #0.1 }}	
  title = "150"
  
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

%%% settings to generate the double longnotes (breves)

brevenote = { \once \override NoteHead #'duration-log = #-1  
                \once \override NoteColumn #'force-hshift = #0.8 }

%%% same as \brevenote but modified for the same reason as \lnb is modified for \ln		
		
brevenoteb = { \once \override NoteHead #'duration-log = #-1  
                \once \override NoteHead #'X-offset = #1.6 }		

%% suprresses printing of accidental
noacci = \once \override Accidental #'transparent = ##t

%%%%%%%%%%%%%%%%%%%%%%%% End of Macro definitions

%%% plainsong voice

plainsong = \context VaticanaVoice  {  \relative c { 
	\clef "vaticana-do3"
	\set fontSize = #3
        \key c \major 

  d8 d f d \[ d \flexa  c \] f g a \bar "|" \[ a \flexa  g \] c \[ c \pes d \] \bar "" \break

  c \[ c \flexa  b \] a g a \bar "|" a a \[ a \pes c \inclinatum b \inclinatum a \] \[ g \flexa  f \] \[ e \flexa  d \] \bar "" \break

  f \[ e \flexa  d \] \[ d \pes e \] \bar "|" c \[ e \flexa  d \] g \[ g \pes a \flexa  g \] \[ f \flexa  e \] d c d \bar "||"
} }
  

%%% SATB voices

global = {
  \key c \major 
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
	\autoBeamOff
  d8 d f d d[ c] f g a \bar "|" a[ g] c c[ d] \bar "" \break
  c8 c[ b] a g a \bar "|" a a a[ c b a] g[ f] e[ d] \bar "" \break
  f e[ d] d[ e] \bar "|" c e[ d] g g[ a g] f[ e] d c d \bar "||"
}

alto = \relative c' {
	\autoBeamOff
  a8 \ln bes4 ~ bes8 \ln a4 \ln c4 ~ c8 \bar "|" f8[ e] g ~ g[ f] \bar "" \break
  e8 ~ \ln e4 ~ \ln e4 ~ e8 \bar "|" e8 ~ e8 \brevenote d\breve *1/4 \noacci \ln b4 ~ \ln b4 \bar "" \break
  c8 ~ c8[ b ~] \ln b4 \bar "|" c8 ~ c[ d] b \ln c4. \ln a4 ~ \ln a4 ~ a8 \bar "||"
}

tenor = \relative c { \clef bass
	\autoBeamOff
  f8 f d f ~ \ln f4 ~ f8 e f \bar "|" \ln c'4 ~ c8 ~ c8[ a] \bar "" \break
  a8 \ln c4 ~ c8 b c \bar "|" c a \brevenote f\breve *1/4 \ln g4 ~ \ln g4 \bar "" \break
  a8 \ln g4 ~ \ln g4 \bar "|" e8 ~ e[ g ~]  g \ln e4. \ln f4 ~ f8 e f \bar "||"
}

bass = \relative c { \clef bass
	\autoBeamOff	
  d8 \ln bes4 ~ bes8 \ln f4 a8 c f \bar "|" f[ c] e8 ~ e[ d] \bar "" \break
  a'8 ~ \lnb a4 ~ a8 e a, \bar "|" a c \brevenoteb d\breve *1/4 \lnb e4 ~ e8[ g] \bar "" \break
  f8 c[ g] g[ e] \bar "|" a8 ~ a[ \noacci b] g \lnb c4. \lnb d4 ~ d8 a d, \bar "||"
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

%\markup { \hspace #1 }

\markup {
\hspace #6 \column {                            
	    \line { \small { \hspace #6 \smallCaps  "Office Hymn." \italic " Whitsun Eve,"  } }
            \line { \small { \hspace #8 "E.:" \italic "and daily till Trinity" \hspace #40 \italic "c. 4th cent.  Tr. P. D." } }   
            \line { \small { \hspace #8 \italic "Sunday." "M." } }
	    \line { \small { \hspace #34 "Jam Christus astra ascenderat." } }
} }
  

%\markup { \hspace #1 }

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "W" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HEN Christ our Lord had passed once more"
			                                 "  Into the heaven he left before," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "He sent a Comforter below"
					   "The Father's promise to bestow."
			  		}}
		      }
}}

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
				   "The solemn time was soon to fall"
				   "Which told the number mystical;"
				   "For since the Resurrection day"
				   "A week of weeks had passed away."
				   "      " %%% adds vertical spacing between verse
			}}
			\line { "3  "
				\column {	     
					"At the third hour a rushing noise"
					"Came like the tempest's sudden voice,"
					"And mingled with the Apostles' prayer,"
					"Proclaiming loud that God was there."
					"      " %%% adds vertical spacing between verse
			}}
			\line {"4  "
				\column {	     
					"From out the Father's light it came,"
					"That beautiful and kindly flame,"
					"To kindle every Christian heart,"
					"And fervour of the Word impart."
					"      " %%% adds vertical spacing between verse
			}} 
			\line {"5  "
				\column {	     
					"As then, O Lord, thou didst fulfil,"
					"Each holy heart to do thy will,"
					"So now do thou our sins forgive"
					"And make the world in peace to live."
					"      " %%% adds vertical spacing between verse
			}}
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
	\clef "vaticana-do3"
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
	                                              \voiceOne d8[ e] d8[ c8 d8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  a8[ g] \ln a4. \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  f8[ g] f8[ e f] \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour d8[ c8] d8[ a8 d,8] \bar "||" }}
			        >> 
   >>
  \context Lyrics = "lyrics" \lyricsto "altos" { \override LyricText #'font-size = #-1  A -- _ men. }
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
	                                              \voiceOne d8[ e] d8[ c8 d8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  a8[ g] \ln a4. \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  f8[ g] f8[ e f] \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour d8[ c8] d8[ a8 d,8] \bar "||" }}
			        >> 
   >>
   
\midi {  
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) } }
      }

%%% Markup for "See also:" line
\markup {\hspace #38 \column {
	\line{ \hspace #8 \italic "See also:"}
	\hspace #1 
	\small {
	"630  Hail thee, Festival Day."
	"631  Spirit of mercy, truth, and love."
}}}      
      

} %% book bracket

