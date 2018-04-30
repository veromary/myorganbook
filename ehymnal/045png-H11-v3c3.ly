%%%045.png
%%%Hymn 11 St Thomas. The Advent of our God
%%%Version 3 045png-H11-v3.ly Reset fonts.

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - ADVENT"
		\hspace #0.1 }}	
  title = "11"
  poet = \markup { \small { \column {  \line { \sans "ST. THOMAS." \hspace #1 \roman "(S. M.)" } }} }
  meter = \markup { \small { \italic "In moderate time" \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 72.} }
  arranger =  \markup { \small \italic "Williams' Psalmody, 1770."}
  tagline =""
}


global = {
  \time 4/2 
  \key f \major 
  \set Staff.midiInstrument = "church organ"
}


soprano = \relative c' { 
  \partial 2 c2        | f2 f2 a2 g4( f4)  |    \noBreak g1.  \bar "||" \noBreak
  a4( bes4) | \noBreak c2 bes4( a4) bes2 a2 | g1.  \bar "||"\break
  c2        | \noBreak a2 f2 g2 c,2   |  \noBreak f2 a4.( bes8) c2 \fermata \bar "||" \noBreak 
  \once \override Score.SeparationItem #'padding = #2 c2  | \noBreak d2 c4( bes4) a2 g2   | f1  \bar "||"
}

alto = \relative c' { 
  c2   | c2 d2 c2 c4( b4)      | c1.       \bar "||"
  c2   | f2 e4( f4) d4( e4) f2 | e1.       \bar "||" 
  g2   | f2 f2 e2 c2           | c2 d2 e2  \bar "||"
  ees2 | d2 f2 f2 \once \override Accidental #'transparent = ##t e2 
      |  \once \override NoteColumn #'force-hshift = #-0.05 f1 \bar "||"
}

tenor = \relative c { \clef bass 
  c'2 | f,2 f2 f2 g2         | e1.       \bar "||"
  c'2 | c2 c2 bes2 c2      | c1.       \bar "||" 
  c2 | c2 c2 c2 c4( bes4)  | a2 f2 g2 \bar "||" 
  f2 | f2 c'4( d4) c2. bes4 |  a1 \bar "||" 
}

bass = \relative c { \clef bass 
  c2    | a2 bes2 \once \override Slur #'positions = #'(0 . -2)  f4( f'4) e4( d4)| c1.       \bar "||" 
  f4( g4) | a2 g4( f4) g2 f2        | c1.       \bar "||" 
  e2    | f2 a2   \once \override NoteColumn #'force-hshift = #-2.2 c4( bes4) a4( g4) | f2 d2 c2_\fermata  \bar "||" 
  a2    | bes2 a4( bes4) c2 c2    | f,1       \bar "||" 
}


#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
% annotate-spacing = ##t
  top-margin = 2\mm
  bottom-margin = 3\mm
  print-page-number = ##f
  after-title-space = 2\mm
  between-system-space = #0.4
  between-system-padding = 3\mm
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
%%		\context { \Score timing = ##f }
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	}
	
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 72 2)
            }
       }
	
} %%score bracket


\markup { \small { \hspace #28 \italic "This hymn can also be sung to " \hspace #-1.2 \smallCaps "Franconia"  \italic "(No. 370)."} }
	
\markup {  \hspace #2.4  %%add space as necc. to center the column
       \fill-line { 

          \column {
	%%next line is for attributions	  
	  \hspace #1
	  \line { \hspace #26 \small \italic {"C. Coffin, 1676-1749.     Tr. H. P."}}
	  \line { " "}
	  \line { \hspace #8 \small {"Instantis adventum Dei."}}
	  \hspace #0.2          
          \column {
		  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 " T" }   %%Drop Cap goes here
			 \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
			\column  { \raise #0.0 "HE advent of our God" "With eager prayers we greet," } }          
	          \line { \hspace #2.7  %%adjust hspace until this line left edge is flush with Drop Cap
			\lower  #1.56  %%adjust this until the line spacing looks right
			\column {   
				"And singing haste upon his road"
				"    His glorious gift to meet."
			  		}}
	           } %% finish stanza 1

	   \hspace #0.1 % adds vertical spacing between verses
           \line { "2  "
             \column {	     
		     "    The everlasting Son"
		     "    Scorns not a Virgin's womb;"
		     "That we from bondage may be won"
		     "    He bears a bondsman's doom."	   
	   }}
	   \hspace #0.1 % adds vertical spacing between verses
           \line { "3  "
             \column {	     
		     "    Daughter of Sion, rise"
		     "    To meet thy lowly king;"
		     "Let not thy stubborn heart despise"
		     "    The peace he deigns to bring."	   
	   }}
	   \hspace #0.1 % adds vertical spacing between verses
           \line { \hspace #-10.9 \italic "Unison." "   4  "
             \column {    
		     "    In clouds of awful light,"
		     "    As Judge he comes again,"
		     "His scattered people to unite,"
		     "    With them in heaven to reign."
 	   }}
	  }
           }
} % stanza markup bracket	   

%%fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
\score{
{ s4 }
\header { breakbefore = ##f piece = " " opus = " " }
\layout{
\context { \Staff
\remove Time_signature_engraver
\remove Key_engraver
\remove Clef_engraver
\remove Staff_symbol_engraver
}}}
	
%%second page	

\markup { \hspace #-8   %%add space as necc. to center the column  
	 \fill-line { 

          \column {

           \line { "5  "
             \column { 
		     "    Let evil flee away"
		     "    Ere that dread hour shall dawn,"
		     "Let this old Adam day by day"
		     "    God's image still put on."	     
	   }}
	  \hspace #0.1 % adds vertical spacing between verses   
          \line { \hspace #-10.9 \italic "Unison." "   6. "
             \column {	     
		     "    Praise to the Incarnate Son,"
		     "    Who comes to set us free,"
		     "With God the Father, ever one,"
		     "    To all eternity.   Amen."   
	   }} 
	  }
    }	  
}


%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f1 f1 \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo d1 c1 \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree bes'1 a1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  bes1 f'1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 72 2) }}  %%Amen midi 

} 	
	

} %% book bracket
