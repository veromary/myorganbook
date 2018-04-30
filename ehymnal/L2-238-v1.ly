%%% 372.png
%%% Hymn 238
%%% Version 1


\version "2.10"

\include "gregorian-init.ly"

\header {
   dedication = \markup { \center-align {  "THE HOLY NAME" \hspace #0.1 }}	
   title = "238"
   arranger = \markup { \small "Mode i." } 
   % *** suppresses "Engraved by Lilypond..." at the bottom of the page 
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


plainsong = { 
   \clef "vaticana-do3"
   \set fontSize = #3
 
c8 d \[ e \pes g \] \[ g \flexa f \] \[ e \flexa d \] f \[ \virga e \inclinatum d \inclinatum c \] d \bar "|" \[ c \pes e \] g \[ g \pes a \] a \bar " " \break
\[ a \flexa g \] \[ g \pes c' \] \[ b \inclinatum a \inclinatum g \] a \bar "|" \[ a \pes c' \] g \[ g \flexa f \] e \[ d \flexa c \] d \[ d \pes e \] e \bar "" \break
c8 d \[ e \pes g \] \[ g \flexa f \] \[ e \flexa d \] f \[ \virga e \inclinatum d \inclinatum c \] d s8 \bar "||" \break
}

globalAmen = {
   \set Score.timing = ##f
   \key d \major
   \time 2/1
   \set Staff.midiInstrument = "church organ"
   \set Staff.fontSize = #-3
   \override NoteHead #'duration-log = 1 
}

plainsongamen = {  
   \set Score.timing = ##f
   \clef "vaticana-do3"
   \set fontSize = #3
   \override Staff.StaffSymbol #'staff-space = #1.6
   \set Staff.midiInstrument = "church organ"
   \relative c' {
   \[ d,8\melisma \pes e8\melismaEnd \] \[ \override NoteHead #'extra-offset = #'(0.0 . -0.2) d8\melisma 
   \override NoteHead #'extra-offset = #'(-0.38 . 0) \flexa  c8 \pes 
   \override NoteHead #'extra-offset = #'(0.02 . 0.0) d8\melismaEnd \]  \bar "||" }
}  


global =  {
   \set Score.timing = ##f
   \key d \major
   \autoBeamOff
   \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
   d8 e8 fis8[ a8] a8[ g8] fis8[ e8] g8 fis8[ e d] e8 \bar "|" d8[ fis8] a8 a8[ b8] b8 \bar "" \break
   b8[ a8] a8[ d8] cis8[ b8 a8] b8 \bar "|" b8[ d8] a8 a8[ g8] fis8 e8[ d8] e8 e8[ fis8] fis8 \bar "|" \break
   d8 e8 fis8[ a8] a8[ g8] fis8[ e8] g8 fis8[ e d] \ln e4 \bar "||" \break
}

alto = \relative c' { 
   \ln b4 d8[ e8] \ln d4 d8[ cis8] d8 \ln d4. cis8 \bar "|" \ln d4 e8 \ln d4 d8 \bar "" \break 
   d8[ e8] d8[ fis8] \ln fis4. fis8 \bar "|" \once \override Tie #'extra-offset = #'( 0 . -1.0 ) \ln d4.~ \ln d4. cis8[ b8] b8 \ln cis4 d8 \bar "|" \break
   \ln b4 d8[ e8] \ln d4 d8[ cis8] b8 d8[ cis8 b8] \ln b4 \bar "||" \break
}

tenor = \relative c { \clef bass
   \ln g'4 \ln a4 \ln b4 \ln a4 b8 a8[ g8 fis8] a8 \bar "|" fis8[ a8] a8 \ln fis4 g8 \bar "" \break
   g8[ e8] fis8[ a8] a8[ b8 cis8] d8 \bar "|" \ln b4 d8 a8[ b8] a8 a8[ fis8] b8 \ln a4 a8 \bar "|" \break
   g8~ g8 \ln a4 fis8[ g8] \ln a4 g8 \ln b4( fis8) \ln g4 \bar "||" \break
}

bass = \relative c { \clef bass
   \once \override NoteColumn #'force-hshift = #'-0.5 g'8 e8 d8[ cis8] \lnb b4 d8[ a8] g8 \ln d'4. a8 \bar "|" \ln d4 cis8 d8[ b8] g8 \bar "" \break
   b8[ cis8] \ln d4 \ln fis4. b,8 \bar "|" \lnb g'4 fis8 fis8[ g8] d8 a8[ b8] g8 a8[ fis8] d'8 \bar "|" \break
   g8 e8 d8[ cis8] \ln d4 d8[ a'8] e8 \lnb b4. \ln e,4 \bar "||" \break
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


%%% Lyric titles and attributions

\markup { \hspace #6 \small {  \column { \line {\smallCaps  "Office Hymn."   "(" \hspace #-1 \italic "Pts." "1" \italic "and" "2) M."  \hspace #42 \italic "St. Bernard, 1091-1153." }   
        \line {  \italic "Suitable also for other occasions." \hspace #46 \italic "Tr. J. M. Neale." }
	\line { \hspace #36 "Jesu, dulcis memoria." }
}}}


%%% Lyrics

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.6 \column { \lower #2.4 \fontsize #8 "J" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ESU!—The very thought is sweet!"
			                                 "  In that dear name all heart-joys meet;" } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					  "But sweeter than the honey far"
					  "The glimpses of his presence are."
			  		}} 
			         } %%% finish verse 1

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
				   "No word is sung more sweet than this:"
				   "No name is heard more full of bliss:"
				   "No thought brings sweeter comfort nigh,"
				   "Than Jesus, Son of God most high."
				   "                " %%% adds vertical spacing between verses
			}}
			 \line { "3  "
			\column {	 
				"Jesu! the hope of souls forlorn!"
				"How good to them for sin that mourn!"
				"To them that seek thee, O how kind!"
				"But what art thou to them that find?"
				   "                " %%% adds vertical spacing between verses
			 }}	   
			\line { "4  "
			\column {	     
				"Jesu, thou sweetness, pure and blest,"
				"Truth's Fountain, Light of souls distrest,"
				"Surpassing all that heart requires,"
				"Exceeding all that soul desires!"
				   "                " %%% adds vertical spacing between verses
			}}
			\line { "5  "
			\column {	     
				"No tongue of mortal can express,"
				"No letters write its blessedness:"
				"Alone who hath thee in his heart"
				"Knows, love of Jesus! what thou art."
				   "                " %%% adds vertical spacing between verses
			}}
			\line { \hspace #16 \column { \line {\italic "Part" "2."} 
			        "                                "
			}}
			\line { "6  "
			\column {	     
				"O Jesu! King of wondrous might!"
				"O Victor, glorious from the fight!"
				"Sweetness that may not be exprest,"
				"And altogether loveliest!"
				   "                " %%% adds vertical spacing between verses
			}}	
			\line { "7  "
			\column {	     
				"Remain with us, O Lord, to-day!"
				"In every heart thy grace display:"
				"That now the shades of night are fled,"
				"On thee our spirits may be fed."
				"                " %%% adds vertical spacing between verses
			}}
			\line { "8. "
			   \column {	     
				   "All honour, laud and glory be,"
				   "O Jesu, Virgin-born, to thee!"
				   "All glory, as is ever meet,"
				   "To Father and to Paraclete.      Amen."
			}}
	  } %%% end supercolumn
} %%% end markup	  


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
        \[ d8 \pes e \]   \[
	    \override NoteHead #'extra-offset = #'(2.0 . -0.1 ) d8 
            \override NoteHead #'extra-offset = #'(1.62 . 0.0 ) \flexa  c8 \pes 
            \override NoteHead #'extra-offset = #'(2.02 . 0.05) d8 \] }} 
                    >> 
 \new Lyrics = "lyrics" { s1 }
 \new ChoirStaff
   <<
   \context Staff = upper \with {  fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
	                                              \voiceOne e8[ fis] e[ d e] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo cis8[ d] cis[ b b] \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree \ln a'4 a8[ fis g] \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour a8[ d] a[ b e,] \bar "||" }}
			        >> 
   >>
  \context Lyrics = "lyrics" \lyricsto "sopranos" { \override LyricText #'font-size = #-1  "A    -   - " "    men." }
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
	                                              \voiceOne e8[ fis] e[ d e] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo cis8[ d] cis[ b b] \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree \ln a'4 a8[ fis g] \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour a8[ d] a[ b e,] \bar "||"  }}
			        >> 
   >>
   
\midi {  
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 80 8) }
      }

}


} % book bracket