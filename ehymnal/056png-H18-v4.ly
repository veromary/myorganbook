%%% 056png
%%% Hymn 18 From east to west from shore to shore
%%% Version 4


\version "2.10.19"

\include "gregorian-init.ly"

\header {
  dedication = \markup { \center-align {  "THE CHRISTIAN YEAR - CHRISTMAS"
		\hspace #0.1 }}	
  title = "18"
  
  arranger = \markup { \small { "Mode iii." }}
  
  tagline =""
}


%%% macro settings for stemless long note which is 2x duration of regular white note    
ln = {\once \override NoteHead #'duration-log = #0 
           \once \override Stem #'stencil = ##f
           \once \override NoteColumn #'force-hshift = #'0.4 }

%%% plainsong voice	   
	   
plainsong = \context VaticanaVoice  {  \relative c' { 
	\clef "vaticana-do3"
	\set fontSize = #3
        \key c \major
 
  d,8 e8 f8 \[g8 \pes a8\] d,8 \[e8\melisma f8 \pes g8\melismaEnd \] \[f8 \flexa e8\] e8 \bar "|" 
      g8 \[a8 \pes c8\] c8 \[c8 \flexa b8\] \[a8 \flexa g8\] \bar ""  \break
 
  \[a8 \pes b8\] b8 b8 \bar "|" 
      a8 \[a8 \pes c8 \virga d8\] c8 \[c8 \flexa b8\] \[a8 \flexa g8\] 
      \[a8 \pes c8 \inclinatum b8 \inclinatum a8 \] \[g8 \flexa f8\] \bar "" \break
  
  \[e8  \pes f8 \] \override NoteHead #'extra-offset = #'(-5.5 . 0.0 ) \[g8 \pes a8\]  
      \revert NoteHead #'extra-offset \bar "|" 
      d,8 e8 f8 a8 \[a8 \pes c8 \inclinatum b8 \inclinatum a8\] 
      \[g8 \melisma \flexa e8 f8 \pes g8 \melismaEnd \] \[f8 \flexa e8\] e8 \bar "||"
}
}

%%% SATB voices

global = {
  \key d \major 
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
	\autoBeamOff

  e8 fis8 g8 a8[ b8] e,8 fis8[ g8 a8] g8[ fis8] fis8 \bar "|" 
      a8 b8[ d8] d8 d8[ cis8] b8[ a8] \bar ""
  
  b8[ cis8] cis8 cis8 \bar "|" 
      b8 b8[ d8 e8] d8 d8[ cis8] b8[ a8] b8[ d8 cis8 b8] a8[ g8] \bar ""
  
  fis8[ g8 a8 b8] \bar "|" 
      e,8 fis8 g8 b8 b8[ d8 cis8 b8] a8[ fis8 g8 a8] g8[ fis8] fis8 \bar "||"
}

alto = \relative c' {
	\autoBeamOff
	
  \ln e4. \ln d4 b8 \ln d4. ~ \ln d4 d8 \bar "|" d8 \ln d4 g8 \ln fis4 ~ \ln fis4 \bar ""
  
  \ln fis4. e8 \bar "|" e8 \ln d4 g8[ fis8] \ln fis4 \ln d4 
      \once \override NoteHead #'duration-log = #-1  
      \once \override NoteColumn #'force-hshift = #0.8
      d\breve*1/4
      \ln e4 \bar ""
  
  \ln d4 e8[ d8] \bar "|" 
      \once \override NoteHead #'duration-log = #-1  
      \once \override NoteColumn #'force-hshift = #0.8
      e\breve*1/4
      \once \override NoteHead #'duration-log = #-1  
      \once \override NoteColumn #'force-hshift = #0.8
      d\breve*1/4
      e8[ d8 ~ ]  \ln d4 \ln d4 cis8 \bar "||"
}

tenor = \relative c { \clef bass
	\autoBeamOff

  g'8 a8 b8 a8[ g8 ~ ] g8 \ln a4. b8[ ~  b8] a8 \bar "|" a8 g8[ b8] b8 \ln a4  d8[ cis8] \bar "" 
  
  b8[ a8] ~ a8 a8 \bar "|" g8 \ln fis4( \ln b4)  \ln a4  g8[ fis8] g8[ b8 a8 g8] \ln e4 \bar ""
  
  \ln a4 ~ a8[ fis8] \bar "|" g8 a8 b8 g8 
      \once \override NoteHead #'duration-log = #-1  
      \once \override NoteColumn #'force-hshift = #0.8
      fis\breve*1/4
      \ln a4  g8[ d'8] \ln b4  a8 \bar "||"
}

bass = \relative c { \clef bass
	\autoBeamOff
	
  \ln e4. fis8[ g8 ~] g8 fis8[ e8 d8] g8[ b8] d,8 \bar "|" fis8 \ln g4 g8 \ln d4 ~ d8[ fis8] \bar ""
  
  d8[ fis8 ~] fis8 a8 \bar "|" e8 \ln b4( g8[ b8]) \ln d4 g8[ d8] 
      \once \override NoteHead #'duration-log = #-1  
      \once \override NoteColumn #'force-hshift = #0.8
      g\breve*1/4
      \ln cis,4
      
  \ln d4( cis8)[ b8] \bar "|" 
      \once \override NoteHead #'duration-log = #-1  
      \once \override NoteColumn #'force-hshift = #0.8
      e\breve*1/4
      \once \override NoteHead #'duration-log = #-1  
      \once \override NoteColumn #'force-hshift = #0.8
      b\breve*1/4 
      cis8[ d8 b8 fis8] g8[ b8] fis8 \bar "||"
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


%%% score block

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
  
  % *** Customizations for VaticanaStaff context for the plainsong staff
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

%%% A separate score block for the midi, minus the plainsong voice
%%% Score comprises 1/8 notes masquerading as 1/2 notes, so tempo has to be adjusted accordingly

\score {	
  <<
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
 
\midi { 
  \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) }
       } 

}


%%% Lyrics markups

\markup {
	\column {
	    \line { \small { \hspace #16 \smallCaps { "Office Hymn. M., E."} \hspace #25 \italic {"Coelius Sedulius, c. 450.  Tr. J. Ellerton."}  }  }
	    \line { \hspace #42 \small "A solis ortus cardine."}
   }}


\markup { \hspace #30   %%% add space as necc. to center the column	
                \column {  %%% a column for verse 1, a column of 2 lines
		  \line { \hspace #0.1 \column { \lower #2.4 \fontsize #8 "F" }   %%Drop Cap goes here
			 \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
			\column  { \raise #0.0 " ROM east to west, from shore to shore,"  "    Let every heart awake and sing"  } }          
	          \line { \hspace #0.2  %%adjust hspace until this line left edge is flush with Drop Cap
			\lower  #1.56  %%adjust this until the line spacing looks right
			\column {   
				"The holy Child whom Mary bore,"
				"    The Christ, the everlasting King."
			  		}}
	           } %%% finish verse 1
}

%%% fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
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

\markup { \hspace #30  %%add space as necc. to center the column  
            \column {  %%% a column for the entire block of lyrics		 		  
		   \line { "2  "
		       \column {	     
			       "Behold, the world's Creator wears" 
			       "    The form and fashion of a slave;" 
			       "Our very flesh our Maker shares," 
			       "    His fallen creature, man, to save." 
		   }} %% finish verse 2
		   
		   \hspace #0.2 % adds vertical spacing between verses
		     \line { "3  "
		       \column {	     
			       "For this how wondrously he wrought!"
			       "    A maiden, in her lowly place,"
			       "Became in ways beyond all thought,"
			       "    The chosen vessel of his grace."	   
	          }} %% finish verse 3

		   \hspace #0.2 % adds vertical spacing between verses
		   \line { "4  "
		    \column {    
			    "She bowed her to the Angel's word" 
			    "    Declaring what the Father willed," 
			    "And suddenly the promised Lord" 
			    "    That pure and hallowed temple filled."
 	          }} %% finish verse 4


		\hspace #0.2 % adds vertical spacing between verses
	  	\line { "5  "
             \column {    
		     "He shrank not from the oxen's stall," 
		     "    He lay within the manger-bed," 
		     "And he, whose bounty feedeth all," 
		     "    At Mary's breast himself was fed." 
 	   }} %% finish verse 5

		\hspace #0.2 % adds vertical spacing between verses
		\line { "6  "
		\column {
			"And while the Angels in the sky"
			"    Sang praise above the silent field,"
			"To shepherds poor the Lord most high,"
			"    The one great Shepherd, was revealed."
		}} %% finish verse 6

		\hspace #0.2 % adds vertical spacing between verses
		\line { "7. "
		\column {
			"All glory for this blessèd morn"
			"    To God the Father ever be;"
			"All praise to thee, O Virgin-born,"
			"    All praise, O Holy Ghost, to thee.     Amen." 
		}} %% finish verse 7	  
          } %%5 column bracket
} %%markup bracket

%%% Amen score block

\score {  	
  <<
    <<
  \new VaticanaStaff <<
  \context VaticanaVoice = "plainsongamen"  {  \relative c' { 	  
	\set Score.timing = ##f
	\override Staff.Clef #'#'font-size = #3
	\clef "vaticana-do3"
	\set fontSize = #3
	\override Staff.StaffSymbol #'staff-space = #1.6
        \[ e,8 \pes f8 \] 
        \[  \override NoteHead #'extra-offset = #'(0.0 . 0.0 ) e8 
            \override NoteHead #'extra-offset = #'(-0.38 . 0) \flexa  d8 \pes 
            \override NoteHead #'extra-offset = #'(0.02 . 0.05) e8 \] }}
                    >>
  
 \new Lyrics = "lyrics" { s1 }
 \new ChoirStaff
   <<
   \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
	                                              \voiceOne fis8[ g8] fis8[ e8 fis8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo \ln d4 d8[ cis8 ~ cis8] \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass \global
	                                          \voiceThree \ln b'4 \ln a4.  \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass \global
						  \voiceFour b8[ g8] d'8[ a8 fis8]\bar "||" }}
			        >> 
   >>
  \context Lyrics = "lyrics" \lyricsto "altos" { \override LyricText #'font-size = #-1  A -- men. }
  >>
>>

\layout {
     indent = 13\cm
     raggedright = ##t
     packed = ##f
     \context { \Score \override TimeSignature #'transparent = ##t }
     \context { \Score \override SeparationItem #'padding = #2 }	 
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

} %%% end Amen score block

%%% Separate scroe block for Amen midi without the plainsong voice
%%% Score comprises 1/8 notes masquerading as 1/2 notes, so tempo has to be adjusted accordingly

\score {  	
 \new ChoirStaff
   <<
   \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
                              << 
	\context Voice = "sopranos" { \relative c' { 
	                                              \clef treble \global
	                                              \voiceOne fis8[ g8] fis8[ e8 fis8] \bar "||" }}
	\context Voice = "altos"    { \relative c' { 
	                                              \global
	                                              \voiceTwo \ln d4 d8[ cis8 ~ cis8] \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass \global
	                                          \voiceThree \ln b'4 \ln a4.  \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass \global
						  \voiceFour b8[ g8] d'8[ a8 fis8]\bar "||" }}
			        >> 
   >>

\midi {  \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) } }

}  

} %% book bracket