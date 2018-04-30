%%% 284.png
%%% Hymn 176 Let the round world with songs rejoice
%%% Version 1


\version "2.10"

\include "gregorian-init.ly"

\header {
  dedication = \markup { \center-align {  "SAINTS' DAYS: GENERAL - APOSTLES AND EVANGELISTS"
		\hspace #0.1 }}	

  title = "176"
  
  arranger = \markup { \small { "Mode viii." }}
  
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

g'8 \[ a \pes b \] c \[ b \flexa a \] g a f g \bar "|" b d \bar "" \break
c b d c \[ b \flexa a \] g \bar "|" g a f g e \bar "" \break
f \[ e \flexa d \] c \bar "|" g' \[ a \pes b \] c \[ b \flexa a \] g a f g \bar "||"
}}
  
  
%%% SATB voices

global = {
  \key c \major 
  \set Staff.midiInstrument = "church organ"
}


soprano = \relative c' {
	\autoBeamOff
g'8 a[ b] c b[ a] g a f g \bar "|" b d \bar "" \break
c b d c b[ a] g \bar "|" g a f g e \bar "" \break
f e[ d] c \bar "|" g' a[ b] c b[ a] g a f g \bar "||"
}


alto = \relative c' {
	\autoBeamOff
e8 \ln e4. \ln e4. e8 d d \bar "|" d f \bar "" \break
g \ln g4 g8 ~ g[ f] d \bar "|" e f c d  c \bar "" \break
c c[ b] a \bar "|" b \ln c4. \ln e4. c8 c d \bar "||"
}


tenor = \relative c { \clef bass
	\autoBeamOff
c'8 \ln c4. g8[ a] b c a b \bar "|" g a \bar "" \break
c d ~ d e ~ e[ c] b \bar "|" \ln c4 ~ c8 b g \bar "" \break
a \ln a4 e8 \bar "|" e \ln e4. g8[ a] b a c b \bar "||"
}

bass = \relative c { \clef bass
	\autoBeamOff
c8 \lnb a4. \ln e'4. c8 d g, \bar "|" g' d \bar "" \break
e g b, c e[ f] g \bar "|" c, f a g c, \bar "" \break
f, \lnb a4 ~ a8 \bar "|" e' \lnb a,4. \ln e'4. f8 a g \bar "||"
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

\markup { \hspace #8 \small {  \column { \line {\smallCaps  "Office Hymn."  \italic "  Common of Apostles and"  \hspace #28 \italic "c. 10th cent.  Tr. Bishop R. Mant" "‡." }    
	\line { \hspace #4 \italic "Evangelists.  "  "M." \italic "and" "E." } 
	\line { \hspace #32 "Exultet caelum laudibus." }
}}}


%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "L" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ET the round world with songs rejoice;"
			                                 "  Let heaven return the joyful voice;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "All mindful of the Apostles' fame,"
					   "Let heaven and earth their praise proclaim."
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

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
		  	\hspace #1  % adds vertical spacing between verses  
           		\line { "2  "
			   \column {	     
				  "Ye servants who once bore the light"
				  "Of Gospel truth o'er heathen night,"
				  "Still may your work that light impart,"
				  "To glad our eyes and cheer our heart."
				  "           " %%% adds vertical spacing between verses
			}}
			   \line { "3  "
			   \column {	     
				  "O God, by whom to them was given"
				  "The key that shuts and opens heaven,"
				  "Our chains unbind, our loss repair,"
				  "And grant us grace to enter there;"
				  "           " %%% adds vertical spacing between verses
			}} 
			  \line { "4  "
			   \column {	     
				  "For at thy will they preached the word"
				  "Which cured disease, which health conferred:"
				  "O may that healing power once more"
				  "Our souls to grace and health restore:"
				  "           " %%% adds vertical spacing between verses
			}}
			   \line { "5  "
			   \column {	     
				  "That when thy Son again shall come,"
				  "And speak the world's unerring doom,"
				  "He may with them pronounce us blest,"
				  "And place us in thy endless rest."
				  "           " %%% adds vertical spacing between verses
			}}
			\line { "6. "
				\column {	     
				  "To thee, O Father; Son, to thee;"
				  "To thee, blest Spirit, glory be!"
				  "So was it ay for ages past,"
				  "So shall through endless ages last.     Amen."
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
	                                              \voiceTwo e8[ f] c[ c d] \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  \ln c'4 ~ \ln c4 b8 \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour c8[ f,8] c'8[ a8 g8] \bar "||" }}
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
	                                              \voiceOne g'8[ a] g8[ f8 g8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo e8[ f] c[ c d] \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  \ln c'4 ~ \ln c4 b8 \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour c8[ f,8] c'8[ a8 g8] \bar "||" }}
			        >> 
   >>
   
\midi {  
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) } }
      }
   	
      
%%%% Office Hymns markup

\markup { \hspace #53 \center-align {
	\line { \italic "Office Hymn for Apostles and Evangelists during Eastertide. " "E." \italic "and" "M. 123," \italic "Part" "2;" }   
        \line { \italic "and for" "M."\italic "and" "E. 124," \italic "Part" "2." }
}}
	
	
} %% book bracket

