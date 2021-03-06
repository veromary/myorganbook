%%% 230.png
%%% Hymn 141 Eternal Monarch, King most high
%%% Version 1


\version "2.10"

\include "gregorian-init.ly"

\header {
  dedication = \markup { \center-align {  "THE CHRISTIAN YEAR - ASCENSIONTIDE"
		\hspace #0.1 }}	
  title = "141"
  
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

%% push a notehead slightly to the right	   

push = \once \override NoteHead #'X-offset = #2

%% push a tie slightly to the right. Sometimes needed when using \lnb above.

tiepush = \once \override Tie #'extra-offset = #'(0.8 . 0.0)

%%%%%%%%%%%%%%%%%%%%%%%% End of Macro definitions

%%% plainsong voice

plainsong = \context VaticanaVoice  {  \relative c { 
	\clef "vaticana-do3"
	\set fontSize = #3
        \key c \major 

  g'8 \[ g8 \pes a8 \] \override NoteHead #'extra-offset = #'(-5.2 . 0.0 ) \[ b8 \pes c8 \flexa a8 \] \revert NoteHead #'extra-offset 
      \[ g8 \flexa f8 \] \[ a8 \flexa g8 \] \[ a8 \pes b8 \] 
      \override NoteHead #'extra-offset = #'(-5.2 . 0.0 ) \[ \virga c8 \inclinatum b8 \inclinatum a8 \inclinatum g8 \] 
      \revert NoteHead #'extra-offset  \[ a8 \flexa g8 \] \[ f8 \pes g8 \] g8 \bar "|" \break

  g8 \[ g8 \pes c8 \flexa b8 \] \[ c8 \pes d8 \] d8 \[ c8 \flexa b8 \] \[ a8 \flexa g8 \] \[ a8 \pes c8 \] c8 \bar "|" 
      c8 a8 c8 g8 \bar "" \break

  \[ g8 \pes a8 \] \[ a8 \flexa g8 \] \[ f8 \pes g8 \] g8 \bar "|" 
      f8 \[ a8 \flexa g8 \] \[ a8 \pes c8 \] \[ c8 \flexa b8 \] \[ a8 \flexa g8 \] \[ a8 \flexa g8 \] \[ f8 \pes g8 \] g8 \bar "||" 
} }
  

%%% SATB voices

global = {
  \key c \major 
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
	\autoBeamOff
	\override Script #'padding = #1
  g'8 g([ a] b[ c a]) g[ f] a[ g] a[ b c -> b a g] a[ g] f[ g] g \bar "|" \break
  g g[ c b] c[ d] d c[ b] a[ g] a[ c] c \bar "|" c a c g \bar "" \break
  g[ a] a[ g] f[ g] g \bar "|" f a[ g] a[ c] c[ b] a[ g] a[ g] f[ g] g \bar "||"
}

alto = \relative c' {
	\autoBeamOff
  d8 d[ e ~ ] \ln e4. ~ e8[ f] \ln e4 ~ \ln e4 \ln g4 f8[ e] ~ \ln e4 d8[ e] d \bar "|" \break
  d8 c \ln g'4 ~ g8[ f] f \ln e4 ~ \ln e4 \ln f4 e8 \bar "|" e f ~ f e \bar "" \break
  e8[ f] f[ e] d[ e] d \bar "|" d \ln e4 \ln f4 \ln g4 \ln e4 ~ \ln e4 d8[ e] d \bar "||"
}

tenor = \relative c { \clef bass
	\autoBeamOff
  b'8 d[ c ~ ] \ln c4. ~ \ln c4 ~ \ln c4 ~ \ln c4 ~ \ln c4 ~ \ln c4 ~ \ln c4 a8[ c] b \bar "|" \break
  b \ln g4. ~ g8[ a] a \ln c4 ~ \ln c4 ~ c8[ a] c \bar "|" c ~ c c c \bar "" \break
  \push \ln c4 ~ \ln c4 a8[ c] b \bar "|" a \ln c4 ~ c8[ a] \ln c4 ~ c8[ b] \ln c4 a8[ c] b \bar "||"
}

bass = \relative c { \clef bass
	\autoBeamOff	
  g'8 b[ a] \tiepush \lnb a4.~ \lnb a4 a8[ c] \lnb a4( \lnb e4 f8[ c] ) a8[ c] d[ c] g \bar "|" \break
  g'8 \lnb e4. ~ e8[ d] d \lnb a'4 ~ a8[ c] \lnb f,4 c8 \bar "|" c f a c \bar "" \break 
  c8[ f,] f[ c] d[ c] g' \bar "|" d a[ c] \lnb f4 \tiepush \lnb e4 ~ \lnb e4 \lnb c4 d8[ c] g \bar "||"
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

%%% Hymn note markup

\markup { \hspace #8 \italic "See also:  "   "628  Hail thee, Festival Day." \hspace #8 "629  O King most high of earth and sky." }
 
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
%%% Lyric titles and attributions

\markup {
	\hspace #12 \column {
	    \line { \small { \hspace #6 \smallCaps  "Office Hymn." \italic " Till Whitsun" \hspace #24 \italic "c. 5th cent.  Tr. J. M. Neale." } }  
	    \line { \small { \hspace #8 \italic "Even," "E." }}
	    \line { \small { \hspace #32 "Aeterne Rex altissime." }}
}} 

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "E" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "TERNAL Monarch, King most high"
			                                 "  Whose Blood hath brought redemption nigh," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "By whom the death of Death was wrought,"
					   "And conquering Grace's battle fought:"
					   "      " %%% adds vertical spacing between verses
			  		}}
		      } 
           		\line { "2  "
			   \column {	     
				   "Ascending to the throne of might,"
				   "And seated at the Father's right,"
				   "All power in heaven is Jesu's own,"
				   "That here his manhood had not known."
				   "      " %%% adds vertical spacing between verses
			}} 
			\line { "3  "
				\column {	     
				"That so, in nature's triple frame,"
				"Each heavenly and each earthly name,"
				"And things in hell's abyss abhorred,"
				"May bend the knee and own him Lord."
				"      " %%% adds vertical spacing between verses
			}}
			\line {"4  "
				\column {	     
				"Yea, Angels tremble when they see"
				"How changed is our humanity;"
				"That flesh hath purged what flesh had stained,"
				"And God, the Flesh of God, hath reigned."
				"      " %%% adds vertical spacing between verses
			}} 
			\line {"5  "
				\column {	     
				"Be thou our joy and strong defence,"
				"Who art our future recompense:"
				"So shall the light that springs from thee"
				"Be ours through all eternity."
				"      " %%% adds vertical spacing between verses
			}}
			\line { "6. "
				\column {	     
				"O risen Christ, ascended Lord,"
				"All praise to thee let earth accord,"
				"Who art, while endless ages run,"
				"With Father and with Spirit One.     Amen."
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
	 
        \[ g'8 \pes a8 \]   \[
	    \override NoteHead #'extra-offset = #'(0.0 . -0.1 ) g8 
            \override NoteHead #'extra-offset = #'(-0.38 . 0.0 ) \flexa  f8 \pes 
            \override NoteHead #'extra-offset = #'(0.02 . 0.05) g8 \] }} 
                    >> 
 \new Lyrics = "lyrics" { s1 }
 \new ChoirStaff
   <<
   \context Staff = upper \with {  fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
	                                              \voiceOne g'8[ a] g8[ f8 g8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  e8[ f] e[ c d] \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  \ln c'4 ~ \ln c4 b8 \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour c8[ f8] c8[ a8 g8] \bar "||" }}
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
	                                              \voiceOne g'8[ a] g8[ f8 g8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  e8[ f] e[ c d] \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  \ln c'4 ~ \ln c4 b8 \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour c8[ f8] c8[ a8 g8] \bar "||" }}
			        >> 
   >>
   
\midi {  
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) } }
      }
	

} %% book bracket

