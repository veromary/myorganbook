%%%% 322.png
%%%% Hymn 204.  All Saints.  Who are these, like stars appearing.
%%%% Rev 1.

\version "2.10"

\header {
	
  dedication = \markup {  \center-align { "SAINTS' DAYS: GENERAL - FOR ANY SAINT'S DAY"
	\hspace #0.1 }}	
	
  title = "204"   
  
  meter = \markup {  \small { \column {  \line { \sans {"ALL SAINTS."} \hspace #1 \roman {"(8 7. 8 7. 7 7.)"}}
                                        \line { \italic {Moderately slow, dignified}\general-align #Y #DOWN \note #"2" #0.5 = 66.}}}}   
  
  arranger =  \markup {  \small \center-align {
		            \line{ \italic "Darmstadt Gesangbuch, 1698"  }
			    \line { "(" \hspace #-1 \italic  "slightly adapted" \hspace #-1 ")." }}}
  tagline =""
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro definitions	   
	      
%%% SATB voices

soprano = \relative c' {
  c'2 g a a | g2. f4 e2 c | g' a4( b) c2 b | a a g1 \breathmark \bar "||" \break
  c2 g a a | g2. f4 e2 c | g' a4( b) c2 b | a a g1 ^\fermata \bar "||" \break
  d'2 d d c4( d) | e2 d4( c) d1 | c2 g a4( b) c2 | d d c1 ^\fermata \bar "||"
}

alto = \relative c' {
  e2 g f f | d b c c | d d c d | e d4( c) b1 \bar "||"
  c2 e f f | d b c c | d d c d | e d4( c) b1 \bar "||"
  g'2 a g g | g g g1 | e2 g f e | a g4( f) e1 \bar "||"
}

tenor = \relative c { \clef bass
  g'2 c c d | g, g g e | g fis4( g) g2 g | g fis g1 \bar "||"
  g2 c c d | g, g g e | g fis4( g) g2 g | g fis g1 \bar "||"
  b2 d4( c) b2 c4( b) | c2 b4( c) b1 | c2 c c c | c b c1 \bar "||"
}

bass = \relative c { \clef bass
  c2 e f d4( c) | b2 g c c | b d4( g) e2 d | c d g,1 \bar "||"
  e'2 c f d4( c) | b2 g c c | b d4( g) e2 d | c d g,1 _\fermata \bar "||"
  g'2 fis g4( f) e( d) | c2 g'4( e) g1 | a2 e f a | f g c,1 _\fermata \bar "||"
} 
  
global = {
  \time 4/2 
  \key c \major 
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
	
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 66 2)
            }
       }
	
} %%score bracket


%%% Lyric titles 

\markup { \hspace #84 \small { \center-align { \line { \italic "H. T. Schenk, 1656-1727." }  
                                               \line { \italic "Tr. F. E. Cox." }
}}}

%%% Note: In order to generate the Fraktur title below, a Fraktur font is needed.
%%% HumboldtFraktur and GF Gesetz are examples of Fraktur fonts which resemble the original
%%% image and are free and downloadable from the internet.   
%%% HumboldtFraktur works well on Windows and Linux 
%%% but has been reported to give problems when compiling
%%% on Macintosh installations, thus GF Gesetz has been used below
%%% If you use another Fraktur font, simply put the name into the font-name override below.

\markup { \line {  \small { \hspace #40 \override #'(font-name . "HumboldtFraktur") {"Wer finb bie vor Gottes Throne." }}}}

\markup { "                 "  }  %%% force some blank space between score and lyrics

%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "W" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HO are these, like stars appearing,"
			                                "  These before God's throne who stand?" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Each a golden crown is wearing;"
					   "    Who are all this glorious band?"
					   "        Alleluya, hark! they sing,"
					   "        Praising loud their heavenly King."
					   "         " %%% adds blank spacing between verses
			  		}}
		      }
		      	   \line { "2  "
			   \column {	     
				   "Who are these of dazzling brightness,"
				   "    These in God's own truth arrayed,"
				   "Clad in robes of purest whiteness,"
				   "    Robes whose lustre ne'er shall fade,"
				   "        Ne'er be touched by time's rude hand—"
				   "        Whence comes all this glorious band?"
					}}

	  } %%% end super column
}


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

%%% Second page
%%% Continuation of lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
		  	\hspace #1  % adds vertical spacing between verses  
			   \line { "3  "
			   \column {	     
				   "These are they who have contended"
				   "    For their Saviour's honour long,"
				   "Wrestling on till life was ended,"
				   "    Following not the sinful throng;"
				   "        These, who well the fight sustained,"
				   "        Triumph through the Lamb have gained."
				   "           " %%% adds vertical spacing between verses
			}}
			   \line { "4  "
			   \column {	     
				   "These are they whose hearts were riven,"
				   "    Sore with woe and anguish tried,"
				   "Who in prayer full oft have striven"
				   "    With the God they glorified;"
				   "        Now, their painful conflict o'er,"
				   "        God has bid them weep no more."
				   "           " %%% adds vertical spacing between verses
			}}
			\line { "5. "
				\column {	     
					"These like priests have watched and waited,"
					"    Offering up to Christ their will,"
					"Soul and body consecrated,"
					"    Day and night to serve him still:"
					"        Now, in God's most holy place"
					"        Blest they stand before his face."
				   "           " %%% adds vertical spacing between verses
     			}}

	  }
} %%% lyric markup bracket
  

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f1 e1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo c1 c1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree a'1 g1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  f1  c1 \bar "||" }}
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

\markup { \hspace #14 \italic "The following are also suitable:" \small " 641 For all the Saints who from their labours rest." }

} %%% book bracket
