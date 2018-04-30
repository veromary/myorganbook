%%% 128.png
%%% Hymn 68  "The glory of these forty days"
%%% Version 3

%%% Note for PPer:  Corrected typo in verse 2, "Messiah'a".

\version "2.10"

\include "gregorian-init.ly"

\header {
   dedication = \markup { \center-align {  "THE CHRISTIAN YEAR - LENT" \hspace #0.1 } }	
   title = "68"
   arranger = \markup { \small { "Mode ii." } }
   tagline =""
}


%%%%%%%%%%     Macro Definitions     %%%%%%%%%%


global = {
   \key f \major
   \set Score.timing = ##f
   \autoBeamOff
   \set Staff.midiInstrument = "church organ"
}


% *** ln macro: settings for stemless long note which is 2x duration of regular white note    

ln = { \once \override NoteHead #'duration-log = #0 
       \once \override Stem #'stencil = ##f
       \once \override NoteColumn #'force-hshift = #'0.4 }



%%%%%%%%%%     Music     %%%%%%%%%%


plainsong = \relative c { 
   \clef "vaticana-fa2"
   \set fontSize = #3
   
\[ c8 \pes d \] d8 \[ d \pes f \] c \[ d \pes f \] \[ f \flexa e \] \[ d \pes e \] e \bar "|" g \[ f \flexa e \]\bar "" \break

     d e \[ f \flexa e \] d \[ c \pes d \] d \bar "|" \[ d \pes g \] d \[ d \pes g \] f \[ f \flexa e \] \bar "" \break

\[ d \pes e \] \[ d \flexa c \] c \bar "|" c d e \[ f \flexa e \] d \[ e \flexa d \] \[ c \pes d \] d \bar "||" \break

} 


soprano = \relative c' {

   f8[ g] g g[ bes]f g[ bes] bes[ a] g[ a] a \bar "|" c bes[ a] \bar "" \break
   g a bes[ a] g f[ g] g \bar "|" g[ c] g g[ c] bes bes[ a] \bar "" \break
   g[ a] g[ f] f \bar "|" f g a bes[ a] g a[ g] f[ g] g \bar "||" \break
}

alto = \relative c' {
	
   \ln d4 d8 \ln ees4 f8 \ln ees!4 \ln d4 \ln e!4 f8 \bar "|" e8 \ln g4 \bar "" \break
   d8 f8 \ln f4 c8 \ln c4 d8 \bar "|" \ln e4 d8 \ln c4 d8 \ln d4 \bar "" \break 
   \ln e4 e8[ d8] c8 \bar "|" \ln d4 c8 \ln bes4 c8 \ln c4 \ln c4 bes8 \bar "||" \break
}

tenor = \relative c { 
	\clef bass
   \ln bes'4~ bes8 \ln bes4~ bes8 \ln g4 \ln f4 \ln c'4~ c8 \bar "|" c8 d8[ c8] \bar "" \break
   bes8 c8 \ln d4 g,8 a8[ c8] bes8 \bar "|" \ln c4 bes8 \ln g4 g8 \ln f4 \bar "" \break
   \ln c'4 c8[ a8] a8 \bar "|" \ln f4 f8 \ln g4 e8 \once \override Tie #'extra-offset = #'( 0 . 1 ) \ln f4~ f8[ e8] d8 \bar "||" \break }

bass = \relative c { 
	\clef bass
	
   \ln  \once \override NoteColumn #'force-hshift = #-0.2 bes'4 g8 \ln ees4 d8 \ln ees!4 \ln bes4 c8[ a8] f'8 \bar "|" c8 \once \override Tie #'extra-offset = #'( 0 . -1 ) \ln g'4~ \bar "" \break
   g8 f8 \ln d4 #(set-accidental-style 'forget) e8 f8[ e8] g8 \bar "|" \ln c,4 g'8 \ln e4 g8 \ln bes,4 \bar "" \break 
   c8[ a8] c8[ d8] f8 \bar "|" \ln bes,4 a8 \ln g4 c8 \ln f,4 a8[ c8] g8 \bar "||" \break
}



%%%%%%%%%%     Score block     %%%%%%%%%%


#(ly:set-option 'point-and-click #f)


\book {


\paper {
   #(set-paper-size "a4")
   between-system-padding = #3.0
   print-page-number = ##f
   ragged-bottom=##t
   ragged-last-bottom=##t
}


\score { 
<<
   \new VaticanaStaff { \plainsong }
   \new ChoirStaff <<
      \new Staff = "upper" <<
         \context Voice = sopranos { \voiceOne \global \soprano }
         \context Voice = altos    { \voiceTwo \global \alto } >> 
      \new Staff = "lower" <<
         \context Voice = tenors   { \voiceOne \global \tenor }
         \context Voice = bass     { \voiceTwo \global \bass } >>
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
   \remove "Mark_engraver"
   \override NonMusicalPaperColumn #'page-break-permission = ##f 

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
   \override KeySignature #'transparent = ##t
   \override Accidental  #'transparent = ##t
   % *** needed for certain tweaks   
   \consists "Mark_engraver"
}

\context { \Staff 
   \consists "Mark_engraver" 
   \override TimeSignature #'transparent = ##t
   % *** Needed to produce beamed minims - which are quavers in disguise
   \override NoteHead #'duration-log = #1 
   \override Stem #'flag-style = #'no-flag 
}

} % end layout 
 
} % end score 




%%%%%%%%%%     Lyrics     %%%%%%%%%%

\markup {
   % change number as necessary to centre lyrics block
   \hspace #34   


\column { 

% whole lyrics block is formatted into a single column

% heading section
   \line { \lower #0.5 \small { \hspace #-30 \smallCaps "Office Hymn." " M." \italic " Lent" \normal-text "iii." \italic "till Passion Sunday." \hspace #20 \italic "Ascr. to St. Gregory the Great," } } 
   \line { \small { \hspace # 42 \italic "6th cent.  Tr. M. F. B." } }
   \line { \small { \hspace #12 "Clarum decus jejunii." } }
   % *** inserts vertical space between lines
   % \hspace #0.1
   
% lyrics: a single column of verses
% return to LH margin
   \hspace #-30
   \column {  
      \line { \hspace #2.2 
              % *** Drop Cap goes here
              \column { \lower #2.3 \fontsize #8 "T" }
                        % *** adjust if rest of line is too far from Drop Cap - left is negative
                        \hspace #-1.2    
		        \column { \raise #0.0 "HE glory of these forty days"
                                              "  We celebrate with songs of praise;" } }          

              \line { \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
                      \lower  #1.56  %%adjust this until the line spacing looks right
                      \column { "For Christ, by whom all things were made,"
                                "Himself has fasted and has prayed." } }
} % end column
} % end column
} % end markup



%%%%%%%%%%     Page Break     %%%%%%%%%%
  

% *** fake score block to occupy space and force a pagebreak.  Lilypond version 2.11 has a new \pageBreak command BTW!


\score { 
   { s4 }
\header { breakbefore = ##f piece = " " opus = " " }
\layout{
   \context { \Staff
              \remove Time_signature_engraver
              \remove Key_engraver
              \remove Clef_engraver
              \remove Staff_symbol_engraver }
} }
	



%%%%%%%%%%     Page Two     %%%%%%%%%%


\markup {
\hspace #34
\column {
\column {
              \hspace #1 
              \line { "2  " \column { "Alone and fasting Moses saw"
                                      "The loving God who gave the Law;"
                                      "And to Elijah, fasting, came"
                                      "The steeds and chariots of flame." } }

              \hspace #1 
              \line { "3  " \column { "So Daniel trained his mystic sight,"
                                      "Delivered from the lions' might;"
                                      "And John, the Bridegroom's friend, became"
                                      "The herald of Messiah's name." } }              
              \hspace #1 
              \line { "4  " \column { "Then grant us, Lord, like them to be"
                                      "Full oft in fast and prayer with thee;"
                                      "Our spirits strengthen with thy grace,"
                                      "And give us joy to see thy face." } }

              \hspace #1 
              \line { "5. " \column { "Father and Son and Spirit blest,"
                                      "To thee be every prayer addrest,"
                                      "Who art in threefold Name adored,"
                                      "From age to age, the only Lord.    Amen." } }
   } % end column of verse

} % end column that is entire lyrics block

} % end markup



%%%%%%%%%%     Midi Block     %%%%%%%%%%

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
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) } } 

} % end midi score



%%%%%%%%%%     Amen Block     %%%%%%%%%%

	
\score { <<

\new VaticanaStaff <<
   \new VaticanaVoice = "plainsongamen" { 
      \set Score.timing = ##f
      \set fontSize = #3
      % *** makes clef bigger
      \override Staff.Clef #'#'font-size = #3
      \clef "vaticana-fa2"
      \override Staff.StaffSymbol #'staff-space = #1.6
	 
      \relative c { 
      \[ d8 \pes e8 \] 
      \[ \override NoteHead #'extra-offset = #'(0.0 . -0.1 ) d8 
         \override NoteHead #'extra-offset = #'(-0.38 . 0) \flexa  c8 \pes 
         \override NoteHead #'extra-offset = #'(0.0 . 0.0 ) d8 \] } }
                      >>

\new ChoirStaff <<
   \new Staff = upper << 
      \new Voice = "sopranos"  { \relative c' { \global \voiceOne g'8[ a8] g8[ f8 g8] \bar "||" } }
      \new Voice = "altos"     { \relative c' { \global \voiceTwo \ln c4~ c8[ a8 bes8] \bar "||" } } >>

      \new Lyrics \lyricsto sopranos { \set alignAboveContext = #"upper" \override LyricText #'font-size = #-1 { A -- men. } } 

      \new Staff = lower <<
         \new Voice = "tenors" { \relative c { \global \clef bass \voiceThree e8[ f8] e8[ d8~ d8] \bar "||" } }
         \new Voice = "basses" { \relative c { \global \clef bass \voiceFour c8[ f,8] c'8[ d8 g,8] \bar "||" } } >> 
>> % choirstaff bracket

>> % score bracket

% *** creates space between end of lyrics and amen score
\header { breakbefore = ##f piece = " " opus = " " }


\layout {
   indent = 13\cm
   raggedright = ##t
   ragged-bottom = ##t
   packed = ##f

\context { \Score 
   \override TimeSignature #'transparent = ##t
   % *** controls the amount of space between notes on the staff
   \override SeparationItem #'padding = #2 
}
     
\context { \VaticanaStaff 
   \revert StaffSymbol #'color
   \revert LedgerLineSpanner #'color
   \override BarLine #'transparent = ##f 
} 

\context { \Staff 
   \override VerticalAxisGroup #'minimum-Y-extent = #'( -2 . 2) 
   fontSize = #-3 
   \override StaffSymbol #'staff-space = #(magstep -2)
   \override NoteHead #'duration-log = #1
   \override Stem #'flag-style = #'no-flag
}

} % end amen layout

} % end amen score


% *** Separate Score block for Amen midi
% *** Score comprises 1/8 notes masquerading as 1/2 notes, so tempo has to be adjusted accordingly, tempo set to 2=80

\score {  
   \new ChoirStaff <<
      \new Staff = upper << 
          \new Voice = "sopranos" { \relative c' { \global \voiceOne d8[ e8] d8[ c8 d8] \bar "||" } }
	  \new Voice = "altos"    { \relative c' { \global \voiceTwo a8[ c8] \ln a4 ~ a8  \bar "||" } } >>

      \new Staff = lower <<
	 \new Voice = "tenors"    { \relative c { \clef bass \global \voiceThree f8[ g8] f8[ e8 f8] \bar "||" } }
	 \new Voice = "basses"    { \relative c { \clef bass \global \voiceFour d8[ c8] d8[ a8 d,8] \bar "||" } } >>
>> % choir staff bracket


\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) } } 

} % end midi score

} % end book