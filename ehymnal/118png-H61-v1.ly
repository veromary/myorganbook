%%% 118.png
%%% Hymn 61  "Almighty God, who from the flood"
%%% Version 1


\version "2.10"

\include "gregorian-init.ly"

\header {
   dedication = \markup { \center-align {  "THE CHRISTIAN YEAR - FROM THE EPIPHANY TILL LENT" \hspace #0.1 } }	
   title = "61"
   arranger = \markup { \raise #0.5 \small { "Mode ii." } }
   tagline =""
}



%%%%%%%%%%     Macro Definitions     %%%%%%%%%%


global = {
   \key d \major
   \time 16/8
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
   
   fis8 fis g a g g fis e \bar "|" g e fis d cis fis fis fis \bar "|" \break
   fis fis g a g g fis e \bar "|" g e fis d cis fis d d \bar "||" \break } 

soprano = \relative c' {

   g'8 g a b a a g fis \bar "|"a fis g e d g g g \bar "|" \break
   g g a b a a g fis \bar "|"a fis g e d g e e \bar "||" \break }

alto = \relative c' {
	
   e8 d c b d cis e d \bar "|" e d~ d c b b e d \bar "|"
   d e \once \override Slur #'extra-offset = #'( 0.0 . -0.2 ) fis~ fis fis e \ln d4 \bar "|" e8 d~ d c b d c! b \bar "||" \break }

tenor = \relative c { 
	\clef bass

   \ln g'4 fis8 g a~ a \ln b4 \bar "|" \ln a4 \ln g4~ g8~ g c b \bar "|"
   \ln b4 \ln d4~ d8 cis! b a \bar "|" \ln a4 \ln g4~ g8~ g g g \bar "||" \break }

bass = \relative c { 
	\clef bass
	
   c8 b a g fis a e' b \bar "|" cis d b c g' e c! g \bar "|"
   g' e d b d a b d \bar "|" cis! d b c g' b, c! e \bar "||" \break }



%%%%%%%%%%     Score block     %%%%%%%%%%


#(ly:set-option 'point-and-click #f)


\book {


\paper {
   #(set-paper-size "a4")
   print-page-number = ##f
   ragged-bottom=##f
   ragged-last-bottom=##f
}


\score { <<
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
   \line { \lower #0.5 \small { \hspace #-30 \smallCaps "Office Hymn." \hspace #54 \italic "6th or 7th cent.  Tr. J. M. Neale" \normal-text "‡." } } 
   \line { \small { \hspace #-28 \italic "Thursday Evening." \hspace #18 "Magnae Deus potentiae."} }
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
                         % *** Drop Cap goes here
                         \column { \lower #2.4 \fontsize #8 "A" }
                         % *** adjust if rest of line is too far from Drop Cap - left is negative
                         \hspace #-1.7    
		         \column { \raise #0.0 "LMIGHTY God, who from the flood"
                                               "  Didst bring to light a twofold brood;" } 
                       }          

                 \line { \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
                         \lower  #1.56  %%adjust this until the line spacing looks right
		         \column { "Part in the firmament to fly,"
                                   "And part in ocean's depths to lie;" } 
                       }

                 \hspace #1 
           	 \line { "2  " \column { "Appointing fishes in the sea,"
                                         "And fowls in open air to be,"
                                         "That each, by origin the same,"
                                         "Its separate dwelling-place might claim:" } }
                 \hspace #1 
           	 \line { "3  " \column { "Grant that thy servants, by the tide"
                                         "Of Blood and water purified," } }                 

                 } % end first column of verse

         % create some space between first column of verse and the vertical line
         \hspace #3

         % vertical line	
         \column { \filled-box #'(0.0 . 0.1) #'(-30 . 2) #0 }

         % second column of verse
         \column { \line { \hspace #2 "   " \column { "No guilty fall from thee may know,"
                                                      "Nor death eternal undergo." } }

                   \hspace #1 
           	   \line { \hspace #2 "4  " \column { "Be none submerged in sin's distress,"
                                                      "None lifted up in boastfulness;"
                                                      "That contrite hearts be not dismayed,"
                                                      "Nor haughty souls in ruin laid." } }

		   \hspace #1 
         	   \line { \hspace #2 "5. " \column { "O Father, that we ask be done,"
                                           "Through Jesus Christ, thine only Son;"
                                           "Who, with the Holy Ghost and thee,"
                                           "Doth live and reign eternally.    Amen." } }
 
                 } % end second column of verse

   } % end master line

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
  
%   \new Lyrics = "lyrics" { s1 }

\new ChoirStaff <<
   \new Staff = upper << 
      \new Voice = "sopranos"  { \relative c' { \global \voiceOne e8[ fis8] e8[ d8 e8] \bar "||" } }
      \new Voice = "altos"     { \relative c' { \global \voiceTwo cis!8[ d8] \ln b4. \bar "||" } } >>

      \new Lyrics \lyricsto sopranos { \set alignAboveContext = #"upper" \override LyricText #'font-size = #-1 { A -- men. } } 

      \new Staff = lower <<
         \new Voice = "tenors" { \relative c { \global \clef bass \voiceThree \ln a'4 g8[ fis8 g8] \bar "||" } }
         \new Voice = "basses" { \relative c { \global \clef bass \voiceFour a8[ d8] e8[ b8 e,8] \bar "||" } } >> 
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