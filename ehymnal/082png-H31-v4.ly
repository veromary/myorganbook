%%% 082png
%%% Hymn 31 Saint of God elect and precious
%%% Version 4


\version "2.10.19"

\include "gregorian-init.ly"

\header {
  dedication = \markup { \center-align {  "THE CHRISTIAN YEAR - ST. STEPHEN'S DAY"
		\hspace #0.1 }}	
  title = "31"
  
  arranger = \markup { \small { "Mode i." }}
  
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% macro settings for stemless long note which is 2x duration of regular white note  

ln = {\once \override NoteHead #'duration-log = #0 
           \once \override Stem #'stencil = ##f
           \once \override NoteColumn #'force-hshift = #'0.4 }

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
                \once \override NoteColumn #'force-hshift = #1.2 }
	   	   
%%% suppress printing of implied accidentals	   
	   
noacci = { \once \override Accidental #'transparent = ##t }
	   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro definitions

%%% plainsong voice

plainsong = \context VaticanaVoice  {  \relative c' { 
	\clef "vaticana-fa2"
	\set fontSize = #3
        \key c \major 
  a8 a8 a8 \[g8 \flexa f8\] g8 a8 a8 d,8 \bar "|" f8 g8 e8 f8 d8 c8 d8 \bar "|" \break
  f8 d8 e8 f8 g8 a8 \[ \virga g8 \inclinatum f8 \inclinatum e8\] d8 \bar "|" e8 f8 e8 d8 e8 d8 c8 \bar "|" \break
  a8 \[c8 \pes d8\] d8 \[d8 \flexa c8\] f8 g8 g8 f8 \bar "|" a8 g8 \[f8 \flexa e8\] \[f8 \pes g8 \inclinatum f8 \inclinatum e8\] d8 c8 d8 \bar "||"
}
}

%%% SATB voices


global = {
  \key f \major 
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
	\autoBeamOff

  d'8 d8 d8 c8[ bes8] c8 d8 d8 g,8 \bar "|" bes8 c8 a8 bes8 g8 f8 g8 \bar "|"
  bes8 g8 a8 bes8 c8 d8 c8[ bes8 a8] g8 \bar "|" a8 bes8 a8 g8 a8 g8 f8 \bar "|"
  d8 f8[ g8] g8 g8[ f8] bes8 c8 c8 bes8 \bar "|" d8 c8 bes8[ a8] bes8[ c8 bes8 a8] g8 f8 g8 \bar "||"
}

alto = \relative c' {
	\autoBeamOff
	
  f8 g8 f8 ees8[ d8] \ln f4 f8 ees!8 \bar "|" f8 ees!8 c8 d8 bes8 d8 ~ d8 \bar "|"
  f8 c8 \brevenote f\breve*1/4 ~   
      \ln f4. d8 \bar "|" \ln f4. d8 f8 ees8 c8 \bar "|"
  bes8 c8[ d8] ees!8 ees8[ f8] d8 g8 f8 d8 \bar "|" f8 f8 \ln d4 ~ d8[ ees!8] f8[ ~ f8] ees!8 d8 d8 \bar "||"
}

tenor = \relative c { \clef bass
	\autoBeamOff

  bes'8 bes8 a8 \ln g4 a8 a8 bes8 bes8 \bar "|" bes8 g8 f8 ~ f8 g8 bes8 bes8 \bar "|"
  bes8 c8 c8 bes8 f8 bes8 a8[ d8 c8] bes8 \bar "|" \lnb d4 c8 d8 c8 c8 a8 \bar "|"
  f8 f8[ bes8] bes8 \ln bes4 ~ bes8 g8 a8 bes8 \bar "|" bes8 a8 d8[ c8] bes8[ a8] \ln bes4 ~ bes8 bes8 bes8 \bar "||"
}

bass = \relative c { \clef bass
	\autoBeamOff
	
  bes'8 g8 d8 ees!8[ g8] f8 d8 bes8 ees!8 \bar "|" d8 c8 f8 bes,8 ees!8 bes'8 g8 \bar "|"
  d8 \noacci e8 f8 d8 a8 bes8 \ln f'4. g8 \bar "|" d8 bes8 f'8 bes,8 a8 c8 f8 \bar "|"
  bes,8 a8[ g8] ees'!8 ees8[ d8] g8 ees!8 f8 bes,8 \bar "|" bes'8 f8 \ln g4 ~ g8[ c,8(] \lnb d4) ees!8 bes8 g8 \bar "||"
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
}

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

%%% Lyric titles

\markup {
	\column {
	    \line { \small { \hspace #18 \smallCaps  "Office Hymn. M." \italic "and" "E." \hspace #25 \small \italic "10th-16th cent.  Tr. J. M. Neale."}  }  
	    \line { \hspace #44 \small "Sancte Dei pretiose."} }
   }

%%% Lyrics

\markup { \hspace #32   %%add space as necc. to center the column
	    \line  {	
             \column { 
		  	\line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "S" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "AINT of God, elect and precious," "  Protomartyr Stephen, bright" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "With thy love of amplest measure,"
					   "    Shining round thee like a light;"
					   "Who to God commendedst, dying,"
					   "    Them that did thee all despite:"
			  		}}		       
	           } %% finish stanza 1

      }}

%%%fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.

\score{
{ s4 }
\header { breakbefore = ##f piece = ##f opus = ##f tagline = ##f }
\layout{
\context { \Staff
\remove Time_signature_engraver
\remove Key_engraver
\remove Clef_engraver
\remove Staff_symbol_engraver
}}}

%%% second page		
%%% continuation of lyrics

\markup { \hspace #32  %%add space as necc. to center the column  
         	 \column {		 		  
		   \line { "2  "
		       \column {	     
			       "Glitters now the crown above thee,"
			       "    Figured in thy sacred name:"
			       "O that we, who truly love thee,"
			       "    May have portion in the same;"
			       "In the dreadful day of judgement"
			       "    Fearing neither sin nor shame."
		   }} %% finish stanza 2
		   
		   \hspace #0.2 % adds vertical spacing between verses
		     \line { "3. "
		       \column {	     
			       "Laud to God, and might, and honour,"
			       "    Who with flowers of rosy dye"
			       "Crowned thy forehead, and hath placed thee"
			       "    In the starry throne on high:"
			       "He direct us, he protect us"
			       "    From death's sting eternally.      Amen."  
	          }} %% finish stanza 3 
          } %% column bracket
} %%markup bracket


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
	 
        \[ d8\melisma e8 d8\melismaEnd \] d4 } }
        
                    >>
  
 \new Lyrics = "lyrics" { s1 }
 \new ChoirStaff
   <<
   \context Staff = upper \with {  fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
                                                      \set Staff.midiInstrument = "church organ"
	                                              \voiceOne g'8[ a8 g8] \ln g4 \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
                                                      \set Staff.midiInstrument = "church organ"
	                                              \voiceTwo d8[ f8 ees8] \ln d4 \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass \global
                                                  \set Staff.midiInstrument = "church organ"
	                                          \voiceThree  bes'8[ d8 bes8] \ln bes4 \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass \global
                                                  \set Staff.midiInstrument = "church organ"
						  \voiceFour g'8[ d8 ees8] \ln g4 \bar "||" }}
			        >> 
   >>
  \context Lyrics = "lyrics" \lyricsto "altos" { \override LyricText #'font-size = #-1  A --  _ _ men. }
  >>
>>

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
                                                      \set Staff.midiInstrument = "church organ"
	                                              \voiceOne g'8[ a8 g8] \ln g4 \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
                                                      \set Staff.midiInstrument = "church organ"
	                                              \voiceTwo d8[ f8 ees8] \ln d4 \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass \global
                                                  \set Staff.midiInstrument = "church organ"
	                                          \voiceThree  bes'8[ d8 bes8] \ln bes4 \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass \global
                                                  \set Staff.midiInstrument = "church organ"
						  \voiceFour g'8[ d8 ees8] \ln g4 \bar "||" }}
			        >> 
   >>
   
\midi {  \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) } }
}


} %% book bracket

