%%% 261.png
%%% Hymn 161 Alternative Version Have mercy on us, God most high.
%%% Version 1

\version "2.10"

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%%pull a rest leftwards slightly leaving the rest of the notecolumn alone	      
restleft =  { \once \override Score.SeparationItem #'padding = #3
              \once \override Rest #'X-offset = #-2.2
            }

%%% macro to specify a partial measure in the middle of a piece.
%%% Manual does not recommend using \partial in the middle of a piece.
%%% In this case, the macro specifies that 2 1/2 notes in a 4/2 measure have past,
%%% hence we are halfway through the measure
halfmeasure =  \set Score.measurePosition = #(ly:make-moment 2 2)

%%% suppress printing of implied accidentals
noacci = \once \override Accidental #'transparent = ##t

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions	

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - TRINITY"
                         \hspace #0.1 }}	
  
  title = \markup { "161 " \large \smallCaps "(Alternative Version)" }
  
  %%% Note: the original image did not have a tune name or meter line. However since this is an alternative setting
  %%% of Hymn 161 proper and shares the same melody, the tune name and meter of Hymn 161 have been copied over to make
  %%% this piece complete in and of itself
  
  meter = \markup { \small { \column { \line { \sans "ST. FLAVIAN." \hspace #1 \roman " (C. M.)" } 
                            \line { { \italic "Moderately slow" \general-align #Y #DOWN \note #"2" #0.5 "= 66." } } }} }
 
  arranger =  \markup { \small {\center-align {
                            \line { \italic "Harmonised by" \smallCaps "T. Ravenscroft" \italic "in his" }
                            \line { \italic "Psalter, 1621" "(" \hspace #-1 \italic "rhythm slightly simplified" \hspace #-1 ")." }
                } } }
   
  tagline =""
}


global = {
  \time 4/2 	
  \key  f \major	
  \set Staff.midiInstrument = "church organ" 
}


people = \relative c' { 
  \partial 1 f1 | f2 e f a | g g f1 \bar "||" \halfmeasure f1 | \break
  \stemUp bes2 a f g | a1 ^\fermata \bar "||" a1 | a2 bes \stemNeutral c a | \break
  f2 g a1 \bar "||" \halfmeasure a1 | g2 f f e | f1 ^\fermata \bar "||"

}


soprano = \relative c' {
  a'1 | bes2 g a2. c4 | bes2 g a1 \bar "||" d1 | \break
  bes2 c d2. d4 | cis1 ^\fermata \bar "||" b2\rest \noacci c2 | c d g, a | \break
  bes2. c4 d1 \bar "||" c1 | c2 a bes a4( g) | a1 \bar "||"
}

alto = \relative c' { 
  c1 | d2 c c c | d c c1 \bar "||" d1 | \break
  g2 f d g | e1 \bar "||" s2 f2 | f f e c | \break
  d g fis1 \bar "||" f!1 | e2 d d c | c1 \bar "||"
}

tenor = \relative c { 
  f1 | f2 e f a | g g f1 \bar "||" f1 | \break
  bes2 a f g | a1 \bar "||" a1 | a2 bes c a | \break
  f2 g a1 \bar "||" a1 | g2 f f e | f1 \bar "||"
}

bass = \relative c { \clef bass 
  \restleft b2\rest f'2 | bes,2 c4.( bes8) a2 f | bes c f,1 \bar "||" bes1 | \break
  g2 a bes bes | a1 _\fermata \bar "||" f1 | f'2 d e f | \break
  d2 ees d1 \bar "||" f1 | c2 d bes c | f,1 _\fermata
}

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##f
}

\book{

\score{
\new ChoirStaff	
<<   
    <<
        \context Staff = people { \set Staff.instrumentName = \markup { \hcenter-in #16 {\center-align { \smallCaps "People's"  \smallCaps "Part." } } }
	                   \global \people } 

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
>> 
\layout {       
	        indent = 2.5\cm
		\context { \Score \remove "Bar_number_engraver" }		        
		\context { \PianoStaff \remove "Span_bar_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
		
		%%%Lilypond tended to put the staffs too close together. This next setting spreads it a little to match the image
		\context { \Staff \override VerticalAxisGroup #'minimum-Y-extent = #'(-6 . 6) }
	}
	
\midi {  \context { \Score  tempoWholesPerMinute = #(ly:make-moment 66 2) } }
	
}

\markup{ \hspace #52 \center-align { \line { "[" \hspace #-1 \italic "This version may be used in connexion with the other for one or more verses, the people"} 
                                    \line { \italic "singing the melody as usual." \hspace#-1 "]" } }}

%%% fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
\score{
	{s4 }
\header { breakbefore = ##f piece = ##f opus = ##f tagline = ##f }
\layout{	
	\context { \Staff
		\remove Time_signature_engraver
		\remove Key_engraver
		\remove Clef_engraver
		\remove Staff_symbol_engraver
}}}

				    				    
%%% Lyric attributions and titles

\markup { \small { \hspace #4 \italic "Suitable also for other occasions." \hspace #48 \italic "F. W. Faber, 1814-63." }}


%%% Lyrics

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "H" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "AVE mercy on us, God most high,"
			                                 "  Who lift our hearts to thee;" } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Have mercy on us, worms of earth,"
					   "    Most holy Trinity."
					   "           " %%% adds vertical spacing between verses
			  		}} 
			         } %%% finish verse 1
           		\line { "2  "
			   \column {	     
				   "Most ancient of all mysteries,"
				   "    Before thy throne we lie;"
				   "Have mercy now, most merciful,"
				   "    Most holy Trinity."
				   "           " %%% adds vertical spacing between verses
			}}  
           		\line { "3  "
			   \column {	     
				   "When heaven and earth were yet unmade,"
				   "    When time was yet unknown,"
				   "Thou in thy bliss and majesty"
				   "    Didst live and love alone."
				   "           " %%% adds vertical spacing between verses
			}}
			\line {"4  "
			   \column {	     
				   "Thou wert not born: there was no fount"
				   "    From which thy Being flowed;"
				   "There is no end which thou canst reach;"
				   "    But thou art simply God."
				   "           " %%% adds vertical spacing between verses
			}}
			\line {"5  "
			    \column {	     
				    "How wonderful creation is,"
				    "    The work which thou didst bless,"
				    "And O! what then must thou be like,"
				    "    Eternal loveliness!"
				    "           " %%% adds vertical spacing between verses
			}}
			\line { "6  "
			     \column {	     
				     "How beautiful the Angels are,"
				     "    The Saints how bright in bliss;"
				     "But with thy beauty, Lord, compared,"
				     "    How dull, how poor is this!"
				     "           " %%% adds vertical spacing between verses
			}}	     
			\line { "7  "
			     \column {	     
				     "O listen then, most pitiful,"
				     "    To thy poor creature's heart:"
				     "It blesses thee that thou art God,"
				     "    That thou art what thou art."
				     "           " %%% adds vertical spacing between verses
			}}	     
			\line { "8. "
			     \column {	     
				     "Most ancient of all mysteries,"
				     "    Still at thy throne we lie:"
				     "Have mercy now, most merciful,"
				     "    Most holy Trinity."
				     "           " %%% adds vertical spacing between verses
     			}}
	  } %%% end supercolumn
} %%% end markup	  

	
%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f1 f1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo d1 c1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree bes'1 a1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  bes1 f1 \bar "||" }}
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
