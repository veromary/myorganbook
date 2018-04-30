%%% 087png first staff on 86png
%%% Hymn 35 Wer Da Wonet "The Hymn for conquering Martyrs raise"
%%% Version 4

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - INNOCENTS' DAY"
		\hspace #0.1 }}	
		title = \markup { "35" }
  meter = \markup { \column {  \line { \small { \sans {"WER DA WONET."} \hspace #1 \roman {"(D. L. M.)"}}}
	                        \line { \small {\italic {In moderate time} \fontsize #-5 \general-align #Y #DOWN \note #"4" #1 = 120.} }
  }}   
  arranger =  \markup { \center-align {
		            \line { \small \italic "Melody in ‘St. Gall Gesangbuch,’ 1863,"  }
			    \line { \small {\italic "from" \smallCaps "Vehe's" \italic "Gesangbüchlein, 1537."  }}
  }}
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% macros

%%generates the breathmarks
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
		 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% end of macro definitions

%%% SATB voices

global = {	
  \time 3/2 
  \key d \major 
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
  \fdstartrepeat \partial 4 d4 | d2 fis4 a2 fis4 | g4 ( a4 ) b4 a2 d4 | 
       cis2 b4 a4 ( fis4 ) a4 | g4 ( fis4 ) g4 fis2 \breathmark \fdendrepeat \break
  a4 | b2 cis4 d2 a4 | g4 ( fis4 ) e4 d2 d4 | 
       fis2 g4 a2 b4 | g2 fis4 e2 \breathmark \bar "||" \break
  e4 | fis2 gis4 a2 b4 | cis4 ( d4 ) b4 a2 d4 | 
       cis2 b4 a2 g4 | fis4 ( g4 ) e4 d2 ^\fermata \bar "||" 
}

alto = \relative c' {
  \fdstartrepeat a4 | a2 d4 e2 d4 | d2 d4 d2 fis4 | 
	fis2 d4 e4 ( d4 ) d4 | d2 cis4 d2 \fdendrepeat
  d4 | d2 g4 fis2 d4 | d2 cis4 d2 d4 | 
        cis2 d4 d2 d4 | b4 ( e4 ) d4 cis2 \bar "||" 
  cis4 | d2 e4 e2 fis4 | e2 d4 cis2 d4 | 
        fis2 d4 e2 e4 | d2 cis4 d2  \bar "||" 
}

tenor = \relative c { \clef bass
  \fdstartrepeat fis4 | fis2 a4 a2 a4 | g2 g4 fis2 b4 | 
       ais2 b4 e,4 ( a!4 ) a4 | b2 a4 a2 \fdendrepeat
  a4 | g2 g4 b2 a4 | b2 g4 fis2 b4 | 
       cis2 b4 a2 fis4 | g4. ( a8 ) b4 cis2 \bar "||" 
  a4 | a2 b4 a2 a4 | a2 gis4 a2 fis4 | 
       ais2 b4 e,2 a!4 | a4 ( b4 ) g4 fis2 \bar "||" 
}

bass = \relative c { \clef bass
  \fdstartrepeat d4 | d2 d4 cis2 d4 | b2 g4 d'2 b4 | 
       fis'2 g4 cis,4 ( d4 ) fis4 | e2 a,4 d2 \fdendrepeat
  fis4 | g2 e4 b2 fis4 | g2 a4 b2 b'4 | 
       a2 g4 fis2 d4 | e4. ( fis8 ) g4 a2 \bar "||" 
  a,4 | d2 d4 cis2 d4 | e2 e4 a,2 b4 | 
       fis'2 g4 cis,4. ( b8 ) cis4 | d4 ( g,4 ) a4 d2_\fermata \bar "||" 
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
  \unfoldRepeats { \repeat volta 2 { \partial 4 d4 | d2 fis4 a2 fis4 | g4 ( a4 ) b4 a2 d4 | 
       cis2 b4 a4 ( fis4 ) a4 | g4 ( fis4 ) g4 fis2 } } \break
  a4 | b2 cis4 d2 a4 | g4 ( fis4 ) e4 d2 d4 | 
       fis2 g4 a2 b4 | g2 fis4 e2 \bar "||" \break
  e4 | fis2 gis4 a2 b4 | cis4 ( d4 ) b4 a2 d4 | 
       cis2 b4 a2 g4 | fis4 ( g4 ) e4 d2 ^\fermata \bar "||" 
 }
}

\new Staff = "alto" {\relative c' {\clef treble \global  
  \unfoldRepeats { \repeat volta 2 { a4 | a2 d4 e2 d4 | d2 d4 d2 fis4 | 
	fis2 d4 e4 ( d4 ) d4 | d2 cis4 d2 } }
  d4 | d2 g4 fis2 d4 | d2 cis4 d2 d4 | 
        cis2 d4 d2 d4 | b4 ( e4 ) d4 cis2 \bar "||" 
  cis4 | d2 e4 e2 fis4 | e2 d4 cis2 d4 | 
        fis2 d4 e2 e4 | d2 cis4 d2  \bar "||" 

 }	
}

\new Staff = "tenor" { \relative c {\clef bass \global  
  \unfoldRepeats { \repeat volta 2 { fis4 | fis2 a4 a2 a4 | g2 g4 fis2 b4 | 
       ais2 b4 e,4 ( a!4 ) a4 | b2 a4 a2 } }
  a4 | g2 g4 b2 a4 | b2 g4 fis2 b4 | 
       cis2 b4 a2 fis4 | g4. ( a8 ) b4 cis2 \bar "||" 
  a4 | a2 b4 a2 a4 | a2 gis4 a2 fis4 | 
       ais2 b4 e,2 a!4 | a4 ( b4 ) g4 fis2 \bar "||" 

 } 
}


\new Staff = "bass" { \relative c { \clef bass \global  
  \unfoldRepeats { \repeat volta 2 { d4 | d2 d4 cis2 d4 | b2 g4 d'2 b4 | 
       fis'2 g4 cis,4 ( d4 ) fis4 | e2 a,4 d2 } }
  fis4 | g2 e4 b2 fis4 | g2 a4 b2 b'4 | 
       a2 g4 fis2 d4 | e4. ( fis8 ) g4 a2 \bar "||" 
  a,4 | d2 d4 cis2 d4 | e2 e4 a,2 b4 | 
       fis'2 g4 cis,4. ( b8 ) cis4 | d4 ( g,4 ) a4 d2_\fermata \bar "||" 	
 }
}

>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4) }}  

} %% midi score bracket

