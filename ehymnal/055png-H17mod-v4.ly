%%%% 055.png
%%% Hymn 17Mod Vom Himmel Hoch
%%% Version 4

\version "2.10.19"

\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - CHRISTMAS"
		\hspace #0.1 }}	
  title = \markup { "17 " \large \smallCaps "(Modern Tune)"}
 
  meter = \markup { \small { \column { \line { \sans "VOM HIMMEL HOCH." \hspace #1 \roman " (L. M.)" } 
                            \line { { \italic "Very slow and dignified" \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 "= 46." } } }} }
 
			    arranger = \markup { \small { \center-align { 
		 \line { \italic "Melody by" \smallCaps "Martin Luther, 1483-1546." }
				 \line { \italic "Adapted by" \smallCaps "J. S. Bach." } }} }
 
  tagline =""
}

%%% SATB voices

global = {
  \time 4/2 
  \key c \major
  \set Staff.midiInstrument = "church organ" 
}

soprano = \relative c' {
  \partial 2 c'2 | b2 a2  b2 g2 | a2 b2  c2^\fermata  \bar "||" \break
  c2 | c2 g2  g2 e4( f4) | g2 f2  e2^\fermata \bar "||" \break
  e2 | a2 a2  g4( a4) b2 | c4( b4) \once \override NoteColumn #'force-hshift = #1.8 a2 
      g2^\fermata \bar "||" \break
  \once \override NoteColumn #'force-hshift = #1.4 c2 | 
      \once \override NoteColumn #'force-hshift = #1.4 b2 
      a2  g2 a4( g4) | f4( e4) d2  c2^\fermata \bar "||" 
}

alto = \relative c' {
  \partial 2 g'2 | g4( fis4) e2  d2 e4( d4) | c2 d2  e2 \bar "||"
  e4( f4) | g4( f4) e2  d2 c2 | c2 d2 c2 \bar "||"
  c4( d4) | e2 d2  d4( fis4) g2 | g2 g4( fis4)  g2 \bar "||"
  e4( d4) | d4( e4) e4( d4)  d4( c4) c2 | c4( a4) b2  c2 \bar "||"
}

tenor = \relative c { \clef bass
  \partial 2 e'2 | d2 c2  b2 c4( b4) | a4( g4) f2 g2 \bar "||"
  g2 | c2 c2  b2 bes4( a4) | g2 g2  g2 \bar "||"
  g2 | g2 fis2  g4( c4) b4( a4) | g4( b4) e4( d4)  b2 \bar "||"
  \once \override NoteColumn #'force-hshift = #1.8 a2 | 
      \once \override NoteColumn #'force-hshift = #1.8 g2 
      g4( f!4) f4( e4) a4( b4) | c2 g4( f4)  e2 \bar "||"
}

bass = \relative c { \clef bass
  \partial 2 c2 | g'2. fis4 g4( f4) e2 | f4( e4) d2 c2_\fermata \bar "||"
  c4( d4) | e2 e4( f4)  g2 g4( f4) | e4( d4) c4( b4)  c2_\fermata \bar "||"
  c2 | cis2 d4( c4)  b4( a4) g2 | e'4( d4) c4( d4)  g2_\fermata \bar "||"
  g4( fis4) | g4( e4) c4( d4)  b4( c4) f4( g4) | a4( f4) g4( g,4)  c2_\fermata \bar "||"
}

#(ly:set-option 'point-and-click #f)

\paper {
 #(set-paper-size "a4")
%% annotate-spacing = ##t
 print-page-number = ##f
 ragged-last-bottom = ##t
 ragged-bottom = ##t
}

