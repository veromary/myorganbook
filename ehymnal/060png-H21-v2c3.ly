%%%060-061.png
%%%Hymn 21 YORKSHIRE or STOCKPORT. Christians, awake, salute the happy morn.
%%%Version 2 060png-H21-v2.ly Fonts reset

\version "2.10"


\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - CHRISTMAS"
		\hspace #0.1 }}	
  title = "21"
  poet = \markup { \small {  \line { \small \sans {"YORKSHIRE"} \sans \smallCaps "or" \small \sans {"STOCKPORT."} \hspace #1 \roman {"(10 10. 10 10. 10 10.)"}} }}
  meter = \markup { \small { \italic {In moderate time, dignified} \fontsize #-5 \general-align #Y #DOWN \note #"4" #1 = 100.} }
  arranger =  \markup { \small \smallCaps "J. Wainwright, 1723-68."}
  tagline =""
}


global = {
  \time 4/4 
  \key c \major 
  \set Staff.midiInstrument = "church organ"
}

nbbar = { \bar "|" \noBreak } %%macro to generate a nobreak bar

soprano = \relative c' {
  c2 c4 d \nbbar e2. f4 \nbbar g e f g \nbbar a1 \bar "||" \noBreak g2 a4 b \bar "|" \break
  c d e d \nbbar c2 b \nbbar c1 \bar "||" \noBreak c2 e4 g, \nbbar a2. g4 \bar "|" \break
  a b c d \nbbar b1 \bar "||" \noBreak b2 c4 b \nbbar a gis! a b \bar "|" \break
  c2 b \nbbar a1 \bar "||" \noBreak a2 \override Accidental #'transparent = ##t g4 f \nbbar e2 c \nbbar f4 e d c \nbbar g'2. \bar "||" \break  
  \partial 4 g4 \nbbar a2 b \nbbar c4 d e d \nbbar c2 b \nbbar c1 \bar "||"
}

alto = \relative c' {
  c2 c4 b \nbbar c2. b4 \nbbar c c c c \nbbar c1 \bar "||" \noBreak c2 c4 f \bar "|" \break
  g f e f \nbbar e2 d \nbbar e1 \bar "||" \noBreak e2 e4 g \nbbar f2. c4 \bar "|" \break
  f f g f \nbbar d1 \bar "||" \noBreak e2 e4 gis \nbbar a e c f \bar "|" \break
  e2 e4( d) \nbbar c1 \bar "||" \noBreak c2 d4 b \nbbar c2 c \nbbar b4 c g c \nbbar b2. \bar "||" \break
  \partial 4 c4 \nbbar c2 f \nbbar g4 g g a \nbbar g2 g \nbbar g1 \bar "||"
}

tenor = \relative c { \clef bass
  e2 e4 g \nbbar g2. g4 \nbbar g g g g \nbbar f1 \bar "||" \noBreak g2 c4 d \bar "|" \break
  c b c a \nbbar g2 g \nbbar g1 \bar "||" \noBreak g2 c4 c \nbbar c2. c4 \bar "|" \break
  c d c a \nbbar g1 \bar "||" \noBreak gis2 a4 d \nbbar e b a a \bar "|" \break
  a2 gis! \nbbar a1 \bar "||" \noBreak e2 \once \override Accidental #'transparent = ##t g4 g \nbbar g2 g \nbbar g4 g g fis! \nbbar g2. \bar "||" \break
  \partial 4 g4 \nbbar \once \override Accidental #'transparent = ##t f2 f \nbbar c'4 b c f \nbbar e2 d \nbbar e1 \bar "||"
}

bass = \relative c { \clef bass
  c2 c4 g \nbbar c2. d4 \nbbar e c d e \nbbar \once \override NoteColumn #'force-hshift = #-0.05 f1 \bar "||" \noBreak e2 f4 d \bar "|" \break
  e d c f \nbbar g2 g, \nbbar c1 \bar "||" \noBreak c2 c4 e \nbbar f2. e4 \bar "|" \break
  f d e f \nbbar \once \override NoteColumn #'force-hshift = #-0.05 g1 \bar "||" \noBreak e2 a,4 b \nbbar c e f d \bar "|" \break
  e2 e \nbbar a,1 \bar "||" \noBreak a2 b4 g \nbbar c2 e \nbbar d4 c b a \nbbar g2. \bar "||" \break
  \partial 4 e'4 \nbbar \override Accidental #'transparent = ##t f2 d \nbbar e4 g c f, \nbbar g2 g, \nbbar c1 \bar "||"
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
	\context Voice = altos    { \voiceTwo \global \alto }
	                      >>
        
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \tenor }
	\context Voice = basses { \voiceTwo \global \bass }
			        >> 
			      

 >>
\layout {
		indent=0
		\context { \Score timing = ##f }
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %% close layout
	
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 100 4)
            } %% close context
       } %% close midi
	
} %%score bracket