%%% Lyric titles and attributiona

\markup { \hspace #56 \small \italic "The Venerable Bede, 673-735.   Tr. J. M. Neale."}  

\markup {  \hspace #40 \small "Hymnum canentes martyrum." }


%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HE hymn for conquering Martyrs raise," 
			                                 "  The victor Innocents we praise," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Whom in their woe earth cast away,"
					   "But heaven with joy received to-day;"
					   "Whose Angels see the Father's face"
					   "World without end, and hymn his grace;"
					   "And, while they chant unceasing lays,"
					   "The hymn for conquering Martyrs raise."
			  		}}
			           } %% finish verse 1
	       }
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
	
\markup { \hspace #30   %%add space as necc. to center the column
	       \column { 
           	 \line { "2  "
			\column {	     
				"A voice from Ramah was there sent,"
				"A voice of weeping and lament,"
				"When Rachel mourned the children's care"
				"Whom for the tyrant's sword she bare."
				"Triumphal is their glory now,"
				"Whom earthly torments could not bow,"
				"What time, both far and near that went,"
				"A voice from Ramah was there sent."
			}}	   

	        \hspace #1 
           	\line { "3* "
			\column {	     
				"Fear not, O little flock and blest,"
				"The lion that your life opprest!"
				"To heavenly pastures ever new"
				"The heavenly Shepherd leadeth you;"
				"Who, dwelling now on Sion's hill,"
				"The Lamb's dear footsteps follow still;"
				"By tyrant there no more distrest,"
				"Fear not, O little flock and blest."
			}}
			
		\hspace #1 
           	\line { "4* "
			\column {	     
				"And every tear is wiped away"
				"By your dear Father's hands for ay:"
				"Death hath no power to hurt you more,"
				"Whose own is life's eternal store."
				"Who sow their seed, and sowing weep,"
				"In everlasting joy shall reap,"
				"What time they shine in heavenly day,"
				"And every tear is wiped away."
			}}		

		\hspace #1 	  
		\line { "5. "
			\column {
				"O city blest o'er all the earth,"
				"Who gloriest in the Saviour's birth,"
				"Whose are his earliest Martyrs dear,"
				"By kindred and by triumph here;"
				"None from henceforth may call thee small,"
				"Of rival towns thou passest all:"
				"In whom our Monarch had his birth,"
				"O city blest o'er all the earth!"
             }
           }
          }
}
       
%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne d1 d1 \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo b1 a1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" {  \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree g'1 fis1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  g1 d'1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = ##f opus = ##f }
\layout { 
	ragged-right = ##t
	indent = 15\cm
	\context { \Score timing = ##f } 
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4) }}  %%Amen midi       
       
}  

%%% Hymn also suitable

\markup {  \hspace #26 \italic "The following is also suitable:" \small "  611 When Christ was born." } 
  


} %%book bracket
