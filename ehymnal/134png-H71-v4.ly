%%% 134.png
%%% Hymn 71, St. Bernard (C.M.), All ye who seek a comfort sure.
%%% Rev 4.

\version "2.10"

\header {
	dedication = \markup { \center-align { "THE CHRISTIAN YEAR - LENT" \hspace #0.1 }}
	title = "71"
	meter =  \markup { \small { \column {  \line { \sans "ST. BERNARD." \hspace #1 \roman  "(C. M.)" } 	
	                                       \line { \italic "Moderately slow" \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 69.} } } }
	arranger = \markup { \small { \center-align { \italic "Adapted from a melody in"
	                                              \line { "‘" \hspace #-1 \italic "Tochter Sion" \hspace #-1.2 "’" "(Cöln, 1741)." } } } }
	tagline =""
}			

%%%%%%%%%%%%%%%%%%%%%%%%%%%%macros begin

%%generates the breathmarks
breathmark = { 
	\override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup { \fontsize #4 "," }
	}

%% Macro to push notes rightwards
push = { \once \override Dots #'transparent = ##t
	\once \override NoteColumn #'force-hshift = #-0.07 }
		      
%%%%%%%%%%%%%%%%%%%%%%%%%%%macro end

global = {
\time 8/4
\key d \major
\set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 2 a'2 | d, e fis  e4(d) | g2 fis e \breathmark \bar "||" 
      a | fis b gis2. gis4 | a1. \breathmark \bar "||" \break
  a2 | d b a b | g g fis \breathmark \bar "||" d | g fis e e |  \push d1. \bar "||" }
 
alto = \relative c' { 
  d2 | d cis d  cis4(d) | cis2 d cis \bar "||" 
      e | d d d2. d4 | cis1. \bar "||" \break
  cis2 | d d d b | b e d \bar "||" d | cis d d cis | d1. \bar "||" }

tenor = \relative c { \clef bass 
  fis2 | a a a \once \override NoteColumn #'force-hshift = #1.6 a | g a a \bar "||" 
      a | a b b2. b4 | a1. \bar "||" \break
  a2 | a g fis fis | g a a \bar "||" a | g a b a4(g) | fis1. \bar "||"}

bass = \relative c { \clef bass 
  d2 | fis e d  g4(fis) | e2 d a \bar "||" 
      cis | d b e2. e4 | a,1. \bar "||" \break
  a'2 | fis g d dis | e cis d \bar "||" fis | e d g, a | d1. \bar "||"}

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
%%  annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##t
}

\score{
\new ChoirStaff
<<
	\context Staff = upper <<
	\context Voice = sopranos { \voiceOne \global \soprano }
	\context Voice = altos { \voiceTwo \global \alto }
							>>
		\context Staff = lower <<
		\context Voice = tenors { \voiceOne \global \tenor }
		\context Voice = basses { \voiceTwo \global \bass}
								>>
>>

\layout {
	indent=0
	\context { \Score \remove "Bar_number_engraver" }
	\context { \Staff \remove "Time_signature_engraver" }
	\context { \Score \remove "Mark_engraver" }
	\context { \Staff \consists "Mark_engraver" }
	}
	
%%Hymn midi
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 69 2)}}

}%%score


\markup { \hspace #8   %%add space as necc. to center the column
          \column { %% super column of everything
	    \line { \hspace #66 \small  { \italic "18th cent.  Tr. E. Caswall" "‡."}}
	    \line { \hspace #30 \small {"Quicumque certum quaeritis."}}
	    \line { %% a master line of 3 columns    
		\column { %% column 1
	        \hspace #1 % adds vertical spacing between verses
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "A" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "LL ye who seek a comfort sure" "  In trouble and distress," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Whatever sorrow vex the mind,"
					   "    Or guilt the soul oppress,"
			  		}}
			       
			           } %% finish stanza 1
		\hspace #1 
           		\line { "2  "
			   \column {	     
				   "Jesus, who gave himself for you"
				   "    Upon the Cross to die,"
				   "Opens to you his sacred Heart;"
				   "    O to that Heart draw nigh."
			}}
		}  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -26 . -1) #0 }       %%Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
 
	   \hspace #1 % adds vertical spacing between verses
           		\line { "3  "
			  \column {	     
				  "Ye hear how kindly he invites;"
				  "    Ye hear his words so blest—"
				  "'All ye that labour come to me,"
				  "    And I will give you rest.'"
			}}
		\hspace #1 
           		\line {"4  "
			  \column {	     
				  "O Jesus, joy of Saints on high,"
				  "    Thou hope of sinners here,"
				  "Attracted by those loving words"
				  "    To thee I lift my prayer."
			}}


	    } %% end column 3
     } %% end master-line
    		\hspace #1 
           		\line { \hspace #20  "5. "
			  \column {	     
				  "Wash thou my wounds in that dear Blood"
				  "    Which forth from thee doth flow;"
				  "New grace, new hope inspire, a new"
				  "    And better heart bestow."
     			}}
}
}% stanza markup bracket

%%Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2)} 
	                    << 
	\context Voice = "sopranos" { \relative c' { \global
	                                             \voiceOne d1 d \bar "||" }}
	\context Voice = "altos"    { \relative c' { \global
	                                              \voiceTwo b1 a \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2)} 
	                       <<
	\context Voice = "tenors" { \relative c { \global \clef bass
	                                          \voiceThree g'1 fis \bar "||" }}
	\context Voice = "basses" { \relative c { \global \clef bass 
	                                          \voiceFour  g1 d'1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = ##f opus = ##f tagline = ##f }

\layout { 
	\context { \Score timing = ##f } 
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }
        }


%%Amen midi
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 69 2) }} %%Amen midi 



}%%amen score