\markup { \hspace #4   %%add space as necc. to center the column
          \column { %% super column of everything
	    \hspace #0.2
	  \line { \hspace #70 \small \italic {"John Byrom, 1690-1763."}}
	  \hspace #0.4          
          \column {
		  \line { \hspace #25 \column { \lower #2.4 \fontsize #8 "C" }   %%Drop Cap goes here
			 \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
			\column  { \raise #0.0 "HRISTIANS, awake, salute the happy morn," "Whereon the Saviour of the world was born;" } }          
	          \line { \hspace #25  %%adjust hspace until this line left edge is flush with Drop Cap
			\lower  #1.56  %%adjust this until the line spacing looks right
			\column {   
				"Rise to adore the mystery of love,"
				"Which hosts of Angels chanted from above;"
				"With them the joyful tidings first begun"
				"Of God incarnate and the Virgin's Son:"
			  		}}
	           } %% finish stanza 1

	   \hspace #0.4 % adds vertical spacing between verses
           \line { \hspace #22 "2  "
             \column {	   
				"Then to the watchful shepherds it was told,"
				"Who heard the angelic herald's voice, 'Behold,"
				"I bring good tidings of a Saviour's birth"
				"To you and all the nations upon earth;"
				"This day hath God fulfilled his promised word,"
				"This day is born a Saviour, Christ the Lord.'" 
			   }} %% finish stanza 2

	   \hspace #0.4 % adds vertical spacing between verses
           \line { \hspace #12.5 \italic "Unison." "  3  "
             \column {	     
				"He spake; and straightway the celestial choir"
				"In hymns of joy, unknown before, conspire."
				"The praises of redeeming love they sang,"
				"And heaven's whole orb with Alleluyas rang:"
				"God's highest glory was their anthem still,"
				"Peace upon earth, and mutual goodwill."	   
	  		   }} %% finish stanza 3

	   \hspace #0.4 % adds vertical spacing between verses
           \line { \hspace #22 "4  "
             \column {    
				"To Bethlehem straight the enlightened shepherds ran,"
				"To see the wonder God had wrought for man,"
				"And found, with Joseph and the blessèd Maid,"
				"Her Son, the Saviour, in a manger laid;"
				"Amazed the wondrous story they proclaim,"
				"The first apostles of his infant fame."
 	  		   }} %% finish stanza 4

	   \hspace #0.4 % adds vertical spacing between verses
           \line { \hspace #22 "5. "
             \column {    
				"* Like Mary let us ponder in our mind"
				"God's wondrous love in saving lost mankind;"
				"Trace we the Babe, who hath retrieved our loss,"
				"From his poor manger to his bitter cross;"
				"Then may we hope, angelic thrones among,"
				"To sing, redeemed, a glad triumphal song."
			   }} %% finish stanza 5	
           
    } %% page super column bracket
} %%markup bracket


%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f1 e1 \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo c1 c1 \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree a'1 g1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  f1 c1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
      \context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       } %% close layout

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 100 4) }}  %%Amen midi 
       }  %% close midi	


} %% close book