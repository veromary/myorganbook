%%%% 272b.png
%%%% Hymn 170 Modern Tune  Christ is made the sure foundation
%%%% Rev 2

\version "2.10"

\header {
  dedication = \markup {  \center-align { "THE CHRISTIAN YEAR - DEDICATION FESTIVAL"
	\hspace #0.1 }}	
	
  title = \markup { "170 " \large \smallCaps "(Modern Tune)" }   
  
  meter = \markup { \small { \column {  
	                                \line { \sans {"URBS COELESTIS."} \hspace #1 \roman {"(8 7. 8 7. 8 7.)"}}
		                        \line { \italic {In moderate time} \general-align #Y #DOWN \note #"4" #0.5 = 104 "(" \hspace #-1 \general-align #Y #DOWN \note #"2" #0.5 = 52 \hspace #-1 ")." } }
  	}}	
	

 arranger = \markup { \small  { \center-align { \line {\italic "No. XVI from" "‘" \hspace #-1 \italic "The Golden Legend" \hspace #-1.2 ",’" \italic "1880."}
	  					 \line { \italic "By" \smallCaps "H. E. Hodson." }
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
	      
push = \once \override NoteColumn #'force-hshift = #1.6

%%% push a note slightly to the right but by a smaller amount

pushb = \once \override NoteColumn #'force-hshift = #1.0

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01

%%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 

straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.6
              \once \override Stem #'X-offset = #-2.6 }
	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/4
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \tag #'repeatpart { \fdstartrepeat b'2( a4) g | a( b c) b | a( g fis) g | a2 g \bar "||" \break
  b2( a4) g | fis( d g) fis | e( d) \push e2 | d1 \fdendrepeat \break }
  \tag #'remainder { d'2( c4) b | d2( c4) b | a( gis a) b | c( b) a2 \bar "||" \break
  c2( b4) a | g( fis g) a | b2( a4 g | fis g a4. ) g8 | g2. \bar "||" }
} 
   
alto = \relative c' {  
  \tag #'repeatpart { \fdstartrepeat d2. d4 | d2( e4) d | e( d c) b | c2 b \bar "||"
  d2. cis4 | d2. d4 | b( d)  d( cis) | \merge d1 \fdendrepeat }
  \tag #'remainder { g2( fis4) g | a2( g4) fis | e2. d4 | c( d8[ e]) fis2 \bar "||"
  c2( d4) d | b( dis e) d | d2( c4 b | d2 c) | b2. \bar "||" }
}

tenor = \relative c {\clef bass 
  \tag #'repeatpart { \fdstartrepeat g'2( fis4) g | fis( \push g2) g4 | e( g d) g | g( fis) g2 \bar "||"
  g2( a4) a | a2( g4) a | e( fis) a( g)  | fis1 \fdendrepeat } 
  \tag #'remainder { b2( c4) d | a2( e4) fis8[ g] | a4( b a) gis | a( g!) fis2 \bar "||"
  e4( fis g) fis | e4( b'2) a4 | g2( fis4 g | a g2) fis4 | g2. \bar "||" }
}

bass = \relative c {\clef bass 
  \tag #'repeatpart { \fdstartrepeat g2( d'4) b | d( g c,) g | c( b a) g | d'2 g, \bar "||"  
  g4( g' fis) e | d( c b ) a | g( b) \pushb a2 | d1 \fdendrepeat }
  \tag #'remainder { b4( b' a) g | \straddle g( fis e) d | c( d c) b | a( b8[ c] ) d2 \bar "||" 
  a2( b4) d | e( b e) fis | \straddle g( b, d e8[ d] | c4 b) d2 | g,2. \bar "||" }
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 52 2) }}  
  		
} %%% Score bracket

\markup {  \line { \hspace #26 \italic "See also:" \hspace #1 \small {\column { "634  Hail thee, Festival Day."
	            					        "635  Eternal Power, whose high abode."
		     						"636  Only-begotten, Word of God eternal."
								"637  Lo! God is here! let as adore." }}}}

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


%%% Lyric Titles


%%% Lyric titles and attributions

\markup { \hspace #12 \small {  \column { \line {\smallCaps  "Office Hymn."  "M." \italic "and" "E."  \hspace #30 \italic "c. 7th cent.  Tr. J. M. Neale." }    
					 \line { \hspace #28 "Angularis fundamentum." }
}}}


%%% Lyrics

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "C" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HRIST is made the sure Foundation,"
			                                 "  And the precious Corner-stone," } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Who, the two walls underlying,"
					   "    Bound in each, binds both in one,"
					   "Holy Sion's help for ever,"
					   "    And her confidence alone."
					   "          " %%% adds space between verses
			  		}} 
			         } %%% finish verse 1 
           		\line { "2  "
			   \column {	     
				   "All that dedicated City,"
				   "    Dearly loved by God on high,"
				   "In exultant jubilation"
				   "    Pours perpetual melody:"
				   "God the One, and God the Trinal,"
				   "    Singing everlastingly."
				   "                " %%% adds vertical spacing between verses
			}}
			   \line { "3  "
			   \column {	     
				   "To this temple, where we call thee,"
				   "    Come, O Lord of Hosts, to-day;"
				   "With thy wonted loving-kindness"
				   "    Hear thy people as they pray;"
				   "And thy fullest benediction"
				   "    Shed within its walls for ay."
				   "                " %%% adds vertical spacing between verses
			}}
			   \line { "4  "
			   \column {	     
				   "Here vouchsafe to all thy servants"
				   "    What they supplicate to gain;"
				   "Here to have and hold for ever"
				   "    Those good things their prayers obtain,"
				   "And hereafter in thy glory"
				   "    With thy blessèd ones to reign."
				   "                " %%% adds vertical spacing between verses
			}}
			   \line { \hspace #-9.8 \italic "Unison. " "5. "
			   \column {	     
				   "Laud and honour to the Father;"
				   "    Laud and honour to the Son;"
				   "Laud and honour to the Spirit;"
				   "    Ever Three and ever One:"
				   "Consubstantial, co-eternal,"
				   "    While unending ages run.     Amen."
				   "                " %%% adds vertical spacing between verses
			}}
	  } %%% end supercolumn
} %%% end markup	  	  


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne g'1 g1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo c1 b1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree e1 d1 \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 52 2) }}  %%Amen midi       
       
}  


} %%% book bracket
