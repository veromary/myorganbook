%%% 024.png
%%% Plainsong sample 2 in Preface.
%%% Version 3

\version "2.10"

\include "gregorian-init.ly"

#(ly:set-option 'point-and-click #f)

\header {
   tagline = "" }

plainsong = { 
   \clef "vaticana-do3"
   \set fontSize = #3
   \set Staff.midiInstrument = "church organ"
f8 e d \[ f\melisma \pes a\melismaEnd \] \[ a\melisma a \flexa g  g\melismaEnd \] \[ e\melisma \flexa d\melismaEnd \] f g a a f d e \bar "||" 
}

\score { 

<<

\new VaticanaStaff = "snippet" 

\new VaticanaVoice = "cantus" { \plainsong }

\new Lyrics \lyricsto "cantus" {
   \override LyricText #'font-shape = #'italic
Qua De -- us in -- fer -- num vi -- cit, et as -- tra te -- net. } 

\new Lyrics \lyricsto "cantus" {
   \override LyricText #'font-shape = #'upright
Day \override LyricHyphen #'minimum-distance = #2.0 where -- in God o'er -- came hell, and a -- rose from the dead. }

>>

\layout { ragged-last = ##f

\context { \Score 
           timing = ##f 
           \override TimeSignature #'transparent = ##t }

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

\context { \Lyrics
           % **** To even out spacing between words:
           \override LyricSpace #'minimum-distance = #5
           % **** To reduce the font size:
           \override LyricText #'font-size = #-1 }

}% end layout
	  
}% end score


% *** Second invisible score in modern context to support midi call

\score {
   \new Staff = "midi" {
   \set Staff.midiInstrument = "church organ"
    f8 e d f[( a]) a[~ a g~ g] e[( d]) f g a a f d e \bar "||" 
} 	
   \midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) } }	
}% end midi score