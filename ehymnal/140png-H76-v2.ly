%%%140.png
%%%Hymn 76 Heiliger Geist, Lord in this thy mercy's day
%%%Version 2

\version "2.10"

\header {
	dedication = \markup { \center-align { \line {  "THE CHRISTIAN YEAR - LENT" } 
					       \hspace #1
						} }	
  title = "76"
			       
  arranger = \markup { \small { "J. C" \hspace #-1.2 \teeny "RÜGER," "1598-1662."} }
  poet = \markup { \small { \sans  "HEILIGER GEIST" \smallCaps "(Berlin)." \hspace #1 \roman { "(7. 7. 7.)"} } }
  meter = \markup { \small { \italic {Very slow and solemn} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 63.} }
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01

%%% push noteheads a little to the right	   
push = \once \override NoteHead #'X-offset = #1	   
		      
	      
%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro definitions	   
	      
%%% SATB voices

global = {
  \time 3/2
  \key e \minor
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
  e1 g2 | fis1 gis2 | a1 g!2 | \once \override NoteColumn #'force-hshift = #1.5 fis1. \breathmark \bar "||" \push g1 a2 | \break
  \push b1 c2 | b1 a2 | g1. \breathmark \bar "||" b1 g2 fis1 e2 | \push e1 dis2 | e1. \bar "||"
}

alto = \relative c' {
  b1 e2 | \merge fis1 e2 | e1 e2 | e1( dis2) \bar "||" \push e1 ~ e2 ~ |
  e2( d2) g2 | g1 fis2 | \merge g1. \bar "||" fis1 e2 | c1 a2 | \push b1 b2 | b1. \bar "||"
}

tenor = \relative c { \clef bass
  g'1 b2 | b1 b2 | a1 c2 |  \push fis,1. \bar "||" \once \override NoteColumn #'force-hshift = #-0.4 e2( b'2) a2 |
  g2( b) e2 | d1 d2 | b1. \bar "||" b1 b2 | a1 e2 | fis2.( g4) a2 | g1. \bar "||"
}

bass = \relative c { \clef bass
  e1 e2 | dis1 d2 | c1 a2 | \push b1. \bar "||" e1 fis2 |
  g1 a,2 | b2.( c4) d2 | g1. \bar "||" dis1 e2 | a,2.( b4) c2 | \push b1 b2 | e1. \bar "||"
}

pedals = \relative c { \clef bass
	 \set fontSize = #-3 
         \override Stem #'length = #5
	 \override NoteColumn #'force-hshift = #0.2
  s1. | s1. | s1. | s1. \bar "||" s1. |
  s1. | s1. | 
      \override TextScript #'padding = #4
      g1._\markup { \hspace #-6 \normalsize \italic "Ped." \normalsize "in vv. 4 and 5." }  \bar "||" dis1 e2 | s1. | s1. | e1. \bar "||"
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
	\context Voice = pedals { \voiceFour \global \pedals }
			        >> 
 >>
\layout {
		indent=0
%		\context { \Score timing = ##f }
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	}

\midi { 
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 63 2) }
       }	
} %%score bracket

%%% Lyrics titles

\markup { \hspace #20 \smallCaps "Note" \hspace #-1.2 ".—" \italic "Another tune for this hymn will be found in the Appendix." }

\markup { \small { \hspace #74 \italic "Isaac Williams" "‡," \italic "1802-65." } }

%%% Main lyrics markup block
%%% Lyrics in 3 columns,  column 1 (verses), column 2 (a dividing line), column 3 (verses); 

\markup { \hspace #10 %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "L" }   %%Drop Cap goes here
				  \hspace #-1.6    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ORD, in this thy mercy's day,"
			                                 "  Ere it pass for ay away," } }  
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "On our knees we fall and pray."
			  		}}
			       
			           } %%% finish verse 1
		        \hspace #1 
           		\line { "2  "
			   \column {	     
				   "Holy Jesu, grant us tears,"
				   "Fill us with heart-searching fears,"
				   "Ere that awful doom appears."
			}}
			\hspace #1 
           		\line { "3  "
			   \column {	     
				   "Lord, on us thy Spirit pour,"
				   "Kneeling lowly at the door,"
				   "Ere it close for evermore."
			}}
		}  %% finish Page column 1
		
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -27 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
 
           		\line { "4  "
			  \column {	     
				  "By thy night of agony,"
				  "By thy supplicating cry,"
				  "By thy willingness to die;"
			}}
		        \hspace #1 
           		\line {"5  "
			  \column {	     
				  "By thy tears of bitter woe"
				  "For Jerusalem below,"
				  "Let us not thy love forgo."
			}}
			\hspace #1 
           		\line {"6. "
			  \column {	     
				  "Grant us 'neath thy wings a place,"
				  "Lest we lose this day of grace,"
				  "Ere we shall behold thy face."
			}}
	    } %%% end column 3
     } %%% end master-line
   } %%% super column bracket
} %%% lyrics markup bracket

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne e1 e1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo c1 b1 \bar "||" }}
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
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

%%% Amen midi       
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 63 2) }}   
       
}  

} %%book bracket
