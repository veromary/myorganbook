%%% 037.png
%%% Hymn 6 Alternative Version 
%%% Version 1 Reset fonts

\version "2.10.19"


\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - ADVENT"
		\hspace #0.1 }}	
  title = "6"
  subtitle = \markup { \column  {\smallCaps "Alternative Version" 
                \hspace #0.1 }}
  arranger =  \markup {  \small { \italic {"Harmonized by" } \smallCaps { "T. Ravenscroft," } \italic {"in his Psalter." } } }     
  tagline =""
}

global =  {
  \time 4/2 
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

halfmeasure =  \set Score.measurePosition = #(ly:make-moment 2 2)

soprano = \relative c' {
 \halfmeasure g'1 | a2 fis2 g2 d'2 | c2 a2 b1 \bar "||" \halfmeasure b2\rest a2 | \break
 gis2 a2 c2 b2 | a1 \bar "||" b2\rest fis2 | g2 g2 g2 d'2 | \break
 c2 b4( c4) d1 \bar "||"  \new Voice = "enterlyrics" { \halfmeasure \voiceOne b2 a2 ~ | a4 g4 g1 fis2 | g1 \bar "||"}
}

alto = \relative c' {
  r2 d2 | e2 d2 d2. g4 | e2 fis2 g1 \bar "||" e1 | 
  e2 c4( d4) e2. d4 | cis1 \bar "||" d1 | d2 e2 d2. g4 |
  e2 e2 a,1 \bar "||" r2 f'2 \bar "||" d2 e2 d2. c4 | b1 \bar "||"
}

tenor = \relative c { \clef bass
  d'1 | c2 a2 b2 g2 | a2. a4 g1 \bar "||" c1 |
  b2 a2 a2 gis2 | a1 \bar "||" a1 | b2 c2 b2 g2 |
  a2 g2 fis1 \bar "||" d'1 | b2 c2 a2 a2 | g1 \bar "||" 
}

bass = \relative c { \clef bass
  g'1 | c,2 d2 g,2 b2 | c2 d2 g,1 \bar "||" a1 |
  e'2 f2 e2 e2 | a,1 \bar "||" d1 | g2 e2 g2 b,2 |
  c2 e2 d1 \bar "||" d1 | g2 c,2 d2 d2 | g,1 \bar "||"
}

people = \relative c' {
  d'1 \bar "|" c2 a2 b2 g2 \bar "|" a2. a4 g1 \bar "||" c1 \bar "|"
  b2 a2 a2 gis2 \bar "|" a1 \bar "||" a1 \bar "|" b2 c2 b2 g2 \bar "|"
  a2 g2 fis1 \bar "||" d'1 \bar "|" b2 c2 a2 a2 \bar "|" g1 \bar "||"
}


#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
  % annotate-spacing = ##t
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
    <<
        \context Staff = people { \set Staff.instrumentName = \markup { \hcenter-in #16 {\center-align { \smallCaps "People's"  \smallCaps "Part." } } }
	                   \voiceOne \global \people } 
	
	\new Lyrics = "lyrics" {s1}		   
	
	\new PianoStaff  
	                  <<  
	    \set PianoStaff.instrumentName = \markup { \hcenter-in #14 {\center-align { \smallCaps "Choir"  \smallCaps "or" \smallCaps "Organ."  } } } 
	     \context Staff =  upper  
	                     << 
			     \context Voice = "sopranos" {  
			           \voiceOne \global \soprano }
	                      \context Voice = "altos"   { 
	                           \voiceTwo \global \alto }
	                      >>
	     \context Staff = lower <<
	     \context Voice = "tenors" { 
	                           \voiceOne \global \tenor }
	     \context Voice = "basses" { 
	                           \voiceTwo \global \bass }
			            >> 
		              >>	      
    >>
    \context Lyrics = "lyrics" \lyricsto "enterlyrics" { \override LyricText #'font-size = #-1  "to en" -- "rich      .      ."  the hum -- ble poor. } 
>> 
\layout {       
	        indent = 2.5\cm
		\context { \Score \remove "Bar_number_engraver" }
	%	\context { \Score timing = ##f }                 
		        
		\context { \PianoStaff \remove "Span_bar_engraver" }
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
	
}

\markup{ \hspace #8
  \override #'(line-width . 85)
  \justify{  \small { "      [" \italic { This version may be used in connexion with the other for verse 3, the people singing the
melody as usual.} "]" } } }

%%fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
\score{
{ s4 }
\header { breakbefore = ##f piece = ##f opus = ##f tagline = ##f }
\layout{
	\context { \Staff
		\remove Time_signature_engraver
		\remove Key_engraver
		\remove Clef_engraver
		\remove Staff_symbol_engraver
}}}


\markup { \hspace #8   %%add space as necc. to center the column
          \fill-line { 
	       \column { 
	  	     \line {  \small \italic {\hspace #44 "P. Doddridge, 1702-51."}}
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
			      
	\context Lyrics \lyricsto "altos" {  \override LyricText #'font-size = #-1 A -- men. }
	
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