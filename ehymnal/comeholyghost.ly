%%%100.png
%%%Hymn 46 Tallis' Ordinal. In stature grows the heavenly Child
%%%Version 2

\version "2.10"

\header {
	dedication = \markup { \center-align { \line {  "Veni Creator Spiritus" } 
					       \hspace #1
						} }	
  title = "46" 
			       
  arranger = \markup { \small { \smallCaps "T. Tallis," \italic "c. 1515-85."} }
  poet = \markup { \small { \sans  "TALLIS' ORDINAL." \smallCaps "('9th tune')."  \hspace #1 \roman { "(C. M.)"} } }
  meter = \markup { \small { \italic {Moderately slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 66.} }
  tagline = ""
}

%%generates the breathmarks
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}


soprano = \relative c' {
  \partial 2 d2 | fis2 g2 a2 a2 | b2 b2 a2 \breathmark \bar "||" a2 | d2 cis2 b2 b2 | a1. \breathmark \bar "||" \break
  d,2 | fis2 g2 a2 a2 | b2 b2 a2 \breathmark \bar "||" d,2 | g2 fis2 e2 e2 | \once \override Dots #'transparent = ##t d1. \bar "||"
}

alto = \relative c' {
  d2 | d2 d2 e2 fis2 | g2 g2 fis2 \bar "||" fis2 | fis2 e2 e2 e2 | cis1. \bar "||"
  d2 | d2 d2 cis2 a2 | d2 d2 d2 \bar "||" d2 | d2 d2 d2 cis2 | \once \override NoteColumn #'force-hshift = #-0.01 d1. \bar "||"
}

tenor = \relative c { \clef bass
  fis2 | a2 b2 cis2 a2 | d2 d2 d2 \bar "||" d,2 | fis2 a2 a2 gis2 | a1. \bar "||"
  fis2 | a2 d,2 e2 fis2 | g2 g2 fis2 \bar "||" fis2 | b2 a2 a2 a2 | fis1. \bar "||"
}

bass = \relative c { \clef bass
  d2 | d2 b2 a2 d2 | g,2 g2 d'2 \bar "||" d2 | d2 a2 e'2 e2 | a,1. \bar "||"
  d2 | d2 b2 a2 d2 | g,2 g2 d'2 \bar "||" d2 | g,2 d'2 a2 a2 | d1. \bar "||"
}

lhchords = \relative c { \clef bass
 r2 | <d fis a>1 <a e' cis> | <g b d> <d' fis a> | 
<d fis a> <e gis b> <a, e' cis> s
 <d fis a>1 <a e' cis> | <g b d> <d' fis a> | 
<g, b d> <a e' cis> <d, fis a>
}

global = {
  \time 4/2
  \key d \major 
  \set Staff.midiInstrument = "church organ"
}

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##t
}

\book{

\score{
\new ChoirStaff	
 <<

	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \soprano }
	\context Voice = altos    {\voiceTwo \global \alto }
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \tenor }
	\context Voice = basses { \voiceTwo \global \bass }
			        >> 
 >>
\layout {
		indent=0
%		\context { \Score timing = ##f }
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	}

\midi { 
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2) }
       }	
} %%score bracket

\score {
  \new PianoStaff <<
    \new Staff = "upper" \soprano
    \new Staff = "lower" \lhchords
  >>
  \layout { }
  \midi { }
}

%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne d1 d1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo b1 a1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree g'1 fis1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  g1 d'1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2) }}  %%Amen midi       
       
}  

} %%book bracket
