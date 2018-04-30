%%% 270b.png
%%% Hymn 170 Christ is made the sure Foundation.
%%% Version 2


\version "2.10"

\include "gregorian-init.ly"

\header {
  dedication = \markup { \center-align {  "THE CHRISTIAN YEAR - DEDICATION FESTIVAL"
		\hspace #0.1 }}	

  title = "170"
  
  arranger = \markup { \small { "Mode i." }}
  
  tagline =""
}

%%%%%%%%%%%%%%%% Macros

%% macro settings for stemless long note which is 2x duration of regular white note    
ln = {\once \override NoteHead #'duration-log = #0 
           \once \override Stem #'stencil = ##f
           \once \override NoteColumn #'force-hshift = #0.4 }


%% settings to generate the double longnotes (breves)

brevenote = { \once \override NoteHead #'duration-log = #-1  
                \once \override NoteColumn #'force-hshift = #0.8 }
	   		
%%% suprresses printing of accidental
noacci = \once \override Accidental #'transparent = ##t


%%%%%%%%%%%%% End of Macro Definitions		
		
%%% plainsong voice

plainsong = \context VaticanaVoice  {  \relative c { 
	\clef "vaticana-fa2"
	\set fontSize = #3
        \key c \major 
  a'8 a a \[ g \flexa f \] g a a d, \bar "|" f g e f d c d \bar "|" \break
  f d e f g a \[ \virga g \inclinatum f \inclinatum e \] d \bar "|" e f e d e d c \bar "|" \break
  a \[ c \pes d \] d \[ d \flexa c \] f g g f \bar "|" a g \[ f \flexa e \] \[ f \pes g \inclinatum f \inclinatum e \] d c d \bar "||"
}} 
  
%%% SATB voices

global = {
  \key f \major 
  \set Staff.midiInstrument = "church organ"
}

amenglobal = {
  \key bes \major 
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
	\autoBeamOff
  d'8 d d c[ bes] c d d g, \bar "|" bes c a bes g f g \bar "|" \break
  bes g a bes c d c[ bes a] g \bar "|" a bes a g a g f \bar "|" \break
  d f[ g] g g[ f] bes c c bes \bar "|" d c bes[ a] bes[ c bes a] g f g \bar "||" 
}


alto = \relative c' {
	\autoBeamOff
  f8 g f ees[ d] \ln f4 f8 ees! \bar "|" f ees! c d bes d ~ d \bar "|"
  f c \brevenote f\breve *1/4 ~ \ln f4. d8 \bar "|" \ln f4. d8 f \noacci e c \bar "|"
  bes c[ d] ees! ees[ f] d g f d \bar "|" f f \ln d4 ~ d8[ ees!] f~[ f] ees! d d \bar "||"
}


tenor = \relative c { \clef bass
	\autoBeamOff
  bes'8 bes a \ln g4 a8 a bes bes \bar "|" bes g f ~ f g bes bes \bar "|"
  bes c c bes f bes a[ d c] bes \bar "|" \ln d4 c8 d c c a \bar "|"
  f f[ bes] bes \ln bes4 ~ bes8 g a bes \bar "|" bes a d[ c] bes[ a] \ln bes4 ~ bes8 bes bes \bar "||"
}

bass = \relative c { \clef bass
	\autoBeamOff
  bes'8 g d ees[ g] f d bes ees! \bar "|" d c f bes, ees! bes' g \bar "|"
  d \noacci e f d a bes \ln f'4. g8 \bar "|" d bes f' bes, a c f \bar "|"
  bes, a[ g] ees' ees[ d] g ees! f bes, \bar "|" bes' f \ln g4 ~ g8[ c,]( \ln d4) ees!8 bes g \bar "||"
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


\markup {  \line { \hspace #26 \italic "See also:" \hspace #1 \small {\column { "634  Hail thee, Festival Day."
	            					        "635  Eternal Power, whose high abode."
		     						"636  Only-begotten, Word of God eternal."
								"637  Lo! God is here! let as adore." }}}}


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


%%% Lyric Titles


%%% Lyric titles and attributions

\markup { \hspace #12 \small {  \column { \line {\smallCaps  "Office Hymn."  "M." \italic "and" "E."  \hspace #30 \italic "c. 7th cent.  Tr. J. M. Neale." }    
					 \line { \hspace #28 "Angularis fundamentum." }
}}}


%%% Lyrics

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "C" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HRIST is made the sure Foundation,"
			                                 "  And the precious Corner-stone," } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Who, the two walls underlying,"
					   "    Bound in each, binds both in one,"
					   "Holy Sion's help for ever,"
					   "    And her confidence alone."
					   "          " %%% adds space between verses
			  		}} 
			         } %%% finish verse 1 
           		\line { "2  "
			   \column {	     
				   "All that dedicated City,"
				   "    Dearly loved by God on high,"
				   "In exultant jubilation"
				   "    Pours perpetual melody:"
				   "God the One, and God the Trinal,"
				   "    Singing everlastingly."
				   "                " %%% adds vertical spacing between verses
			}}
			   \line { "3  "
			   \column {	     
				   "To this temple, where we call thee,"
				   "    Come, O Lord of Hosts, to-day;"
				   "With thy wonted loving-kindness"
				   "    Hear thy people as they pray;"
				   "And thy fullest benediction"
				   "    Shed within its walls for ay."
				   "                " %%% adds vertical spacing between verses
			}}
			   \line { "4  "
			   \column {	     
				   "Here vouchsafe to all thy servants"
				   "    What they supplicate to gain;"
				   "Here to have and hold for ever"
				   "    Those good things their prayers obtain,"
				   "And hereafter in thy glory"
				   "    With thy blessèd ones to reign."
				   "                " %%% adds vertical spacing between verses
			}}
			   \line { "5. "
			   \column {	     
				   "Laud and honour to the Father;"
				   "    Laud and honour to the Son;"
				   "Laud and honour to the Spirit;"
				   "    Ever Three and ever One:"
				   "Consubstantial, co-eternal,"
				   "    While unending ages run.     Amen."
				   "                " %%% adds vertical spacing between verses
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
	\clef "vaticana-fa2"
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
	                                              \clef treble \amenglobal
	                                              \voiceOne g'8[ a g] \ln g4 \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \amenglobal
	                                              \voiceTwo  d8[ f ees] \ln d4 \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \amenglobal
	                                          \voiceThree  bes'8[ d bes] \ln bes4 \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \amenglobal
						  \voiceFour g'8[ d8 ees] \ln g4 \bar "||" }}
			        >> 
   >>
  \context Lyrics = "lyrics" \lyricsto "sopranos" { \override LyricText #'font-size = #-1  A  -- _ _ men. }
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
	                                              \clef treble \amenglobal
	                                              \voiceOne g'8[ a g] \ln g4 \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \amenglobal
	                                              \voiceTwo  d8[ f ees] \ln d4 \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \amenglobal
	                                          \voiceThree  bes'8[ d bes] \ln bes4 \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \amenglobal
						  \voiceFour g'8[ d8 ees] \ln g4 \bar "||" }}
			        >> 
   >>
   
\midi {  
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 80 8) }
      }

}
	

} %% book bracket
