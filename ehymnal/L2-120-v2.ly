%%% 192png
%%% Hymn 120 OMNI DIE It is finished! Blessed Jesus
%%% Version 2

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - GOOD FRIDAY AND EASTER EVEN"
		\hspace #0.1 }}	
  title = "120"
  meter = \markup { \small {\column {  \line { " " }
	                               \line { \sans {"OMNI DIE."} \hspace #1 \roman {"(8 7. 8 7.)"}}
                                       \line { \italic {Very slow and solemn} \general-align #Y #DOWN \note #"2" #0.5 = 46"(" \fontsize #-5 \general-align #Y #DOWN \note #"4" #0.5 = 92).}
                                  }
                  }}
 
  arranger =  \markup { \small {\center-align { \line { \italic "Melody in" }
		                                \line { \smallCaps "Corner's" \italic "‘Gesangbuch,’ 1631." }
			                        \line { \italic "Arranged by" \smallCaps "W. S. Rockstro."  }
  		} } }
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro Definitions


%%% SATB Voices

global = {
  \time 3/2
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 4*2 f4 f | g2 f a4 c | bes2 a \bar "||" f4 g | a c c2 b | c1 \bar "||" \break
  c4 c | d2 c bes4 a | g2 a \bar "||" f4 g | a bes g2. f4 | f1 \bar "||"
}

alto = \relative c' { 
  c4 d | e2 f f4 f | f( e) f2 \bar "||" c4 e | f g f2 f | e1 \bar "||"
  f4 g | f2 f f4 f | e( d) cis2 \bar "||" d4 e | f f f2 e | \merge f1 \bar "||"
}

tenor = \relative c { \clef bass
  a'4 a | c2 a c4 a | bes2 c \bar "||" a4 c | c c a4( g4) f2 | g1 \bar "||"
  a4 g | a2 a d4 c | c( d) e2 \bar "||" a,4 c | c d c2 c2 | a1 \bar "||"
}

bass = \relative c { \clef bass
  f4 d  | c2 f f4 f | g2 f \bar "||" f4 c | f e f( e) d2 | c1 \bar "||"
  f4 e | d2 f bes,4 f' | c( bes) a2 \bar "||" d4 c | f bes, c2 c | f,1 \bar "||"
}

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##f
  ragged-bottom = ##f

}


\book {

%%% Score block	
	
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 46 2)}} 

} %%% Score bracket

%%% Lyrics titles

\markup { \small {  \hspace #74 \italic "Archbishop W. D. Maclagan." } }                 

\markup { \hspace #1 }

%%% Lyrics in 3 columns,  column 1 (verses), column 2 (a dividing line), column 3 (verses); 

\markup { \hspace #6   %%add space as necc. to center the entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "I" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "T is finished! Blessèd Jesus,"
			                                 "  Thou hast breathed thy latest sigh," } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Teaching us the sons of Adam"
					   "    How the Son of God can die."
			  		}}
			       
			           } %%% finish verse 1				   
		        \hspace #1 
           		\line { \lower #0.4 { "2  "
			   \column {	     
				   "Lifeless lies the piercèd Body,"
				   "    Resting in its rocky bed;"
				   "Thou hast left the Cross of anguish"
				   "    For the mansions of the dead."
			}} }
			\hspace #1 
           		\line { \lower #0.4 { "3  "
			   \column {	     
				   "In the hidden realms of darkness"
				   "    Shines a light unseen before,"
				   "When the Lord of dead and living"
				   "    Enters at the lowly door."
			}}}
			\hspace #1 
           		\line { "4  "
			   \column {	     
				   "* Lo! in spirit, rich in mercy"
				   "    Comes he from the world above,"
				   "Preaching to the souls in prison"
				   "    Tidings of his dying love."
			}}
		}  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -49 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
 
           		\line { "5  "
			  \column {	     
				  "* Lo! the heavenly light around him,"
				  "    As he draws his people near;"
				  "All amazed they come rejoicing"
				  "    At the gracious words they hear."
			}}
		        \hspace #1 
           		\line {"6  "
			  \column {	     
				  "Patriarch and Priest and Prophet"
				  "    Gather round him as he stands,"
				  "In adoring faith and gladness"
				  "    Hearing of the piercèd hands."
			}}
			\hspace #1 
			\line {"7  "
			  \column {	     
				  "There in lowliest joy and wonder"
				  "    Stands the robber by his side,"
				  "Reaping now the blessèd promise"
				  "    Spoken by the Crucified."
			}}
			\hspace #1 
           		\line {"8. "
			  \column {	     
				  "Jesus, Lord of our salvation,"
				  "    Let thy mercy rest on me;"
				  "Grant me too, when life is finished,"
				  "    Rest in Paradise with thee."
			}}
	    } %%% end column 3
     } %%% end master-line
} %%% lyrics markup bracket

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f1 f1  \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo d1 c1 \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
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

       } %%% close layout

%%% Amen Midi
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 46 2) }} 

}


} %%% book bracket
