%%%048.png
%%%Hymn 13 When came in flesh the incarnate Word"
%%% Version 2 048png-H13-v2.ly Fonts reset.

\version "2.10"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - ADVENT"
		\hspace #0.1 }}	
  title = "13"
  poet = \markup { \small {  \line { \sans {"WALSALL."} \hspace #1 \roman {"(C. M.)"}} }}
  meter = \markup { \small { \italic {Slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 58.} }
  arranger =  \markup { \small { \italic "Attributed to" \smallCaps "H. Purcell, 1658-1695."  } }
  tagline =""
}     
 

global =  {
  \time 4/2 
  \key aes \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
  \partial 2 f2 | aes2 g4( f4) c2 c'2 | bes4( aes4) g2  f2^\fermata \bar "||" aes2 | \break
  f2 e2 f4( g4) aes4( bes4) | c1. \bar "||" c2 | c2 c2 bes2 aes4( g4) | \break
  f2 bes4( aes4)  g2^\fermata \bar "||" c2 | f,4( e4) f4( g4) aes4( bes4) g4.( f8) | 
       \once \override Dots #'transparent = ##t f1. \bar "||"
}

alto = \relative c' {
  c2 | c2 c2 c2 f2 | des2 bes2  aes2 \bar "||" f'2 | 
  c2 bes2 c2 f2 | e1. \bar "||" ees2 | ees2 ees2 ees2 ees2 | 
  des2 f2  ees2 \bar "||" ees2 | des2 f2 f2 e!2 | 
      \once \override NoteColumn #'force-hshift = #-0.01 f1. \bar "||"
}

tenor = \relative c { \clef bass
  aes'2 | f2 f2 e2 aes2 | f2 e2  f2 \bar "||" c'2 | 
  aes2 bes2 aes2 f2 | g1. \bar "||" aes2 | aes2 aes2 g2 aes2 | 
  aes2 des2  bes2 \bar "||" aes2 | aes2 des2 c4( des4) bes2 | aes1. \bar "||"
}

bass = \relative c { \clef bass
  f,2 | f'2 aes,2 c2 f,2 | bes2  c2  f2 _\fermata \bar "||" f2 |
  aes2 g2 f2 des2 | c1. \bar "||" aes2 | c2 aes2 ees'2 c2 | 
  des2 bes2  ees2_\fermata \bar "||" aes,2 | des2 bes2 c4( bes4) c2 | f,1. \bar "||" 
}


#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
  top-margin = 3\mm
  bottom-margin = 5\mm
  print-page-number = ##f
  between-system-space = #0.1
  after-title-space = 2\mm
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
		\context { \Score timing = ##t }
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	}
	
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 58 2)
            }
       }	
}
	
\markup {  \hspace #2.4  %%add space as necc. to center the column
       \fill-line { 

          \column {
	%%next line is for attributions	  
	  \hspace #1
	  \line { \hspace #26 \small \italic "J. Anstice, 1808-36."}
	  \hspace #0.2          
          \column {
		  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "W" }   %%Drop Cap goes here
			 \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
			\column  { \raise #0.0 "HEN came in flesh the incarnate Word," "  The heedless world slept on," } }          
	          \line { \hspace #2.7  %%adjust hspace until this line left edge is flush with Drop Cap
			\lower  #1.56  %%adjust this until the line spacing looks right
			\column {   
				"And only simple shepherds heard"
				"    That God had sent his Son."
			  		}}
	           } %% finish stanza 1

	   \hspace #0.1 % adds vertical spacing between verses
           \line { "2  "
             \column {	     
		     "When comes the Saviour at the last,"
		     "    From east to west shall shine"
		     "The awful pomp, and earth aghast"
		     "    Shall tremble at the sign."   
	   }}
	   
	   \hspace #0.1 % adds vertical spacing between verses
           \line { "3  "
             \column {	     
		     "Then shall the pure of heart be blest;"
		     "    As mild he comes to them,"
		     "As when upon the Virgin's breast"
		     "    He lay at Bethlehem:"   
	   }}
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

           \line { "4  "
             \column { 
		     "As mild to meek-eyed love and faith,"
		     "    Only more strong to save;"
		     "Strengthened by having bowed to death,"
		     "    By having burst the grave."     
	   }}
	  \hspace #0.1 % adds vertical spacing between verses   
          \line { "5  "
             \column {	     
		     "Lord, who could dare see thee descend"
		     "    In state, unless he knew"
		     "Thou art the sorrowing sinner's friend,"
		     "    The gracious and the true?" 
	   }}
	   
	  \hspace #0.1 % adds vertical spacing between verses   
          \line { "6. "
             \column {	     
		     "Dwell in our hearts, O Saviour blest;"
		     "    So shall thine advent's dawn"
		     "'Twixt us and thee, our bosom-guest,"
		     "    Be but the veil withdrawn."
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
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f1 f1 \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo des1 c1 \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree bes'1 a1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  bes1 f1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 58 2) }}  %%Amen midi 

} 	
	

\markup {\hspace #33 \small  \column {
	\line{ \hspace #5 \italic "The following are also suitable:"}
	\hspace #0.1
	"374  Christian, seek not yet repose."  
	"462  O quickly come, dread Judge of all."
	"487  That day of wrath, that dreadful day."
	"492  The Lord will come and not be slow."
	"495  The world is very evil."
	"504  Thy kingdom come! on bended knee."
	"518  Ye servants of the Lord."
	"554  Thy kingdom come, O God."
	"647  Litany of the Advent."
	"734  The Advent Antiphons."
	"735  Drop down ye heavens." }}   

} %% book bracket