%%% 033.png
%%% Hymn 3 Alternative Version "Behold the Bridegroom cometh"
%%% Version 3 Reset Fonts.


\version "2.10.19"


\header {
	dedication = \markup { \center-align { "THE CHRISTIAN YEAR - ADVENT"
		\hspace #0.1
	                                     }}
	title="3"
	arranger = \markup { \small { \smallCaps "Tallis'" \italic "Original Version."} }
	subtitle=\markup { \smallCaps "Alternative Version" "(melody in the tenor)"}
	tagline = ""
}


noacci = \once \override Accidental #'transparent = ##t

global =  {
  
  \time 4/2 
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { \once \override Staff.TimeSignature #'stencil = ##f
 \partial 1 e1 | g2 fis2 e2 e2 | e2 dis2 e2 g2 | fis2 e2 e2 dis!2 | e1 b'2\rest \bar "||" g2 | \break
 c2 b2 a2 a2 | a2 gis2 a2 c2 | b2 a2 a2 gis!2 | a1 b2\rest \bar "||" fis2 | \break
 b2 a2 d,2 \noacci g2 | g2 fis2 g2 b2 | a2 g2 g2 fis2 | g1 b2\rest \bar "||" g2 | \break
 d2 e2 fis2 a2 | g2 fis4( e4)  dis2 e2 | \time 3/1 g2 fis2. e4 e1 dis2 | e1 \bar "||" 
}

alto = \relative c' { \once \override Staff.TimeSignature #'stencil = ##f
 b1 | b2 b2 b2 a2 | b2. b4 b2 b2 | b2 g4( a4) b2 b2 | b1 s2 \bar "||" e2 | 
 e2 e2 e2 e2 | e2 e2 e2 e2 | e2 c4( \noacci d4) e2 e2 | e1 s2 \bar "||" d2 | 
 d2 d2 d2 c2 | d2 d2 d2 d2 | d2 b4( c4) d2 d2 | d1 s2 \bar "||" b2 |
 b2 b2 d2 d2 | b2 b2 b2 b2 | g2 \noacci d'2 b1. b2 | b1 \bar "||" 
}

tenor = \relative c { \clef bass \once \override Staff.TimeSignature #'stencil = ##f
 e1 | e2 fis2 g2 e2 | fis2. fis4 e2 e2 | d2 e2 fis2 fis2 | e1 d2\rest \bar "||" e2 |
 a2 b2 c2 a2 | b2 b2 a2 a2 | g2 a2 b2 b2 | a1 d,2\rest \bar "||" d2 | 
 g2 a2 b2 g2 | a2 a2 g2 g2 | \noacci fis2 g2 a2 a2 | g1 d2\rest \bar "||" g2 |
 fis2 g2 a2 fis2 | g2 g2 fis2 e2 | e2 d2 e1 fis1 | e1 \bar "||" 
}

bass = \relative c { \clef bass \once \override Staff.TimeSignature #'stencil = ##f
 \once \override NoteColumn #'force-hshift = #0.02 e1 | e2 d2 e2 c2 | b2. b4 e2 e2 | b2 c2 b2 b2 | 
     \once \override NoteColumn #'force-hshift = #0.02 e1 s2 \bar "||" e2 | 
 a,2 gis2 a2 a2 | e'2 e2 a,2 a2 | e'2 f2 e2 e2 | a,1 s2 \bar "||" d2 | 
 \noacci g,2 d'2 g2 e2 | d2 d2 g,2 g2 | d'2 e2 d2 d2 | g,1 s2 \bar "||" e'2 |
 b2 e2 d2 d2 | e2 e2 b2 e2 | b'2. a4 \slurUp \once\override Slur  #'control-points = #'(( 1 . 2.3 ) ( 2.5 . 2.5 ) ( 4.8 . 2 ) (7.2 . 1.2 ))  g2( 
            \slurUp \override Slur #'line-thickness = #'2.5  
            \once\override Slur  #'control-points = #'(( 1.6 . 0.8 ) ( 3.5 . 0.5 ) ( 4.4 . 0 ) (5.6 . -0.5 )) 
            \slurDotted e2)( b1) | \once \override NoteColumn #'force-hshift = #0.02 e1 \bar "||" 
}

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
  top-margin = 1\mm
  bottom-margin = 2\mm
  between-system-padding = 2\mm
  before-title-space = 0\mm
  after-title-space = 1.5\mm
  print-page-number = ##f
  between-system-space = #0.5
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
%		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	}
	
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 69 2)
            }
       }	
}

