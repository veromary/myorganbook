%%%046-47.png
%%%Hymn 12 Wachet Auf "Wake, O wake! with tidings thrilling"
%%%Version 3 Reset fonts

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - ADVENT"
		\hspace #0.1 }}	
  title = "12"
  meter = \markup {  \small { \column {  \line { \sans {"WACHET AUF !"} \hspace #1 \roman {"(8 9 8. 8 9 8. 6 6 4. 8 8.)"}}
                               \line { \italic {Very slow and solemn} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 39 "("\fontsize #-5 \general-align #Y #DOWN \note #"4" #1 = 78")."}}} }  
  arranger =  \markup {  \small { \center-align {
		            \line { \italic "Melody by" \smallCaps "P. Nicolai, 1556-1608."  }
			       \line { \italic "Adapted and harmonized by" \smallCaps "J. S. Bach."  }}}}
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% macros

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



%%generates the breathmarks as a type of rehearsal mark
breathmark = {	
	      \once \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \once \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \once \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% end of macro definitions

global =  {
  \time 4/2 
  \key d \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { \override TextScript #'padding = #'0
  \fdstartrepeat d2 fis2 a2 a2 | a2 a2 b1 | a1.^\fermata  \breathmark \bar "||" a2   | \break
  d2 a2  d4( e4) fis2 | e2 d2 cis2( b2) | a1.^\fermata \breathmark \bar "||" a2 | \break
  d2 a2  b2 fis2 | g4( fis4) e2 d2^\fermata \breathmark \fdendrepeat  a'2 | a2. g4  fis2 e2 | \break
  d1.^\fermata \breathmark \bar "||"  a'2 | a2. g4  fis2 e2 | d1^\fermata \bar "||" \break 
  e2 fis2 | \once \override NoteColumn #'force-hshift = #0.6 g1 fis2^\fermata \breathmark \bar "||" a2 | b2 cis2 d2 d4( e4) | \break 
  fis2 e2 d2^\fermata \breathmark \bar "||" a2 | d2 a2 b2 fis2 | g4( fis4) e2 d1^\fermata \bar "||" 
}

alto = \relative c' {
  \fdstartrepeat a2 d2 fis2 e2 | fis2 e2 fis2( e2) | e1. \bar "||" e2 | 
  a2. g4 fis4( g4) a2 | a2 b2  \once \override NoteHead #'X-offset = #-2.8  
      \once \override Stem #'X-offset = #-2.8 b4( a2 gis4) | e1. \bar "||" fis2 | 
  g2 fis2 d2 d2 | d2 cis2 a2 \fdendrepeat e'2 | fis2. e4 a,4( b4) cis2 | 
  b1. \bar "||" cis4( d4) | e2 e2 \once \override NoteColumn #'force-hshift = #-1.6 e4( d2) cis4 | a1 \bar "||"
  \once \override Score.SeparationItem #'padding = #2 cis2 d2 | d2( cis2) d2 \bar "||" fis2 | fis4( e4) e4( fis4) fis2 fis4( g4) |
  a2. g4 fis2 \bar "||" fis4( g4) | a4( g4) \once \override NoteColumn #'force-hshift = #-1.6 a4( fis4) g2 d2 | d2 cis2 a1 \bar "||"
}

tenor = \relative c { \clef bass
  \fdstartrepeat fis2 a2  d2 cis2 | d2 a2 a2( gis2) | cis1. \bar "||" cis2 | 
  d2 d2 a2 d2 | e2 e2 e2.( b4) | cis1. \bar "||" d2 | 
  d2 d4( c4) b2 b2 | b4( a4) g2 fis2 \fdendrepeat a2 | d4( cis4) b4( cis4) d2 a4( g4) | 
  fis1. \bar "||" a2 | a4( b4) cis2 a4( b2) a4 | fis1 \bar "||"
  a2 a2 | b2( g2) a2 \bar "||" d2 | d2 cis2 b2 d2 | 
  d2 cis2 d2 \bar "||" d2 | a2 d2 d2. b4 | b4( a4) g2 fis1 \bar "||"
}

bass = \relative c { \clef bass
  \fdstartrepeat d2 d2 d4( fis4) a4( g4) | fis4( e4) d4( cis4) d4( b4) e2 | a,1._\fermata \bar "||" a'4( g4) |
  fis4( g4) fis4( e4) d2 d'2 | cis4( b4) a4( gis4) a2( e2) | a,1._\fermata \bar "||" d4( c4) | 
  b4( cis!4) d2 g4( a4) b2 | e,2 a,2 d2_\fermata \fdendrepeat cis2 | d2 e2 fis4( g4) a4( a,4) |
  b1._\fermata \bar "||" fis'2 | cis4( b4) a2 d4( b4) g4( a4) | d1_\fermata \bar "||" 
  \once \override NoteHead #'X-offset = #-2.8  \once \override Stem #'X-offset = #-2.8 a'4( g4) fis2 | 
      \once \override NoteColumn #'force-hshift = #0.6 e1 d2_\fermata \bar "||" d'2 | gis,2 ais2 b2 b2 | 
  fis4( g4) a2 b,2_\fermata \bar "||" d4( e4) | 
      fis4( e4) \once \override NoteColumn #'force-hshift = #-1.6 fis4( d4) g,4( a4) b2 | e2 a,2 d1_\fermata \bar "||" 
}

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
  % annotate-spacing = ##t 
  top-margin = 1\mm
  bottom-margin = 2\mm
  print-page-number = ##f
  head-separation = 2\mm
  between-system-padding = 1\mm
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
  \unfoldRepeats  {   \repeat volta 2 { \set Score.measurePosition = #(ly:make-moment 0 4) 
      d2 fis2 a2 a2 | a2 a2 b1 | a1.^\fermata \bar "||" a2 | \break
  d2 a2  d4( e4) fis2 | e2 d2 cis2( b2) | a1.^\fermata \bar "||" a2 | \break
  d2 a2  b2 fis2 | g4( fis4) e2 d2^\fermata } } a'2 | a2. g4  fis2 e2 | \break
  d1.^\fermata \bar "||"  a'2 | a2. g4  fis2 e2 | d1^\fermata \bar "||" \break 
  e2 fis2 | g1 fis2^\fermata \bar "||" a2 | b2 cis2 d2 d4( e4) | \break 
  fis2 e2 d2^\fermata \bar "||" a2 | d2 a2 b2 fis2 | g4( fis4) e2 d1^\fermata \bar "||" 
}
}

\new Staff = "alto" {\relative c' {\clef treble \global  
  \unfoldRepeats {   \repeat volta 2 { a2 d2 fis2 e2 | fis2 e2 fis2 e2 | e1. \bar "||" e2 | 
  a2. g4 fis4( g4) a2 | a2 b2  b4( a2 gis4) | e1. \bar "||" fis2 | 
  g2 fis2 d2 d2 | d2 cis2 a2  } } e'2 | fis2. e4 a,4( b4) cis2 | 
  b1. \bar "||" cis4( d4) | e2 e2 e4( d2) cis4 | a1 \bar "||"
  cis2 d2 | d2( cis2) d2 \bar "||" fis2 | fis4( e4) e4( fis4) fis2 fis4( g4) |
  a2. g4 fis2 \bar "||" fis4( g4) | a4( g4) a4( fis4) g2 d2 | d2 cis2 a1 \bar "||"
}	
}

\new Staff = "tenor" { \relative c {\clef bass \global  
  \unfoldRepeats { \repeat volta 2 { fis2 a2  d2 cis2 | d2 a2 a2 gis2 | cis1. \bar "||" cis2 | 
  d2 d2 a2 d2 | e2 e2 e2.( b4) | cis1. \bar "||" d2 | 
  d2 d4( c4) b2 b2 | b4( a4) g2 fis2 } } a2 | d4( cis4) b4( cis4) d2 a4( g4) | 
  fis1. \bar "||" a2 | a4( b4) cis2 a4( b2) a4 | fis1 \bar "||"
  a2 a2 | b2( g2) a2 \bar "||" d2 | d2 cis2 b2 d2 | 
  d2 cis2 d2 \bar "||" d2 | a2 d2 d2. b4 | b4( a4) g2 fis1 \bar "||"
} 
}


\new Staff = "bass" { \relative c { \clef bass \global  
  \unfoldRepeats { \repeat volta 2 { d2 d2 d4( fis4) a4( g4) | fis4( e4) d4( cis4) d4( b4) e2 | a,1._\fermata \bar "||" a'4( g4) |
  fis4( g4) fis4( e4) d2 d'2 | cis4( b4) a4( gis4) a2( e2) | a,1._\fermata \bar "||" d4( c4) | 
  b4( cis!4) d2 g4( a4) b2 | e,2 a,2 d2_\fermata } } cis2 | d2 e2 fis4( g4) a4( a,4) |
  b1._\fermata \bar "||" fis'2 | cis4( b4) a2 d4( b4) g4( a4) | d1_\fermata \bar "||" 
  a'4( g4) fis2 | e1 d2_\fermata \bar "||" d'2 | gis,2 ais2 b2 b2 | 
  fis4( g4) a2 b,2_\fermata \bar "||" d4( e4) | fis4( e4) fis4( d4) g,4( a4) b2 | e2 a,2 d1_\fermata \bar "||" 	
}
}
>>

\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 39 2)
            }
       }
} %% midi score bracket

