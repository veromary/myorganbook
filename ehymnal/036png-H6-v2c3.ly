%%%036.png
%%%Hymn 6 Bristol (C. M.) "Hark the glad sound!"
%%%Version 3 Fonts reset.

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - ADVENT"
		\hspace #0.1 }}	
  title = "6"
  meter = \markup {  \small { \column {  \line { \sans {"BRISTOL."} \hspace #1 \roman {"(C. M.)"}}
                                        \line { \italic {Moderately slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 69.}}}}   
  arranger =  \markup {  \small \center-align {
		            \line{ \italic {"Melody from" } }
			    \line { \italic { "Ravencroft's Psalter, 1621."}}}}
  tagline =""
}

nbbar = {\bar "|" \noBreak }

halfmeasure =  \set Score.measurePosition = #(ly:make-moment 2 2)


soprano = \relative c' { 
  \partial 1 d'1 \nbbar c2 a2 b2 g2 \nbbar a2. a4 g1 \bar "||" \noBreak
  \halfmeasure c1 \nbbar b2 a2 a2 gis2 \nbbar a1 \bar "||" \break
  \halfmeasure a1 \nbbar b2 c2 b2  g2 \nbbar a2 g2 fis1 \bar "||" \noBreak
  \halfmeasure d'1 \nbbar b2 c2 a2 a2 \nbbar g1 
}

alto = \relative c' {
  d1  | e2 d2 d2 d2    | e2 fis2 \once \override NoteColumn #'force-hshift = #-0.02 g1 \bar "||"
  e1  | e2 c4 ( d4 ) e2. d4 | cis1 \bar "||" 
  d1  | d2  c2 d2 d2   | c2 b4 ( c4 ) d1 \bar "||" 
  a'1 | g2 g2 g2 fis2  | \once \override NoteColumn #'force-hshift = #-0.02 g1 \bar "||" 
}

tenor = \relative c { \clef bass
  b'1  | a2 fis2 g2 d'2 | c2 a2 b1 \bar "||"
  a1   | gis2 a2 b2 b2  | a1 \bar "||" 
  fis1 |  g2 g2 g2 g2   | e2 g2 a1 \bar "||" 
  d1   | d2 e2 a,2 d4 ( c4 ) | b1 \bar "||" 
}

bass = \relative c {\clef bass
  g'1  | c,2 d2 g,2 b2 | c2 d2 g,1 \bar "||" 
  a1   | e'2 f2 e2 e2  | a,1 \bar "||" 
  d1   |  g2 e2 g2 b,2 | c2 e2 d1 \bar "||" 
  fis1 |  g2 c,2 d2 d2 | g,1 \bar "||" 
}

global = {
  \time 4/2 
  \key g \major 
  \set Staff.midiInstrument = "church organ" 
}

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  top-margin = 3\mm
  bottom-margin = 5\mm
  print-page-number = ##f
  after-title-space = 1\mm
  between-system-space = #0.1
  between-system-padding = 2\mm
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
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 69 2)
            }
       }
	
} %%score bracket


\markup { \hspace #8   %%add space as necc. to center the column
          \fill-line { 
	       \column { 
		       \line {  \small { \italic {\hspace #44 "P. Doddridge, 1702-51." }}}
	             \hspace #1  % adds vertical spacing between verses. More such lines more space.     
		     \column { %% stanza 1 column 
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "H" }   %%Drop Cap goes here
				  \hspace #-1    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ARK the glad sound! the Saviour comes,"  "  The Saviour promised long!"  } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Let every heart prepare a throne," 
					   "    And every voice a song."
			  		}}
			       
			           } %% finish stanza 1
		\hspace #1 
           		\line { "2  "
			   \column {	     
				"He comes the prisoners to release" 
				"    In Satan's bondage held;" 
				"The gates of brass before him burst," 
				"    The iron fetters yield." 
			}}
		\hspace #1 
           		\line { "3  "
			  \column {	     
				"He comes the broken heart to bind," 
				"    The bleeding soul to cure," 
				"And with the treasures of his grace" 
				"    To enrich the humble poor." 
			}}
	   	\hspace #1 
           		\line { "4. "
			  \column {	     
				  "Our glad hosannas, Prince of peace," 
				  "    Thy welcome shall proclaim," 
				  "And heaven's eternal arches ring" 
				  "    With thy belovèd name."
			}}
	  }}
	} % stanza markup bracket

%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne g'1 g1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo e1 d1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree c'1 b1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  c1 g1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 69 2) }}  %%Amen midi       
       
}  

} %%book bracket

