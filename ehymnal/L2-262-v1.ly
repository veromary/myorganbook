%%% 408.png
%%% Hymn 262 O God, creation's secret force
%%% Version 1


\version "2.10"

\include "gregorian-init.ly"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—NOON"
	                                        \hspace #0.1 }}	
	
  title = "262"

  arranger = \markup { \small { "Mode iv." }}
  
  tagline =""
}

%%%%%%%%%%%%%%%% Macros

%% suprresses printing of accidental
noacci = \once \override Accidental #'transparent = ##t

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
				
%%%%%%%%%%%%% End of Macro Definitions		
		
%%% plainsong voice

plainsong = \context VaticanaVoice  {  \relative c { 
	\clef "vaticana-fa2"
	\set fontSize = #3
        \key c \major 

  \[ f8 \pes g \flexa f \] e g \[ g \pes a \] \[ a \flexa g \] f d e \bar "|" f d \[ f \flexa e \] \[ f \pes g \] \[f \flexa e \] d c d \bar "|" \break
  f d c e \[ d \pes f \] d c e \bar "|" f g \[ f g \pes a \] \[ a \flexa g \] \[e \flexa d \] f \[ g \flexa f \] e \bar "||" 
}} 
  
%%% SATB voices

global = {
  \key e \major 
  \set Staff.midiInstrument = "church organ"
}


soprano = \relative c' {
	\autoBeamOff
  a'8[ b8 a8] gis8 b8 b8[ cis8] cis8[ b8] a8 fis8 gis8 \bar "|" a8 fis8 a8[ gis8] a8[ b8] a8[ gis8] fis8 e8 fis8 \bar "|"
  a8 fis8 e8 gis8 fis8[ a8] fis8 e8 gis8 \bar "|" a8 b8 a8[ b8 cis8] cis8[ b8] gis8[ fis8] a8 b8[ a8] gis8 \bar "||"
}


alto = \relative c' {
	\autoBeamOff
  \override Tie #'extra-offset = #'(0.0 . -0.5)		
  \ln e4. \ln e4 \brevenote e\breve * 1/4 ~ e8 dis8 e8 \bar "|" e8 dis8 \brevenote e\breve * 1/4 \ln cis4 ~ \ln cis4 ~ cis8 \bar "|" 
  \ln cis4 ~ cis8 e8 \ln cis4 d8 e8 e8 \bar "|" e8 e8 \ln cis4 ( fis8 ) \ln e4 ~ e8[ \noacci dis8] e8 ~ \ln e4 dis8 \bar "||" 
}


tenor = \relative c { \clef bass
	\autoBeamOff
    \override Tie #'extra-offset = #'(0.0 . 0.5)		
  \ln cis'4. b8 gis8 ~ \brevenote gis\breve * 1/4 a8 a8 b8 \bar "|" cis8 b8 \ln e,4 a8[ gis8] \ln a4 ~ a8 gis8 fis8 \bar "|" 
  fis8 fis8 a8 b8 \ln a4 a8 cis8 b8 \bar "|" cis8 b8 \ln cis4 ( a8 ) \ln gis4 \ln b4 a8 gis8[ a8] b8 \bar "||" 
}

bass = \relative c { \clef bass
	\autoBeamOff
  \override Tie #'extra-offset = #'(0.0 . -0.5)		
  \lnb a'4. \ln e4 ~ e8[ cis8] ~ \lnb cis4 ~ cis8 fis8 e8 \bar "|" a,8 b8 \lnb cis4 ~ cis8[ e8] \lnb fis4 ~ fis8 cis8 fis,8 \bar "|" 
  fis8 a8 a8 e'8 \ln fis4 d8 a'8 e8 \bar "|" a8 gis8 \lnb fis4. cis8[ e8] ~ e8[ b8] cis8 e8[ fis8] gis8 \bar "||" 
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


%%% Hymn Note markup

\markup { \hspace #54 \center-align { \line { "N. B" \hspace #-1.2 ".—" \italic "On Double Feasts tune" "261" \italic "was anciently used." }}}

\markup { \hspace #54 \center-align { \line { \smallCaps "Note" \hspace #-1.2 ".—" \italic "If a Modern Tune is required for this hymn it may be sung to" }
                          \line { \smallCaps "Melcombe" "(" \hspace #-1 \italic "No." "260)" \italic "or" \smallCaps "St. Venantius" "(" \hspace #-1 \italic "No." "18)." }}}


%%%% Lyric titles and attributions

\markup { "                    " }

\markup { "                    " }


\markup {
	\column {
	    \line { \small { \hspace #6 \smallCaps  "Office Hymn."  \italic "  None." \hspace #44 \italic "Ascribed to St. Ambrose, 340-97." } } 
	    \line { \small { \hspace #78 \italic "Tr. J. M. Neale." } } 
	    \line { \hspace #42 \small "Rerum Deus tenax vigor." }
	
}} 

%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.6 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
				  \hspace #-0.6    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "GOD, Creation's secret force,"
			                                 "  Thyself unmoved, all motion's source," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					  "Who from the morn till evening ray"
					  "Through all its changes guid'st the day:"
					   "      " %%% adds vertical spacing between verses
			  		}}
		      } 

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
			\line {"2  "
			   \column {	     
                                     "Grant us, when this short life is past,"
				     "The glorious evening that shall last;"
				     "That, by a holy death attained,"
				     "Eternal glory may be gained."
				   "               " %%% add vertical spacing between verses
			}}
           		\line { "3. "
			     \column {	     
				     "O Father, that we ask be done,"
				     "Through Jesus Christ, thine only Son;"
				     "Who, with the Holy Ghost and thee,"
				     "Doth live and reign eternally.      Amen."
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
	\clef "vaticana-fa2"
	\set fontSize = #3
	\override Staff.StaffSymbol #'staff-space = #1.6
	 
        \[ e8 \pes f8 \flexa e8 \]  e8  }} 
                    >> 
 \new Lyrics = "lyrics" { s1 }
 \new ChoirStaff
   <<
   \context Staff = upper \with {  fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
	                                              \voiceOne gis'8[ a gis] gis \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo \ln e4. dis8 \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  b'8[ a b] b  \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour e8[ cis e] gis, \bar "||" }}
			        >> 
   >>
  \context Lyrics = "lyrics" \lyricsto "sopranos" { \override LyricText #'font-size = #-1  "  A    -    -"  _ _ " men." }
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
	                                              \voiceOne gis'8[ a gis] gis \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo \ln e4. dis8 \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  b'8[ a b] b  \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour e8[ cis e] gis, \bar "||" }}
			        >> 
   >>
   
\midi {  
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) } }
      }
   	

} %% book bracket

