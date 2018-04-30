%%% 210png
%%% Hymn 128 Salzburg At the lamb's high feast we sing
%%% Version 1

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - EASTERTIDE"
		\hspace #0.1 }}	
  title = "128"
  
  meter = \markup { \small { \column {  
	                                \line { \sans {"SALZBURG."}   \hspace #1 \roman {"(7 7. 7 7. D.)"}}
		                        \line { \italic {Moderately slow, dignified} \general-align #Y #DOWN \note #"2" #0.5 = 66.} }
  	}}	
	
 arranger = \markup { \small  { \center-align { 
	 					 \line {  \italic "Melody from" \smallCaps "J. Hintze, 1622-1702." }
	  					 \line { \italic "Harmonized by" \smallCaps "J. S. Bach."  }
  	}}}
	
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01

%%% forbid linebreaking after a barline unless commanded

nbbar = { | \noBreak }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro Definitions

global = {
  \time 4/2
  \key d \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  a'2 d a b \nbbar a2. g4 fis1 \bar "||" \noBreak a2 a g fis \nbbar e e d1 ^\fermata \bar "||" \break
  a'2 d a b \nbbar a2. g4 fis1 \bar "||" \noBreak a2 a g fis \nbbar e e d1^\fermata \bar "||" \break
  e2 e fis4( gis) a2 \nbbar a gis a1 \bar "||" \noBreak b2. cis4 d2 d \nbbar cis cis b1^\fermata \bar "||" \break 
  fis2 fis b a \nbbar a gis a1 \bar "||" \noBreak b2 a g fis \nbbar e e d1^\fermata \bar "||"
}

alto = \relative c' { 
  d2 d d d | d cis d1 \bar "||" d2 d4( cis) b( cis) d2 | d cis \merge d1 \bar "||"
  d2 d d d | d cis d1 \bar "||" d2 d4( cis) b( cis) d2 | d cis \merge d1 \bar "||"
  cis2 cis d cis | fis e4( d) cis1 \bar "||" e4( fis) g2 fis fis | fis fis4( e) d1 \bar "||"
  d2 d d cis | d d cis1 \bar "||" d2 d4( cis) b( cis) d2 | d cis \merge d1 \bar "||"
}

tenor = \relative cis { \clef bass
  fis2 fis4( g) a2 g4( fis)  | e4( d) e2 d1 \bar "||" fis2 fis g a | b a fis1 \bar "||"
  fis2 fis4( g) a2 g4( fis) | e4( d) e2 d1 \bar "||" fis2 fis g a | b a fis1 \bar "||"
  a2 a a a | b b a1 \bar "||" g2. a4 b2 b | b ais b1 \bar "||"
  a2 a g4( fis) e2 | d4( fis) e4( d) e1 \bar "||" g2 fis g a | b a4( g) fis1 \bar "||"
}

bass = \relative cis { \clef bass \override Stem #'length = #5 
  d2 b fis g | a a \merge d1 \bar "||" d2 d e fis | g4( e) a2 \merge d,1 _\fermata  \bar "||"
  d2 b fis g | a a \merge d1 \bar "||" d2 d e fis | g4( e) a2 d,1 _\fermata \bar "||" 
  a2 a d fis4( e) | d2 e a,1 \bar "||" e'2 e b4( cis) d( e) | fis2 fis b,1 _\fermata \bar "||"
  d2 d g, a | b b a1 \bar "||" g2 d' e fis | 
      << { g4( e) a2 \once \override Script #'padding = #3 d,1 _\fermata }
           \new Voice = "ped" { 
	       \voiceFour	   
	       \set fontSize = #-3 
               \override Stem #'length = #5 
	       \override NoteColumn #'force-hshift = #0.2
	   g,4(e) a2 d,1    }
      >>
  \bar "||"
}

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##t
}


\book {

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
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %%% close layout

%%% Hymn Midi	

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2)}} 

} %%% Score bracket


%%% Lyric titles

\markup { \small { \hspace #44 \italic "R. Campbell" "‡" \italic ", 1814-68.  Based on" "Ad regias Agni dapes." } }

%%% Main block of lyrics

\markup { \hspace #32 %%add space as necc. to center the column
	      \column { %%% super column for entire block of lyrics 
	              \column { %%% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "A" }   %%Drop Cap goes here
				  \hspace #-1.4    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "T the Lamb's high feast we sing"
                                                         "  Praise to our victorious King:" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Who hath washed us in the tide"
					   "Flowing from his piercèd side;"
					   "Praise we him whose love Divine"
					   "Gives the guests his Blood for wine,"
					   "Gives his Body for the feast,"
					   "Love the Victim, Love the Priest."
			  		}}
			           } %% finish verse 1	 
		 \hspace #1  % adds vertical spacing between verses  	
		  \line { "2  "
		    \column {	     
			    "* Where the Paschal blood is poured,"
			    "Death's dark angel sheathes his sword;"
			    "Israel's hosts triumphant go"
			    "Through the wave that drowns the foe."
			    "Christ, the Lamb whose Blood was shed."
			    "Paschal victim, Paschal bread!"
			    "With sincerity and love"
			    "Eat we Manna from above."
			}} 
                 \hspace #1  % adds vertical spacing between verses 
		 %%% this blank line was narrower than the others.  Lilypond bug? Used \lower to adjust the spacing
		 \line { \lower #0.4 { "3  "
		    \column {	     
			    "Mighty Victim from on high."
			    "Powers of hell beneath thee lie;"
			    "Death is broken in the fight,"
			    "Thou hast brought us life and light."
			    "Now thy banner thou dost wave,"
			    "Conquering Satan and the grave."
			    "See the prince of darkness quelled;"
			    "Heaven's bright gates are open held."
		        }}}
           	\hspace #1  % adds vertical spacing between verses  		  
           	\line { "4. "
		   \column {	     
			   "Paschal triumph. Paschal joy,"
			   "Only sin can this destroy;"
			   "From sin's death do thou set free,"
			   "Souls re-born, dear Lord, in thee."
			   "Hymns of glory, songs of praise,"
			   "Father, unto thee we raise."
			   "Risen Lord, all praise to thee,"
			   "Ever with the Spirit be."
     			}}
	  }
} %%% lyric markup bracket


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne d1 d  \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo b1 a \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree g'1 fis \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  g1 d'1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       } %%% close layout

%%% Amen Midi
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2) }} 

}


} %%% book bracket
