%%% 264.png
%%% Hymn 164 O Trinity of blessed light
%%% Version 1


\version "2.10"

\include "gregorian-init.ly"

\header {
  dedication = \markup { \center-align {  "THE CHRISTIAN YEAR - TRINITY TO ADVENT"
		\hspace #0.1 }}	

  title = "164"
  
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


%% settings to generate the double longnotes (breves)

brevenote = { \once \override NoteHead #'duration-log = #-1  
                \once \override NoteColumn #'force-hshift = #0.8 }

%%%%%%%%%%%%% End of Macro Definitions		
		
%%% plainsong voice

plainsong = \context VaticanaVoice  {  \relative c { 
	\clef "vaticana-do3"
	\set fontSize = #3
        \key c \major 

\[ g'8  \pes a \] \[ \virga g \inclinatum f \inclinatum e f \] d e f \[ g \pes a \] \[ a \flexa g \] g \bar "|" \[ g \pes a \] \[ \virga g \inclinatum f \inclinatum e f \] \bar "" \break
d e f \[ g \pes a \] \[ a \flexa g \] g \bar "|" \[ g \flexa a \] c \[ b \pes c \] a \[ g \flexa f \] \[ g \pes a \] \bar "" \break
\[ \virga g \inclinatum f \inclinatum e \] e \bar "|" \[ f \pes g \] \[ \virga g \inclinatum f \inclinatum e f \] d e f \[ g \pes a \] \[ a \flexa g \] g4 \bar "||"
}}
  
  
%%% SATB voices

global = {
  \key d \major 
  \set Staff.midiInstrument = "church organ"
}


soprano = \relative c' {
	\autoBeamOff
  a'8[ b] a[ g fis g] e fis g a[ b] b[ a] a \bar "|" a[ g] a[ g fis g] \bar "" \break
  e fis g a[ b] b[ a] a \bar "|" a[ b] d cis[ d] b a[ g] a[ b] \bar "" \break
  a[ g fis] fis \bar "|" g[ a] a[ g fis g] e fis g a[ b] b[ a] \ln a4 \bar "||"
}


alto = \relative c' {
	\autoBeamOff
  \ln d4 \brevenote e\breve *1/4 e8 \brevenote d\breve *1/4 \ln d4 ~ d8 \bar "|" e[ d] d \ln b4. \bar "" \break
  b8 \brevenote d\breve *1/4 ~ \ln d4 e8 \bar "|" e[ g] \ln fis4. g8 a[ d,] \ln d4 \bar "" \break
  \ln d4. cis8 \bar "|" \ln e4 \brevenote d\breve *1/4 cis8 \ln d4 \brevenote d\breve *1/4 \ln cis4 \bar "||"
}


tenor = \relative c { \clef bass
	\autoBeamOff
  \ln fis4 
  \once\override Slur  #'control-points = #'((1.6 . 2.8) (3 . 4.1 ) (6 . 4.1 ) (7 . 3.9 ))
  a8( \ln b4.) cis8 a g fis[ g] \ln g4 fis8 \bar "|" a[ fis] fis \ln g4. ~ \bar "" \break
  \once \override Staff.SeparationItem #'padding = #4 
  g8 \ln b4 a8[ g] g[ a] cis \bar "|" cis[ d] \ln d4. d8 cis[ b] a[ g] \bar "" \break
  fis[ g a] a \bar "|" b[ a] fis[ b a b] a a g \ln d4 g8 fis \ln e4 \bar "||"
}

bass = \relative c { \clef bass
	\autoBeamOff
  \lnb d4 
  \once\override Slur  #'control-points = #'((1.6 . -1.8) (3 . -1.9) (6 . -1.9 ) (7 . -0.5 ))
      cis8( \lnb e4.) a8 d, b a[ g] \lnb g4 d'8 \bar "|" cis[ b] d \lnb e4. ~ \bar "" \break
  e8 \lnb b4 fis'8[ g] g[ fis] a \bar "|" a[ g] \lnb b4. \ln g4. fis8[ g] \bar "" \break
  \ln d4. fis8 \bar "|" e[ cis] \ln d4.( g,8) a d b fis[ g] a d \ln a4 \bar "||"
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


%%% Lyric Titles

\markup {  \column { 
	\line { \small { \hspace #4 \smallCaps "Office Hymn." \italic "  Saturdays. " "E."  \hspace #36 \italic "St. Ambrose, 340-97.   Tr. J. M. Neale."  } } 
	\line { \small { \hspace #42 "O Lux beata Trinitas."} }
}}

%%% Lyrics

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 " TRINITY of blessèd light," 
			                                 "  O Unity of princely might," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "The fiery sun now goes his way;"
					   "Shed thou within our hearts thy ray."
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
				  "To thee our morning song of praise,"
				  "To thee our evening prayer we raise;"
				  "Thy glory suppliant we adore"
				  "For ever and for evermore."
				  "           " %%% adds vertical spacing between verses
			}} 
			\line { "3. "
				\column {	     
				  "All laud to God the Father be;"
				  "All praise, eternal Son, to thee;"
				  "All glory, as is ever meet,"
				  "To God the holy Paraclete.     Amen."
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
	 
        \[ g'8 a8 g8 \]  g4  }} 
                    >> 
 \new Lyrics = "lyrics" { s1 }
 \new ChoirStaff
   <<
   \context Staff = upper \with {  fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
	                                              \voiceOne a'8[ b a] \ln a4 \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  \ln fis4. \ln e4 \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  \ln d'4.  \ln cis4 \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour d8[ b8 d8] \ln a4  \bar "||" }}
			        >> 
   >>
  \context Lyrics = "lyrics" \lyricsto "altos" { \override LyricText #'font-size = #-1  A  --  men. }
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
	                                              \voiceOne a'8[ b a] \ln a4 \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  \ln fis4. \ln e4 \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  \ln d'4.  \ln cis4 \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour d8[ b8 d8] \ln a4  \bar "||" }}
			        >> 
   >>
   
\midi {  
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 80 8) }
      }

}
	

} %% book bracket

