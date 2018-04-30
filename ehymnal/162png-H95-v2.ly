%%% 162.png
%%% Hymn 95 Sing my tongue, the glorious battle
%%% Version 2


\version "2.10"

\include "gregorian-init.ly"

\header {
  dedication = \markup { \center-align {  "THE CHRISTIAN YEAR - PASSIONTIDE"
		\hspace #0.1 }}	
  title = "95"
  
  arranger = \markup { \small { "Mode iii." }}
  
  tagline =""
}

%%%%%%%%%%% Macros

%% moves plainsong accidentals leftwards so that they show up more clearly
moveacci = \once \override Accidental #'extra-offset = #'(-0.4 . 0 )

%% moves plainsong accidentals leftwards a greater amount so that they show up more clearly
bigmoveacci = \once \override Accidental #'extra-offset = #'(-1.4 . 0 )


%% macro settings for stemless long note which is 2x duration of regular white note    
ln = {\once \override NoteHead #'duration-log = #0 
           \once \override Stem #'stencil = ##f
           \once \override NoteColumn #'force-hshift = #'0.4 }

noacci = { \once \override Accidental #'transparent = ##t }

%%%%%%%%%%%% End of Macro definitions

%%% plainsong voice

plainsong = \context VaticanaVoice  {  \relative c { 
	\clef "vaticana-do1"
	\set fontSize = #3
        \key c \major 

  a'8 a a g c c \[ d \pes f \] f \bar "|" \[ f \pes g \] f f f d f \[ \virga e \inclinatum d \inclinatum c \] \bar "|" \break

  c d f e d c d d \bar "|" d e c b a d \[ d \flexa g, \] \bar "|" \break

  c c c a c d d c \bar "|" d e c \[ d \flexa c \] \moveacci bes g a \bar "||"
} }
  

%%% SATB voices

global = {
  \key c \major 
  \set Staff.midiInstrument = "church organ"
}


soprano = \relative c' {
	\autoBeamOff

  e8 e e d g g a[c] c \bar "|"c [d] c c c a c b[a g] \bar "|"
  g a c b a g a a \bar "|" a b g fis! e a a[d,] \bar "|"
  g g g e g a a g \bar "|" a b g a[g] \noacci f d e \bar "||"
}


alto = \relative c' {
	\autoBeamOff
	
  \ln b4 c8 b \ln d4 \ln f4 e8 \bar "|" \ln g4  ~ g8 a g f e \ln d4. \bar "|"
  d8 \ln e4( \ln e) e8 e e \bar "|" fis fis e d b c c[a] \bar "|"
  \ln c4 ~ \ln c4 ~ c8 c8  ~ c8 c8 \bar "|" c d e \ln e4 d8 d b \bar "||"
}


tenor = \relative c { \clef bass
	\autoBeamOff

  \ln g'4 ~ g8 g8 \ln b4 c8[a]c \bar "|" e[d] e ~ e \ln c4 ~ c8 d[c b] \bar "|"
  b8 c e d c b c c \bar "|" d d b ~ b g a e[f!] \bar "|"
  \ln e4 ~ e8 g e e ~ e e \bar "|" e g b \ln c4 a8 a g \bar "||"
}

bass = \relative c { \clef bass
	\autoBeamOff
	
  \ln e4 c8 g' \ln g4 \ln f c8 \bar "|" c'[b]c a e f c \ln g'4. \bar "|"
  b8 \ln a4 ~ \ln a4 e8 a, a \bar "|" d b e b e a, a[d] \bar "|"
  \ln c4 ~ \ln c4 ~ c8 a8 ~ a8 c8 \bar "|" a g e' \ln c4 d8 f e \bar "||"
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
	    \line { \small { \hspace #6 \smallCaps  "Office Hymn.  M." \italic "  Passion Sunday and " \hspace #21 \italic "Bishop Venantius Fortunatus," } }  
	    \line { \small { \hspace #8 \italic "daily till Maundy Thursday."    \hspace #36 \italic "530-609.  Tr. P. D." } }                                   
            \line { \small { \hspace #34 "Pange lingua gloriosi proelium certaminis."} }
	    \line { " "}
} } 
  
\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "S" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ING, my tongue, the glorious battle,"
			                                 "  Sing the ending of the fray;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Now above the Cross, the trophy,"
					   "    Sound the loud triumphant lay:"
					   "Tell how Christ, the world's Redeemer,"
					   "    As a Victim won the day."
			  		}}
			       
			           } %% finish stanza 1	
}}

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
%%% continuation of lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
                        \hspace #1  % adds vertical spacing between verses  
           		\line { "2  "
			   \column {	     
				   "God in pity saw man fallen,"
				   "    Shamed and sunk in misery,"
				   "When he fell on death by tasting"
				   "    Fruit of the forbidden tree;"
				   "Then another tree was chosen"
				   "    Which the world from death should free."
			}}
		  \hspace #1  % adds vertical spacing between verses 
		  \line { "3  "
		    \column {	     
			    "Thus the scheme of our salvation"
			    "    Was of old in order laid,"
			    "That the manifold deceiver's"
			    "    Art by art might be outweighed."
			    "And the lure the foe put forward"
			    "    Into means of healing made."
			}}
		\hspace #1 % adds vertical spacing between verses  
           	\line {"4  "
		    \column {	     
			    "Therefore when the appointed fullness"
			    "    Of the holy time was come,"
			    "He was sent who maketh all things"
			    "    Forth from God's eternal home;"
			    "Thus he came to earth, incarnate,"
			    "    Offspring of a maiden's womb."
			}} 
		\hspace #1 % adds vertical spacing between verses
           	\line { "5. "
		   \column {	     
			   "To the Trinity be glory"
			   "    Everlasting, as is meet;"
			   "Equal to the Father, equal"
			   "    To the Son and Paraclete:"
			   "Trinal Unity, whose praises"
			   "    All created things repeat.     Amen."
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
	\clef "vaticana-do1"
	\set fontSize = #3
	\override Staff.StaffSymbol #'staff-space = #1.6
	 
        \[ a'8 \pes \bigmoveacci bes8 \]   \[
	    \override NoteHead #'extra-offset = #'(0.0 . -0.1 ) a8 
            \override NoteHead #'extra-offset = #'(-0.38 . 0.0 ) \flexa  g8 \pes 
            \override NoteHead #'extra-offset = #'(0.02 . 0.05) a8 \] }} 
                    >> 
 \new Lyrics = "lyrics" { s1 }
 \new ChoirStaff
   <<
   \context Staff = upper \with {  fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
	                                              \voiceOne e8[ f] e8[ d8 e8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  \ln c4 c8[ a8 b8] \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  g'8[ f8] g8[ a8 g8] \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour c8[ a8] c8[ f,8 e8] \bar "||" }}
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
	                                              \voiceOne e8[ f] e8[ d8 e8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  \ln c4 c8[ a8 b8] \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  g'8[ f8] g8[ a8 g8] \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour c8[ a8] c8[ f,8 e8] \bar "||" }}
			        >> 
   >>
   
\midi {  
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 80 8)
            }
       }

}

%%% Alternative hymns

\markup { \hspace #50 \center-align { \line { \smallCaps "Note" \hspace #-1.2 ".—" \italic "Nos. 95 and 96 may also be sung to" \smallCaps "St. Thomas" "(" \hspace #-1 \italic "No. 31" \hspace #-1 ")," \smallCaps "Tantum Ergo" }
	\line { "(" \hspace #-1 \italic "No. 33" \hspace #-1 ")," \italic "the Mechlin Melody at 326, or" \smallCaps "Oriel" "(" \hspace #-1 \italic "No. 507" \hspace #-1 ")." }    
}}	

} %% book bracket