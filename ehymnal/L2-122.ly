%%% 194.png
%%% Hymn 122 Ye choirs of new Jerusalem
%%% Version 1


\version "2.10"

\include "gregorian-init.ly"

\header {
  dedication = \markup { \center-align {  "THE CHRISTIAN YEAR - EASTERTIDE"
		\hspace #0.1 }}	
  title = "122"
  
  arranger = \markup { \small { "Mode iii." }}
  
  tagline =""
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%% moves plainsong accidentals leftwards so that they show up more clearly
moveacci = \once \override Accidental #'extra-offset = #'(-1.2 . 0 )

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
	   
push = \once \override NoteHead #'X-offset = #'1.4

%%%%%%%%%%%%%%%%%%%%%%%% End of Macro definitions

%%% plainsong voice

plainsong = \context VaticanaVoice  {  \relative c { 
	\clef "vaticana-do3"
	\set fontSize = #3
        \key c \major 

  \[ e8 \melisma f8 \pes g8 \melismaEnd \] \[ f8 \flexa e8 \] \[ d8 \pes e8 \] 
       e8 \[ d8 \flexa c8 \] d8 \[ f8 \flexa d8 \] \[ e8 \pes f8 \flexa e8 \] \bar "|" \[ \virga e8 \inclinatum d8 \inclinatum c8 \] \bar "" \break
  
  g'8 a8 b8 c8 \[ \virga b8 \inclinatum a8 \inclinatum g8 \]  c8 \[ \virga b8 \inclinatum a8 \inclinatum g8 \] \bar "|" 
      \[ b8 \flexa a8 \] g8 \[ a8 \flexa g8 \] \[ \virga f8 \inclinatum e8 \inclinatum d8 \] \bar "" \break
  
  \[ e8 \melisma f8 \pes g8 \melismaEnd \] f8 e8 d8 \bar "|" 
      a'8 g8 a8 \[ \virga b8 \inclinatum a8 \inclinatum g8 \] a8 \[ \virga g8 \inclinatum f8 \inclinatum d8 e8 \pes f8 \virga g8 \melismaEnd \] \[ f8 \flexa e8 \] \push e4 \bar "||"
} }
  

%%% SATB voices

global = {
  \key d \major 
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
	\autoBeamOff
  fis8[ g a] g[ fis] e[ fis] fis e[ d] e g[ e] fis[ g fis] \bar "|" fis[ e d] \bar ""
  a'8 b cis d cis[ b a] d cis[ b a] \bar "|" cis[ b] a b[ a] g[ fis e] \bar ""
  fis[ g a] g fis e \bar "|" b' a b cis[ b a] b a[ g e fis g a] g[ fis] \lnb fis4 \bar "||"
}

alto = \relative c' {
	\autoBeamOff
  \ln d4. \ln b4 cis8[ d] d \ln b4 cis8 d8[ e] \ln d4. \bar "|" \ln d4. \bar ""
  \ln d4 e8 d8 \ln fis4. fis8 \ln e4. \bar "|" \ln fis4. \ln d4 ~ \ln d4. \bar ""
  \ln d4( e8) \ln d4 b8 \bar "|" d8 \ln d4 \ln cis4. d8 d8( \ln b4) \ln d4( e8) \ln d4 \ln cis4 \bar "||"
}

tenor = \relative c { \clef bass
	\autoBeamOff
  a'8[ g fis] \lnb g4 ~ g8[ a] b \lnb fis4 a8 \lnb b4 a8[ b a] \bar "|" a[ g fis] \bar ""
  \lnb fis4 a8 fis a[ b cis] d e[ d cis] \bar "|" a[ b] cis d[ cis] \lnb b4. \bar ""
  \lnb a4. \lnb b4 g8 \bar "|" g8 \lnb fis4 \lnb e4. g8 fis( \lnb g4) \lnb b4( cis8) \lnb b4 \lnb a4 \bar "||"
}

bass = \relative c { \clef bass
	\autoBeamOff	
  \ln d4. \ln e4 ~ e8[ d] b \ln b4 a8 \ln g4 \ln d'4. \bar "|" \ln d4. \bar "" 
  \ln d4( cis8) b8 \ln fis'4. d8 \ln a'4. \bar "|" \ln fis4. \ln b,4 \ln g'4. \bar ""
  \ln d4( cis8) \ln b4 e8 \bar "|" g,8 \ln d'4 \ln a4. g8 d'8( \ln e4) \ln b4( a8) \ln b4 \ln fis'4 \bar "||" 
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

\markup {
	\column {
	    \line { \small { \hspace #6 \smallCaps  "Office Hymn." \italic " Saturday evenings:" \hspace #30 \italic "St. Fulbert of Chartres, c. 1000." } }  
	    \line { \small { \hspace #8 \italic "i.e. 1st" "E." \italic "of Sundays after Easter."     \hspace #36 \italic "Tr. J. M. Neale." }                                    } }
} 

\markup { \hspace #44 \small "Chorus novae Jerusalem." }

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "Y" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "E choirs of new Jerusalem,"
			                                 "  To sweet new strains attune your theme;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "The while we keep, from care released,"
					   "With sober joy our Paschal feast:"
			  		}}
		      }
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
           		\line { "2  "
			   \column {	     
				   "When Christ, unconquer'd Lion, first"
				   "The dragon's chains by rising burst:"
				   "And while with living voice he cries,"
				   "The dead of other ages rise."
			}}
		  \hspace #1  % adds vertical spacing between verses 
		  \line { "3  "
		    \column {	     
			    "Engorged in former years, their prey"
			    "Must death and hell restore to-day:"
			    "And many a captive soul, set free,"
			    "With Jesus leaves captivity."
			}}
		\hspace #1 % adds vertical spacing between verses  
           	\line {"4  "
		    \column {	     
			    "Right gloriously he triumphs now,"
			    "Worthy to whom should all things bow;"
			    "And joining heaven and earth again,"
			    "Links in one commonweal the twain."
			}} 
		\hspace #1 % adds vertical spacing between verses  
           	\line {"5  "
		    \column {	     
			    "And we, as these his deeds we sing,"
			    "His suppliant soldiers, pray our King,"
			    "That in his palace, bright and vast,"
			    "We may keep watch and ward at last."
		}}
		\hspace #1 % adds vertical spacing between verses
           	\line { "6. "
		   \column {	     
			   "Long as unending ages run,"
			   "To God the Father, laud be done:"
			   "To God the Son, our equal praise,"
			   "And God the Holy Ghost, we raise.     Amen."
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
	 
        \[ e8 \pes f8 \]   \[
	    \override NoteHead #'extra-offset = #'(0.0 . -0.1 ) e8 
            \override NoteHead #'extra-offset = #'(-0.38 . 0.0 ) \flexa  d8 \pes 
            \override NoteHead #'extra-offset = #'(0.02 . 0.05) e8 \] }} 
                    >> 
 \new Lyrics = "lyrics" { s1 }
 \new ChoirStaff
   <<
   \context Staff = upper \with {  fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
	                                              \voiceOne fis8[ g] fis8[ e8 fis8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  \ln d4 ~ d8 \ln cis4 \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  \ln b'4 \ln a4. \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour b8[ g8] d'8[ a8 fis8] \bar "||" }}
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
	                                              \voiceOne fis8[ g] fis8[ e8 fis8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  \ln d4 ~ d8 \ln cis4 \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  \ln b'4 \ln a4. \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour b8[ g8] d'8[ a8 fis8] \bar "||" }}
			        >> 
   >>
   
\midi {  
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) } }
      }
	

} %% book bracket

