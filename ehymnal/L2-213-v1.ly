%%% 338.png
%%% Hymn 213 
%%% Version 1


\version "2.10"

\include "gregorian-init.ly"

\header {
  dedication = \markup { \center-align { "THE ANNUNCIATION" \hspace #0.1 }}

  title = "213"
  
  arranger = \markup { \small { "Mode i." }}
  
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


%%%%%%%%%%%%% End of Macro Definitions		
	

%%% plainsong voice

plainsong = \context VaticanaVoice  {  \relative c { 
	\clef "vaticana-do3"
	\set fontSize = #3
        \key c \major 
	\override Tie #'transparent = ##t 
  d8 a' ~    \once \override NoteHead #'X-offset = #-10  a g \[ a \pes b \] d \[ \virga c \inclinatum b \inclinatum a \inclinatum g \] \bar "|" a a \[ d, \pes e \] g \bar "" \break

  \[ f \flexa e \] d \bar "|" f e g a a ~ \once \override NoteHead #'X-offset = #-8  a d, \bar "|" e g e f \[ \virga e \inclinatum d \inclinatum c \] d4 \bar "||"

}} 
  
%%% SATB voices

global = {
  \key d \major 
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
	\autoBeamOff
  e8 b' ~ b a b[ cis] e d[ cis b a] \bar "|" b b e,[ fis] a \bar "" \break
  g[ fis] e \bar "|" g fis a b b ~ b e, \bar "|" fis a fis g fis[ e d] \ln e4 \bar "||"
}


alto = \relative c' {
	\autoBeamOff
  b8 \ln d4 \ln cis4. g'8 \ln a4( g8[ e8]) \bar "|" \ln g4 e8[ cis~ ] cis8 \bar "" \break  
  \ln d4 b8 \bar "|" \ln d4 e8 d8 \ln d4 cis8 \bar "|" d8 e d d d[ cis b] \ln b4 \bar "||"
}


tenor = \relative c { \clef bass
	\autoBeamOff
  g'8 \lnb fis4 \lnb a4. b8 \lnb d4.( cis8) \bar "|" \lnb d4 \lnb cis4 ~ cis8 \bar "" \break 
  \lnb b4 g8 \bar "|" g a a fis \lnb b4 a8 \bar "|" \lnb a4 ~ a8 b a ~ [ a fis] \ln g4 \bar "||"
}


bass = \relative c { \clef bass
	\autoBeamOff
  e8 \ln b4 \ln fis'4. e8 \ln fis4( g8[ a]) \bar "|" \ln g4 \ln a4 fis8 \bar "" \break
  \ln b,4 e8 \bar "|" b8 d cis b \ln g4 a8 \bar "|" d8 cis d g, d'[ a b] \ln e,4 \bar "||"
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


%%% Hymn note

\markup { \hspace #30 \italic "See also: " \small "640 Virgin born! we born before thee." }
	
\markup { "             " }

\markup { \hspace #8 \small {  \column { \line {\smallCaps  "Office Hymn." " E." \italic " Conception, Annunciation," \hspace #30 \italic "c. 9th cent.  Tr. A. R." } 
          	                         \line { \hspace #6 \italic "Nativity, B.V.M." }    
					 \line { \hspace #36 "Ave, maria Stella." }
}}}



%%% Lyrics

\markup { \hspace #34 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "H" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "AIL, O Star that pointest"
			                                 "    Towards the port of heaven," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Thou to whom as maiden"
					   "    God for Son was given."
					   "           " %%% adds vertical spacing between verses
			  		}}
		      } %%end verse 1
		           \line { "2  "
			   \column {	     
				  "When the salutation"
				  "    Gabriel had spoken,"
				  "Peace was shed upon us,"
				  "    Eva's bonds were broken."
				  "           " %%% adds vertical spacing between verses
			}}

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

\markup { \hspace #34 %%add space as necc. to center the column
          \column { %% super column of everything
		  	\hspace #1  % adds vertical spacing between verses  
			\line { "3  "
			   \column {	     
				  "Bound by Satan's fetters,"
				  "    Health and vision needing,"
				  "God will aid and light us"
				  "    At thy gentle pleading."
				  "           " %%% adds vertical spacing between verses
			}}
			   \line { "4  "
			   \column {	     
				  "Jesu's tender Mother,"
				  "    Make thy supplication"
				  "Unto him who chose thee"
				  "    At his Incarnation;"
				  "           " %%% adds vertical spacing between verses
			}} 
			
			\line { "5  "
			   \column {	     
				  "That, O matchless Maiden,"
				  "    Passing meek and lowly,"
				  "Thy dear Son may make us"
				  "    Blameless, chaste and holy."
				  "           " %%% adds vertical spacing between verses
			}} 
			
			\line { "6  "
			   \column {	     
				  "So, as now we journey,"
				  "    Aid our weak endeavour,"
				  "Till we gaze on Jesus,"
				  "    And rejoice for ever."
				  "           " %%% adds vertical spacing between verses
			}} 
			
			\line { "7. "
			  \column {	     
				"Father, Son and Spirit,"
				"    Three in One confessing,"
				"Give we equal glory,"	
				"    Equal praise and blessing.      Amen."
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
	 
        \[ d8 e8 d8 \] d4
  }} 
                    >> 
 \new Lyrics = "lyrics" { s1 }

 \new ChoirStaff
   <<
   \context Staff = upper \with {  fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
	                                              \voiceOne e8[ fis e] \ln e4 \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  b8[ d cis] \ln b4 \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree g'8 \ln a4 \ln g4 \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour e8[ d a] \ln e4 \bar "||" }}
			        >> 
   >>
  \context Lyrics = "lyrics" \lyricsto "sopranos" { \override LyricText #'font-size = #-1  A  - - "  men." }
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
	                                              \voiceOne e8[ fis e] \ln e4 \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  b8[ d cis] \ln b4 \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree g'8 \ln a4 \ln g4 \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour e8[ d a] \ln e4 \bar "||" }}
			        >> 
   >>
   
\midi {  
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 80 8) }
      }

}
	

} %% book bracket

