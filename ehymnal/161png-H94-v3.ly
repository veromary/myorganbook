%%% 161.png
%%% Hymn 94 The royal banners forward go.
%%% Version 3


\version "2.10"

\include "gregorian-init.ly"

\header {
  dedication = \markup { \center-align {  "THE CHRISTIAN YEAR - PASSIONTIDE"
		\hspace #0.1 }}	
  title = "94"
  
  arranger = \markup { \small { "Mode i." }}
  
  tagline =""
}


%% moves plainsong accidentals leftwards so that they show up more clearly
moveacci = \once \override Accidental #'extra-offset = #'(-1.2 . 0 )

%% macro settings for stemless long note which is 2x duration of regular white note    
ln = {\once \override NoteHead #'duration-log = #0 
           \once \override Stem #'stencil = ##f
           \once \override NoteColumn #'force-hshift = #'0.4 }

noacci = { \once \override Accidental #'transparent = ##t }


push = \once \override NoteHead #'X-offset = #'1

%%% plainsong voice

plainsong = \context VaticanaVoice  {  \relative c { 
	\clef "vaticana-do3"
	\set fontSize = #3
        \key c \major 
	
  f8  \[ g8  \pes \moveacci bes8 \] bes8 \[ \virga a8 \inclinatum g8 \inclinatum f8\] g8 \[ g8  \pes a8 \flexa g8  \] f8 \[ e8 \flexa d8 \] \bar "|"
      g8 g8 a8 \bar "" \break
  
  \[ \virga f8 \inclinatum e8 \inclinatum d8\] f8 \[ e8 \pes f8 \] \[ d8 \flexa c8 \] \[ c8 \pes d8 \] \bar "|" 
      d8 d8 f8 \[ d8 \flexa c8 \] f8 \[ f8 \pes g8 \virga a8 \] \bar "" \break
  
  g8 \[ g8 \flexa f8 \] \bar "|" f8 \[ f8 \pes a8 \] 
      \once \override Accidental #'extra-offset = #'(-7.2 . 0 )
      \override NoteHead #'extra-offset = #'(-5.5 . 0.0 ) \[ \virga  bes!8 \inclinatum a8 \inclinatum g8 \] 
      \revert NoteHead #'extra-offset
      a8 \[ \virga f8 \inclinatum e8 \inclinatum d8 \]  f8 \[ e8 \pes f8 \] \[ d8 \flexa c8 \] \[ c8 \pes d8 \] \bar "||"
} }
  

%%% SATB voices

global = {
  \key ees \major 
  \set Staff.midiInstrument = "church organ"
}


soprano = \relative c' {
	\autoBeamOff

  aes'8 bes[ des] des c[ bes aes] bes bes[ c bes] aes g[ f] \bar "|" bes bes c

  aes8[ g f] aes g[ aes] f[ ees] ees[ f] \bar "|" f f aes f[ ees] aes aes[ bes c] 

  bes bes[ aes] \bar "|" aes aes[ c des! c bes] c aes[ g f] aes g[ aes] f[ ees] ees[ f] \bar "||"
}


alto = \relative c' {
	\autoBeamOff
	
  c8 ees[ f] f \ln ees4. ees8 \ln ees4. ees8 ees8[ c] \bar "|" d! \ln ees4

  \ln c4. ees8 des[ ees] des[ c] bes[ c] \bar "|" des! c ees \ln  c4. \ln ees4.

  f8 g[ ees] \bar "|" f \ln ees4( \ln des!4.) ees8  \ln ees4( des!8) ees8 \ln ees4 des!8[ c] \ln c4 \bar "||"
}


tenor = \relative c { \clef bass
	\autoBeamOff

  aes'8 g[ aes] aes aes[ bes c] bes g[ aes g] aes bes[ aes] \bar "|" f \ln g4 

  f8[ g aes] aes bes[ c] \ln aes4 bes8[ aes] \bar "|" \ln aes4 ~ aes8 \ln aes4. \ln \push c4.

  des8 bes[ c] \bar "|" aes \ln \push aes4( \ln f4.) aes8 \ln \push aes4. aes8 bes[ aes] \ln aes4 g8[ aes] \bar "||"
}

bass = \relative c { \clef bass
	\autoBeamOff
	
f8 ees[ des] des \ln aes'4. g8 \ln ees4. c8 ees[ f] \bar "|" bes, ees c

\ln f4. c8 bes[ aes] des![ aes] g[ f] \bar "|" des'! f c \ln \push aes'4. \ln \push aes,4.

des!8 ees[ aes] \bar "|" des,!8 
     \once\override Slur  #'control-points = #'((2 . -1.5) (4 . -2.5) (7 . -2.5 ) (9 . -1.8 ))   
     \ln \push  c4( \ln bes4.) aes8 
     \once\override Slur  #'control-points = #'((2 . -1.5) (4 . -2.5) (7 . -2.0 ) (9 . -1.2 ))
     \ln \push c4( des!8) c ees[ c] des![ aes] c[ f,] \bar "||" 
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

%%% Hymn note markup

\markup { \hspace #55 \center-align { \line { \italic "If a modern tune is required for this hymn it may be sung to that at Hymn 50 which" }
                             \line { \italic "was originally proper to" \smallCaps "Vexilla Regis."  } } }

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
%%% Lyric titles

\markup {
	\column {
	    \line { \small { \hspace #0 \smallCaps  "Office Hymn (" \italic "in full" ").  E." \italic "  Passion Sunday," \hspace #26 \italic "1-5 Bishop Venantius Fortunatus," } }  
	\line { \small { \hspace #6 \italic "and daily till Maundy Thursday." \hspace #4 "Vexilla Regis prodeunt."    \hspace #10 \italic "530-609.  Tr. J. M. Neale." }                                    } }
} 
  
\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HE royal banners forward go;"  
			                                 "  The Cross shines forth in mystic glow;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Where he in flesh, our flesh who made,"
					   "Our sentence bore, our ransom paid:"
			  		}}
			       
			           } %% finish stanza 1	
                        \hspace #1  % adds vertical spacing between verses  
           		\line { "2  "
			   \column {	     
				   "Where deep for us the spear was dyed,"
				   "Life's torrent rushing from his side,"
				   "To wash us in that precious flood,"
				   "Where mingled Water flowed, and Blood."
			}}
           	  \hspace #1  % adds vertical spacing between verses 
		  \hspace #1  % adds vertical spacing between verses
		  \line { \hspace #16 \italic "Part 2." }
		  \hspace #1  % adds vertical spacing between verses 
		  \line { "3  "
		    \column {	     
			    "Fulfilled is all that David told"
			    "In true prophetic song of old;"
			    "Amidst the nations, God, saith he,"
			    "Hath reigned and triumphed from the tree."
			}}
		\hspace #1 % adds vertical spacing between verses  
           	\line {"4  "
		    \column {	     
			    "O Tree of beauty, Tree of light!"
			    "O Tree with royal purple dight!"
			    "Elect on whose triumphal breast"
			    "Those holy limbs should find their rest:"
			}} 
		\hspace #1 % adds vertical spacing between verses  
           	\line {"5  "
		    \column {	     
			    "On whose dear arms, so widely flung,"
			    "The weight of this world's ransom hung:"
			    "The price of humankind to pay,"
			    "And spoil the spoiler of his prey."
		}}
		\hspace #1 % adds vertical spacing between verses  
           	\line {"6  "
		    \column {	     
			    "* O Cross, our one reliance, hail!"
			    "So may thy power with us avail"
			    "To give new virtue to the saint,"
			    "And pardon to the penitent."
		}}
		\hspace #1 % adds vertical spacing between verses
           	\line { "7. "
		   \column {	     
			   "To thee, eternal Three in One,"
			   "Let homage meet by all be done:"
			   "Whom by the Cross thou dost restore,"
			   "Preserve and govern evermore.     Amen."
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
	 
        \[ d8 \pes e8 \]   \[
	    \override NoteHead #'extra-offset = #'(0.0 . -0.1 ) d8 
            \override NoteHead #'extra-offset = #'(-0.38 . 0.0 ) \flexa  c8 \pes 
            \override NoteHead #'extra-offset = #'(0.02 . 0.05) d8 \] }} 
                    >> 
 \new Lyrics = "lyrics" { s1 }
 \new ChoirStaff
   <<
   \context Staff = upper \with {  fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
	                                              \voiceOne f8[ g] f8[ ees8 f8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  c8[ ees8] \ln c4. \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  aes'8[ bes8] aes8[ g8 aes8] \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour f8[ ees8] f8[ c8 f,8] \bar "||" }}
			        >> 
   >>
  \context Lyrics = "lyrics" \lyricsto "sopranos" { \override LyricText #'font-size = #-1  A -- _ men. }
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
	                                              \voiceOne f8[ g] f8[ ees8 f8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo  c8[ ees8] \ln c4. \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree  aes'8[ bes8] aes8[ g8 aes8] \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour f8[ ees8] f8[ c8 f,8] \bar "||" }}
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