\markup { ""}  %%spacer

\markup{ \hspace #12
  \override #'(line-width . 81)
  \justify{ \small {"    [" \italic { This version may be used, in connexion with the other, for one or more verses; it is
intended for the \upright \smallCaps "choir alone" and must be sung without the organ. " "This version should
only be attempted by good choirs. \upright "]" } } } }

\markup { \column { \line{ \hspace #0.2 } \line{ \small {\hspace #28 \smallCaps "'Kingsfold'" \italic "(No. 574) is also suitable to this hymn."} } } }

\markup {  \hspace #0  %%add space as necc. to center the column
       \fill-line { 

          \column {
	%%next line is for attributions	  
	  \hspace #1
	  \line { \hspace #36 \small \italic "Horologion.  c. 8th cent.  Tr. G. Moultrie."}
		  \hspace #0.2
		  \line { \small {\hspace #20 "Ἰδοὺ ὀ Νυμφἱος ἔρΧεται.  [Idou o Numphios erchetai.]"} }
	  \hspace #0.2          
          \column {
		  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "B" }   %%Drop Cap goes here
			 \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
			\column  { \raise #0.0 "EHOLD the Bridegroom cometh in the middle of the night,"
                                               "  And blest is he whose loins are girt, whose lamp is burning bright;" } }          
	          \line { \hspace #2.7  %%adjust hspace until this line left edge is flush with Drop Cap
			\lower  #1.56  %%adjust this until the line spacing looks right
			\column {   
				"But woe to that dull servant, whom the Master shall surprise"
				"With lamp untrimmed, unburning, and with slumber in his eyes."
			  		}}
	           } %% finish stanza 1
	  }
      } 
}   

%%fake score block to occupy space and force a pagebreak.  Can't think of a better way of doing this.
\score{
{ s4 }
\header { breakbefore = ##f piece = " " opus = " " }
\layout{
\context { \Staff
\remove Time_signature_engraver
\remove Key_engraver
\remove Clef_engraver
\remove Staff_symbol_engraver
}}}

%%second page	

\markup { \hspace #0   %%add space as necc. to center the column  
	 \fill-line { 

          \column {
	   \hspace #0.1 % adds vertical spacing between verses   	  
           \line { "2  "
             \column {	     
		     	"Do thou, my soul, beware, beware, lest thou in sleep sink down,"
			"Lest thou be given o'er to death, and lose the golden crown;"
			"But see that thou be sober, with a watchful eye, and thus"
			"Cry—'Holy, holy, holy God, have mercy upon us.' "
	   }}
	   \hspace #0.1 % adds vertical spacing between verses  
           \line { "3  "
             \column { 
		     "That day, the day of fear, shall come; my soul, slack not thy toil,"
		     "But light thy lamp, and feed it well, and make it bright with oil;"
		     "Who knowest not how soon may sound the cry at eventide,"
		     "'Behold, the Bridegroom comes! Arise! Go forth to meet the bride.'"  
	   }}
	  
	   \hspace #0.1 % adds vertical spacing between verses   
          \line { "4. "
             \column {	     
		     "Beware, my soul; beware, beware, lest thou in slumber lie,"
		     "And, like the Five, remain without, and knock, and vainly cry;"
		     "But watch, and bear thy lamp undimmed, and Christ shall gird thee on"
		     "His own bright wedding-robe of light—the glory of the Son."
	   }}
	  }
    }	  
}

%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                     << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne e1 e1 \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo c1 b1 \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                        <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree a'1 gis1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  a1 e'1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 69 2) }}  %%Amen midi 

} 	

} %% book bracket