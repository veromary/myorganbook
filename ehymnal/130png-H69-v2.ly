%%% 130png
%%% Hymn 69 O Jesu Christ from thee began
%%% Version 2


\version "2.10"

\include "gregorian-init.ly"

\header {
  dedication = \markup { \center-align {  "THE CHRISTIAN YEAR - LENT"
		\hspace #0.1 }}	
  title = "69"
  arranger = \markup { \small { "Mode iv." }}
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% macro settings for stemless long note which is 2x duration of regular white note    
ln = {\once \override NoteHead #'duration-log = #0 
           \once \override Stem #'stencil = ##f
           \once \override NoteColumn #'force-hshift = #'0.4 }

%%% some of the long notes need a little more push to the right to align with notes above	   
push = \once \override NoteHead #'X-offset = #0.9	   

%% moves plainsong accidentals leftwards so that they show up more clearly
moveacci = \once \override Accidental #'extra-offset = #'(-1.4 . 0 )

%% suprresses printing of accidental
noacci = \once \override Accidental #'transparent = ##t

%%%%%%%%%%%%%%%%%%%%%%%% End of Macro Definitions

%%% plainsong voice
	   
plainsong = \context VaticanaVoice  {  \relative c { 
	\clef "vaticana-do3"
	\set fontSize = #3
        \key c \major 

  f8 \[ e8 \pes f8 \] \override NoteHead #'extra-offset = #'(-5.0 . 0.0 ) \[g8 \pes a8 \] 
      \revert NoteHead #'extra-offset 
      g8 \[ f8 \flexa d8 \] f \[ e8 \pes f8 \] e8 e8 \bar "|" g8 \[ a8 \pes \moveacci bes8 \] a8 \bar "" \break 

  \[ g8 \flexa f8 \] g8 \[ g8 \flexa f8 \] e8 \[ e8 \flexa d8 \] \bar "|" \[ c8 \pes d8 \] d8 \[ d8 \flexa c8 \] d8 f8 \bar "" \break
  
  \[ d8 \pes e8 \] e8 e8 \bar "|" g8 \[ g8 \pes a8 \] g8 \[ f8 \flexa d8 \] f8 \[ e8 \pes f8 \] e8 e8 \bar "||" 
}
}

%%% SATB voices

global = {
  \key d \major 
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
	\autoBeamOff

  g'8 fis[ g a b] a g[ e] g fis[ g] fis fis \bar "|" a b[ c] b
  
  a[ g] a a[ g] fis fis[ e] \bar "|" d[ e] e e[ d] e g 
  
  e[ fis] fis fis \bar "|" a a[ b] a g[ e] g fis[ g] fis fis \bar "||"
}

alto = \relative c' {
	\autoBeamOff
	
  d8 \ln d4( \ln e4.) \ln e4 b8 \ln d4. cis8 \bar "|" fis8 \ln g4.
  
  \ln fis4 e8 \ln d4. d8[ b] \bar "|" \ln b4 b8 c[ d] c! d
  
  \ln cis4 d8 d \bar "|" e \ln fis4. \ln e4 ~ e8 \ln d4. cis8 \bar "||"
}

tenor = \relative c { \clef bass
	\autoBeamOff

  b'8 \ln a4 ~ \ln a4. b8[ g( ] g) \ln b4. a8 \bar "|" d \ln d4. 
  
  \ln d4 a8 fis[ b a] a[ g] \bar "|" \ln g4 g8 \ln g4. b8
  
  \ln a4. b8 \bar "|" a \ln d4. b8[ g b] \ln b4. a8 \bar "||"
	
}

bass = \relative c { \clef bass
	\autoBeamOff
	
  g8 \ln d'4( \ln cis4.) \ln e4 e8 \ln b4. fis'8 \bar "|" d \ln g4.

  \ln d4 cis8 \ln d4. d8[ e] \bar "|" \push \ln g4 e8 c8[ b] c g 
  
  \ln a4 d8 b8 \bar "|" \noacci cis8 \ln d4. \ln e4 ~ e8 \ln b4( d8) fis8 \bar "||"
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
 }  %%% close layout
 
} %%% close score bracket
 
%%% A separate score block to generate the hymn midi minus the plainsong voice
%%% As the minims are quavers in disguise, the tempo has to be adjusted accodingly. Tempo is set for 2=80

\score {	
  \new ChoirStaff 
  <<
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
	
%%% Text markups - lyric titles

\markup { \small { \hspace #10 \smallCaps "Office Hymn." "  M." \italic "  Lent." "iii." \italic "till Passion Sunday."  \hspace #15  \italic "c. 9th cent.  Tr. T. A. L." } }
		                                                                                                     
\markup { \hspace #44 \small "Jesu quadragenariae."} 

%%% Main lyrics markup block
  
\markup { \hspace #32 %%add space as necc. to center the column
	              \column { %%% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 " JESU Christ, from thee began"  "  This healing for the soul of man," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "By fasting sought, by fasting found,"
					   "Through forty days of yearly round;"


			  		}}
			       
			           } %% finish verse 1	  
}	  



%%%fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
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
%%% Continuation of lyrics

\markup { \hspace #32   %%add space as necc. to center the column
          \column { 
		\hspace #1 
           	\line { "2  "
			   \column {	     
				   "That he who fell from high delight,"
				   "Borne down to sensual appetite,"
				   "By dint of stern control may rise"
				   "To climb the hills of Paradise."
			}}
		  \hspace #1 
		  \line { "3  "
		    \column {	     
			    "Therefore behold thy Church, O Lord,"
			    "And grace of penitence accord"
			    "To all who seek with generous tears"
			    "Renewal of their wasted years."
			}}
		\hspace #1 % adds vertical spacing between verses  
           	\line {"4  "
		    \column {	     
			    "Forgive the sin that we have done,"
			    "Forgive the course that we have run,"
			    "And show henceforth in evil day"
			    "Thyself our succour and our stay."
			}} 
		\hspace #1 % adds vertical spacing between verses  
           	\line {"5  "
		    \column {	     
			    "But now let every heart prepare,"
			    "By sacrifice of fast and prayer,"
			    "To keep with joy magnifical"
			    "The solemn Easter festival."
		}}
		\hspace #1 % adds vertical spacing between verses  
           	\line {"6. "
		    \column {	     
			    "Father and Son and Spirit blest,"
			    "To thee be every prayer addrest,"
			    "Who art in threefold Name adored,"
			    "From age to age, the only Lord.     Amen."
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
            \override NoteHead #'extra-offset = #'(0.02 . 0.0 ) e8 \] 
                    }} 
                    >>
  
 \new Lyrics = "lyrics" { s1 }
 \new ChoirStaff
   <<
   \context Staff = upper \with {  fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
	                                              \voiceOne fis8[ g8] fis8[ e8 fis8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo \ln d4 d8[ cis8  cis8] \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree a'8[ b8] \ln a4. \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour d8[ g,8] d'8[ a8 fis8] \bar "||" }}
			        >> 
   >>
  \context Lyrics = "lyrics" \lyricsto "altos" { \override LyricText #'font-size = #-1  \override LyricText #'self-alignment-X = #-1 A --  men. }
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

} %%% close Amen score block

%%% A separate score block for the Amen midi minus the plainsong voice
%%% Score comprises 1/8 notes masquerading as 1/2 notes, so tempo has to be adjusted accordingly

\score { 	
 \new ChoirStaff
   <<
   \context Staff = upper \with {  fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
	                                              \voiceOne fis8[ g8] fis8[ e8 fis8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo \ln d4 d8[ cis8 cis8] \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree a'8[ b8] \ln a4. \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour d8[ g,8] d'8[ a8 fis8] \bar "||" }}
			        >> 
   >>

\midi {  \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) }  }

}
	

} %%% book bracket