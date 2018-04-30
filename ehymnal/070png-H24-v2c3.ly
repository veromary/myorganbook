%%%070-071.png
%%%Hymn 24 Mendelssohn. Hark the Herald
%%%Version 2 Fonts reset

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - CHRISTMAS"
		\hspace #0.1 }}	
  title = "24"
  meter = \markup { \small { \column {  \line { \sans {"MENDELSSOHN."} \hspace #1 \roman {"(7 7 7 7. 7 7 7 7. 7 7.)"}}
                               \line { \italic {In moderate time} \fontsize #-5 \general-align #Y #DOWN \note #"4" #1 = 92.} }}  } 
  arranger =  \markup { \small { \center-align {
		            \line{ \italic {"Adapted from a Chorus by" } }
			    \line { \smallCaps { "F. Mendelssohn-Bartholdy, 1809-47."}}}} }
  tagline =""
}


global = {
 \time 4/4 
 \key g \major
}

soprano = \relative c' { \set Staff.midiInstrument = "church organ"

  \partial 2 d4 g4 | g4. fis8 g4 b4 | b4( a4) d4 d4 | d4. c8 b4 a4 | b2 \bar "||" \break
  d,4 g4 | g4. fis8 g4 b4 | b4( a4) d4 a4 | a4. fis8 fis4 e4 | d2 \bar "||" \break
  d'4 d4 | d4 g,4 c4 b4 | b4( a4) d4 d4 | d4 g,4 c4 b4 | b4( a4) \bar "||" \break  
  e'4 e4 | e4 d4 c4 b4 | c2 a4 b8[ c8] | d4. g,8 g4 a4 | \break
  b2 e4. e8 | e4 d4 c4 b4 | 
 %\once \override Score.SeparationItem #'padding = #2
 % \once \override NoteColumn #'force-hshift = #2.4
  \once \override NoteHead #'X-offset = #1.6
  \once \override Stem #'X-offset = #2.92
  c2 a4 ^\markup {\hspace #-3 \small \italic "Unison."} b8[ c8] | d4. g,8 g4 a4 | g2 \bar "||"
}


alto = \relative c' { \set Staff.midiInstrument = "church organ"
  \partial 2 d4 d4 | d4. d8 d4 g4 | g4( fis4) g4 fis4 | e4 a4 g4 fis4 | g2 \bar "||" \break
  d4 d | d4. c8 b4 g'4 | g2 fis4 e4 | fis4. d8 d4 cis4 | d2 \bar "||" \break
  d4 d4 | d4 g4 a4 g4 | g4( fis4) d4 d4 | d4 g4 a4 g4 | g4( fis4) \bar "||" \break  
  c'4 c4 | c4 b4 a4 gis4 | a2 fis4 fis4 | g4. d8 d4 fis4 | \break
  g2 c4. c8 | c4 b4 a4 gis4 | 
 % \once \override NoteColumn #'force-hshift = #2.0
  \once \override NoteHead #'X-offset = #1.6
  \once \override Stem #'X-offset = #1.66
  a2 d,4 <d fis >4 | <d g >4. <b d >8 d4 <d fis >4 | d2 \bar "||"
}


tenor = \relative c { \clef bass \set Staff.midiInstrument = "church organ"
  \partial 2 b'4 b4 | b4. a8 g4 d'4 | d2 d4 d4 | e4 e4 d4 d4 | d2 \bar "||" \break
  b4 b4 | b4. a8 g4 d'4 | e2 d4 e4 | a,4. a8 b4 g4 | fis2 \bar "||" \break
  d'4 d4 | d4 d4 d4 d4 | d2 d4 d4 | d4 d4 d4 d4 | d2 \bar "||" \break
  e4 e4 | e4 f4 e4 d4 | c2 d4 d4 | d4. b8 b4 d4 | \break
  d2 e4. e8 | e4 d4 c4 b4 | c2 d4 s4 | s4 s4 b4 c4 | b2 \bar "||"
}

bass = \relative c { \clef bass \set Staff.midiInstrument = "church organ"
  \partial 2 g'4 g4 | g4. d8 b4 g4 | d'2 b4 b4 | c4 c4 d4 d4 | g,2 \bar "||" \break
  g'4 g4 | g4. d8 e4 d4 | cis4.( a8) b4 cis4 | d4 fis,4 g4 a4 | d2 \bar "||" \break
  d'4 d4 | d4 b4 fis4 g4 | d2 d'4 d4 | d4 b4 fis4 g4 | d2 \bar "||" \break
  c4 c4 | c4 d4 e4 e4 | a2 d4 c4 | b4. g8 d4 d4 | \break
  << { g2 c4. c8 | c4 b4 a4 gis4 | a2  fis4 c'4 | } 
       \new Voice = "pedals" { \voiceFour \stemDown 
	\override NoteColumn #'force-hshift = #0.8
	\set fontSize = #-3
	\override Stem #'length = #4
       s2 c,2 ~ _\markup { \fontsize #2 \italic "Organ pedals." } |
       c2. e4 | \once \override NoteColumn #'force-hshift = #-1.2 a4( g!4)  } 
   >>
       b4 g4 d4 d4 | g2 \bar "||" 
}

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
  top-margin = 3\mm
  bottom-margin = 5\mm
  print-page-number = ##f
  between-system-space = #0.1
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
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	}
	
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 92 4)
            }
       }
	
} %%score bracket

\markup { \hspace #10   %%add space as necc. to center the column
          \fill-line { 
	       \column { 
	  	     \line { \small \italic {\hspace #10 "C. Wesley (1743), G. Whitefield (1753), M. Madan"}}
		     \line { \hspace #26 \small \italic {"(1760), and others."}}
	             \hspace #1  % adds vertical spacing between verses. More such lines more space.     
             
		     \column { %% stanza 1 column 
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "H" }   %%Drop Cap goes here
				  \hspace #-1    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ARK! the herald Angels sing"  "Glory to the new-born King;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Peace on earth and mercy mild,"
					   "God and sinners reconciled:"
					   "Joyful all ye nations rise,"
					   "Join the triumph of the skies,"
					   "With the angelic host proclaim,"
					   "Christ is born in Bethlehem."
					   \italic  "              Hark! the herald Angels sing"
					   \italic "              Glory to the new-born King."
			  		}}
			       
			           } %% finish stanza 1
	   \hspace #1 
	   \hspace #1 
           	\line { "2  "
			\column {	     
				"Christ, by highest heaven adored,"
				"Christ, the everlasting Lord,"
				"Late in time behold him come"
				"Offspring of a Virgin's womb!"
				"Veiled in flesh the Godhead see,"
				"Hail the incarnate Deity!"
				"Pleased as man with man to dwell,"
				"Jesus, our Emmanuel."
			}}
	   \hspace #1 
	   \hspace #1 
           	\line { "3. "
			\column {	     
				"Hail the heaven-born Prince of peace!"
				"Hail the Sun of Righteousness!"
				"Light and life to all he brings,"
				"Risen with healing in his wings;"
				"Mild he lays his glory by,"
				"Born that man no more may die,"
				"Born to raise the sons of earth,"
				"Born to give them second birth."
	   }}
	  }}
	} % stanza markup bracket

%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                    << 
	\context Voice = "sopranos" { \relative c' { \set Staff.midiInstrument = "church organ" 
	                                             \clef treble \time 4/2 \key g \major \voiceOne g'1 g1 \bar "||" }}
	\context Voice = "altos"    { \relative c' { \set Staff.midiInstrument = "church organ"
	                                              \clef treble \key g \major \voiceTwo e1 d1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \set Staff.midiInstrument = "church organ"
	                                          \clef bass \key g \major \voiceThree c'1 b1 \bar "||" }}
	\context Voice = "basses" { \relative c { \set Staff.midiInstrument = "church organ"
	                                          \clef bass \key g \major \voiceFour  c1 g1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 92 4) }}  %%Amen midi       
       
}  

} %%book bracket
