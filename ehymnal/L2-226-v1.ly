%%% 354.png
%%% Hymn 226 With gold most precious, and with sanguine hues of morn
%%% Version 1


\version "2.10"

\include "gregorian-init.ly"

\header {
  dedication = \markup {  \center-align { "SAINTS' DAYS: ST. PETER"
	\hspace #0.1 }}	
	
		
  title = "226"
  
  arranger = \markup { \small { "Mode i." }}
  
  tagline =""
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%% macro settings for stemless long note which is 2x duration of regular white note    
ln = {\once \override NoteHead #'duration-log = #0 
           \once \override Stem #'stencil = ##f
           \once \override NoteColumn #'force-hshift = #0.4 }
	   
%%% Plainsong half-bar.  Prints a bar glyph on a plainsong staff slightly shorter than a full height bar.
%%% Corresponds to a half-height bar on a normal SATB staff
%%% This macro works by replacing the glyph used by the \bar "|" function.	
	
phalfbar = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
            \once \override Staff.BarLine #'text = \markup  {  \hspace #-0.6 \filled-box #'(0 . 0.15) #'(-1.8 . 1.8 ) #0
            }          
        \bar "||"} 

%%%%%%%%%%%%%%%%%%%%%%%% End of Macro definitions

%%% plainsong voice

plainsong = {  \relative c { 
	\clef "vaticana-do3"
	\set fontSize = #3
        \key c \major 
	\set Staff.midiInstrument = "church organ"


  \[ d8 \pes a' a \pes b \] g \[ a \pes b \] c \[ b \flexa a \] \phalfbar d c \[b \flexa a \] g c \[ \virga b \inclinatum a \inclinatum g \] a \bar "|" a \[ a \pes c \inclinatum b \inclinatum a \]  \bar "" \break
  
  g \[ f g f \] \[ e \flexa d \] \phalfbar g \[ a \pes b \] c \[ b \flexa a \] g a a \bar "|" d \[ c \flexa b \] \[ c \pes d \] \[ c \flexa b \] a \phalfbar \break
	
  b c a b g a a \bar "|" a \[ a \pes c \inclinatum b \inclinatum a \] g \[ f g f \] \[e \flexa d \] \phalfbar e f d e c d d \bar "||"
  
}}


global = {
  \key c \major 
  \set Staff.midiInstrument = "church organ"
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

  \new VaticanaStaff {\plainsong }

\layout {
	
  ragged-right = ##f
  ragged-last = ##f
  \context { \Score timing = ##f }
  \context { \Score \override TimeSignature #'transparent = ##t }
  \context { \Score \remove "Mark_engraver" }
  \context { \Staff \consists "Mark_engraver" }
  
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


%%% A separate score block to generate the midi 


\score {	
	\new Staff = "midistaff" { \plainsong }

\midi { 
  \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) }
       } 
}


%%% Hymn Note markup

\markup { \hspace #54 \center-align { \line { \smallCaps "Note" \hspace #-1.2 ".—" \italic "The accompaniment to this plainsong melody, and also the modern tune to this" }
                          \line { \italic "hymn is the same as that of No." "174." }}}

%%% Lyric titles and attributions

\markup { "           " } %%% force some blank space
\markup { "           " } %%% force some blank space


\markup {
	\column {
	    \line { \small { \hspace #6 \smallCaps  "Office Hymn" "(" \italic "St. Peter and" \hspace #44 \italic "Ascribed to Elpis, c. 500." } } 
	    \line { \small { \hspace #10 \italic "St. Paul" ")."  "  E." \italic "and" "M."   \hspace #52 \italic "Tr. T. A. L." } } 
	    \line { \hspace #48 \small "Aurea luce." }
	
}} 

\markup { \hspace #22 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "W" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ITH gold most precious, and with sanguine hues of morn,"
			                                 "  O Saviour gracious, Light of light, this day adorn," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "To sinners granting pardon, peace, and welcome home,"
					   "Where heaven is chanting praise of splendid martyrdom."
			                   "               " %%% add vertical spacing between verses		
			  }}
		      }
		      	\line {"2  "
			   \column {	     
				  "For thy true servant Peter bearing high the keys,"
				  "And Paul whose fervent word proclaimed thy mysteries,"
				  "By cross victorious and by sword-stroke triumphing,"
				  "Now share the glorious court of life's eternal King."
				   "               " %%% add vertical spacing between verses
			}}
			\line {"3  "
			   \column {	     
				   "O kindly pastor, unto whose apostolate"
				   "The royal Master gave in charge the heavenly gate,"
				   "In sin's defiling bondage be our joy to gauge"
				   "The reconciling virtue of thine embassage."
				   "               " %%% add vertical spacing between verses
			}}
			\line {"4  "
			   \column {	     
				  "O faithful teacher, noble saint of ecstasy,"
				  "Fuller and richer be the truth we learn of thee,"
				  "Till for the failing doctrine that in part we know"
				  "His all-revealing light our bounteous God bestow."
				   "               " %%% add vertical spacing between verses
			}}
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

\markup { \hspace #22 %%add space as necc. to center the column
          \column { %% super column of everything
		\hspace #1 % adds vertical spacing between verses
			\line {"5  "
			   \column {	     
				  "In faith unshrinking, fearing not your hope to prove,"
				  "And deeply drinking from the fount of either love,"
				  "Ye stood in union like twin olive trees of grace;"
				  "Through whose communion may we seek the Father's face."
				   "               " %%% add vertical spacing between verses
			}}
			\line {"6. "
			   \column {	     
				   "To thee, the glorious Christ, our Saviour manifest,"
				   "All wreaths victorious, praise and worship be addrest;"
				   "Whom with the living Father humbly we adore,"
				   "And the life-giving Spirit, God for evermore.      Amen."
				   "               " %%% add vertical spacing between verses
			}}
	  }
} %%% lyric markup bracket

%%%markup for alternative tunes

\markup { \hspace #36 \italic "Or for O. H.," "M. 175" \italic "or" "176." }  

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
	 
        \[ d8 e d\]  d4 }} 
                    >> 
 \new Lyrics = "lyrics" { s1 }
 \new ChoirStaff
   <<
   \context Staff = upper \with {  fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
	                                              \voiceOne d8[ e d] \ln d4 \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  b8[ c b] \ln a4  \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  \ln g'4. \ln f4 \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour g8[ c g] \ln d4 \bar "||" }}
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
	                                              \voiceOne d8[ e d] \ln d4 \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  b8[ c b] \ln a4  \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  \ln g'4. \ln f4 \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour g8[ c g] \ln d4 \bar "||" }}
			        >> 
   >>
   
\midi {  
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) } }
      }
	

} %% book bracket

