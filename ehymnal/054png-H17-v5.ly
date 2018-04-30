%%% 054.png
%%% Hymn 17 VOM HIMMEL HOCH "Criste Redemptor Omnium."
%%% Version 5


\version "2.10"

\include "gregorian-init.ly"

\header {
   dedication = \markup { \center-align {  "THE CHRISTIAN YEAR - CHRISTMAS DAY" \hspace #0.1 }}	
   title = "17"
   arranger = \markup { \small "Mode i." } 
   % *** suppresses "Engraved by Lilypond..." at the bottom of the page 
   tagline =""
}

global =  {
   \set Score.timing = ##f
   \key d \major
   \autoBeamOff
   \set Staff.midiInstrument = "church organ"
}


longnote = {
   % *** this macro contains the settings for the stemless note which is 2x duration of the stemmed white note    
   \once \override NoteHead #'duration-log = #0 
   \once \override Stem #'stencil = ##f
   \once \override NoteColumn #'force-hshift = #'0.4 
}

plainsong = { 
   \clef "vaticana-do3"
   \set fontSize = #3
 
c8 d \[ e \pes g \] \[ g \flexa f \] \[ e \flexa d \] f \[ \virga e \inclinatum d \inclinatum c \] d \bar "|" \[ c \pes e \] g \[ g \pes a \] a \bar " " \break
\[ a \flexa g \] \[ g \pes c' \] \[ b \inclinatum a \inclinatum g \] a \bar "|" \[ a \pes c' \] g \[ g \flexa f \] e \[ d \flexa c \] d \[ d \pes e \] e \bar "" \break
c8 d \[ e \pes g \] \[ g \flexa f \] \[ e \flexa d \] f \[ \virga e \inclinatum d \inclinatum c \] d s8 \bar "||" \break
}

globalAmen = {
   \set Score.timing = ##f
   \key d \major
   \time 2/1
   \set Staff.midiInstrument = "church organ"
   \set Staff.fontSize = #-3
   \override NoteHead #'duration-log = 1 
}

plainsongamen = {  
   \set Score.timing = ##f
   \clef "vaticana-do3"
   \set fontSize = #3
   \override Staff.StaffSymbol #'staff-space = #1.6
   \set Staff.midiInstrument = "church organ"
   \relative c' {
   \[ d,8\melisma \pes e8\melismaEnd \] \[ \override NoteHead #'extra-offset = #'(0.0 . -0.2) d8\melisma 
   \override NoteHead #'extra-offset = #'(-0.38 . 0) \flexa  c8 \pes 
   \override NoteHead #'extra-offset = #'(0.02 . 0.0) d8\melismaEnd \]  \bar "||" }
}  

soprano = \relative c' {
   d8 e8 fis8[ a8] a8[ g8] fis8[ e8] g8 fis8[ e d] e8 \bar "|" d8[ fis8] a8 a8[ b8] b8 \bar "" \break
   b8[ a8] a8[ d8] cis8[ b8 a8] b8 \bar "|" b8[ d8] a8 a8[ g8] fis8 e8[ d8] e8 e8[ fis8] fis8 \bar "|" \break
   d8 e8 fis8[ a8] a8[ g8] fis8[ e8] g8 fis8[ e d] \longnote e4 \bar "||" \break
}

alto = \relative c' { 
   \longnote b4 d8[ e8] \longnote d4 d8[ cis8] d8 \longnote d4. cis8 \bar "|" \longnote d4 e8 \longnote d4 d8 \bar "" \break 
   d8[ e8] d8[ fis8] \longnote fis4. fis8 \bar "|" \once \override Tie #'extra-offset = #'( 0 . -1.0 ) \longnote d4.~ \longnote d4. cis8[ b8] b8 \longnote cis4 d8 \bar "|" \break
   \longnote b4 d8[ e8] \longnote d4 d8[ cis8] b8 d8[ cis8 b8] \longnote b4 \bar "||" \break
}

tenor = \relative c { \clef bass
   \longnote g'4 \longnote a4 \longnote b4 \longnote a4 b8 a8[ g8 fis8] a8 \bar "|" fis8[ a8] a8 \longnote fis4 g8 \bar "" \break
   g8[ e8] fis8[ a8] a8[ b8 cis8] d8 \bar "|" \longnote b4 d8 a8[ b8] a8 a8[ fis8] b8 \longnote a4 a8 \bar "|" \break
   g8~ g8 \longnote a4 fis8[ g8] \longnote a4 g8 \longnote b4( fis8) \longnote g4 \bar "||" \break
}

bass = \relative c { \clef bass
   \once \override NoteColumn #'force-hshift = #'-0.5 g'8 e8 d8[ cis8] \longnote b4 d8[ a8] g8 \longnote d'4. a8 \bar "|" \longnote d4 cis8 d8[ b8] g8 \bar "" \break
   b8[ cis8] \longnote d4 \longnote fis4. b,8 \bar "|" \longnote g'4 fis8 fis8[ g8] d8 a8[ b8] g8 a8[ fis8] d'8 \bar "|" \break
   g8 e8 d8[ cis8] \longnote d4 d8[ a'8] e8 \longnote b4. \longnote e,4 \bar "||" \break
}

#(ly:set-option 'point-and-click #f)

\book {

\paper {
   #(set-paper-size "a4")
   % *** suppresses page numbering
   print-page-number = ##f
   ragged-last-bottom = ##t
   ragged-bottom = ##t
}


\score { <<

\new VaticanaStaff { \plainsong }

\new ChoirStaff <<

   \new Staff = "women" <<
      \context Voice = sopranos { \voiceOne \global \soprano }
      \context Voice = altos { \voiceTwo \global \alto } 
                        >> 
   \new Staff = "men"   << 
      \context Voice = tenors { \voiceOne \global \tenor }
      \context Voice = basses { \voiceTwo \global \bass  } 
                        >> 
                >>
>>

\layout { 

   ragged-right = ##f
   % *** makes sure last system spreads right across the page
   ragged-last = ##f

\context { \Score
   \remove "Bar_number_engraver"
   % *** uncomment this to remove system start bar 
   % \override SystemStartBar #'stencil = ##f 
}

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
   \remove Custos_engraver 
   \remove Key_engraver
   \override Accidental  #'transparent = ##t
   % **** Moves lines closer together
   %\override VerticalAxisGroup #'minimum-Y-extent = #'(-2 . 0)
}

\context { \Staff
           \override TimeSignature #'transparent = ##t
           \override NoteHead #'duration-log = #1
           \override Stem #'flag-style = #'no-flag 
} 

} % end layout

} % end score



%%% This next score block generates the midi %%%

\score {	
\new ChoirStaff <<
\new Staff = "upper" <<
\context Voice = sopranos { \voiceOne \global \soprano }
\context Voice = altos { \voiceTwo \global \alto }
                      >> 
\new Staff = "lower" <<
\context Voice = tenors { \voiceOne \global \tenor }
\context Voice = bass { \voiceTwo \global \bass }
                    >>
	        >>	  
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 80 8) } } 
}

