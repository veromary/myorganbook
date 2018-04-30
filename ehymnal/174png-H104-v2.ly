%%% 174png
%%% Hymn 104 Nun Lasst Uns Geh'n Servant of God, remember
%%% Version 2

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - PASSIONTIDE"
		\hspace #0.1 }}	
  title = "104"
  poet = \markup {  \small { \sans {"NUN LASST UNS GEH'N."}   \hspace #1 \roman {"(7 7. 7 7.)"}} }
  meter = \markup { \small { \italic {Moderately slow } \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 80.} }
  arranger =  \markup { \small \italic "‘Kirchen- und Haus-Buch,’ Dresden, 1694."}
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%%% pushes notecolumn slightly to the right
push = \once \override NoteColumn #'force-hshift = #0.5


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro Definitions

global = {
  \time 3/2
  \key ees \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  bes'2 aes g | f1 ees2 | \once \override NoteColumn #'force-hshift = #1.5 f1. | ees1 \breathmark \bar "||" 
      g2 | aes(bes)c | bes(aes)g | g1(f2) | g1. \bar "||" \break
  bes2 c d | ees1 d2 | c1. | bes1 \breathmark \bar "||" 
      c2 | aes1 bes2 | g1 f2 | f1. | ees1. \bar "||"
}

alto = \relative c' { 
  ees2 c4(d) ees2 | c1 ees2 | ees1(d2) | \once \override NoteColumn #'force-hshift = #-0.05 ees1 \bar "||" 
      ees2 | \push f1 g2 | \push f1 ees2 | c1. | d1. \bar "||" \break
  ees2 ees f | ees1 g2 | aes1. | ees1 \bar "||" 
      g2 | f1 f2 | ees1 c2 | d1. | \once \override NoteColumn #'force-hshift = #-0.05 ees1. \bar "||"
}

tenor = \relative c { \clef bass
  g'2 aes bes | aes1 g2 | bes1. | g1 \bar "||" 
      c2 | c1 c2 | f,1 bes2 | c1. | b1. \bar "||" \break
  bes!2 aes aes | bes1 bes2 | ees1(d2) | ees1 \bar "||" 
      c2 | c1 bes2 | bes1 c2 | bes1(aes2) | g1. \bar "||"
}

bass = \relative c { \clef bass
  g'2 f ees | aes,1 c2 | bes1. | ees1 \bar "||" 
      c2 | f1 ees2 | d1 ees2 | aes,1. | g1. \bar "||" \break
  g'2 aes f | g1 ees2 | f1. | g1 \bar "||" 
      ees2 | f1 d2 | ees1 aes,2 | bes1. | ees1. \bar "||"}

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##t
}


\book {

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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 2)}} 

} %%% Score bracket

%%% Hymn Note markup

\markup { \hspace #18 \smallCaps "Note" \hspace #-1.2 ".—" \italic "The plainsong tune for this hymn will be found in the Appendix." }

%%% Lyric titles

\markup {
	\column {
	    \line { \small { \hspace #26 \italic "Compline." \hspace #30 \italic {"Prudentius, b. 348.  Tr. T. A. L."} } }  
	    \line { \small { \hspace #42 "Cultor Dei memento."} }
} }

%%% Main block of lyrics

\markup { \hspace #32 %%add space as necc. to center the column
	      \column { %%% super column for entire block of lyrics 
	              \column { %%% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "S" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ERVANT of God, remember"
                                                         "  The stream thy soul bedewing." } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "The grace that came upon thee"
					   "    Anointing and renewing."
			  		}}
			           } %% finish verse 1	 
		 \hspace #1  % adds vertical spacing between verses  	
		  \line { "2  "
		    \column {	     
			    "When kindly slumber calls thee,"
			    "    Upon thy bed reclining,"
			    "Trace thou the Cross of Jesus,"
			    "    Thy heart and forehead signing."
			}}
					 \hspace #1  % adds vertical spacing between verses  	
		  \line { "3  "
		    \column {	     
			    "The Cross dissolves the darkness,"
			    "    And drives away temptation;"
			    "It calms the wavering spirit"
			    "    By quiet consecration."
		  }}
		  		\hspace #1  % adds vertical spacing between verses   
		\line { "4  "
		    \column {	     
			    "Begone, begone, the terrors"
			    "    Of vague and formless dreaming;"
			    "Begone, thou fell deceiver,"
			    "    With all thy boasted scheming."
		}}
	      }	%%% end super column	
}	  
	

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

%%% second page
%%% continuation of  lyrics

\markup { \hspace #32   %%add space as necc. to center the column
          \column { 
                 \hspace #1  % adds vertical spacing between verses 
		  \line { "5  "
		    \column {	     
			    "Begone, thou crookèd serpent,"
			    "    Who, twisting and pursuing,"
			    "By fraud and lie preparest"
			    "    The simple soul's undoing;"
			}}
		 \hspace #1  % adds vertical spacing between verses  	
		  \line { "6  "
		    \column {	     
			    "Tremble, for Christ is near us,"
			    "    Depart, for here he dwelleth."
			    "And this, the Sign thou knowest,"
			    "    Thy strong battalions quelleth."
			}}
		\hspace #1  % adds vertical spacing between verses   
		\line { "7  "
		    \column {	     
			    "Then while the weary body"
			    "    Its rest in sleep is nearing,"
			    "The heart will muse in silence"
			    "    On Christ and his appearing."
			}}
           	\hspace #1  % adds vertical spacing between verses  		  
           	\line { "8. "
		   \column {	     
			   "To God, eternal Father,"
			   "    To Christ, our King, be glory."
			   "And to the Holy Spirit,"
			   "    In never-ending story.     Amen."
     			}}
	  }
} %%% lyric markup bracket


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne ees1 ees  \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo c1 bes \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree aes'1 g \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  aes1 ees'1 \bar "||" }}
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
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 2) }} 

}


} %%% book bracket