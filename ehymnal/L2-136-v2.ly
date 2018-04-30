%%%% 222.png
%%%% Hymn 136 Hornsey On the resurrection morning
%%%% Rev 2.

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - EASTERTIDE"
	\hspace #0.1 }}	
	
	title = "136"  
  
  poet = \markup { \small {  \line { \sans { \smallCaps "HORNSEY."} \hspace #1 \roman {"(8 7. 8 3.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"2" #0.5 = 84.} }
  
  arranger = \markup { \small \smallCaps "S. S. Wesley, 1810-76." }
  
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros
	      
%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 
merge = \once \override NoteColumn #'force-hshift = #-0.01

%%% generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 

straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.6
              \once \override Stem #'X-offset = #-2.6 }

%% Used to pull an upstem note left. Used when a slurred note pair straddles a longer note below and when notecolumn force-hshift does not work 
topstraddle = { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.5 
              \once \override Stem #'X-offset = #-0.2 }	      
	      
	      
%%% push a note slightly to the right	      
	      
push = \once \override NoteColumn #'force-hshift = #0.6

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {  
  d2 d g b | a b c d \breathmark \bar "||" b a4( g) a2 d | e, g fis1 \bar "||" \break
  b2 e e d | g, c c b \breathmark \bar "||" e,1 fis1 | g\breve \bar "||"
} 
   
alto = \relative c' {  
  d2 d e g | g fis g a \bar "||" d, e e d | d cis d1 \bar "||" 
  d2 e a a | g g f f \bar "||" \merge e1 \straddle e2( d) | d\breve \bar "||"
}

tenor = \relative c {\clef bass 
  b'2 a b d | e d c4( b) a2 \bar "||" b b a fis | b a a1 \bar "||" 
  b2 b a d | d c f, b \bar "||" b( a) \topstraddle a2.( c4) | b\breve
}

bass = \relative c {\clef bass 
  g'2 fis e d | c d e fis \bar "||" g g fis b,4( a4) | g2 a2 d1 \bar "||"
  g2 g fis b, | e e d g, \bar "||" \push c1 d1 | g,\breve \bar "||"
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

%%% Hymn Midi	

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 84 2)}} 
		
} %%% Score bracket


%%% Lyrics titles

\markup { \small { \hspace #72 \italic "S. Baring-Gould, 1834-1924." } }

%%% Main lyric block

\markup { \hspace #34 %%add space as necc. to center the column
          \column { %%% one super column for the entire block of lyrics
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "N the Resurrection morning"
			                                "  Soul and body meet again;" } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "No more sorrow, no more weeping,"
					   "                                    No more pain!"
					   "         " %%% extra spacing between verses
			  		}} 
			         } %%% finish verse 1	 
           		\line { "2  "
			   \column {	     
				   "Here awhile they must be parted,"
				   "    And the flesh its Sabbath keep,"
				   "Waiting in a holy stillness,"
				   "                                    Wrapt in sleep."
				   "         " %%% extra spacing between verses
			}} 
           		\line { "3  "
			   \column {	     
				   "For a while the wearied body"
				   "    Lies with feet toward the morn;"
				   "Till the last and brightest Easter"
				   "                                    Day be born."
				   "         " %%% extra spacing between verses
			}} 
           		\line { "4  "
			   \column {	     
				   "But the soul in contemplation"
				   "    Utters earnest prayer and strong,"
				   "Bursting at the Resurrection"
				   "                                    Into song."
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

\markup { \hspace #34   %%add space as necc. to center the column
          \column { 
			\hspace #1 
           		\line { "5  "
			   \column {	     
				   "Soul and body reunited"
				   "    Thenceforth nothing shall divide,"
				   "Waking up in Christ's own likeness"
				   "                                    Satisfied."
				   "         " %%% extra spacing between verses
			}}
           		\line { "6  "
			   \column {	     
				   "O the beauty, O the gladness"
				   "    Of that Resurrection day,"
				   "Which shall not through endless ages"
				   "                                    Pass away!"
				   "         " %%% extra spacing between verses
			}}
           		\line { "7  "
			   \column {	     
				   "On that happy Easter morning"
				   "    All the graves their dead restore;"
				   "Father, sister, child, and mother"
				   "                                    Meet once more."
				   "         " %%% extra spacing between verses
			}}
           		\line {"8. "
			  \column {	     
				  "To that brightest of all meetings"
				  "    Bring us, Jesu Christ, at last,"
				  "By thy Cross, through death and judgement,"
				  "                                    Holding fast."
			}}
	  }
} %%% lyric markup bracket

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne g'1 g \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo c1 b \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree e1 d  \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  c1 g \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
      \context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       } %% close layout

%%% Amen Midi

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 84 2) }} 

}
	
} %%% book bracket