%%% End of midi generation block %%% 



\markup {
   % change number as necessary to centre lyrics block
   \hspace #30   

\column { 

% whole lyrics block is formatted into a single column

% heading section
   \line { \small { \hspace #4 \italic "See also: " "613 Of the Father's heart begotten." } }
   % adds vertical spacing between lines
   \hspace #1  
   \line { \small { \hspace #-18 \smallCaps "Office Hymn. M." \hspace #10 "Christe Redemptor omnium." \hspace #10 \italic "6th cent.  Tr. J. M. Neale." } } 
   % adds vertical spacing between heading and lyrics.
   \hspace #3  
   
% lyrics section 1: double column of verses
% Create a line made up of two columns of verse separated by a vertical line
   \line {
         % first column of verse  
            % return to LH margin
            \hspace #-30
         \column {  
                 \line { \hspace #2.2 
                         \column { \lower #2.4 \fontsize #8 "J" }   %%Drop Cap goes here
                         \hspace #-1    %% adjust this if other letters are too far from Drop Cap
		         \column { \raise #0.0 "ESU, the Father's only Son,"  
                                   "  Whose death for all redemption won;"  } 
                       }          

                 \line { \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
                         \lower  #1.56  %%adjust this until the line spacing looks right
		         \column { "Before the worlds, of God most high"
			           "Begotten all ineffably:" } 
                       }

                 
                 } % end first column of verse

         % create some space between first column of verse and the vertical line
         \hspace #7

         % vertical line	
         \column { \filled-box #'(0.0 . 0.1) #'(-10 . 2) #0 }

         % second column of verse
         \column { \line { \hspace #5 "2  " \column { "The Father's light and splendour thou,"
                                                      "Their endless hope to thee that bow;" 
                                                      "Accept the prayers and praise to-day"
                                                      "That through the world thy servants pay." } 
                         }
 
                 } % end second column of verse

   } % end master line

% lyrics section 2: single column of verses

                 	\hspace #3 
                        \line { "3  "
                          \column { 
                                   "Salvation's author, call to mind"
                	           "How, taking form of humankind,"
			           "Born of a Virgin undefiled,"
	         		   "Thou in man's flesh becam'st a child." } }
                 	\hspace #1 
           		\line { "4  "
			  \column {	     
				  "Thus testifies the present day,"
				  "Through every year in long array,"
				  "That thou, salvation's source alone,"
				  "Proceededst from the Father's throne." } }
			\hspace #1 
           		\line { "5  "
			  \column {	     
				  "Whence sky, and stars, and sea's abyss,"
				  "And earth, and all that therein is,"
				  "Shall still, with laud and carol meet,"
				  "The Author of thine advent greet." } }
			\hspace #1 
           		\line { "6  "
			  \column {	     
				  "And we who, by thy precious blood"
				  "From sin redeemed, are marked for God,"
				  "On this the day that saw thy birth,"
				  "Sing the new song of ransomed earth:" } }
	   	       \hspace #1 
           		\line { "7. "
			  \column {	     
				  "For that thine advent glory be,"
				  "O Jesu, virgin-born, to thee;"
				  "With Father, and with Holy Ghost,"
				  "From men and from the heavenly host.     Amen." } }

} % end column that is entire lyrics block

} % end markup

%%% Amen block %%%

\score { << 

<<

\new VaticanaStaff << 
   \new VaticanaVoice = "plainsongAmen" { \plainsongamen }
   \new Lyrics \lyricsto "plainsongAmen" { \override LyricText #'font-size = #-1 { A -- men. } } 
>> % end vaticana staff

\new ChoirStaff << 
   \new Staff = upper << 
       \new Voice = "sopranos" { \relative c' { \globalAmen \voiceOne e8[ fis8] e8[ d8 e8] \bar "||" } }
       \new Voice = "altos"    { \relative c' { \globalAmen \voiceTwo cis8[ d8] cis8[ b8 b8] \bar "||" } } 
                      >>
   \new Staff = lower << 
       \new Voice = "tenors"   { \relative c { \globalAmen \voiceOne \clef bass \longnote a'4 a8[ fis8 g8] \bar "||" } }
       \new Voice = "basses"   { \relative c { \globalAmen \voiceTwo \clef bass a8[ d8] a8[ b8 e,8] \bar "||" } }
                                                                >> 
                     >>
>> % end choir staff 

>>


\layout { 
   % #(layout-set-staff-size 5)
   indent = 13\cm
   %raggedright = ##t
   packed = ##f

\context { \Score 
   timing = ##f 
   \override TimeSignature #'transparent = ##t
   \override SeparationItem #'padding = #2 
   \remove "Bar_number_engraver" }

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
   \override BarLine #'transparent = ##f }

\context { \Staff
           \override StaffSymbol #'staff-space = #(magstep -1) }

} % end Amen layout

} % end Amen score

%%% This next score block generates the amen midi %%%

\score {	
\new ChoirStaff << 
   \new Staff = upper << 
       \new Voice = "sopranos" { \relative c' { \globalAmen \voiceOne e8[ fis8] e8[ d8 e8] \bar "||" } }
       \new Voice = "altos"    { \relative c' { \globalAmen \voiceTwo cis8[ d8] cis8[ b8 b8] \bar "||" } } 
                      >>
   \new Staff = lower << 
       \new Voice = "tenors"   { \relative c { \globalAmen \voiceOne \clef bass \longnote a'4 a8[ fis8 g8] \bar "||" } }
       \new Voice = "basses"   { \relative c { \globalAmen \voiceTwo \clef bass a8[ d8] a8[ b8 e,8] \bar "||" } }
                     >>
>> % end choir staff 	 
 
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 80 8) } } 
}

%%% End of amen midi generation block %%% 

} % book bracket