%%% 108.png
%%% Hymn 51 LUCIS CREATOR 
%%% Version 3

% *** Note for PPer: the change of plainsong clef between the first and second systems is not signalled with a custos mark, 
% *** whereas it is in hymn 22.  ?typo.

\version "2.10"

\include "gregorian-init.ly"

\header {
   dedication = \markup { \center-align {  "THE CHRISTIAN YEAR - FROM THE EPIPHANY TILL LENT" \hspace #0.1 }}	
   title = "51"
   arranger = \markup { \small "Mode viii." } 
   % *** suppresses "Engraved by Lilypond..." at the bottom of the page 
   tagline =""
}



%%%%% macros %%%%%


global = {
   \set Score.timing = ##f
   \key c \major
   \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}


% *** longnote macro: creates stemless long note which is 2x duration of regular white note    
 
longnote = {\once \override NoteHead #'duration-log = #0 
           \once \override Stem #'stencil = ##f
           \once \override NoteColumn #'force-hshift = #'0.4 }

 

%%%%% music %%%%%


% *** first system, tenor and bass, last note before bar 1: length changed from 4 to 8 to fit other parts (?typo)


plainsong = \relative c' { 
   \clef "vaticana-do2"
   \set fontSize = #3
   \set Staff.explicitClefVisibility = #end-of-line-invisible
\[ g8 a g g \] f \[ a \pes c \] c g \[ a \flexa g \] \[ f \flexa g \] g \bar "|" \[ g \pes d' \] \[ d e d \] c \bar " " \break
\clef "vaticana-do3" \[c \flexa b \] a \[ c \flexa b \] \[ a \flexa g\] \[ g a g \] \bar "|" d \[ \oriscus d \pes \virga f \once \override NoteHead #'extra-offset = #'(-0.2 . 0.0) e \] \[ f \pes g \] \[ g \pes a \] \bar "" \break
\[ g \flexa f \] g \[ g \pes a \] a \bar "|" c \[ c d c \] a \[ \once \override Accidental #'extra-offset = #'(-0.8 . 0) bes! \flexa a \] g \[ a \flexa g \] \[ f \pes g \] g \bar "||" \break
}


soprano = \relative c' {
g'8[ a g]~ g f a[ c] c g a[ g] f[ g] g \bar "|" g[ d'] d[ e d] c \bar "" \break
c[ b] a c[ b] a[ g] g[ a g] \bar "|" d d[ f e] f[ g] g[ a] \bar "" \break
g[ f] g g[ a] a \bar "|" c c[ d c] a bes[ a] g a[ g] f[ g] g \bar "||" \break
}


alto = \relative c' { 
\once \override NoteHead #'duration-log = #-1 \once \override NoteColumn #'force-hshift = #0.8 d\breve*1/4 d8 f8[ e8] e8 c8 \longnote c4~ \longnote c4 b8 \bar "|" \longnote d4 \longnote g4. e8 \bar "" \break
\once \override Tie #'extra-offset = #'( 0 . -0.8 ) \longnote e4~ e8 \longnote g4 f8[ e8] \longnote d4. \bar "|" b8 a8[ d8 c8] \once \override Tie #'extra-offset = #'( 0 . -0.8 ) \longnote c4~ \once \override Tie #'extra-offset = #'( 0 . -0.8 ) \longnote c4~ \bar "" \break
\once \override Tie #'extra-offset = #'( 0 . -0.5 ) \longnote c4~ c8 e8[ f8] f8 \bar "|" f8 \once \override Tie #'extra-offset = #'( 0 . -1.0 ) \longnote f4.~ f8 \longnote f4 e8 f8[ e8] d8[ e8] d8 \bar "||" \break
}


tenor = \relative c { \clef bass
\once \override NoteHead #'duration-log = #-1 \once \override NoteColumn #'force-hshift = #0.8 b'\breve*1/4 a8 f8[ g8] g8 e8 \longnote f4 f8[ e8] g8 \bar "|" \longnote b4~ b8[ c8 b8] a8  \bar "" \break
a8[ b8]  c8 \once \override Tie #'extra-offset = #'( 0 . 0.5 ) \longnote c4~ \once \override Tie #'extra-offset = #'( 0 . 0.5 ) \longnote c4~ \longnote c4 b8 \bar "|" g8 f8[ a8~ a8] f8[ e8] \once \override Tie #'extra-offset = #'( 0 . 2.0 )\longnote e4~ \bar "" \break
e8[ f8] e8 \once \override Tie #'extra-offset = #'( 0 . 0.5 ) \longnote c'4~ c8 \bar "|" a8 a8[ bes8 a8] c8 d8[ c8] c8 \longnote c4 a8[ c8] b8 \bar "||" \break
}


bass = \relative c { \clef bass
\once \override NoteHead #'duration-log = #-1 \once \override NoteColumn #'force-hshift = #0.8 g'\breve*1/4 d8~ d8[ c8] c8 c8 \longnote f,4 a8[ c8] g8 \bar "|" \once \override Tie #'extra-offset = #'( 0 . -0.8 ) \longnote g'4~ \longnote g4. a8 \bar "" \break
\longnote a4~ a8 \longnote e4 f8[ c8] \longnote g'4. \bar "|" g8 \longnote d4 a8 a8[ c8] \longnote \once \override Tie #'extra-offset = #'( 0 . -2.0 )c4~ \bar "" \break
c8[ a8] c8 c8[ f8] f8 \bar "|" f8 \longnote f4. f8 bes,!8[ f'8] c8 a8[ c8] d8[ c8] g'8 \bar "||" \break
}



%%%%% score %%%%%


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



%%%%% midi %%%%%


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



%%%%% lyrics %%%%%


\markup {
   % change number as necessary to centre lyrics block
   \hspace #30   

\column { 

% whole lyrics block is formatted into a single column

% heading section
   \line { \small { \hspace #-27 \smallCaps "Office Hymn.  " \italic " Sunday," \smallCaps "E." \hspace #50 \italic "6th cent.  Tr. J. M. Neale." } } 
   \line { \small { \hspace #15 "Lucis Creator optime." } }
   % *** inserts vertical space between lines
   \hspace #0.1
   
% lyrics section 1: double column of verses
% Create a line made up of two columns of verse separated by a vertical line
   \line {
         % first column of verse  
            % return to LH margin
            \hspace #-30
         \column {  
                 \line { \hspace #2.2 
                         \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
                         \hspace #-1    %% adjust this if other letters are too far from Drop Cap
		         \column { \raise #0.0 " BLEST Creator of the light,"  
                                   " Who mak'st the day with radiance bright," } 
                       }          

                 \line { \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
                         \lower  #1.56  %%adjust this until the line spacing looks right
		         \column { "And o'er the forming world didst call"
                                   "The light from chaos first of all;" } 
                       }

                 
                 } % end first column of verse

         % create some space between first column of verse and the vertical line
         \hspace #3

         % vertical line	
         \column { \filled-box #'(0.0 . 0.1) #'(-10 . 2) #0 }

         % second column of verse
         \column { \line { \hspace #2 "2  " \column { "Whose wisdom joined in meet array"
                                                      "The morn and eve, and named them Day:"
                                                      "Night comes with all its darkling fears;"
                                                      "Regard thy people's prayers and tears," } 
                         }
 
                 } % end second column of verse

   } % end master line

% lyrics section 2: single column of verses

                 	\hspace #3 
                        \line { "3  " \column { "Lest, sunk in sin, and whelm'd with strife,"
                                                "They lose the gift of endless life;"
                                                "While thinking but the thoughts of time,"
                                                "They weave new chains of woe and crime." } }
                 	\hspace #1 
           		\line { "4  " \column { "But grant them grace that they may strain"
                                                "The heavenly gate and prize to gain:"
                                                "Each harmful lure aside to cast,"
                                                "And purge away each error past." } }
			\hspace #1 
           		\line { "5. " \column { "O Father, that we ask be done,"
                                                "Through Jesus Christ, thine only Son;"
                                                "Who, with the Holy Ghost and thee,"
                                                "Doth live and reign eternally.    Amen." } }
} % end column that is entire lyrics block

} % end markup



%%%%% amen %%%%%


\score { << 

<<

\new VaticanaStaff << 
   \new VaticanaVoice = "plainsongAmen" { 
   \set Score.timing = ##f
   \clef "vaticana-do3"
   \set fontSize = #3
   \override Staff.StaffSymbol #'staff-space = #1.6
   % *** stops cautionary clef being printed when there is a change of clef in the next line
   \set Staff.explicitClefVisibility = #end-of-line-invisible 
   \set Staff.midiInstrument = "church organ"
   \relative c' {
   \[ g8 \pes a8 \] \[ \override NoteHead #'extra-offset = #'(0.0 . -0.2) g8 
   \override NoteHead #'extra-offset = #'(-0.38 . 0) \flexa  f8 \pes 
   \override NoteHead #'extra-offset = #'(0.02 . 0.0) g8 \]  \bar "||" } }
>> 

\new ChoirStaff << 
   \new Staff = upper << 
       \new Voice = "sopranos" { \relative c' { \global \voiceOne g'8[\melisma a8]\melismaEnd g8[ f8 g8] \bar "||" } }
       \new Voice = "altos"    { \relative c' { \global \voiceTwo e8[ f8] e8[ \once \override Tie #'extra-offset = #'( 0 . -3.2 ) d8~ d8] \bar "||" } } 
                      >>
   \new Lyrics \lyricsto sopranos { \set alignAboveContext = #"upper" \override LyricText #'font-size = #-1 { A -- men. } } 
   \new Staff = lower << 
       \new Voice = "tenors"   { \relative c { \global \voiceOne \clef bass \longnote c'4~ c8[ a8 b8] \bar "||" } }
       \new Voice = "basses"   { \relative c { \global \voiceTwo \clef bass c8[ f,8] c'8[ d8 g,8] \bar "||" } }
                                                                >> 
                     >>
>> % end choir staff 

>>


\layout { 
   
   indent = 13\cm
   %raggedright = ##t
   packed = ##f

\context { \Score 
   timing = ##f 
   \override TimeSignature #'transparent = ##t
   % *** controls the amount of space between notes on the staff
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
   % *** reduces size of clef, notes and other elements
   fontSize = #-3
   % *** reduces size of staff
   \override StaffSymbol #'staff-space = #(magstep -2)
   % *** adjusts spacing between staffs in a system
   \override VerticalAxisGroup #'minimum-Y-extent = #'(-6 . 2) 
   \override NoteHead #'duration-log = #1 }

} % end Amen layout

} % end Amen score


% *** This generates the amen midi 

\score {	
\new ChoirStaff << 
   \new Staff = upper << 
       \new Voice = "sopranos" { \relative c' { \global \voiceOne g'8[ a8] g8[ f8 g8] \bar "||" } }
       \new Voice = "altos"    { \relative c' { \global \voiceTwo e8[ f8] e8[ d8~ d8] \bar "||" } } 
                      >>
   \new Staff = lower << 
       \new Voice = "tenors"   { \relative c { \global \voiceOne \clef bass \longnote c'4~ c8[ a8 b8] \bar "||" } }
       \new Voice = "basses"   { \relative c { \global \voiceTwo \clef bass e8[ a8] c'8[ d8 g,8] \bar "||" } }
                     >>
>> % end choir staff 	 
 
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 80 8) } } 
}


} % end book