%%fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
\score{
{ s4 }
\header { breakbefore = ##t piece = ##f opus = ##f tagline = ##f }
\layout{
	\context { \Staff
		\remove Time_signature_engraver
		\remove Key_engraver
		\remove Clef_engraver
		\remove Staff_symbol_engraver
}}}



%%% Note: In order to generate the Fraktur title below, a Fraktur font is needed.   
%%% I have used HumboldtFraktur.ttf which is free and easily
%%% downloadable from the Internet (google for the name). 
%%% In the original image, "c" and "h" in were joined in a Fraktur style ligature. 
%%% I did not use the ligature character.  I used separate "c" and "h" and moved the
%%% characters closer together. This allows the entire phrase would degrade correctly into
%%% default Roman font for anyone who doesn't have a Fraktur font. 
%%% If you do not have a Fraktur font, you should see "Wachet auf" in Roman, "c" and "h" close together. 
%%% If you use another %%% Fraktur font, simply put the name into the font-name override below.

\markup { \hspace #0   %%add space as necc. to center the column
	\column { %%super-column of everything
	  	\line { {\hspace #66  \small \italic "P. Nicolai, 1556-1608.  Tr. F. C. B."}}  
		\line {  \small { \hspace #45 \override #'(font-name . "HumboldtFraktur") {"Wac" \hspace #-1.6 "het" "auf."}}}
		\line { %% a master line of 3 columns
                   \column { %% column 1
		       \hspace #1  % adds vertical spacing between verses. More such lines more space.     
		       \column { %% stanza 1 column 
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "W" }   %%Drop Cap goes here
				  \hspace #-1    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "AKE, O wake! with tidings thrilling" "The watchmen all the air are filling," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "        Arise, Jerusalem, arise!"
					   "Midnight strikes! no more delaying,"
					   "'The hour has come!' we hear them saying."
					   "        Where are ye all, ye virgins wise?"
					   "            The Bridegroom comes in sight,"
					   "            Raise high your torches bright!"
					   "                          Alleluya!"
					   "            The wedding song"
					   "            Swells loud and strong:"
					   "        Go forth and join the festal throng."
			  		}}
			           } %% finish stanza 1
		   } %% end column 1
		 
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -36 . -2) #0 }       %%Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3
	   
	\column { %%start page column 3   
	        \hspace #1 
           	\line { "2  "
			\column {	     
				"Sion hears the watchmen shouting,"
				"Her heart leaps up with joy undoubting,"
				"        She stands and waits with eager eyes;"
				"See her Friend from heaven descending,"
				"Adorned with truth and grace unending!"
				"        Her light burns clear, her star doth rise,"
				"            Now come, thou precious Crown,"
				"            Lord Jesu, God's own Son!"
				"                          Hosanna!"
				"            Let us prepare"
				"            To follow there,"
				"        Where in thy supper we may share."
			}}
	       }  %% end column 3
	}  %% end of 3 column master line
	\column { %% centered column for last verse
	     \hspace #1 
             \line { \hspace #22 \italic "Unison." "   3. "
             \column { 
		     "Every soul in thee rejoices;"
		     "From men and from angelic voices"
		     "        Be glory given to thee alone!"
		     "Now the gates of pearl receive us,"
		     "Thy presence never more shall leave us,"
		     "        We stand with Angels round thy throne."
		     "            Earth cannot give below"
		     "            The bliss thou dost bestow."
		     "                          Alleluya!"
		     "            Grant us to raise,"
		     "            To length of days,"
		     "        The triumph-chorus of thy praise."    
	   }}
	  }
	       
	       
	       
	       
	} %% end super-column  
} %% end markup

%% Score block for Ver. 2 line 9
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne 
		\mark \markup {\hspace #16 \raise #1 \fontsize #-3 "Ver. 2, line 9, must run:"}    
	                             e2( fis2) \bar "|" g1 fis2^\fermata \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo 
	                                 cis2( d2) \bar "|" d2( cis2) d2 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" {  \override LyricText #'font-size = #-1 Ho -- san -- na. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) } 
	                      <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree 
	                                a'1 \bar "|" b2( g2) a2 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  
		                        \once \override NoteHead #'X-offset = #-2.4  
					\once \override Stem #'X-offset = #-2.4
	                                a'4( g4 fis2) \bar "|" e1 d2_\fermata \bar "||" }}
			        >> 
  >>	
  
  
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 0\cm
	\context { \Staff \remove Time_signature_engraver }

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
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 39 2) }}  %%Amen midi       
       
}  

} %%book bracket