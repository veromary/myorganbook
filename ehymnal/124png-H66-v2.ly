%%% 124 png
%%% Hymn 66 O Kind Creator, bow thine ear
%%% Version 2


\version "2.10"

\include "gregorian-init.ly"

\header {
  dedication = \markup { \center-align {  "THE CHRISTIAN YEAR - LENT"
		\hspace #0.1 }}	
  title = "66"
  arranger = \markup { \small { "Mode ii." }}
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macro Definitions

%% macro settings for stemless long note which is 2x duration of regular white note    
ln = {\once \override NoteHead #'duration-log = #0 
           \once \override Stem #'stencil = ##f
           \once \override NoteColumn #'force-hshift = #'0.4 }

	   
%% moves plainsong accidentals leftwards so that they show up more clearly
moveacci = \override Accidental #'extra-offset = #'(-0.2 . 0 )

push = \once \override NoteHead #'X-offset = #1 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro Definitions

%%% plainsong voice

plainsong = \context VaticanaVoice  {  \relative c { 
	\clef "vaticana-fa2"
	\set fontSize = #3
        \key c \major 
	
  \[ d8 \flexa c8 \] d8 \[ f8 \flexa e8 \] f8 \[ d8 \pes e8 \] \[ e8 \flexa d8 \] \[ c8 \pes d8 \] d8 \bar "|" 
      \[ f8 \flexa e8 \] \[ f8 \pes g8 \] \bar "" \break

  \[ \virga g8 \inclinatum f8 \inclinatum e8 \] d8 \[ f8 \flexa e8 \] \[ d8 \pes e8 \] \[ d8 \flexa c8 \] c8 \bar "|" 
      c8 d8 e8 \[ f8 \flexa e8 \] d8 \bar "" \break 

  \[ f8 \flexa e8 \] \[ f8 \pes g8 \] g8 \bar "|" 
      \[ c,8 \pes d8 \] \[ f8 \pes g8 \] e8 \[ f8 \flexa e8 \] d8 \[ e8 \flexa d8 \] \[ c8 \pes d8 \] d8 \bar "||" 
}
}

%%% SATB voices

global = {
  \key f \major 
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
	\autoBeamOff

  g'8[ f8] g8 bes8[ a8] bes8 g8[ a8] a8[ g8] f8[ g8] g8 \bar "|" 
      bes8[ a8] bes8[ c8] \bar "" \break 
  
  c8[ bes8 a8] g8 bes8[ a8] g8[ a8] g8[ f8] f8 \bar "|" 
      f8 g8 a8 bes8[ a8] g8 \bar "" \break 
      
  bes8[ a8] bes8[ c8] c8 \bar "|" 
      f,8[ g8] bes8[ c8] a8 bes8[ a8] g8 a8[ g8] f8[ g8] g8 \bar "||"
}

alto = \relative c' {
	\autoBeamOff
	
  \ln d4 ~ d8 \ln g4 ~ g8 d8[ f8] f8[ d8] \ln \push d4 ees8 \bar "|" 
      \ln f4 ~ \ln f4 ~  \bar "" \break 
  
  \ln f4. d8 \ln f4  \ln e!4 ~ e8[ c8] c8 \bar "|" 
      d8 d8 f8 \ln f4 ees8 \bar "" \break 
  
  \ln d4 ~ d8[ ees8] f8 \bar "|" 
      f8[ d8] d8[ f8] ~ f8 \ln f4 d8 f8[ d8] ~ \ln d4 ~ d8 \bar "||"
}

tenor = \relative c { 
	\clef bass
	\autoBeamOff

  bes'8[ a8] bes8 \push \ln d4 ~ d8 bes8[ c8] c8[ bes8] \ln \once \override NoteColumn #'force-hshift = #1.8 bes4 ~ bes8 \bar "|"
      \push \ln f4 bes8[ a8] \bar "" \break 
      
  a8[ bes8 c8] bes8 bes8[ c8] \ln c4 ~ c8[ a8] a8 \bar "|"
      bes8 bes8 c8 \push \ln bes4 ~ bes8 \bar "" \break 
      
  \push \ln bes4 ~ bes8[ g8] a8 \bar "|"
      c8[ bes8] g8[ a8] c8 d8[ c8] bes8 d8[ bes8] a8[ bes8] bes8 \bar "||" 
}

bass = \relative c { 
	\clef bass
	\autoBeamOff
	
  g'8[ d8] g8 \push \ln g4 ~ g8 g8[ f8] f8[ g8] bes8[ g8] ees8 \bar "|" 
      \push \ln d4 d8[ f8] \bar "" \break 
  
  \ln f4. g8 d8[ f8] c8[ a8] c8[ f8] f8 \bar "|" 
      bes8 g8 f8 \push \ln d4 ees!8 \bar "" \break 
  
  \push \ln g4 ~ g8[ c,8] f8 \bar "|" 
      a8[ g8] g8[ f8] ~ f8 bes,8[ f'8] g8 \ln d4 ~ d8[ g,8] g8 \bar "||" 
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

%%% Score block

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

%%% Lyric titles

\markup {
	\column {
	    \line { \small { \hspace #6 \smallCaps "Office Hymn." " M." \italic " Till Lent" "iii." \hspace #20 \italic {"Asc. to St. Gregory the Great, 6th cent.  Tr. T. A. L."} } }  
	    \line { \small { \hspace #40 "Audi benigne Conditor."} }
} }

%%% Main block of lyrics

\markup { \hspace #30 %%add space as necc. to center the column
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "  KIND Creator, bow thine ear"  "  To mark the cry, to know the tear" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Before thy throne of mercy spent"
					   "In this thy holy fast of Lent."
			  		}}
			       
			           } %% finish verse 1	 
}	  
	

%%% fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
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

%%% second page
%%% continuation of  lyrics

\markup { \hspace #30   %%add space as necc. to center the column
          \column { 

		  \line { "2  "
		    \column {	     
			    "Our hearts are open, Lord, to thee:"
			    "Thou knowest our infirmity;"
			    "Pour out on all who seek thy face"
			    "Abundance of thy pardoning grace."
			}}
		 \hspace #1  % adds vertical spacing between verses  	
		  \line { "3  "
		    \column {	     
			    "Our sins are many, this we know;"
			    "Spare us, good Lord, thy mercy show;"
			    "And for the honour of thy name"
			    "Our fainting souls to life reclaim."
			}}
		\hspace #1  % adds vertical spacing between verses   
		\line { "4  "
		    \column {	     
			    "Give us the self-control that springs"
			    "From discipline of outward things,"
			    "That fasting inward secretly"
			    "The soul may purely dwell with thee."
			}}
           	\hspace #1  % adds vertical spacing between verses  		  
           	\line { "5. "
		   \column {	     
			   "We pray thee, Holy Trinity,"
			   "One God, unchanging Unity,"
			   "That we from this our abstinence"
			   "May reap the fruits of penitence.     Amen."
     			}}
	  }
}% lyric markup bracket


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
	 
        \[ d8 \pes e8 \]  \[
	    \override NoteHead #'extra-offset = #'(0.0 . -0.1 ) d8 
            \override NoteHead #'extra-offset = #'(-0.38 . 0) \flexa  c8 \pes 
             \override NoteHead #'extra-offset = #'(0.0 . 0.0 ) d8 \] }}

                    >>
  
 \new Lyrics = "lyrics" { s1 }
 \new ChoirStaff
   <<
   \context Staff = upper \with {  fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
	                                              \voiceOne g'8[ a8] g8[ f8 g8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo d8[ f8] \ln d4 ~ d8  \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree bes'8[ c8] bes8[ a8 bes8] \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour g'8[ f8] g8[ d8 g,8] \bar "||" }}
			        >> 
   >>
  \context Lyrics = "lyrics" \lyricsto "altos" { \override LyricText #'font-size = #-1  A -- _ men. }
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

%%% Separate Score block for Amen midi
%%% Score comprises 1/8 notes masquerading as 1/2 notes, so tempo has to be adjusted accordingly, tempo set to 2=80

\score {  
 \new ChoirStaff
   <<
   \context Staff = upper \with {  fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
	                                              \voiceOne g'8[ a8] g8[ f8 g8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo d8[ f8] \ln d4 ~ d8  \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree bes'8[ c8] bes8[ a8 bes8] \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour g'8[ f8] g8[ d8 g,8] \bar "||" }}
			        >> 
   >>

\midi {  
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 80 8)
            }
       }  
}

} %% book bracket