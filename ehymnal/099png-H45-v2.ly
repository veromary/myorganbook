%%%099.png - lst staff on 098.png
%%%Hymn 45 Cruger Hail to Lord's Anointed
%%%Version 2

\version "2.10"

\header {
	dedication = \markup { \center-align { \line {  "THE CHRISTIAN YEAR - FROM EPIPHANY TILL SEPTUAGESIMA" } 
					       \hspace #1
						} }	
  title = "45"
  meter = \markup {  \small { \column {  \line { \sans {"CRÜGER."} \hspace #1 \roman {"(7 6. 7 6. D.)"}}
                                        \line { \italic {Slow and dignified} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 56.}}}}   
  arranger =  \markup {  \small \center-align {
		            \line{ \italic "Adapted by" \smallCaps "W. H. Monk" \italic "from a Chorale" } 
  			    \line { \italic  "by" "J. C" \hspace #-1.2 \teeny "RÜGER," "1598-1662."}}}
  tagline =""
}


%%%%%%%%%%%%%%%%%%%%%%%%macros

%%generates the breathmarks which are placed on top of barlines
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}	      

%%prints a repeat sign glyph comprising 4 dots and two thin bars
fdendrepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
	\once \override Staff.BarLine #'text = \markup  {  \line { \raise #1.4 \override #'(baseline-skip . 1.0)  \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
	                                                  \hspace #-1 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
							  \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
	
	} }	
        \bar "||"} 

%%prints a repeat sign glyph comprising 4 dots. Used only to begin a repeat at the start of a piece where \bar ":" does not work	
fdstartrepeat =  {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
	          \once \override Staff.BarLine #'text = \markup  { \line { \hspace #0 \override #'(baseline-skip . 1.0) 
	                                                 \raise #1.4 \column { \with-color #black { 
							                \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
	          } }	
                 \bar "|:"}

%% Used to pull a note left. Used when a slurred note pair straddles a longer note when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.8 
              \once \override Stem #'X-offset = #-2.8 }

%%%%%%%%%%%%%%%%%%%%%%%%%%end of macro definitions

soprano = \relative c' {
    \fdstartrepeat \partial 2 c'2 | d2 c2 bes2 a2 | g1 a2^\fermata \bar "||" a2 | f2 f2 g2 c2 | a1. \breathmark \fdendrepeat \break
   a2 | bes2 a2 g2 f2 | e1 f2^\fermata \bar "||" a2 | g2 g2 a2 f2 | e1. \breathmark \bar "||" \break
   a2 | a2 g2 a2 d2 | c1 a2^\fermata \bar "||" c2 | bes2 a2 g2 g2 | 
       \once \override Dots #'transparent = ##t f1. \bar "||"
}

alto = \relative c' {
  \fdstartrepeat \partial 2 f2 | f2 f2 f2 f2 | \straddle f2( e2) f2 \bar "||" f2 | c2 f2 f2 e2 | f1. \fdendrepeat
  f2 | f2 f2 e2 d2 | \straddle d2( cis2) d2 \bar "||" f2 e2 d2 cis2 d2 | cis1. \bar "||"
  c2 | f2 e2 f2 f2 | e1 f2 \bar "||" f2 | f2 f2 f2 e2 | 
      \once \override NoteColumn #'force-hshift = #0.11 f1. \bar "||"
}

tenor = \relative c { \clef bass
  \fdstartrepeat \partial 2 a'2 | bes2 c2 d2 c2 | c1 c2 \bar "||" c2 | a2 a2 c2 c2 | c1. \fdendrepeat
  c2 | bes2 c2 c4( bes4) a2 | a1 a2 \bar "||" c2 | c2 g2 e2 f4( g4) | a1. \bar "||"
  a2 | c2 c2 c2 bes4( a4) | g2( c2) c2 \bar "||" c2 | d2 c2 c2 c4( bes4) | a1. \bar "||"
}

bass = \relative c { \clef bass
  \fdstartrepeat \partial 2 f2 | bes,2 a2 bes2 f'2 | c1 f2_\fermata \bar "||" f2 | a2 f2 c2 c2 | f1. \fdendrepeat
  f2 | d2 f2 c2 d2 | a1 d2_\fermata \bar "||" f,2 | c'2 bes2 a2 d2 | a1. \bar "||"
  f'2 | f2 c2 f2 bes,2 | c1 f2_\fermata \bar "||" a,2 | bes2 f'2 c2 c2 | f,1. \bar "||"
}

global = {
  \time 4/2 
  \key f \major 
  \set Staff.midiInstrument = "church organ"
}

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  print-page-number = ##f
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
		
} %%score bracket


%%%%%%%%%%%%%%%% This next section of code is for
%%%%%%%%%%%%%%%% unfolding the repeats and generating the midi
%%%%%%%%%%%%%%%% Not needed for visual layout
                