\book{

\score{
\new ChoirStaff	
 <<

	\context Staff = upper 
	      << 
	\context Voice = sopranos { \voiceOne \global \soprano }
	\context Voice = altos {\voiceTwo \global \alto }
	      >>
 
	\context Staff = lower 
	       <<
	\context Voice = tenors { \voiceOne \global \tenor }
	\context Voice = basses { \voiceTwo \global \bass }
		>> 
			 

 >>
\layout {
	indent=0
%%		\context { \Score timing = ##f }
	\context { \Score \remove "Bar_number_engraver" }
	\context { \Staff \remove "Time_signature_engraver" }
	\context { \Score \remove "Mark_engraver" }
        \context { \Staff \consists "Mark_engraver" }
	}
	
\midi { 
 \context {
 \Score 
 tempoWholesPerMinute = #(ly:make-moment 46 2)
 }
 }
	
} %%score bracket


%%% Hymn note

\markup { \hspace #30 \italic "See also: " \small "613 Of the Father's heart begotten." }


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


%%% Lyric titles

\markup { \small { \hspace #16 \smallCaps "Office Hymn. M." \hspace #36   \italic "6th cent.  Tr. J. M. Neale." } } 

\markup { \hspace #36 \small "Christe Redemptor omnium."  }


%%% Lyrics

\markup { \hspace #30   %%% add space as necc. to center the column
	       \column { %%% super column for entire block of lyrics
		       \column { %%% verse 1 column
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "J" }   %%Drop Cap goes here
				  \hspace #-1    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ESU, the Father's only Son,"  "  Whose death for all redemption won;"  } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
                                            "Before the worlds, of God most high"
					    "Begotten all ineffably:"
			  		}}
			       
			           } %% finish verse 1
	                \hspace #1
           		\line { "2  "
			   \column {	     
				   "The Father's light and splendour thou,"
				   "Their endless hope to thee that bow;"
				   "Accept the prayers and praise to-day"
				   "That through the world thy servants pay."
			}}
		       \hspace #1 
           		\line { "3  "
			  \column {	     
				  "Salvation's author, call to mind"
				  "How, taking form of humankind,"
				  "Born of a Virgin undefiled,"
				  "Thou in man's flesh becam'st a child."
			}}
			\hspace #1 
           		\line { "4  "
			  \column {	     
				  "Thus testifies the present day,"
				  "Through every year in long array,"
				  "That thou, salvation's source alone,"
				  "Proceededst from the Father's throne."
			}}
			\hspace #1 
           		\line { "5  "
			  \column {	     
				  "Whence sky, and stars, and sea's abyss,"
				  "And earth, and all that therein is,"
				  "Shall still, with laud and carol meet,"
				  "The Author of thine advent greet."
			}}
			\hspace #1 
           		\line { "6  "
			  \column {	     
				  "And we who, by thy precious blood"
				  "From sin redeemed, are marked for God,"
				  "On this the day that saw thy birth,"
				  "Sing the new song of ransomed earth:"
			}}
	   	       \hspace #1 
           		\line { "7. "
			  \column {	     
				  "For that thine advent glory be,"
				  "O Jesu, virgin-born, to thee;"
				  "With Father, and with Holy Ghost,"
				  "From men and from the heavenly host.     Amen."
			}}
	       }	   
	  			   
} %%% end lyrics markup


%%% Amen score block

\score{
 \new ChoirStaff
 <<
 \context Staff = upper \with { fontSize = #-3 \override StaffSymbol #'staff-space = #(magstep -2)} 
	 << 
	\context Voice = "sopranos" { \relative c' { \global
	 \voiceOne f1 e1 \bar "||" }}
	\context Voice = "altos" { \relative c' { \global
	 \voiceTwo c1 c1 \bar "||" }}
	 >>
			 
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3 \override StaffSymbol #'staff-space = #(magstep -2)} 
	 <<
	\context Voice = "tenors" { \relative c { \global \clef bass
	 \voiceThree a'1 g1 \bar "||" }}
	\context Voice = "basses" { \relative c { \global \clef bass 
	 \voiceFour f,1 c'1 \bar "||" }}
			 >> 
 >>			 
\header { breakbefore = ##f piece = ##f opus = ##f tagline = ##f }
\layout { 
	\context { \Score timing = ##f } 
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

 }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 46 2) }} %%Amen midi 
 
} %%% end Amen block 

} %%% book bracket

