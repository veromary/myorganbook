%%% 110 png
%%% Hymn 52 O splendour of God's glory bright
%%% Version 2


\version "2.10"

\include "gregorian-init.ly"

\header {
  dedication = \markup { \center-align {  "THE CHRISTIAN YEAR - FROM THE EPIPHANY TILL LENT"
		\hspace #0.1 }}	
  title = "52"
  arranger = \markup { \small { "Mode i." }}
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macro Definitions

%% macro settings for stemless long note which is 2x duration of regular white note    
ln = {\once \override NoteHead #'duration-log = #0 
           \once \override Stem #'stencil = ##f
           \once \override NoteColumn #'force-hshift = #'0.4 }
	   
%% moves plainsong accidentals leftwards so that they show up more clearly
moveacci = \once \override Accidental #'extra-offset = #'(-0.2 . 0 )

%% suprresses printing of accidental
noacci = \once \override Accidental #'transparent = ##t

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro Definitions

%%% plainsong voice

plainsong = \context VaticanaVoice  {  \relative c { 
	\clef "vaticana-do3"
	\set fontSize = #3
        \key c \major 
	
  f8 f8 g8 a8 \moveacci bes8 a8 g8 a8 \bar "|" 
      a8 g8 c8 c8 g8 a8 \moveacci bes!8 \[a8 \flexa g8 \] \bar "|" \break
  a8 a8 g8 a8 g8 f8 e8 f8 \bar "|" 
      g8 a8 g8 f8 e8 \[ f8 \pes g8 \] e8 d8 \bar "||"
}
}

%%% SATB voices

global = {
  \key c \major 
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
	\autoBeamOff

  f8 f8 g8 a8 bes8 a8 g8 a8 \bar "|"
      a8 g8 c8 c8 g8 a8 bes!8 a8[ g8] \bar "|" 
  a8 a8 g8 a8 g8 f8 e8 f8 \bar "|" 
      g8 a8 g8 f8 e8 f8[ g8] e8 d8 \bar "||" 
}

alto = \relative c' {
	\autoBeamOff
	
  c8 d8 e8 \ln f4 ~ f8 e8 f8 \bar "|" 
      f8 g8 e8 f8 e8 \ln f4 ~ f8[ e8] \bar "|" 
  f8 f8 d8 f8 e8 d8 c8 d8 \bar "|" 
      e8 f8 e8 d8 c8 \ln c4 ~ c8 a8 \bar "||" 
}

tenor = \relative c { 
	\clef bass
	\autoBeamOff

  a'8 a8 c8 c8 bes8 \ln c4 ~ c8 \bar "|" 
      a8 
      %%% tweak ties to avoid collision with augmentation dot
      \override Tie #'extra-offset = #'(0.0 . 0.6)
      c8 ~ 
      \once \override Tie #'extra-offset = #'(0.0 . 0.3)
      \ln c4. ~ c8 bes!8 \ln c4 \bar "|" 
  c8 d8 \noacci b8 c8 c8 \ln a4 ~ a8 \bar "|" 
      c8 c8 c8 \ln a4 ~ a8[ g8] ~ g8 f8 \bar "||" 
}

bass = \relative c { 
	\clef bass
	\autoBeamOff
	
  f8 d8 c8 f8 d8 f8 c8 f8 \bar "|" 
      d8 e8 c8 a8 c8 f8 d8 f8[ c8] \bar "|" 
  f8 d8 g8 f8 c8 d8 a8 d8 \bar "|" 
      c8 f8 c8 d8 a'8 f8[ e8] c8 d8 \bar "||" 
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
	    \line { \small { \hspace #16 \smallCaps "Office Hymn." \hspace #40 \italic {"St. Ambrose, 340-97.   Tr. Y. H."} } }  
	    \line { \small { \hspace #20 \italic "Monday Morning." \hspace #4 "Splendor paternae gloriae."} }
} }
   
\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "  SPLENDOUR of God's glory bright,"  "  O thou that bringest light from light,"} }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "O Light of light, light's living spring,"
					   "O Day, all days illumining,"
			  		}}
			       
			           } %% finish stanza 1	
		  \hspace #1  % adds vertical spacing between verses  
		  \line { "2  "
		    \column {	     
			    "O thou true Sun, on us thy glance"
			    "Let fall in royal radiance,"
			    "The Spirit's sanctifying beam"
			    "Upon our earthly senses stream."
			}}
		  \hspace #1  % adds vertical spacing between verses  
		  \line { "3  "
		    \column {	     
			    "The Father, too, our prayers implore,"
			    "Father of glory evermore;"
			    "The Father of all grace and might,"
			    "To banish sin from our delight:"
			}}
		}  
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
		\line { "4  "
		    \column {	     
			    "To guide whate'er we nobly do,"
			    "With love all envy to subdue,"
			    "To make ill-fortune turn to fair,"
			    "And give us grace our wrongs to bear."
			}}
           	\hspace #1  % adds vertical spacing between verses  		  
           	\line { "5  "
		   \column {	     
			     "Our mind be in his keeping placed,"
			     "Our body true to him and chaste,"
			     "Where only faith her fire shall feed,"
			     "To burn the tares of Satan's seed."
			}}
           	  \hspace #1  % adds vertical spacing between verses  
		  \line { "6  "
		    \column {	     
			    "And Christ to us for food shall be,"
			    "From him our drink that welleth free,"
			    "The Spirit's wine, that maketh whole,"
			    "And, mocking not, exalts the soul."
			}}
		\hspace #1 % adds vertical spacing between verses  
           	\line {"7  "
		    \column {	     
			    "Rejoicing may this day go hence,"
			    "Like virgin dawn our innocence,"
			    "Like fiery noon our faith appear,"
			    "Nor know the gloom of twilight drear."
			}} 
		\hspace #1 % adds vertical spacing between verses  
           	\line {"8  "
		    \column {	     
			    "Morn in her rosy car is borne;"
			    "Let him come forth our perfect morn,"
			    "The Word in God the Father one,"
			    "The Father perfect in the Son."
		}}
		\hspace #1 % adds vertical spacing between verses
           	\line { "9. "
		   \column {	     
			   "All laud to God the Father be,"
			   "All praise, eternal Son, to thee;"
			   "All glory, as is ever meet,"
			   "To God the holy Paraclete.     Amen."
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
	\clef "vaticana-do3"
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
	                                              \voiceOne d8[ e8] d8[ c8 d8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo a8[ c8] \ln a4 ~ a8  \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree f8[ g8] f8[ e8 f8] \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour d8[ c8] d8[ a8 d,8] \bar "||" }}
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
	                                              \voiceOne d8[ e8] d8[ c8 d8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo a8[ c8] \ln a4 ~ a8  \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree f8[ g8] f8[ e8 f8] \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour d8[ c8] d8[ a8 d,8] \bar "||" }}
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