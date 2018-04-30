%%% 154.png
%%% Hymn 89 ANIMA CHRISTI.  "Soul of Jesus, make me whole."
%%% Version 3

\version "2.10"

\include "gregorian-init.ly"

\header {
   dedication = \markup { \center-align { "THE CHRISTIAN YEAR - LENT" \hspace #0.1 } }	
   title = "89"
   arranger = \markup { \small \italic "Adapted from an English Traditional Melody."} 
   poet = \markup { \small { \sans  "ANIMA CHRISTI." \hspace #1 \roman { "(7 7. 7 7. D.)"} } }  
   meter = \markup { \small { \italic "Slow" \normal-text { \general-align #Y #DOWN \note #"2" #0.6 = 83.} \italic "  To be sung in unison." } }
   tagline =""
}



%%%%%%%%%%     Macro Definitions     %%%%%%%%%%


global = {
   \key d \minor
   \time 4/4
   \autoBeamOff
   \set Staff.midiInstrument = "church organ"
}


nudgeleft = {
% *** works in situations where forcing a notecolumn hshift doesn't; based on Jack Kenny's macro
   \once \override Score.SeparationItem #'padding = #2
   \once \override NoteHead #'X-offset = #-1.3
   \once \override Stem #'X-offset = #-1.3 
}



%%%%%%%%%%     Music for Page 1    %%%%%%%%%% 


soprano = \relative c' {

   a'4 d4 d4 c4 \bar "|" d4 c8[ bes8]  << { a2 } \new Voice = "low" { \voiceTwo d,2}  >> \bar "|" c'4 bes4 a4 g4 \bar "|" f4 e4 d2 \bar "||" \break

   f4 bes4 a4 g4 \bar "|" f4 e4 \once \override NoteColumn #'force-hshift = #1.6 d2 \bar "|" 
      f4 bes4 a4 g4 \bar "|" f4 e4 d2 \bar "||" \break

   f4 f4 c4 c4 \bar "|" d8[ e8] f8[ g8] a2 \bar "|" c4 bes4 a4 g4 \bar "|" 
      f4 e4 \once \override NoteColumn #'force-hshift = #1.7 d2 \bar "||" \break

   f4 f4 c4 c4 \bar "|" d8[ e8] f8[ g8] < f a >2 \bar "|" c'4 bes4 a4 g4 \bar "|" f4 e4 d2 \bar "||" \break 
}


alto = \relative c' {

   < d f >4 < f a>4 < f a >4 < f a >4 \bar "|" < f bes >4 < d g >4 \voiceFour g4 \voiceTwo f4 \bar "|" 
      < e g >4 < d f >4 < c f >4 < bes d >4 \bar "|" < a c >4 < g c >4 a2 \bar "||" \break

   < bes d >4 < d g >4 < c f >4 < bes d >4 \bar "|" d4 c4 c4 b4 \bar "|" < a d >4 < d f >4 < a e' >4 d8[ e8] \bar "|" 
      c4 c4 bes2 \bar "||" \break

   c4 c4 s2 \bar "|" d4 d4 e2 \bar "|" < f a >4 < d g >4 < c f >4 < c e >4 \bar "|" < a d >4 c4 c4 bes4 \bar "||" \break

   c4 c4 c4 c4 \bar "|" d4 c8[ e8] c4 d4 \bar "|" < e g >4 < d f >4 < c f >4 d4 \bar "|" c4 c4 a2 \bar "||" \break
}


tenor = \relative c { \clef bass

   s1 \bar "|" bes4 g4 < d d'>2 \bar "|" < c c'>4 <d d'>8[ <e e'>8] <f f'>4 g4 \bar "|" 
       s2 g'4 f4 \bar "||" \break

   bes,4 g4 a4 bes8[ c8] \bar "|" a'8[ b8] c4 \once \override NoteColumn #'force-hshift = #1.6 g2 \bar "|" 
      s2. bes4 \bar "|" c4 a4 f4 g4 \bar "||" \break

   < f a >4 < f a >4 <f g>4 << { g4 } \new Voice = "alt" { \voiceFour e4 } >> \bar "|" 
      <f bes>4 d'4 d4  c4   \bar "|"  f,,4 g4 a8[ bes8] c4 \bar "|" s4 g' f e \bar "||" \break

   f4 f4 e4 e4 \bar "|" < bes f' bes >4 f'8[ bes] < f, a' >2 \bar "|" < c c' >4 <d d'>8[ < e e' >] < f f' >4 bes'4 \bar "|" a g g f \bar "||" \break 
}


bass = \relative c { \clef bass

   \tieUp \once \override Tie #'extra-offset = #'( 0 . 0.3 ) d2~ d8[ e] f4 \bar "|" 
      s1 \bar "|" s1 \bar "|" a,8[ bes] c4 d2 \bar "||" \break

   s1 \bar "|" d4 e8[ f] g4 g,4 \bar "|" d'4 d4 c4 bes4 \bar "|" a4 f4 bes2 \bar "||" \break

   f8[ g8 a8 bes8] c2 \bar "|"  bes2 a4. g8  \bar "|" s1 \bar "|" d'4 e4 f,4 g4 \bar "||" \break
 
  a4 a8[ bes8] c4 c4 \bar "|" s4 a8[ g8] s2 \bar "|" s2. g4 \bar "|" a8[ bes8] c4 d2 \bar "||" \break
}


sopranolastfour = \relative c' {

   \once \override TextScript #'extra-offset = #'( -5 . 1 ) c'4^\markup { \small { \italic "Last four lines of final verse." } } 
      bes a g \bar "|" f e < a, d >2 \bar "||" f'4 f c c \bar "|" d8[ e] f[ g] < f a >2 \bar "||" \break

   < g c >4 < f bes > < f a > g \bar "|" f e \once \override NoteColumn #'force-hshift = #1.6 
      \once \override TextScript #'extra-offset = #'( 6 . 0 ) d2^\markup{ \fontsize #4 "," } \bar "||" 
      \once \override TextScript #'padding = #2.0 < e g c >4^\markup{ \italic \small {Slower.} } < d f bes >4 < c f a >4 < d g >4 \bar "|" < c f >4 < c e >4 < a d >2\fermata \bar "||" \time 4/2 < bes d >1 < a d >1 \bar "||" \break 
} 


altolastfour = \relative c' {

   < e g >4 <d f >4 <c f>4 d4 \bar "|" c4 c4 s2 \bar "||" c4 c c c \bar "|" d c8[ e] c4 d \bar "||" \break

   e d c d \bar "|" c c c bes  \bar "||" s1 \bar "|" s1 \bar "||" \time 4/2 s1 s1 \bar "||" \break 
} 


tenorlastfour = \relative c { \clef bass 

   < c, c' >4 < d d' >8[ < e e'>8] < f f' >4 bes'4 \bar "|" a g g f \bar "||" f f e e \bar "|" <f bes > f8[ bes] a2 \bar "||" \break

   < c,, c' >4 < d d' >8[ < e e'>8] < f f' >4 bes'4 \bar "|" f f f2 \bar "||" < c, c' >4 < d d' >8[ < e e' >8] < f f' >4 bes'4 \bar "|" bes g g fis \bar "||"  
      \time 4/2 g1 fis \bar "||" \break
} 


basslastfour = \relative c { \clef bass 

   s2. g4 \bar "|" a8[ bes] c4 d2 \bar "||" a4 a8[ bes] c4 c \bar "|" 
      bes a8[ g] f2 \bar "||" \break

   s2. g4 \bar "|" a a bes2 \bar "||" s2. g4 \bar "|" a8[ bes] c4 d2\fermata \bar "||"  
      \time 4/2 g,1 d'1 \bar "||" \break
} 



%%%%%%%%%%     Score block     %%%%%%%%%%


#(ly:set-option 'point-and-click #f)

\book {

\paper {
   #(set-paper-size "a4")
   between-system-padding = #3.0
   print-page-number = ##f
   % *** forces Lilypond to space out systems to fill the entire page
   ragged-bottom=##f
   ragged-last-bottom=##t
}

\score { <<

\new ChoirStaff <<
   \new Staff = "upper" << 
                           \context Voice = sopranos { \voiceOne \global \soprano }
                           \context Voice = altos    { \voiceTwo \global \alto } 
		        >> 
   \new Staff = "lower" << 
                           \context Voice = tenors   { \voiceOne \global \tenor }
                           \context Voice = bass     { \voiceTwo \global \bass } 
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
   \override NonMusicalPaperColumn #'page-break-permission = ##f }
\context { \Staff 
   \override TimeSignature #'transparent = ##t }
} 

\midi { 
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 83 4) } 
}

} % *** end score 



%%%%%%%%%%     Lyrics     %%%%%%%%%%



\markup {
   % *** change number as necessary to centre lyrics block
   \hspace #34 

\column { 
   % *** whole lyrics block is formatted into a single column

% *** heading section
   \line { \small { \hspace # 43 \italic "14th cent.    Anon." \normal-text "‡ 1855." } }
   \line { \small { \italic "Paraphrase of " \normal-text "Anima Christi sanctifica me." } }
   % *** inserts vertical space between lines
      
% *** lyrics section 1: double column of verses
   % *** Create a line made up of two columns of verse separated by a vertical line
   \line {
      % *** first column of verse  
      % *** return to LH margin
         \hspace #-30
      \column {  
         \line { \hspace #2.2 
                    % *** Drop Cap goes here
                 \column { \lower #2.4 \fontsize #8 "S" }
                    % *** adjust if rest of line is too far from Drop Cap - left is negative
                  \hspace #-1.3    
	          \column { \raise #0.0 "OUL of Jesus, make me whole,"
                                        "  Meek and contrite make my soul;" } }          

                  \line { % *** adjust hspace until this line left edge is flush with Drop Cap
                          \hspace #2.5  
                          % *** adjust this until the line spacing looks right
                          \lower  #1.56  
		          \column { "Thou most stainless Soul Divine,"
                                    "Cleanse this sordid soul of mine,"
                                    "Hallow this my contrite heart,"
                                    "Purify my every part;"
                                    "Soul of Jesus, hallow me,"
                                    \italic \small "                                  Miserere Domine." } }
      } % *** end first column of verse

      % *** create some space between first column of verse and the vertical line
      \hspace #6

      % *** vertical line	
      \column { \filled-box #'(0.0 . 0.1) #'(-20 . 2) #0 }

      % *** second column of verse
         \hspace #5 
      \column {
         \line { "2  " \column { "Save me, Body of my Lord,"
                                 "Save a sinner, vile, abhorred;"
                                 "Sacred Body, wan and worn,"
                                 "Bruised and mangled, scourged and torn,"
                                 "Piercèd hands, and feet, and side,"
                                 "Rent, insulted, crucified:"
                                 "Save me—to the Cross I flee,"
                                 \italic \small "                                  Miserere Domine." } }
      } % end second column of verse
   } % end master line
} % end column that is entire lyrics section
} % end markup



%%%%%%%%%%     Page Break     %%%%%%%%%%
  

% *** fake score block to occupy space and force a pagebreak.

\score { 

   { s4 }

\header { breakbefore = ##f piece = " " opus = " " }

\layout{
   \context { \Staff
      \remove Time_signature_engraver
      \remove Key_engraver
      \remove Clef_engraver
      \remove Staff_symbol_engraver } }  
}
	


%%%%%%%%%%     Page Two     %%%%%%%%%%


\markup {

% *** change number as necessary to centre lyrics block
   \hspace #35

% *** whole section of lyrics is formatted into a single column
   \column {

% *** Create a line made up of two columns of verse separated by a vertical line
   \line {
      % *** first column of verse  
      % *** return to LH margin
         \hspace #-30
      \column { 
         \line { "3  " \column { "Blood of Jesus, stream of life,"
                                 "Sacred stream with blessings rife,"
                                 "From thy broken Body shed"
                                 "On the Cross, that altar dread;"
                                 "Given to be our drink Divine,"
                                 "Fill my heart and make it thine;"
                                 "Blood of Christ, my succour be,"
                                 \italic \small "                                  Miserere Domine." } }
         \hspace #1 
         \line { "4  " \column { "Holy Water, stream that poured"
                                 "From thy riven side, O Lord,"
                                 "Wash thou me without, within,"
                                 "Cleanse me from the taint of sin,"
                                 "Till my soul is clean and white,"
                                 "Bathed, and purified, and bright"
                                 "As a ransomed soul should be,"
                                 \italic \small "                                  Miserere Domine." } }
      } % *** end first column of verse

      % create some space between first column of verse and the vertical line
         \hspace #9

      % vertical line	
      \column { \filled-box #'(0.0 . 0.1) #'(-45 . 2) #0 }

      % create some space between the vertical line and the first column of verse
         \hspace #5

      % second column of verse
         \column { 
            \line { "5  " \column { "Jesu, by the wondrous power"
                                    "Of thine awful Passion hour,"
                                    "By the unimagined woe"
                                    "Mortal man may never know;"
                                    "By the curse upon thee laid,"
                                    "By the ransom thou hast paid,"
                                    "By thy Passion comfort me,"
                                    \italic \small "                                  Miserere Domine." } }
            \hspace #1 
            \line { "6  " \column { "Jesu, by thy bitter Death,"
                                    "By thy last expiring breath,"
                                    "Give me the eternal life,"
                                    "Purchased by that mortal strife;"
                                    "Thou didst suffer death that I"
                                    "Might not die eternally;"
                                    "By thy dying quicken me,"
                                    \italic \small "                                  Miserere Domine." 

                                    % *** create some vertical space before last verse.
                                    \hspace #1 } }
      } % ***end second column of verse

   } % *** end master line

   \line { "7.  " \column { \line { \italic "Miserere" \hspace #-1.2 "; let me be" }
                            "Never parted, Lord, from thee;"
                            "Guard me from my ruthless foe,"
                            "Save me from eternal woe;"
                            "When the hour of death is near,"
                            "And my spirit faints for fear,"
                            "Call me with thy voice of love,"
                            "Place me near to thee above,"
                            "With thine Angel host to raise"
                            "An undying song of praise,"
                            \italic \small "                                  Miserere Domine." } }
} % end master column 
} % end markup


%%%%%%%%%%     Last four lines of music     %%%%%%%%%%


\score { <<
   \new ChoirStaff <<
      \new Staff = "women" << \context Voice = sop { \voiceOne \global \sopranolastfour }
                              \context Voice = alt { \voiceTwo \global \altolastfour } >>

      \new Lyrics \lyricsto sop { \tiny { Place me near to thee a -- bove, With thine An -- gel host to raise
                                          An un -- dy -- ing song of praise, \markup { \italic Mi } -- \markup { \italic se } -- \markup { \italic re } 
                                             -- \markup { \italic re } \markup { \italic Do } -- \markup { \italic mi } -- \markup { \italic ne. }  A -- men. } }

      \new Staff = "men" << \context Voice = ten { \voiceOne \global \tenorlastfour }
                            \context Voice = bas { \voiceTwo \global \basslastfour } >>
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
   \override NonMusicalPaperColumn #'page-break-permission = ##f }
\context { \Staff 
   \override TimeSignature #'transparent = ##t }
} 

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 83 4) } } 
 
} % end last four lines score 

} % end book