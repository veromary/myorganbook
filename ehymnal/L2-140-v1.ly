%%%% 228.png
%%%% Hymn 140 Lincoln. Lord, in thy name thy servants plead
%%%% Rev 1

\version "2.10"
\header {
  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - ROGATION DAYS"
	\hspace #0.1 }}	
	
  title = "140"
  
  poet = \markup { \small {  \line { \sans { \smallCaps "LINCOLN."} \hspace #1 \roman {"(C. M.)"}} }}
  
  meter = \markup { \small { \italic {Moderately slow} \general-align #Y #DOWN \note #"2" #0.5 = 66.} }
  
  arranger = \markup { \small \italic "Ravenscroft's Psalter, 1621." }
  
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% macro to cope with a partial measure in the middle of a piece.
%%% Manual does not recommend using \partial in the middle of a piece.
%%% In this case, the macro specifies that 0 of 1/2 notes in a 4/2 measure have past,
%%% hence we are restarting at the beginning of a measure, and the previous partial measure is 
%%% considered complete
startmeasure =  \set Score.measurePosition = #(ly:make-moment 0 2)
	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {  
  \startmeasure g'1 a2 b | a g g fis | g1 \bar "||" g | d'2 c c b | c1^\fermata \bar "||" \break
  \startmeasure c1 b2 a | gis a b b | a1 \bar "||" g | e2 g g fis | g1^\fermata \bar "||"
} 
   
alto = \relative c' {  
  d1 d2 d | d b e d | d1 \bar "||" d | g2 g d d | e1 \bar "||" \break
  g1 g2 e | e e f e4( d) | c1 \bar "||" c | e2 d e d | d1 \bar "||"
}

tenor = \relative c {\clef bass 
  b'1 a2 g | fis g c a | b1 \bar "||" b | b2 c a g | g1 \bar "||"
  e'1 d2 c | b a a gis | a1 \bar "||" e | g2 g c4( b) a2 | b1 \bar "||"
}

bass = \relative c {\clef bass 
  g'1 fis2 g | d e c d | g,1 \bar "||" g1 | g'2 e f g | c,1 _\fermata \bar "||" 
  c1 g2 a | e' c d e | a,1 \bar "||" c1 | c2 b c d | fis,1_\fermata \bar "||"}

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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2)}} 	
	
} %%% Score bracket

%%% Lyric Attribution 

\markup { \small { \hspace #72 \italic "J. Keble, 1792-1866." } }
 
%%% Main lyric block

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %%% one super column for the entire block of lyrics
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "L" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ORD, in thy name thy servants, plead,"
			                                "  And thou hast sworn to hear;" } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Thine is the harvest, thine the seed,"
					   "    The fresh and fading year."
					   "      " %%% add vertical spacing between verses
			  		}} 
			         } %%% finish verse 1	
           		\line { "2  "
			   \column {	     
				   "Our hope, when autumn winds blew wild,"
				   "    We trusted, Lord, with thee;"
				   "And still, now spring has on us smiled,"
				   "    We wait on thy decree."
				   "      " %%% add vertical spacing between verses
			}}
           		\line { "3  "
			   \column {	     
				   "The former and the latter rain,"
				   "    The summer sun and air,"
				   "The green ear, and the golden grain,"
				   "    All thine, are ours by prayer."
				   "      " %%% add vertical spacing between verses
			}}
           		\line { "4  "
			   \column {	     
				   "Thine too by right, and ours by grace,"
				   "    The wondrous growth unseen,"
				   "The hopes that soothe, the fears that brace,"
				   "    The love that shines serene."
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
           		\line { "5.  "
			   \column {	     
				   "So grant the precious things brought forth"
				   "    By sun and moon below,"
				   "That thee in thy new heaven and earth"
				   "    We never may forgo."
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
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree e1 d \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2) }} 

}
	
%%% alternative hymns also suitable

\markup {\hspace #36 \column {
	\line{ \hspace #2 \italic "The following are also suitable:"}
	\hspace #0.1 
	\small {
		"  75  Jesu, Lord of life and glory."
		"384  Eternal Ruler of the ceaseless round."
		"423  Judge eternal, throned in splendour."
		"447  O God of Bethel, by whose hand."
		"475  Rejoice, O land, in God thy might."
		"492  The Lord will come and not be slow."
		"558  God of our fathers."
		"650  Litany for Rogationtide."
		"651  Litany of the Church." 
	
	}
}} 

} %%% book bracket
