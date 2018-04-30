%%%107.png
%%%Hymn 50 Modern Tune Andernach This day the first of days was made
%%%Version 3

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - FROM THE EPIPHANY TILL LENT"
		\hspace #0.1 }}	
		title = \markup { "50 " \large \smallCaps "(Modern Tune)" }
  meter = \markup {  \small { \column {  \line { \sans {"ANDERNACH."} \hspace #1 \roman {"(L. M.)"}}
                                        \line { \italic {In moderate time, dignified} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 78.}}}}   
  arranger =  \markup {  \small \center-align {
		            \line{ \hspace #1 } 
  			    \line { \italic  "Andernach Gesangbuch, 1608."}}}
  tagline =""
}

%%%%%%%%%%%%%%%%% Macro Definitions

%%% For setting a partial measure in the middle of the music--the manual recommends this rather than \partial
%%% This setting indicates a measure where 2 1/2 notes have already past, a half measure in 4/2 time
halfmeasure =  \set Score.measurePosition = #(ly:make-moment 2 2)

%%% pushes notes slightly to the right
push = \once \override NoteColumn #'force-hshift = #0.5

%%%%%%%%%%%%%%%%% End of Macro Definitions

%%% SATB voices

global = {
  \time 4/2 
  \key g \major 
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  %%% suppress printing of time signature once (there is a need for a time-signature later)	
  \once \override Staff.TimeSignature #'stencil = ##f 
  \partial 1 g'1^\markup { \italic "To be sung in unison." } | g2 g2 fis2 d2 | 
      \once \override NoteColumn #'force-hshift = #1.6 
      e1 \push fis1 | g1^\fermata \bar "||" b1 | \break
  \push a1 \push c1 | b2 a2 g2 a2 | b1.^\fermata \bar "||" g2 | a2 g2 a2 b2 | \break
  g2 a2 g1 \bar "||"  \halfmeasure b1 | \push d1. c2 | \time 3/1 b2 g2 \push <b g>1 a1 | g1 \bar "||"
}

alto = \relative c' { 
  \once \override Staff.TimeSignature #'stencil = ##f
  d1 | d2 <d b>2 c2 d2 | d2 c2 b2 a2 | <d b>1 \bar "||" <g d>1 |
  d2 fis2 g2 <d a'>2 | <g d>2 <fis d>2 d2 <fis d>2 | <g d>1. \bar "||" e2 | fis2 e2 fis2 fis2 |
  e2 <e c>2 e1 \bar "||" \halfmeasure <g d>1 | a2 g2 fis2 a2 | \time 3/1 g2 e2 d2 e2 fis1 | d1 \bar "||"

}

tenor = \relative c { \clef bass 
  \once \override Staff.TimeSignature #'stencil = ##f
  b'2 a2 | g2 d2 fis2 g2 | g1 d'2 c2 | <b g>1 \bar "||" b1 |
  \push d1 c2 a2 | g2 a2 b2 a2 |  
      \once \override NoteHead #'X-offset = #-0.8 
      \once \override Dots #'transparent = ##t
      g1. \bar "||" b2 | d2 b2 d2 d2 |
  b2 a2 b1 \bar "||" \halfmeasure g1 | \push d'1. <a e'>2 | \time 3/1 d2 c2 <b g>1 <d a>1 | <b g>1 \bar "||"
}

bass = \relative c { \clef bass 
  \once \override Staff.TimeSignature #'stencil = ##f
  g2 a2 | b2 g2 a2 b2 | c1 \push d1 | g,1_\fermata \bar "||" g'1 |
  fis2 d2 e2 fis2 | g2 d2 b2 d2 | \once \override NoteHead #'X-offset = #-1.7  g1._\fermata \bar "||" e2 | d2 e2 d2 b2 |
  e2 a,2 e'1 \bar "||" \halfmeasure \once \override NoteColumn #'force-hshift = #-0.01 g1 | fis2 e2 d2 a2 | \time 3/1 b2 c2 d1 d1 | g,1 \bar "||"
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
	\context Voice = altos    {\voiceTwo \global \alto }
	                      >>       
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \tenor }
	\context Voice = basses { \voiceTwo \global \bass }
			        >> 
 >>
 
\layout {
	indent=0
%	\context { \Score timing = ##f }
	\context { \Score \remove "Bar_number_engraver" }
        %%% time-engraver is not removed like in other pieces as there is a time-signature change halfway through the piece
%%	\context { \Staff \remove "Time_signature_engraver" }
	\context { \Score \remove "Mark_engraver"  }
        \context { \Staff \consists "Mark_engraver"  }
	}
	
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 76 2)
            }
       }
	
} %%% score bracket

%%% Text markups - lyrics titles

\markup { \hspace #12 \italic "This tune is set in the Andernach Gesangbuch to the hymn 'Vexilla Regis' (No. 94)." }

\markup {
	\column { \small {
		\line { \hspace #10 \smallCaps "Office Hymn." \italic "Sunday," "M." \hspace #45  \center-align { \italic "Ascribed to St. Gregory the Great,"
		                                                                                                      \italic "6th cent.  Tr. Y. H." } }
	    \line { \hspace #42 \small "Primo dierum omnium."}
} } } 

%%% Main lyrics markup block
  
\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HIS day the first of days was made,"  "  When God in light the world arrayed;"} }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Or when his Word arose again,"
					   "And, conquering death, gave life to men."
			  		}}
			       
			           } %% finish stanza 1	
		       \hspace #1 
           		\line { "2  "
			   \column {	     
				   "Slumber and sloth drive far away;"
				   "Earlier arise to greet the day;"
				   "And ere its dawn in heaven unfold"
				   "The heart's desire to God be told:"
			}}		
		}  
}	  

%%%fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
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
%%% Continuation of lyrics

\markup { \hspace #30   %%add space as necc. to center the column
          \column { 
		  \line { "3  "
		    \column {	     
			    "Unto our prayer that he attend,"
			    "His all-creating power extend,"
			    "And still renew us, lest we miss"
			    "Through earthly stain our heavenly bliss."
			}}
		\hspace #1 % adds vertical spacing between verses  
           	\line {"4  "
		    \column {	     
			    "That us, who here this day repair"
			    "To keep the Apostles' time of prayer,"
			    "And hymn the quiet hours of morn,"
			    "With blessèd gifts he may adorn."
			}} 
		\hspace #1 % adds vertical spacing between verses  
           	\line {"5  "
		    \column {	     
			    "For this, Redeemer, thee we pray"
			    "That thou wilt wash our sins away,"
			    "And of thy loving-kindness grant"
			    "Whate'er of good our spirits want:"
		}}
							\hspace #1 % adds vertical spacing between verses  
           	\line {"6  "
		    \column {	     
			    "That exiles here awhile in flesh"
			    "Some earnest may our souls refresh"
			    "Of that pure life for which we long,"
			    "Some foretaste of the heavenly song."
		}}
							\hspace #1 % adds vertical spacing between verses  
           	\line {"7. "
		    \column {	     
			    "O Father, that we ask be done,"
			    "Through Jesus Christ, thine only Son;"
			    "Who, with the Holy Ghost and thee,"
			    "Doth live and reign eternally.     Amen."
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

%%% Amen midi       
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 76 2) }}    
       
}  

} %%book bracket
