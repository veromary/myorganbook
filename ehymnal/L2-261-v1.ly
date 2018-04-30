%%% 407.png
%%% Hymn 261 O God of truth, O Lord of might
%%% Version 1


\version "2.10"

\include "gregorian-init.ly"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—NOON"
	                                        \hspace #0.1 }}	
	
  title = "261"

  arranger = \markup { \small { "Mode ii." }}
  
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
	   
%%% settings to generate the double longnotes (breves)

brevenote = { \once \override NoteHead #'duration-log = #-1  
                \once \override NoteColumn #'force-hshift = #0.4 }
		
%%% macro settings for black notes 1/2 the duration of regular stemmed white notes    

crotchet = { \once \override NoteHead #'duration-log = #2  }
				
%%%%%%%%%%%%% End of Macro Definitions		
		
%%% plainsong voice

plainsong = \context VaticanaVoice  {  \relative c { 
	\clef "vaticana-do3"
	\set fontSize = #3
        \key c \major 

  a'8 g a c d c b a \bar "|" d d c d \[ c \flexa b \] a g a \bar "|" \break
  a a b g e g a a \bar "||" a g a c d c b a \bar "||" 
}} 
  
%%% SATB voices

global = {
  \key c \major 
  \set Staff.midiInstrument = "church organ"
}


soprano = \relative c' {
	\autoBeamOff
  a'8 g8 a8 c8 d8 c8 b8 a8 \bar "|" d8 d8 c8 d8 c8[ b8] a8 g8 a8 \bar "|" 
  a8 a8 b8 g8 e8 g8 a8 a8 \bar "|" a8 g8 a8 c8 d8 c8 b8 a8 \bar "||" 
}


alto = \relative c' {
	\autoBeamOff
  e8 e8 c8 c8 f8 g8 g8 e8 \bar "|" \ln f4 e8 g8 \ln g4 f8 e8 f8 \bar "|" 
  f8 e8 g8 d8 c8 d8 \ln e4 \bar "|" f8 e8 f8 \ln g4 \ln e4 c8 \bar "||" 
}


tenor = \relative c { \clef bass
	\autoBeamOff
  \override Tie #'extra-offset = #'(0.0 . 0.5)		
  c'8 b8 a8 g8 \crotchet a16 ( \crotchet b16 ) c8 d8 c8 \bar "|" \ln a4 ~ a8 b8 \brevenote c\breve * 1/4 ~ c8 \bar "|" 
  d8 c8 d8 g,8 g8 g8 \ln c4 \bar "|" \ln c4. ~ c8 g8 \ln g4 a8 \bar "||"
}

bass = \relative c { \clef bass
	\autoBeamOff
  a'8 e8 f8 e8 d8 e8 g8 a8 \bar "|" d,8 f8 a8 g8 \lnb e4 f8 c8 f8 \bar "|" 
  d8 a'8 g8 b,8 c8 b8 \lnb a4 \bar "|" f'8 c8 f8 e8 b8 c8 e8 a,8 \bar "||"
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

\markup { \hspace #54 \center-align { \line { \smallCaps "Note" \hspace #-1.2 ".—" \italic "If a Modern Tune is required for this hymn it may be sung to" }
                          \line { \smallCaps "Melcombe" "(" \hspace #-1 \italic "No." "260)" \italic "or" \smallCaps "St. Venantius" "(" \hspace #-1 \italic "No." "18)." }}}


%%%% Lyric titles and attributions

\markup { "                    " }

\markup { "                    " }


\markup {
	\column {
	    \line { \small { \hspace #6 \smallCaps  "Office Hymn."  \italic "  Sext." \hspace #44 \italic "Ascribed to St. Ambrose, 340-97." } } 
	    \line { \small { \hspace #78 \italic "Tr. J. M. Neale." } } 
	    \line { \hspace #42 \small "Rector potens, verax Deus." }
	
}} 


%%% Lyrics

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.6 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
				  \hspace #-0.6    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "GOD of truth, O Lord of might,"
			                                 "  Who orderest time and change aright," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					  "And send'st the early morning ray,"
					  "And light'st the glow of perfect day:"
					   "      " %%% adds vertical spacing between verses
			  		}}
		      } 
		      			\line {"2  "
			   \column {	     
				   "Extinguish thou each sinful fire,"
				   "And banish every ill desire;"
				   "And while thou keep'st the body whole,"
				   "Shed forth thy peace upon the soul."
				   "               " %%% add vertical spacing between verses
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

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
		  	\hspace #1  % adds vertical spacing between verses  
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
	\clef "vaticana-do3"
	\set fontSize = #3
	\override Staff.StaffSymbol #'staff-space = #1.6
	 
        \[ a'8 \pes b8 \flexa a8 \]  a4  }} 
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
	                                              \voiceTwo \ln e4( c8) \ln c4 \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  c'8[ g f] \ln e4  \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour a8[ e f] \ln a4 \bar "||" }}
			        >> 
   >>
  \context Lyrics = "lyrics" \lyricsto "sopranos" { \override LyricText #'font-size = #-1  "  A   "  -- _ _ " men." }
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
	                                              \voiceTwo \ln e4( c8) \ln c4 \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  c'8[ g f] \ln e4  \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour a8[ e f] \ln a4 \bar "||" }}
			        >> 
   >>
   
\midi {  
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) } }
      }
   	

} %% book bracket

