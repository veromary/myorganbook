%%% 147png
%%% Hymn 83 Bedford O Help us Lord; each hour of need
%%% Version 2

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - LENT"
		\hspace #0.1 }}	
  title =  "83"

  meter = \markup { \small {\column {  \line { \sans {"BEDFORD."} \hspace #1 \roman {"(C. M.)"}}
                                       \line { \italic {Very slow and dignified} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 63.}
                                  }
                  }}
 
  arranger =  \markup { \small {\center-align {
		            \line{ \italic "Original form of melody by" }
			    \line { \smallCaps "W. Weale," \italic "d." "1727." }
  		} } }
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01

%%% generates the breathmarks

breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
        \override Score.RehearsalMark #'Y-offset = #'4.0
        \override Score.RehearsalMark #'X-offset = #'-0.5
        \mark \markup {\fontsize #4 ","}
}	      

%%% Push notecolumn a little to the right

push = { \once \override NoteColumn #'force-hshift = #0.8 }
      
%% Used to pull an upstem note left. Used when a slurred note pair straddles a longer note below and when notecolumn force-hshift does not work 
topstraddle = { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.5 
              \once \override Stem #'X-offset = #-0.2 }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro Definitions

%%% SATB Voices

global = {
  \time 3/2
  \key ees \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 2 bes'2 | g1 ees2 | c'1 bes2 | aes2 g1 | f1 \breathmark \bar "||" bes2 | \break
  ees1 d2 | c2 c1 | bes1 ^\fermata \bar "||" g2 | aes1 bes2 | c1 bes2 | \break
  aes2 g1 | f1 \breathmark \bar "||" bes2 | ees1 g,2 | aes2 f1 | ees1 \bar "||"
}

alto = \relative c' { 
  g'2 | ees1 ees2 | ees1 ees2 | d2 ees1 | d1 \bar "||" f2 |
  g1 g2 | g2 f1 | d1 \bar "||" ees2 ees1 g2 | aes1 f2 |
  ees2 ees1 | \merge f1 \bar "||" d2 | ees1 ees2 | \push ees1 d2 | \merge ees1 \bar "||"
}

tenor = \relative c { \clef bass
  bes'2 | bes1 bes2 | c1 ees2 | aes,2 bes1 | bes1 \bar "||" bes2 |
  bes1 bes2 | bes1 a2 | bes1 \bar "||" bes2 | aes1 ees'2 | ees1 des2 |
  c2 \topstraddle bes2( c2) | d!1 \bar "||" bes2 | bes1 g2 | c2 bes1 | g1 \bar "||" 
}

bass = \relative c { \clef bass
  ees2 | ees1 g2 | aes1 g2 | f2 ees1 | bes1 \bar "||" d2 |
  ees1 g2 | ees2 f1 | bes,1 _\fermata \bar "||" ees2 | c1 ees2 | aes,1 bes2 |
  c2 ees1 | bes1 \bar "||" bes2 | g1 c2 | aes2 bes1 | << { ees1 } 
      \new Voice = "alt" { \voiceFour 
                           \once \override NoteColumn #'force-hshift = #0.2 
                           \set fontSize = #-3 
			   \override Stem #'length = #4 
                           ees,1 } >> \bar "||" 
}

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##t
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 63 2)}} 

} %%% Score bracket

%%% Lyrics titles

\markup { \hspace #52 \center-align { \line { \smallCaps "Note" \hspace #-1.2 ".—" \italic "This tune is sometimes sung in duple time.  To effect this all the semibreves" } 
                                      \line { \italic "must be counted as minims."} 
}}

\markup { \small { \hspace #70 \italic "H. H. Milman, 1791-1868."  } } 
                                                                                                    
		                                                                                                     
%%% Main lyric block

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %%% one super column for the entire block of lyrics
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "  HELP us, Lord; each hour of need"
			                                "  Thy heavenly succour give;" } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Help us in thought, and word, and deed,"
					   "    Each hour on earth we live."
			  		}} 
			         } %%% finish verse 1	
		  	\hspace #1 
           		\line { "2  "
			   \column {	     
				   "O help us, when our spirits bleed"
				   "    With contrite anguish sore,"
				   "And when our hearts are cold and dead,"
				   "    O help us, Lord, the more."
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

\markup { \hspace #30   %%add space as necc. to center the column
          \column { 
		        \hspace #1 
           		\line { "3  "
			  \column {	     
				  "O help us through the prayer of faith"
				  "    More firmly to believe;"
				  "For still the more the servant hath,"
				  "    The more shall he receive."
			}}
    		        \hspace #1 
           		\line {"4. "
			  \column {	     
				  "O help us, Jesu, from on high,"
				  "    We know no help but thee;"
				  "O help us so to live and die"
				  "    As thine in heaven to be."
			}}
	  }
}% lyric markup bracket


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne ees1 ees1  \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo c1 bes1 \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree aes'1 g1 \bar "||" }}
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
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 63 2) }} 

}


} %%% book bracket