\score { 
\new ChoirStaff 
<<

\new Staff = "soprano" {\relative c' {\clef treble \global  
   \unfoldRepeats  { \repeat volta 2 { \partial 2 c'2 | d2 c2 bes2 a2 | g1 a2^\fermata \bar "||" a2 | f2 f2 g2 c2 | a1. } }\break
   a2 | bes2 a2 g2 f2 | e1 f2^\fermata \bar "||" a2 | g2 g2 a2 f2 | e1. \bar "||" 
   a2 | a2 g2 a2 d2 | c1 a2^\fermata \bar "||" c2 | bes2 a2 g2 g2 | f1. \bar "||"
}
}

\new Staff = "alto" {\relative c' {\clef treble \global  
  \unfoldRepeats { \repeat volta 2 { \partial 2 f2 | f2 f2 f2 f2 | f2( e2) f2 \bar "||" f2 | c2 f2 f2 e2 | f1. } }
  f2 | f2 f2 e2 d2 | d2( cis2) d2 \bar "||" f2 e2 d2 cis2 d2 | cis1. \bar "||"
  c2 | f2 e2 f2 f2 | e1 f2 \bar "||" f2 | f2 f2 f2 e2 | f1. \bar "||"
}	
}

\new Staff = "tenor" { \relative c {\clef bass \global  
  \unfoldRepeats { \repeat volta 2 { \partial 2 a'2 | bes2 c2 d2 c2 | c1 c2 \bar "||" c2 | a2 a2 c2 c2 | c1. } }
  c2 | bes2 c2 c4( bes4) a2 | a1 a2 \bar "||" c2 | c2 g2 e2 f4( g4) | a1. \bar "||"
  a2 | c2 c2 c2 bes4( a4) | g2( c2) c2 \bar "||" c2 | d2 c2 c2 c4( bes4) | a1. \bar "||"
} 
}


\new Staff = "bass" { \relative c { \clef bass \global  
  \unfoldRepeats { \repeat volta 2 { \partial 2 f2 | bes,2 a2 bes2 f'2 | c1 f2_\fermata \bar "||" f2 | a2 f2 c2 c2 | f1. } }
  f2 | d2 f2 c2 d2 | a1 d2_\fermata \bar "||" f,2 | c'2 bes2 a2 d2 | a1. \bar "||"
  f'2 | f2 c2 f2 bes,2 | c1 f2_\fermata \bar "||" a,2 | bes2 f'2 c2 c2 | f,1. \bar "||"
}
}

>>

\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 56 2)
            }
       }
} %% midi score bracket


\markup { \hspace #38 \italic "Unison."  \hspace #18 \small \italic "J. Montgomery, 1771-1854." }
	
\markup { \hspace #36 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "H" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "AIL to the Lord's Anointed!"  "  Great David's greater Son;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Hail, in the time appointed,"
					   "    His reign on earth begun!"
					   "He comes to break oppression,"
					   "    To let the captive free;"
					   "To take away transgression,"
					   "    And rule in equity."
			  		}}
			       
			           } %% finish stanza 1	
		}  
}	  
	
%%second page
%%fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
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

\markup { \hspace #36   %%add space as necc. to center the column
          \column { 
           	  \line { "2  "
		   \column {	     
			   "He comes with succour speedy"
			   "    To those who suffer wrong;"
			   "To help the poor and needy,"
			   "    And bid the weak be strong;"
			   "To give them songs for sighing,"
			   "    Their darkness turn to light,"
			   "Whose souls, condemned and dying,"
			   "    Were precious in his sight."
			}}
                  \hspace #1
		  \line { "3  "
		    \column {	     
			    "He shall come down like showers"
			    "    Upon the fruitful earth,"
			    "And love, joy, hope, like flowers,"
			    "    Spring in his path to birth:"
			    "Before him on the mountains"
			    "    Shall peace the herald go;"
			    "And righteousness in fountains"
			    "    From hill to valley flow."
			}}
		\hspace #1 % adds vertical spacing between verses  
           	\line {"4  "
		    \column {	     
			    "* Arabia's desert-ranger"
			    "    To him shall bow the knee;"
			    "The Ethiopian stranger"
			    "    His glory come to see;"
			    "With offerings of devotion"
			    "    Ships from the isles shall meet,"
			    "To pour the wealth of ocean"
			    "    In tribute at his feet."
			}}  
		\hspace #1 % adds vertical spacing between verses  
           	\line {"5  "
		    \column {	     
			    "Kings shall fall down before him,"
			    "    And gold and incense bring;"
			    "All nations shall adore him,"
			    "    His praise all people sing;"
			    "To him shall prayer unceasing"
			    "    And daily vows ascend;"
			    "His kingdom still increasing,"
			    "    A kingdom without end."
			}}  
		\hspace #1 % adds vertical spacing between verses
           	\line { \hspace #-10 \italic "Unison.  " "6. "
		   \column {	     
			   "* O'er every foe victorious,"
			   "    He on his throne shall rest,"
			   "From age to age more glorious,"
			   "    All-blessing and all-blest:"
			   "The tide of time shall never"
			   "    His covenant remove;"
			   "His name shall stand for ever;"
			   "    That name to us is Love." 
     			}}
	  }
}% lyric markup bracket


%% Amen score block
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 56 2) }}  %%Amen midi       
       
}  


} %%book bracket