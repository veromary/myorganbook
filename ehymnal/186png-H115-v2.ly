%%%% 186.png
%%%% Hymn 115. Stabat Mater. At the Cross her station keeping.
%%%% Rev 2

\version "2.10"
\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - PASSIONTIDE: GOOD FRIDAY"
	\hspace #0.1 }}	
	
  title = "115"
  
  poet = \markup { \small {  \line { \sans { \smallCaps "STABAT MATER."} \hspace #1 \roman {"(8 8 7. D.)"}} }}
  
  meter = \markup { \small { \italic {Slow and solemn} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 50.} }
  
  arranger = \markup { \small \italic "French Church Melody." }
  
  tagline =""
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
	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {  
  \fdstartrepeat f2 g a g | a c bes a ^\fermata \bar "||" a g f e | \break
  d e d c ^\fermata \bar "||" g' f g a | g2. f4 f1 ^\fermata \fdendrepeat

} 
   
alto = \relative c' {  
  \fdstartrepeat c2 e f g | f c d4( e) f2 \bar "||" f e d c |
  b c b c \bar "||" d d e f | f2 e4( f) c1 \fdendrepeat
}

tenor = \relative c {\clef bass 
  \fdstartrepeat a'2 c c c | c a bes c | c c a g | 
  g g g4( f) e2 \bar "||" g a c c | c c a1 \fdendrepeat
}

bass = \relative c {\clef bass 
  \fdstartrepeat f2 c f e | f a g f_\fermata \bar "||" f c d e4( f) |
  g2 c, g c_\fermata \bar "||" bes! d c a | c c f1_\fermata \fdendrepeat  
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

	
%%% A separate score to unfold the repeat and generate the Hymn Midi	

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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 50 2)}} 

} %%% Score bracket

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

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f1 f \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo d1 c \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree bes'1 a \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  bes1 f' \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 50 2) }} 

}
	
%%% alternative hymns also suitable

\markup { \hspace #42 \italic "Or the following: " }

\markup { \hspace #32 \small  "510  We sing the praise of him who died." }

} %%% book bracket