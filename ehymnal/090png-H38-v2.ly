%%% 90png
%%% Hymn 38 Why, impious Herod
%%% Version 2


\version "2.10.19"

\include "gregorian-init.ly"

\header {
  dedication = \markup { \center-align {  "THE CHRISTIAN YEAR - THE EPIPHANY"
		\hspace #0.1 }}	
  title = "38"
  arranger = \markup { \small { "Mode iii." }}
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% macro settings for stemless long note which is 2x duration of regular white note    
ln = {\once \override NoteHead #'duration-log = #0 
           \once \override Stem #'stencil = ##f
           \once \override NoteColumn #'force-hshift = #'0.4 }

%%% some of the long notes need a little more push to the right to align with notes above	   
push = \once \override NoteHead #'X-offset = #0.9	   
	   
%%%%%%%%%%%%%%%%%%%%%%%% End of Macro Definitions

%%% plainsong voice
	   
plainsong = \context VaticanaVoice  {  \relative c { 
	\clef "vaticana-do3"
	\set fontSize = #3
        \key c \major 
	
  g'8 \[g8 \melisma \pes a8 b8 \pes c8 \flexa a8\melismaEnd \] g8 \[f8 \flexa e8 \] d8 \[d8 \pes f8 \flexa e8\] \[f8 \pes g8\] g8 \bar "|" 
      g8 \[a8 \pes c8\] c8 \[c8 \flexa b8\] \[a8 \flexa g8\] \bar "" \break
  
  \[a8 \pes b8\] b8 b8 \bar "|" 
      a8 \[a8\melisma \pes c8 \virga d8\melismaEnd \] c8 \[c8 \flexa b8\] \[a8 \flexa g8\] \[a8 \pes c8 \inclinatum b8 \inclinatum a8\] \[g8 \flexa f8\] \bar "" \break
  
  \[e8 \pes f8 \] \override NoteHead #'extra-offset = #'(-5.0 . 0.0 ) \[g8 \pes a8 \] 
      \revert NoteHead #'extra-offset \bar "|" 
      d,8 e8 f8 a8 \[a8 \pes c8 \inclinatum b8 \inclinatum a8\] \[g8\melisma \flexa e8 f8 \pes g8\melismaEnd \] \[f8 \flexa e8\] e8 \bar "||"
}
}

%%% SATB voices

global = {
  \key d \major 
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
	\autoBeamOff

  a'8 a8[( b8] cis8[ d8 b8)] a8 g8[ fis8] e8 e8[ g8 fis8] g8[ a8] a8 \bar "|" a8 b8[ d8] d8 d8[ cis8] b8[ a8]
  
  b8[ cis8] cis8 cis8 \bar "|" b8 b8[ d8 e8] d8 d8[ cis8] b8[ a8]  b8[  d8 cis8 b8] a8[ g8]
  
  fis8[ g8 a8 b8] \bar "|" e,8 fis8 g8 b8 b8[ d8 cis8 b8] a8[ fis8 g8 a8] g8[ fis8] fis8 \bar "||"
}

alto = \relative c' {
	\autoBeamOff
	
  fis8 
      \once \override NoteHead #'duration-log = #-1  
      \once \override NoteColumn #'force-hshift = #1
      fis\breve*5/16 ~
      fis8 \ln b,4. ~ \ln b4. ~ b8[ d8] cis8\bar "|" d8 \ln d4 g8 \ln fis4 ~ \ln fis4
      
  \ln fis4. e8\bar "|" e8 \ln d4 g8[ fis8] \ln fis4 \ln d4 
      \once \override NoteHead #'duration-log = #-1  
      \once \override NoteColumn #'force-hshift = #1
      d\breve*1/4  \ln e4
  
   \ln d4 e8[ d8] \bar "|" 
      \once \override NoteHead #'duration-log = #-1  
      \once \override NoteColumn #'force-hshift = #0.4
      e\breve*1/4
      \once \override NoteHead #'duration-log = #-1  
      \once \override NoteColumn #'force-hshift = #0.4
      d\breve*1/4 
      e8[ d8 ~ ] \ln d4 \ln d4 cis8 \bar "||"
}

tenor = \relative c { \clef bass
	\autoBeamOff

  cis'8 
      \once \override NoteHead #'duration-log = #-1  
      \once \override NoteHead #'X-offset = #2
      d\breve*5/16 ~
      d8  \ln \push g,4. ~ \ln \push g4. ~ g8[ fis8] e8\bar "|" a8 g8[ b8] b8 \ln \push a4 d8[ cis8]
      
  b8[ a8] ~ a8 a8 \bar "|" g8 \ln \push fis4( \ln b4) \ln \push a4 g8[ fis8] g8[ b8 a8 g8] \ln \push e4
  
  \ln \push a4( a8)[ fis8] \bar "|" g8 a8 b8 g8 
      \once \override NoteHead #'duration-log = #-1  
      \once \override NoteHead #'X-offset = #0.8
      fis\breve*1/4 
      \ln a4 g8[ d'8] \ln b4 a8 \bar "||"
}

bass = \relative c { \clef bass
	\autoBeamOff
	
  fis8 
      \once \override NoteHead #'duration-log = #-1  
      \once \override NoteHead #'X-offset = #2
      d\breve*5/16 ~
      d8 \push \ln e4. \push \ln g,4. ~ g8[ d'8] a8\bar "|" fis'8 \ln g4 g8 \ln \push d4 ~ d8[ fis8]
  
  d8[ fis8] ~ fis8 a8\bar "|" 
      e8 
      \once\override Slur  #'control-points = #'((2.5 . -4) (5 . -6.5) (13 . -6.5) (14.5 . -5.5 ))  
      \ln \push b4( g8[ b8]) \ln \push d4 g8[ d8] 
      \once \override NoteHead #'duration-log = #-1  
      \once \override NoteColumn #'force-hshift = #0.6
      g\breve*1/4 
      \ln \push cis,4
      
   \once\override Slur  #'control-points = #'((1.5 . -4) (3 . -5.5) (10 . -5.5) (11.5 . -4 ))  
  \ln \push d4( cis8)[ b8] \bar "|" 
      \once \override NoteHead #'duration-log = #-1  
      \once \override NoteColumn #'force-hshift = #0.6
      e\breve*1/4 
      \once \override NoteHead #'duration-log = #-1  
      \once \override NoteHead #'X-offset = #0.8
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

%%% Markup for "See also:" line
\markup {\hspace #35 \column {
	\line{ \hspace #12 \italic "See also:"}
	\hspace #0.1 
	\small {
	"615  From the eastern mountains."
	"616  Hail thou Source of every blessing."
}}}

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
	
%%% Markips for Lyrics

\markup { \hspace #4   %%add space as necc. to center the column
          \column { %%% All text goes into one super column 
	  \hspace #0.2
	  
	  %%% Lyric titles
	  
	  \line { \small { \smallCaps {"Office Hymn.   E."} \italic {"and"} \smallCaps {" M."} \hspace #43 \italic {"C. Sedulius, c. 450.  Tr. P. D."}} }
	  \line { \hspace #42 \small {"Hostis Herodes impie."} }
	  
	  %%% Lyrics in 3 columns, 2 of verse, and a separator line column
	  
	  \line { %%% a master line for the 3 columns
              \column { %%% column 1
	      \hspace #0.2
              \column { %%% column for verse 1
		  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "W" }   %%Drop Cap goes here
			 \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
			\column  { \raise #0.0 "HY, impious Herod, shouldst thou fear" "Because the Christ is come so near?"  } }          
	          \line { \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
			\lower  #1.56  %%adjust this until the line spacing looks right
			\column {   
				"He who doth heavenly kingdoms grant" 
				"Thine earthly realm can never want." 
			  		}}
	           } %% finish verse 1
		  
		   \hspace #0.2 % adds vertical spacing between verses
		   \line { "2  "
		       \column {	     
			       "Lo, sages from the East are gone" 
			       "To where the star hath newly shone:" 
			       "Led on by light to Light they press," 
			       "And by their gifts their God confess."
		   }}
		       }  %%% finish Page column 1
		
	\hspace #4 %%% adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -25 . -1) #0 }  %%% Column 2. This is the line dividing the columns 1 and 3. 
			   	   
	\hspace #4 %%% adds horizontal space between columns 2 and 3
	   
	\column { %%% start page column 3	
		\hspace #0.2	
		\line { "3  "
		    \column {	     
				"The Lamb of God is manifest" 
				"Again in Jordan's water blest," 
				"And he who sin had never known" 
				"By washing hath our sins undone."  	   
	   }} 
	   	\hspace #0.2 % adds vertical spacing between verses
		\line { "4  "
		    \column {    
				"Yet he that ruleth everything" 
				"Can change the nature of the spring," 
				"And gives at Cana this for sign—" 
				"The water reddens into wine." 
 	   }}  

	  } %%% end column 3
	  } %%% close master line of 3 columns
	  
	  \hspace #0.2
	  
	  %%% line for the 5th centred verse
	  
	  \line { \hspace #35 "5. "
             \column {    
		     "Then glory, Lord, to thee we pay" 
		     "For thine Epiphany to-day;" 
		     "All glory through eternity" 
		     "To Father, Son, and Spirit be.     Amen." 
 	   }} %%% end verse stanza
          } %%% page super column bracket
} %%% lyrics markup brack

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
	                                              \voiceTwo \ln d4 d8[ cis8 ~ cis8] \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree \ln b'4 \ln a4. \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour b8[ g8] d'8[ a8 fis8] \bar "||" }}
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
	                                              \voiceTwo \ln d4 d8[ cis8 ~ cis8] \bar "||" }}
	                      >>
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { 
		                                  \clef bass  \global
	                                          \voiceThree \ln b'4 \ln a4. \bar "||" }}
	\context Voice = "basses" { \relative c { 
	                                          \clef bass  \global
						  \voiceFour b8[ g8] d'8[ a8 fis8] \bar "||" }}
			        >> 
   >>

\midi {  \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) }  }

}
	

} %%% book bracket