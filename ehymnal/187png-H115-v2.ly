%%%% 187.png
%%%% Hymn 115 Alternative Tune. At the Cross her station keeping.
%%%% Rev 2

\version "2.10"

\header {

  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - PASSIONTIDE: GOOD FRIDAY"

        \hspace #0.1 }} 

  title = \markup { "115 " \large \smallCaps "(Alternative Tune)" }

  meter = \markup { \small {\column {  \line { \sans {"CHRISTI MUTTER STUND VOR SCHMERZEN."} \hspace #1 \roman {"(8 8 7. D.)" }}
                                       \line { \italic {Very slow and solemn} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 58.}
                                  }
                  }}
 
  arranger =  \markup { \small {\center-align {
                            \line { \smallCaps "G. Corner," }
                            \line { \italic "Gesangbuch, 1625." }
                } } }

  tagline =""

}

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01

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

%%% generates the breathmarks

breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
        \override Score.RehearsalMark #'Y-offset = #'4.0
        \override Score.RehearsalMark #'X-offset = #'-0.5
        \mark \markup {\fontsize #4 ","}
}

%%%  Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work            
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-3.0
              \once \override Stem #'X-offset = #-3.0 }

%%%  Small straddle: same as above but moves note a smaller amount            
smallstraddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.2
              \once \override Stem #'X-offset = #-1.2 }	      
	      
%% Used to pull an upstem note left. Used when a slurred note pair straddles a longer note below and when notecolumn force-hshift does not work 
topstraddle = { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.5 
              \once \override Stem #'X-offset = #-0.2 }	      
              
%%%%%%%%%%%%%%%%%%%%%%%%% end of macro definitions

%%% SATB voices

global = {
  \time 3/2
  \key ees \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \fdstartrepeat bes'1 bes2 | c1 bes2 | aes1 g2 | bes1. | g1. \breathmark \bar "||"  bes1 aes2 | g1 g2 | \break
  aes1 g2 | f1. | f1. \breathmark \bar "||" ees1 f2 | g1 aes2 | f1 f2 | ees1.^\fermata \fdendrepeat
}

alto = \relative c' { 
  \fdstartrepeat g'1 g2 | aes1 g2 | f1 ees2 | ees1( d2) | ees1. \bar "||" f1 f2 | d1 ees2 |
  \smallstraddle c2( d) ees | \smallstraddle c( f ees) | d1. \bar "||" c1 d2 | ees1 ees2 | \straddle ees2( d4 c4) d2 | \merge ees1. \fdendrepeat
}

tenor = \relative c { \clef bass
  \fdstartrepeat bes'1 ees2 | ees1 ees2 | c1 c2 | f,1( bes2) | bes1. \bar "||" bes1 c2 | b1 c2 |
  aes1 bes2 | aes1( g2) | f1. \bar "||" \topstraddle ees2( g) bes | bes1 aes2 | bes1 bes4( aes) | g1. \fdendrepeat
}

bass = \relative c { \clef bass
  \fdstartrepeat ees1 ees2 | aes1 ees2 | f1 c2 | bes1. | ees1. \bar "||" d1 f2 | g1 c,2 |
  f1 ees2 | f1. | bes,1. \bar "||" c1 bes2 | \smallstraddle ees( d) c | bes1 bes2 | ees1. _\fermata \fdendrepeat
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

} %%% end score bracket

%%% A separate score block to unfold repeats and generate Hymn Midi     

\score{
\new ChoirStaff 
<<
  \context Staff = upper << 
        \context Voice = sopranos { \voiceOne \global \soprano \soprano }
        \context Voice = altos    { \voiceTwo \global \alto \alto }
                              >>
  \context Staff = lower <<
        \context Voice = tenors { \voiceOne \global \tenor \tenor }
        \context Voice = basses { \voiceTwo \global \bass \bass }
                              >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 58 2)}} 

} %%% end Hymn midi Score 


%%% Lyric Attribution 

\markup { \small { \hspace #74 \center-align { \italic "Ascribed to Jacopone da Todi, d. 1306." 
		                          \italic "Tr. Bishop Mant, Aubrey de Vere, and others." }    	
	} }

\markup { \small { \hspace #52 \center-align { "‘Behold thy Mother.’" 
	                                    "Stabat mater dolorosa." } 
        } } 
	 

%%% Main lyric block

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %%% one super column for the entire block of lyrics
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "A" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "T the Cross her station keeping,"
			                                "  Stood the mournful Mother weeping," } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "    Close to Jesus at the last,"
					   "Through her soul, of joy bereavèd,"
					   "Bowed with anguish, deeply grievèd,"
					   "    Now at length the sword hath passed."
			  		}} 
			         } %%% finish verse 1	
			\hspace #1 
           		\line { "2  "
			   \column {	     
				   "O, that blessèd one, grief-laden,"
				   "Blessèd Mother, blessèd Maiden,"
				   "    Mother of the all-holy One;"
				   "O that silent, ceaseless mourning,"
				   "O those dim eyes, never turning"
				   "    From that wondrous, suffering Son."
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
				   "Who on Christ's dear Mother gazing,"
				   "In her trouble so amazing,"
				   "    Born of woman, would not weep?"
				   "Who on Christ's dear Mother thinking,"
				   "Such a cup of sorrow drinking,"
				   "    Would not share her sorrow deep?"
			}} 
			\hspace #1 
           		\line { "4  "
			   \column {	     
				   "For his people's sins, in anguish,"
				   "There she saw the victim languish,"
				   "    Bleed in torments, bleed and die;"
				   "Saw the Lord's anointed taken;"
				   "Saw her Child in death forsaken;"
				   "    Heard his last expiring cry."
			}} 
			\hspace #1 
           		\line { "5* "
			   \column {	     
				   "In the Passion of my Maker,"
				   "Be my sinful soul partaker,"
				   "    May I bear with her my part;"
				   "Of his Passion bear the token,"
				   "In a spirit bowed and broken"
				   "    Bear his death within my heart."
			}} 
			\hspace #1 
           		\line { "6* "
			   \column {	     
				   "May his wounds both wound and heal me,"
				   "He enkindle, cleanse, anneal me,"
				   "    Be his Cross my hope and stay."
				   "May he, when the mountains quiver,"
				   "From that flame which burns for ever"
				   "    Shield me on the judgement day."
			}} 
    		        \hspace #1 
           		\line {"7. "
			  \column {	     
				  "Jesu, may thy Cross defend me,"
				  "And thy saving death befriend me,"
				  "    Cherished by thy deathless grace:"
				  "When to dust my dust returneth,"
				  "Grant a soul that to thee yearneth"
				  "    In thy Paradise a place."
			}}
	  }
} %%% lyric markup bracket


%% Amen score block

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
        \context Voice = "basses" { \relative c { \clef bass \global \voiceFour  aes1 ees' \bar "||" }}
                                >> 
  >>                          

\header { breakbefore = ##f piece = " " opus = " " }

\layout { 

   \context { 
        \Score timing = ##f }
        ragged-right = ##t
        indent = 15\cm
   \context { \Staff \remove Time_signature_engraver }

       } %% close layout

%%%%%%%%%%%%%% Amen Midi

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 58 2) }} 
}

	
%%% alternative hymns also suitable

\markup { \hspace #42 \italic "Or the following: " }

\markup { \hspace #32 \small  "510  We sing the praise of him who died." }


} %%% book bracket