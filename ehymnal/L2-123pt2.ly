%%% 197.png
%%% Hymn 123 Part II The day draws on with golden light
%%% Version 1


\version "2.10"

\include "gregorian-init.ly"

\header {
  dedication = \markup { \center-align {  "THE CHRISTIAN YEAR - EASTERTIDE"
		\hspace #0.1 }}	
		title = \markup { "123" \large \smallCaps "(Part II)" }
  
  arranger = \markup { \small { "Mode iv." }}
  
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

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

%% macro to split ligatured notes, moving them a little further apart

split = \override NoteHead #'extra-offset = #'( 0.4 . 0.0 )

%% unsplit. macro to unset the settings for split above.

unsplit = \revert NoteHead #'extra-offset

%%%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro Definitions

%%% plainsong voice

plainsong = \context VaticanaVoice  {  \relative c { 
	\clef "vaticana-do3"
	\set fontSize = #3
        \key c \major 

f8 \[ f8 \split f8\flexa e8 \] \unsplit d8 e8 g8 a8 f8 e8 \bar "|"  
    g8 a8 g8 \[ a8\pes c8 \split c8\flexa b8 \] \unsplit g8 g8 f8 \[ g8\pes a8 \] \bar "|"  
    a8 a8 g8 \bar "" \break

\[ a8\pes c8 \split c8 \flexa b8 \] \unsplit \[ g8\flexa f8 \] a8 a8 \[ d,8\pes f8 \split f8 \flexa e8 \] \unsplit \bar "|"  
    \[ e8\flexa d8 \] c8 \[ e8\pes g8 \] \[ g8 \once \override NoteHead #'extra-offset = #'(-0.38 . 0.0 ) \flexa f8\pes a8 \] \[ g8\flexa f8 \] g8 \[ f8\flexa e8 \] e4 \bar "||"

}}
  
  
%%% SATB voices

global = {
  \key d \major 
  \set Staff.midiInstrument = "church organ"
}


soprano = \relative c' {
	\autoBeamOff
g'8 \ln g4( fis8) e fis a b g fis \bar "|" a b a b( \ln d4 cis8) a a g a[ b] \bar "|" b b a \bar "" \break
b( \ln d4 cis8) a[ g] b b e,( \ln g4 fis8) \bar "|" fis[ e] d fis[ a] a[ g b] a[ g] a g[ fis] \ln fis4 \bar "||"
}


alto = \relative c' {
	\autoBeamOff
	
e8 b[ cis] d cis d e \ln d4. \bar "|" \ln d4. d8( \ln fis4.) fis8 fis d \ln d4 \bar "|" \ln d4. \bar "" \break
d8 \ln fis4 e8 \ln d4 \ln d4 cis8 \ln d4. \bar "|" \ln d4 a8 d8[ e] fis[ g ~ g] \ln d4 \ln d4. \ln cis4 \bar "||" 
}


tenor = \relative c { \clef bass
	\autoBeamOff

b'8 \ln g4 \ln a4 ~ \ln a4 fis8 g8 a8 \bar "|" fis8 g8 fis8 ~ fis8( \ln b4 a8) cis8 d8 b8 a8[ g8] \bar "|" g8 \ln fis4 \bar "" \break
g8 \ln a4 ~ a8 a8[ b8] \ln b4 a8 \ln b4 a8 \bar "|" a8[ g8] fis8 \ln a4 \ln d4. a8[ b8] fis8 g8[ a8] \ln a4 \bar "||" 
}

bass = \relative c { \clef bass
	\autoBeamOff
	
e8 \lnb e4( d8) a8 d8 cis8 \ln b4 d8 \bar "|" d8 g,8 d'8 \ln b4( \ln fis'4) fis8 d8 g8 fis8[ g8] g,8 b8 d8 \bar "" \break
g8( \ln d4 a'8) fis8[ g8] \lnb g4 a8( \ln g4 d8) \bar "|" \ln d4. d8[ cis8] d8[ b8 g8] fis8[ g8] d'8 e8[ fis8] \ln fis4 \bar "||"
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

\markup { \hspace #7 \italic "On Feast of Apostles in Eastertide.  On Feast of Apostles in Ascensiontide Tune 142 is used." }

\markup { \hspace #48 \italic "Part 2." }  

%%% Main block of lyrics

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column for entire block of lyrics
           		\line { "4  " 
			   \column {	     
				   "The sad Apostles mourn him slain,"
				   "Nor hope to see their Lord again;"
				   "Their Lord, whom rebel thralls defy,"
				   "Arraign, accuse, and doom to die."
			}} 
			\hspace #1  % adds vertical spacing between verses  
			 \line { "5  " 
			   \column {	     
				   "But now they put their grief away,"
				   "The pains of hell are loosed to-day;"
				   "For by the grave, with flashing eyes,"
				   "'Your Lord is risen,' the Angel cries."
			}} 
			
	  }  %%% end super column
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
%%% Continuation of lyrics

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
                \hspace #1  % adds vertical spacing between verses  
           	\line { "6  "
		   \column {	     
			   "Maker of all, to thee we pray,"
			   "Fulfil in us thy joy to-day;"
			   "When death assails, grant, Lord, that we"
			   "May share thy Paschal victory."
     			}}
		\hspace #1  % adds vertical spacing between verses  
           	\line { "7. "
		   \column {	     
			   "To thee who, dead, again dost live,"
			   "All glory, Lord, thy people give;"
			   "All glory, as is ever meet,"
			   "To Father and to Paraclete.     Amen."
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
	 
        \[ e8 f8  e8 \]  e4 
      }} 
                    >> 
 \new Lyrics = "lyrics" { s1 }
 \new ChoirStaff
   <<
   \context Staff = upper \with {  fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
	                                              \voiceOne fis8[ g fis] \ln fis4 \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  \ln d4. \ln cis4 \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  \ln b'4. \ln a4 \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global \voiceFour  
	                                          \once \override NoteHead #'duration-log = #0 
                                                  \once \override Stem #'stencil = ##f
                                                  \once \override NoteHead #'X-offset = #0.5
	                                          b4. \ln fis4 \bar "||" }}
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
	                                              \voiceOne fis8[ g fis] \ln fis4 \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  \ln d4. \ln cis4 \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  \ln b'4. \ln a4 \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global \voiceFour  
	                                          \once \override NoteHead #'duration-log = #0 
                                                  \once \override Stem #'stencil = ##f
                                                  \once \override NoteHead #'X-offset = #0.5
	                                          b4. \ln fis4 \bar "||" }}
			        >> 
   >>
   
\midi {  
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 80 8) }
      }

}
	

} %% book bracket

