%%%040.png
%%%Hymn 8 VENI EMANUEL "O Come, O Come, Emmanuel."
%%%version 3

\version "2.10"

\header {
dedication = \markup { \center-align { "THE CHRISTIAN YEAR - ADVENT" \hspace #0.1 }}
title = "8"
poet = \markup { \small { \sans {"VENI EMMANUEL."} \hspace #1 \roman {"(8 8. 8 8. 8 8.)"} } }
meter = \markup { \small { \italic { "In free rhythm" \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 80. "  To be sung in unison." } } }
composer =  \markup { \small { \italic "Adapted by " \normal-text "T. H" } \hspace #-1.2 \teeny "ELMORE" }
arranger =  \markup { \italic \small { 'from a French Missal.' } }
tagline =""
}


global = {
\key e \minor
\time 4/2
\set Staff.midiInstrument = "church organ"
}

shortenStem = \once \override Stem #'length = #5.5
nudgeRight = \once \override NoteColumn #'force-hshift = #0.4

soprano = \relative c' { 
\cadenzaOn \partial 2 e2 \bar "dashed" g2 b2 b2 b2 \bar "dashed"  a2( c2 b2) a2 \bar "dashed" g1. a2 \bar "dashed" b2 g2 e2 g2 \bar "dashed" \break
a2( fis2 e2) d2 \bar "dashed" e1. \fermata \bar "||" \set Score.measurePosition = #(ly:make-moment 2 2 2) a2 \bar "dashed" a2 e2 e2 fis2 \bar "dashed" \nudgeRight g1( fis2) e2 \bar "dashed" d1. g2 \bar "dashed" \break 
a2 b2 b2 b2 \bar "dashed" a2( c2 b2) a2 \bar "dashed" g1. \fermata \bar "||" \set Score.measurePosition = #(ly:make-moment 2 2 2) d'2 \bar "dashed" d1 b2\rest b2 \bar "dashed" b1 b2\rest b2 \bar "dashed" \break 
a2( c2 b2) a2 g2 <fis a>2 \bar "dashed" b2 g2 e2 g2 \bar "dashed" a2( fis2 e2) d2 \bar "dashed" e1. \fermata \bar "||" \break \cadenzaOff 
}
alto = \relative c' { 
\partial 2 s2 \bar "dashed" e2 < d fis>2 <d g>2 <d g>2 \bar "dashed" \nudgeRight < c e>1 <d~ g>2 <d fis>2 \bar "dashed" \once \override Tie #'extra-offset = #'( 0 . -1 ) d1.~ <d fis>2 \bar "dashed" <d~ g>2 d2 c2 d2 \bar "dashed" \break
<c e> d2 \nudgeRight b1 \bar "dashed" b1. \bar "||" \set Score.measurePosition = #(ly:make-moment 2 2 2) e4( d4) \bar "dashed" c2 e2 b2 d2 \bar "dashed" d2 e2 d2 cis2 \bar "dashed" s1. <b e>2 \bar "dashed" \break 
<d fis>2 <d fis>2 <d g>2 <e g>2 \bar "dashed" \nudgeRight #(set-accidental-style 'forget) <c e>1 #(set-accidental-style 'default) <d~ g>2 <d fis>2 \bar "dashed" d1. \bar "||" \set  Score.measurePosition = #(ly:make-moment 2 2 2) <g b>2 \bar "dashed" <fis a>1 s2 <e g>2 \bar "dashed" <d fis>1 s2 <e g>2 \bar "dashed" \break 
\nudgeRight <c e>1 <d g>2 <d fis>2 d2 d2 \bar "dashed" <g d>2( d2) c2 d2 \bar "dashed" <c e>2 d2 \nudgeRight b1 \bar "dashed" b1. \bar "||" \break
}
tenor = \relative c { 
\partial 2 <b' g>2 \bar "dashed" <g b>2 s2 s2 s2 \bar "dashed" s1 s1 \bar "dashed" b1.~ s2 \bar "dashed" s2 s2 \nudgeRight g1 \bar "dashed" \break
\nudgeRight a1 g2 fis2 \bar "dashed" g1. \bar "||" \set Score.measurePosition = #(ly:make-moment 2 2 2) \tieUp a2~ \bar "dashed" a2 \nudgeRight g1 a2 \bar "dashed" \nudgeRight b1 \nudgeRight a1 \bar "dashed" a1. s2 \bar "dashed" \break 
<fis~ a>2 <fis b>2 s2 s2 \bar "dashed" a1 g2 a2 \bar "dashed" b1. \bar "||" \set Score.measurePosition = #(ly:make-moment 2 2 2) <b d>2 \bar "dashed" <a d>1 d,2\rest <g b>2 \bar "dashed" <fis b>1 d2\rest <g b>2 \bar "dashed" \break 
a1 s2 s2 b2 s2 \bar "dashed" \nudgeRight g\breve \bar "dashed" \nudgeRight a1 g2 fis2 \bar "dashed" g1. \bar "||" \break 
}
bass = \relative c { 
\partial 2 e2 \bar "dashed" e2 d2 b2 g2 \bar "dashed" c2 a2 b2 d2 \bar "dashed" g1. d2 \bar "dashed" g,2 b2 c2 b2 \bar "dashed" \break
a2 d2 e2 b2 \bar "dashed" e1. \fermata \bar "||" \set Score.measurePosition = #(ly:make-moment 2 2 2) c4( b4) \bar "dashed" a2 c2 e2 d2 \bar "dashed" << { \voiceTwo \shortenStem g2 \shortenStem e2 \shortenStem fis2 \shortenStem a2 } \new Voice = "pedals" { \voiceFour \set fontSize = #-3 g,2 e2 fis2 a2 } >> \bar "dashed" <d fis>1. e2 \bar "dashed" \break
d2 b2 g2 e'2 \bar "dashed" a,1 b2 d2 \bar "dashed" g1. \fermata \bar "||" \partial 2 g2 \bar "dashed" d1 s2 e2 \bar "dashed" b1 s2 e2 \bar "dashed" \break 
a,1 b2 d2 g2 d2 \bar "dashed" g,2 b2 c2 b2 \bar "dashed" a2 d2 e2 b2 \bar "dashed" <<  { \voiceTwo \once \override Script #'padding = #2.5 e1._\fermata } 
\new Voice = "pedals" { \voiceFour \set fontSize = #-3 \once \override NoteColumn #'force-hshift = #0.1 e,1. } >> \bar "||" \break
}


#(ly:set-option 'point-and-click #f)

\paper {
   #(set-paper-size "a4")
   % between-system-padding = 2\mm
   % before-title-space = 0\mm
   % after-title-space = 1.5\mm
   % top-margin = 3\mm
   % bottom-margin = 5\mm
   % between-system-space = #0
   % *** suppresses page numbering
   print-page-number = ##f
   ragged-last-bottom = ##t
   ragged-bottom = ##t
}

\score { \new ChoirStaff << 
\new Staff = women << \new Voice = "sopranos" { \voiceOne << \global \soprano >> }
                      \new Voice = "altos" { \voiceTwo << \global \alto >> } >>
\new Staff = men << \clef bass 
                    \new Voice = "tenors" { \voiceOne << \global \tenor >> }
                    \new Voice = "basses" { \voiceTwo << \global \bass >> } >>
>>
         
\layout { indent=0
          \context { \Score
                     \remove "Bar_number_engraver" }
          \context { \Staff
                     \override TimeSignature #'transparent = ##t }
}


\midi { \context { \Score 
                   tempoWholesPerMinute = #(ly:make-moment 80 2)
                 }
      }
}

\markup { \hspace #85 \small \italic "18th cent.   Tr.  T. A. L." }

\markup { \hspace #45 \small "Veni, veni, Emmanuel." }

\markup {

%%% Lyrics are formatted as a Master Line of three columns: use \hspace or \halign to centre the group

%%% Start Master Line

\fill-line { 
\column { %%start column 1 - comprises first two verses
          \column { \line { \hspace #2 \column { %% this is the column that makes verse 1
                                                 \lower #2.4 \fontsize #8 "O" } %%Drop Cap goes here
                                                 \hspace #-1    %% adjust this if other letters are too far from Drop Cap
                                                 \column  { \raise #0.0 " COME, O come, Emmanuel!" 
                                                                        " Redeem thy captive Israel," } } }
                    \line { \hspace #2.4  %%adjust hspace until this line left edge is flush with Drop Cap
                            \lower  #1.56  %%adjust this until the line spacing looks right
                            \column { "That into exile drear is gone"
                                      "Far from the face of God's dear Son." } }
                    \line { \hspace #13 \italic { \column { " "
                                                            "Rejoice! Rejoice! Emmanuel"
                                                            "Shall come to thee, O Israel." } } 
                  } %%finish verse 1
         \hspace #0.2
         \line { "2  " \column { "O come, thou Branch of Jesse! draw"
                                 "The quarry from the lion's claw;"
                                 "From the dread caverns of the grave,"
                                 "From nether hell, thy people save." } }  
         } %% finish column 1

\column { \filled-box #'(0.0 . 0.1) #'(-30 . 0) #0 }    %% Column 2. This is the line
		   
\column { %%start column 3
          \hspace #0.5
          \line { "3  " \column { "O come, O come, thou Dayspring bright!"
                                  "Pour on our souls thy healing light;"
                                  "Dispel the long night's lingering gloom,"
                                  "And pierce the shadows of the tomb." } }
          \hspace #0.5
          \line { "4  " \column { "O come, thou Lord of David's Key!"
                                               "The royal door fling wide and free;"
                                               "Safeguard for us the heavenward road,"
                                               "And bar the way to death's abode." } }
        } %% end column 3 

} %% finish Master Line

} %% finish \markup


\markup {
          \halign #-2.5
          \column {
          \hspace #0.5
          \line { "5. " \column { "O come, O come, Adonäi,"
                                  "Who in thy glorious majesty"
                                  "From that high mountain clothed with awe"
                                  "Gavest thy folk the elder law." } }
                  }
} 


%% Amen score block

\header { breakbefore = ##f 
          piece = ##f
          opus = ##f 
}

globalAmen = {
\key e \minor
\time 2/1
\set Staff.midiInstrument = "church organ"
\set Staff.fontSize = #-3
}

\score { \new ChoirStaff << 
\new Staff = upper << \new Voice = "sopranos" { \voiceOne << \globalAmen \relative c' { e1^\markup { \hspace #-9.5 \raise #0.8 \italic \small "Harmony." } e1 \bar "||" } >> }
                      \new Voice = "altos" { \voiceTwo << \globalAmen \relative c' { c1 b1 \bar "||" } >> }
                      \addlyrics { \override LyricText #'font-size = #-1 A_-1 men.1 } 
                   >>

\new Staff = lower << \clef bass 
                      \new Voice = "tenors" { \voiceOne << \globalAmen \relative c { a'1 gis1 \bar "||" } >> }
                      \new Voice = "basses" { \voiceTwo << \globalAmen \relative c { a1 e'1 \bar "||" } >> }
                   >>
>>

\layout { 
   ragged-right = ##t
   indent = 15\cm
   \context { \Staff 
              \remove Time_signature_engraver
              \override StaffSymbol #'staff-space = #(magstep -2) }
}

\midi { \context { 
   \Score 
   tempoWholesPerMinute = #(ly:make-moment 80 2) } 
}

} % end Amen score