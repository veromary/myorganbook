%%%051.png
%%%14 (Modern Tune). Puer nobis nascitur. (L. M.) Come, thou Redeemer of the earth
%%%Version 3 051png-H14-v3.ly Fonts reset.

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - CHRISTMAS EVE"
		\hspace #0.1 }}
	
  title = \markup { \line { \center-align {"14 "} \large \smallCaps {"(Modern Tune)"}}}

  meter = \markup { \small { \column {  \line { " " }
                                        \line { \sans {"PUER NOBIS NASCITUR."} \hspace #1 \roman {"(L. M.)"}} 
                                        \line { \italic {In moderate time} \fontsize #-5 \general-align #Y #DOWN \note #"4" #1 = 144.} }}}

  arranger = \markup { \small { \center-align {
				     \line { \italic {"Composed or adapted by"  } }
				     \line { \smallCaps {"M. Praetorius,"} " 1571-1621." } 
                                     \line { \italic {"Harmonized by"}  \smallCaps {"G. R. Woodward."} } }}}

  tagline =""
  
} %% close header


global = {
  \time 3/4 
  \key d \major 
  \set Staff.midiInstrument = "church organ"
}

nbbar = { \bar "|" \noBreak } %%macro to generate a nobreak bar

soprano = \relative c' {  
  \partial 4 d4 \nbbar d2 e4 \nbbar fis2 g4 \nbbar fis2 e4 \nbbar d2 d4 \nbbar a'2 a4 \bar "|" \break
  a( b) cis \nbbar d2 d4 \nbbar d2 \bar "||" \noBreak a4 \nbbar d2 d4 \nbbar cis2 a4 \bar "|" \break
  b2 b4 \nbbar a2 g4 \nbbar a2 fis4 \nbbar e2 fis4 \nbbar d2 cis4 \nbbar d2^\fermata \bar "||"
}

alto = \relative c' {
  \partial 4 a4 \nbbar b2 cis4 \nbbar d2 d4 \nbbar d2 a4 \nbbar fis2 b4 \nbbar d( g) fis \bar "|" \break
  e2 e4 \nbbar fis2 g4 \nbbar fis2 \bar "||" \noBreak e4 \nbbar d( fis) e \nbbar e2 d4 \bar "|" \break
  b2 d4 \nbbar d2 b4 \nbbar e2 d4 \nbbar cis2 d4 \nbbar b2 a4 \nbbar a2 \bar "||"
}

tenor = \relative c { \clef bass
  \partial 4 fis4 \nbbar fis2 a4 \nbbar a2 d,4 \nbbar a'( b) cis \nbbar d2 d4 \nbbar d2 a4 \bar "|" \break
  a2 a4 \nbbar a2 b4 \nbbar a2 \bar "||" \noBreak a4 \nbbar b2 b4 \nbbar a( g) fis \bar "|" \break
  g2 g4 \nbbar fis2 g4 \nbbar e2 a4 \nbbar a2 a4 \nbbar g( fis) e \nbbar fis2 \bar "||"
}

bass = \relative c { \clef bass
  \partial 4 d4 \nbbar b2 a4 \nbbar d( cis) b \nbbar a( g) a \nbbar d2 g4 \nbbar fis( e) d \bar "|" \break
  cis2 a4 \nbbar d2 d4 \nbbar d2 \bar "||" \noBreak cis4 \nbbar b( a) gis \nbbar a2 d4 \bar "|" \break
  \once \override Accidental #'transparent = ##t g,2 b4 \nbbar d2 e4 \nbbar cis2 d4 \nbbar a( g) fis \nbbar g2 a4 \nbbar d2_\fermata \bar "||"
}

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
  top-margin = 3\mm
  bottom-margin = 3\mm
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
	}
	
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 144 4)
            }
       }
	
} %%score bracket

\markup {
	\column {
	    \line { \small { \hspace #43 "[" \italic {"May be sung in unison throughout."} "]" }}
	    \hspace #0.1
	    \line { \small { \hspace #10 \smallCaps { "Office Hymn. E."} \hspace #25 \italic {"St. Ambrose, 340-97.    Tr. J. M. Neale and others."}  }  }
	    \line { \hspace #48 \small "Veni, Redemptor gentium"}
   }}

\markup { \hspace #4.3   %%add space as necc. to center the column
	    \fill-line  {	
 
             \column { 
          \column { 
		  \line { \hspace #0.1 \column { \lower #2.4 \fontsize #8 "C" }   %%Drop Cap goes here
			 \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
			\column  { \raise #0.0 "OME, thou Redeemer of the earth," "And manifest thy virgin-birth:"  } }          
	          \line { \hspace #0.2  %%adjust hspace until this line left edge is flush with Drop Cap
			\lower  #1.56  %%adjust this until the line spacing looks right
			\column {   
				"Let every age adoring fall;" 
				"Such birth befits the God of all." 
			  		}}
	           } %% finish stanza 1
		  
		   \hspace #0.2 % adds vertical spacing between verses
		   \line { \hspace #-2.9 "2  "
		       \column {	     
			       "Begotten of no human will," 
			       "But of the Spirit, thou art still" 
			       "The Word of God in flesh arrayed," 
			       "The promised fruit to man displayed."
		   }} %% finish stanza 2
      }}}

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

		\markup { \hspace #5   %%add space as necc. to center the column  
		 \fill-line { 

         	 \column {
		      \line { "3  "
		       \column {	     
			      "The virgin womb that burden gained" 
			      "With virgin honour all unstained;" 
			      "The banners there of virtue glow;" 
			      "God in his temple dwells below."  	   
	          }} %% finish stanza 3

		   \hspace #0.2 % adds vertical spacing between verses
		   \line { "4  "
		    \column {    
			    "Forth from his chamber goeth he," 
			    "That royal home of purity," 
			    "A giant in twofold substance one," 
			    "Rejoicing now his course to run." 
 	          }} %% finish stanza 4


		\hspace #0.2 % adds vertical spacing between verses
	  	\line { "5  "
             \column {    
		     "From God the Father he proceeds," 
		     "To God the Father back he speeds;" 
		     "His course he runs to death and hell," 
		     "Returning on God's throne to dwell." 
 	   }} %% finish stanza 5

		\hspace #0.2 % adds vertical spacing between verses
		\line { "6  "
		\column {
			"O equal to thy Father, thou!"
			"Gird on thy fleshly mantle now;"
			"The weakness of our mortal state"
			"With deathless might invigorate."
		}} %% finish stanza 6

		\hspace #0.2 % adds vertical spacing between verses
		\line { "7  "
		\column {
			"Thy cradle here shall glitter bright,"
			"And darkness breathe a newer light,"
			"Where endless faith shall shine serene,"
			"And twilight never intervene."
		}} %% finish stanza 7

		\hspace #0.2 % adds vertical spacing between verses
		\line { "8. "
		\column {
			"All laud to God the Father be,"
			"All praise, eternal Son, to thee:"
			"All glory, as is ever meet,"
			"To God the Holy Paraclete."
		}} %% finish last stanza 
  
	  } %% master line bracket
	  
          } %% page super column bracket
} %%markup bracket


%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne d1 d1 \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo b1 a1 \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 144 4) }}  %%Amen midi 

} 	
	

} %% book bracket