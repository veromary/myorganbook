%%% 024.png
%%% Plainsong sample 1 in Preface.
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
f8 e d f \[ a \melisma \flexa g \melismaEnd \] \[ e\melisma \flexa d\melismaEnd \] f g a a f d e \bar "||" }

\paper {
 #(set-paper-size "a4")
 % annotate-spacing = ##t
 head-separation = 11 \mm
 print-page-number = ##f
 ragged-last-bottom = ##t
 ragged-bottom = ##t
} 

\score { 

<<

\new VaticanaStaff = "snippet" 

\new VaticanaVoice = "cantus" { \plainsong }

\new Lyrics \lyricsto "cantus" {
   \override LyricText #'font-shape = #'italic
Qua De -- us in -- fer -- num vi -- cit, et as -- tra te -- net. } 

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
   \new Staff = "midi" {\plainsong} 	
   \midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) } }	
}% end midi score