%%%% 238.png
%%%% Hymn 148 Nun Freut Euch. The Lord ascendeth up on high.
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "THE CHRISTIAN YEAR - ASCENSIONTIDE"
	\hspace #0.1 }}	
	
	title = "148"   
  
  meter = \markup { \small { \column {  
	                                \line { \sans {"NUN FREUT EUCH."} \hspace #1 \roman {"(8 7. 8 7. 8 8 7.)"}}
		                        \line { \italic {Slow and dignified} \general-align #Y #DOWN \note #"2" #0.5 = 50.} }
  	}}	
	

 arranger = \markup { \small  { \center-align { \line {\italic "Melody by" \smallCaps "M. Luther, 1483-1546."}
	  					 \line { \italic "Adapted and harmonized by" \smallCaps "J. S. Bach." }
  	}}}
	 
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% prints a repeat sign glyph comprising 4 dots. Used only to begin a repeat at the start of a piece where \bar ":" does not work      

fdstartrepeat =  {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
                  \once \override Staff.BarLine #'text = \markup  { \line { \hspace #0 \override #'(baseline-skip . 1.0) 
                                                                    \raise #1.4 \column { \with-color #black { 
                                                                    \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
                  } }   
                 \bar "|:"}
   
%%% prints a repeat sign glyph comprising 4 dots and two thin bars

fdendrepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
                \once \override Staff.BarLine #'text = \markup  {  \line { \raise #1.4 \override #'(baseline-skip . 1.0)  \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
                                                                   \hspace #-1 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
                                                                   \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
        } }     
        \bar "||"} 

%%% push a note slightly to the right	      
	      
push = \once \override NoteColumn #'force-hshift = #0.6

%%% nbbar prints bars which forbid linebreaks

nbbar = { | \noBreak }

%%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 

straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.8
              \once \override Stem #'X-offset = #-2.8 }

%% Used to pull an upstem note left. Used when a slurred note pair straddles a longer note below and when notecolumn force-hshift does not work 
topstraddle = { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.5 
              \once \override Stem #'X-offset = #-0.2 }	      
	      
	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \tag #'repeatpart { \fdstartrepeat \partial 2 g'2 \nbbar g d g c \nbbar b a g ^\fermata \bar "||" \noBreak g \nbbar a4( b) c2 b a | \break
  e2( fis) g ^\fermata \fdendrepeat } \tag #'remainder { g2 \nbbar c b a d \nbbar d cis d ^\fermata \bar "||" \noBreak d | \break
  e2 c d2. c4 \nbbar b2 a g ^\fermata \bar "||" \noBreak b2 \nbbar a d, g c \nbbar b( a) g ^\fermata \bar "||" }
} 
   
alto = \relative c' {  
  \tag #'repeatpart { \fdstartrepeat d2 | d a d a' | d, d4.( c8) b2 \bar "||" b4( cis) | d( f) e( fis!) g2 d4( a8[ b8]) | 
  \push c1 b2 \fdendrepeat } \tag #'remainder { d2 | g4( a) \straddle a( g8[ fis] ) e2 a4( fis) | e( g) g( fis8[ e8]) fis2 \bar "||" g |
  g2 g a4( fis) g( a) | \straddle a4( g2) fis4 e2 \bar "||" e | e4( d8[ c8]) b2 e4( d) e( fis) | g2.( fis4) d2 \bar "||" }
}

tenor = \relative c {\clef bass 
  \tag #'repeatpart { \fdstartrepeat b'4( a) | g2 fis g2. fis4 | g2. fis4 d2 \bar "||" g2 | fis4( gis) a2 d,4( e) fis2 | 
  g2( a) d, \fdendrepeat } \tag #'remainder { b' | e4( d) d2 cis d | b a a \bar "||" d | 
  d4( c8[ b8]) c4(e) d( c) b( a) | \topstraddle b8([ c] d2) c4 b2 \bar "||" g | a g4( a) b2 a | d2.( c4) b2 \bar "||" }
}

bass = \relative c {\clef bass 
  \tag #'repeatpart { \fdstartrepeat g4( a) | b( c) d( c) b2 a | g4( a) d2 g, _\fermata \bar "||" e'2 | d a b4( c) d2 | 
  c4( b) a2 g _\fermata \fdendrepeat } \tag #'remainder { g'4( fis) | e( fis) g2 g4( a8[ g]) fis4( b) | g4( e) a2 d, _\fermata \bar "||" b |
  c4( d) e2 fis4( d) e( fis) | g2 d e _\fermata \bar "||" e | fis g4( fis) e2 a, | b4(c) d2 g, _\fermata \bar "||" }
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
	} %% close layout
  		
} %%% Score bracket


%%% A separate score block to unfold repeats and generate the midi	

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \keepWithTag #'repeatpart \soprano \soprano  }
	\context Voice = altos    { \voiceTwo \global \keepWithTag #'repeatpart \alto \alto  }
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \keepWithTag #'repeatpart \tenor \tenor  }
	\context Voice = basses { \voiceTwo \global \keepWithTag #'repeatpart \bass \bass  }
			        >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 50 2) }}  
  		
} %%% Score bracket

%%% Lyric attributions and titles

\markup { \hspace #60 \small \italic "A. T. Russell, 1806-74, and others."}  

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HE Lord ascendeth up on high,"
			                                 "  Loud anthems round him swelling;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "The Lord hath triumphed gloriously."
					   "    In power and might excelling:"
					   "Hell and the grave are captive led;"
					   "Lo, he returns, our glorious Head,"
					   "    To his eternal dwelling."
			  		}}
		      } %%% end verse 1			
	  } %%% end supercolumn
} %%% end markup	  
       
       
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
%%% continuation of  lyrics

\markup { \hspace #30   %%add space as necc. to center the column  
		\column { 
			\hspace #1  % adds vertical spacing between verses  
           		\line { "2  "
			   \column {	     
				   "The heavens with joy receive their Lord;"
				   "    O day of exultation!"
				   "By Saints, by Angel-hosts adored"
				   "    For his so great salvation:"
				   "O earth, adore thy glorious King,"
				   "His Rising, his Ascension sing"
				   "    With grateful adoration."
			}}
			\hspace #1 % adds vertical spacing between verses
			\line { \hspace #-10 \italic "Unison.  " "3. "
				\column {	     
					"By Saints in earth and Saints in heaven,"
					"    With songs for ever blended,"
					"All praise to Christ our King be given,"
					"    Who hath to heaven ascended:"
					"To Father, Son, and Holy Ghost,"
					"The God of heaven's resplendent host,"
					"    In bright array extended.     Amen."
     			}}
	  }
} %%% lyric markup bracket


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne g'1 g1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo e1 d1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree c'1 b1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  c1 g1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 50 2) }}  %%Amen midi       
       
}  


} %%% book bracket
