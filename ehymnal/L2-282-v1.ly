%%%% 431.png
%%%% Hymn 282. HEATHLANDS. Now the busy week is done
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—SATURDAY EVENING"
	\hspace #0.1 }}	
	
	title = "282"   
  
  poet = \markup { \small {  \line { \sans { "HEATHLANDS."} \hspace #1 \roman {"(7 7. 7 7. 7 7)"}} }}
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"2" #0.5 = 72.} }
  
  arranger = \markup { \small { \smallCaps "H. Smart, 1813-79." }}
  
  tagline = ""
}


%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%% Macro for generating two augmentation dots for a notehead. 
%% When dotted notes from two vocal parts share a single notehead, 
%% Lilypond only inserts a single dot. In the image, two dots are used. 
%% This macro generates the two dots by replacing the normal dot glyph 
%% with a new glyph comprising a column of 2 dots one above the other.
 
%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01		      

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key d \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  a'2 d2 cis2 a2 | b2 b2 a1 | g2 e2 fis2 g2 | a2 g4 ( fis4 -) e1 \breathmark \bar "||" 
  a2 a2 fis2 a2 | d2 cis2 b1 | e2 b2 cis2 b4 ( a4 -) | b2 gis2 a1 ^\fermata \bar "||" 
  a2 a2 b2 b2 | cis2 cis2 d1 | b2 a2 g2 fis2 | e2 e2 d1 ^\fermata \bar "||"
}
   
alto = \relative c' {  
  d2 fis2 e2 fis4 ( e4 -) | d2 d2 d1 | d2 e2 d2 d2 | d2 e4 ( d4 -) cis1 \bar "||"
  e2 cis2 fis2 e2 | d2 e2 e1 | e2 e2 e2 fis2 | fis2 e2 e1 \bar "||" 
  fis2 cis2 d2 d2 | g2 fis4 ( e4 -) d1 | d2 d2 d2 d2 | d2 cis2 \merge d1 \bar "||"
}

tenor = \relative c {\clef bass 
  a'2 a2 a2 d4 ( cis4 -) | b2 g2 fis1 | b2 a2 a2 g2 | fis2 b2 e,1 \bar "||" 
  e2 a2 a2 e2 | fis4 ( gis4 -) a2 gis1 | b2 gis2 a2 d4 ( cis4 -) | d2 b2 cis1 \bar "||" 
  cis2 a2 fis2 b4 ( a4 -) | g2 a4 ( g4 -) fis1 | g2 a2 d2 d,4 ( fis4 -) | b2 a4 ( g4 -) fis1 \bar "||"
}

bass = \relative c {\clef bass 
  fis2 d2 a'2 fis2 | g2 b,2 d1 | b2 cis2 d2 b2 | fis2 g2 a1 \bar "||"
  cis2 a2 d2 cis2 | b2 cis4 ( d4 -) e1 | gis2 e2 a2 fis2 | d2 e2 a,1 _\fermata \bar "||" 
  fis'2 fis2 d2 g4 ( fis4 -) | e2 a,2 b1 | g2 fis2 b2 a2 | g2 a2 d1 _\fermata \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 72 2) }}      
  	
	
} %%% Score bracket

%%% Lyric titles and attributions


\markup {  \small {  \hspace #64 \italic "John Samuel Jones." } }

\markup { "                 "}

%%% Lyrics

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.3 \column { \lower #2.4 \fontsize #8 "N" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "OW the busy week is done,"
			                               "  Now the rest-time is begun;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Thou hast brought us on our way,"
					   "Kept and led us day by day;"	
					   "Now there comes the first and best,"
					   "Day of worship, light and rest."
					   "      " %%% adds vertical spacing between verses
			  		}}
								\line {"2  " 
			   \column {	     
				   "Hallow, Lord, the coming day!"
				   "When we meet to praise and pray."
				   "Hear thy word, thy Feast attend,"
				   "Hours of happy service spend;"
				   "To our hearts be manifest,"
				   "Lord of labour and of rest!"
				   "               " %%% add vertical spacing between verses
			}}
		      } 
	} %%% end super column
}



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

%%% Second page
%%% Continuation of lyrics

\markup { \hspace #32 %%add space as necc. to center the column
          \column { %% super column of everything
		  	\hspace #1  % adds vertical spacing between verses 

           		\line { "3  "
			     \column {	     
				     "For thy children gone before"
				     "We can trust thee and adore;"
				     "All their earthly week is past,"
				     "Sabbath-time is theirs at last;"
				     "Fold them, Father, to thy breast,"
				     "Give them everlasting rest."
				     "              " %%% add vertical spacing between verses
			}}
			\line { "4. "
			     \column {	     
				     "Guide us all the days to come,"
				     "Till thy mercy call us home:"
				     "All our powers do thou employ,"
				     "Be thy work our chiefest joy;"
				     "Then, the promised land possest,"
				     "Bid us enter into rest."
			}}

	  }
} %%% lyric markup bracket



%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne  d1 d1  \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo b1 a1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree g'1 fis1   \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  g1 d'1  \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 72 2) }}  %%Amen midi       
       
}  


%%% alternative hymns

\markup {  \line { \hspace #22 \italic "See also:" \hspace #1 \small {\column { "  49  Creator of the earth and sky."
	            					        "164  O Trinity of blessed light."
		     						"465  O what their joy and their glory must be."
								}}}}



} %%% book bracket

