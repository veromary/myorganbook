%%% 097.png
%%% Hymn 43 Alternative Version 
%%% Version 3

\version "2.10"


\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - THE EPIPHANY"
		\hspace #0.1 }}	
  title = "43"
  subtitle = \markup { \column  {\smallCaps "Alternative Version" 
                \hspace #0.1 }}
  arranger =  \markup {  \small { \italic "Harmonized by"  \smallCaps "Ravenscroft."  } }     
  tagline =""
}

global =  {
  \time 4/2 
  \key ees \major
  \set Staff.midiInstrument = "church organ"
}

%%%%%%%%%%%%%%%%%%%%% Macros

%%shortcut for partial measures in the middle of the music
halfmeasure =  \set Score.measurePosition = #(ly:make-moment 2 2)

%%shortcut macro for small notes
smallnote = {  \once \set fontSize = #-3 
              \once \override Stem #'length = #4  }
	      
%%push notes a little to the right. 	      
push = \once \override NoteHead #'X-offset = #0.8

%%%%%%%%%%%%%%%%%%%%% End of Macro definitions	      
	      
people = \relative c' {
  ees1 | g2 aes2 bes2 ees,2 | f2 g2 aes1 \bar "||" g1 | \break
  f2 ees2 ees2 d2 | ees1 \bar "||" bes'1 | \stemDown ees2 d2 c2 bes2 | \break
  bes2 \stemUp a!2 bes1 \bar "||" g1 | f2 ees2 ees2 d2 | ees1 \bar "||"
}

soprano = \relative c' {
  \partial 1 g'1 | bes2 c2 f,2 g2 | aes2 bes2 c1 \bar "||" \halfmeasure \push bes1 |
  bes2 g2 aes2 f2 | g1 \bar "||" bes2\rest g2 | g2 bes2 aes2 f2 |
  g2 f2 f1 \bar "||" \halfmeasure bes2\rest g2 | aes2 g4( aes4) bes2 f2 | g1 \bar "||"
}

alto = \relative c' {
  bes1 | ees2 ees2 d2 bes2 | des2 des2 ees1 \bar "||" r2 ees2 |
  d!2 c2 c2 bes2 | bes1 \bar "||" bes2\rest bes2 | bes2 f'2 ees2 d2 |
  c2 c2 d1 \bar "||" bes2\rest bes2 | c2 c2 
      << { f,2 } 
      \new Voice = "alt" { \voiceFour \smallnote 
      \override NoteColumn #'force-hshift = #0.1
      f'2 } >>
      bes,2 | bes1 \bar "||"
}

tenor = \relative c { \clef bass
  \push ees1 | g2 aes2 bes2 ees,2 | f2 g2 aes1 \bar "||" g1 |
  f2 ees2 ees2 d2 | ees1 \bar "||" \push bes'1 | ees2 d2 c2 bes2 |
  bes2 a2 bes1 \bar "||" g1 | f2 ees2 ees2 d2 | ees1 \bar "||"
}

bass = \relative c { \clef bass
  bes2\rest ees2 | ees2 c2 d2 ees2 | des2 bes2 aes1 \bar "||" ees'1 |
  bes2 c2 aes2 bes2 | << { ees,1 } 
      \new Voice = "alt" { \voiceFour \smallnote \override NoteHead #'X-offset = #5 ees'1 } >>  
      \bar "||" d2\rest ees2 | ees2 bes2 c2 d2 |
  ees2 f2 bes,1 \bar "||" ees1 | aes,2 c2 bes2 bes2 | 
      << { ees,1 } 
      \new Voice = "alt" { \voiceFour \smallnote \override NoteHead #'X-offset = #5 ees'1 } >>  
      \bar "||"
}

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
  % annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##t
}

\book{

\score{
\new ChoirStaff	
<<   
        \context Staff = people { \set Staff.instrumentName = \markup { \hcenter-in #16 {\center-align { \smallCaps "People's"  \smallCaps "Part." } } }
	                   \voiceOne \global \people } 	   
	
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

\layout {       
	        indent = 2.5\cm
		\context { \Score \remove "Bar_number_engraver" }
	%	\context { \Score timing = ##f }                         
		\context { \PianoStaff \remove "Span_bar_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	}
	
\midi {  \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2) }
      }	
}

\markup{ \hspace #52
         \center-align {  \line {"["  \italic "This version may be used in connexion with the other for one or more verses, the people" }
                                                  \line { \italic "singing the melody as usual." "]"  } } 
}


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

\markup { \hspace #16 \small \italic {"Suitable till Septuagesima." \hspace #18   "J. Morison, 1749-98 (Scottish Paraphrases)." } }

\markup { \hspace #34 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HE race that long in darkness pined" "  Have seen a glorious light;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "The people dwell in day, who dwelt"
					   "    In death's surrounding night."
			  		}}
			       
			           } %% finish stanza 1	
		       \hspace #1 
           		\line { "2  "
			   \column {	     
				   "To hail thy rise, thou better Sun,"
				   "    The gathering nations come,"
				   "Joyous as when the reapers bear"
				   "    The harvest-treasures home."
			}}
			
			\hspace #1 % adds vertical spacing between verses
           		\line { "3  "
			  \column {	     
				  "To us a Child of hope is born,"
				  "    To us a Son is given;"
				  "Him shall the tribes of earth obey,"
				  "    Him all the hosts of heaven."
			}}
			
			\hspace #1 % adds vertical spacing between verses  
			\line {"4  "
			\column {	     
				   "His name shall be the Prince of Peace,"
				   "    For evermore adored;"
				   "The Wonderful, the Counsellor,"
				   "    The great and mighty Lord."
			}}  
			\hspace #1 % adds vertical spacing between verses
			\line { \hspace #-10  \italic "Unison."  "  5. "
			\column {	     
				  "His power increasing still shall spread;"
				  "    His reign no end shall know:"
				  "Justice shall guard his throne above,"
				  "    And peace abound below."
     			}}
	  }
}% lyric markup bracket

%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne ees1 ees1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo c1 bes1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree aes'1 g1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  aes1 ees'1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2) }}  %%Amen midi       
       
}  

} %%book bracket