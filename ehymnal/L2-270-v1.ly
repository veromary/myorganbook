%%%% 418.png
%%%% Hymn 270. HUDDERSFIELD. Holy Father, cheer our way
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—EVENING"
	\hspace #0.1 }}	
	
	title = "270"   
  
  poet = \markup { \small {  \line { \sans { "HUDDERSFIELD."} \hspace #1 \roman {"(7 7. 7 5.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"2" #0.5 = 76.} }
  
  arranger = \markup { \small { \smallCaps "W. Parratt." }}
  
  tagline = ""
}


%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01		      

%%% pushes notecolumn slightly to the right

push = \once \override NoteColumn #'force-hshift = #0.4	      
	      
%%% same as above but uses X-offset. When two notes are stacked in one notecolumn and both need to be moved, force-hshift 
%%% does not work for both, so X-offset must be used for one of the two notes to be moved.

pushb = \once \override NoteHead #'X-offset = #0.8 
	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions


%%% SATB voices

global = {
  \time 4/2
  \key d \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 1 fis2 a2 | g2 fis2 e2 fis2 | d2 ( e2 ) \breathmark \bar "||" fis2 g2 | a2 ais2 b2 cis2 | cis1 \breathmark \bar "||" \break
  d2 cis2 | b2  a2 g2 fis2 | b1 \breathmark \bar "||" d,2 e2 | fis2 ( \push a1 ) a2 | a1 \bar "||" 
}
   
alto = \relative c' {  
  d2 e2 | d2 cis2 b2 cis2 | d2 ( cis2 ) \bar "||" d2 d2 | fis2 fis2 fis2 eis2 | fis1 \bar "||" 
  d2 e2 | fis2 b,2 e2 dis2 | e1 \bar "||" d2 d2 | d2 ( a2 b2 ) cis2 | d1 \bar "||"
}

tenor = \relative c {\clef bass 
  a'2 a2 | b2 fis2 g2 g2 | fis2 ( a2 ) \bar "||" a2 b2 | cis2 cis2 b2 gis2 | ais1 \bar "||"
  fis2 ais!2 | b2 b2 b2 a2 | g1 \bar "||" b2 g2 | \push fis1 ( g2 ) e2 | fis1 \bar "||"
}

bass = \relative c {\clef bass 
  d2 cis2 | b2 a2 g2 a2 | b2 ( a2 ) \bar "||" d2 g2 | fis2 e2 d2 cis2 | fis1 \bar "||" 
  b,2 cis2 | d2 dis2 e2 fis2 | \merge g1 \bar "||" g,2 g2 | \pushb a1. a2 | d1 \bar "||" 
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 76 2) }}      
  	
	
} %%% Score bracket

%%% Hymn Note markup

\markup { \hspace #22 \smallCaps "Note" \hspace #-1.2 ".—" \italic "This hymn may also be sung to" \smallCaps "Capetown" "(" \hspace #-1 \italic "No." "501)." }

%%% Lyric attributions and titles

\markup { "                " }

\markup { \small { \hspace #74 \italic "R. H. Robinson, 1842-92." }}

%%% Lyrics

%%% Main lyric block
%%% To fit on one page, lyrics are in 3 columns: column 1 (verses ), column 2 (a dividing line), column 3 (verses)

\markup { \hspace #10  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.4 \column { \lower #2.4 \fontsize #8 "H" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "OLY Father, cheer our way"
			                                 "  With thy love's perpetual ray;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Grant us every closing day"
					   "        Light at evening time."
					   "      " %%% adds vertical spacing between verses
			  		}}
		      } 
		      	\line {  "2  "
			   \column {
				   "Holy Saviour, calm our fears"
				   "When earth's brightness disappears;"
				   "Grant us in our latter years"
				   "        Light at evening time."
				   "      " %%% adds vertical spacing between verses
		       }}
		}  %% finish Page column 1
		
	\hspace #2 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -22 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #2 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
			\line {"3  "
			   \column {	     
				   "Holy Spirit, be thou nigh"
				   "When in mortal pains we lie;"
				   "Grant us, as we come to die,"
				   "        Light at evening time."
				   "               " %%% add vertical spacing between verses
			}}
			\line {"4. "
			    \column {	     
				    "Holy, blessèd Trinity,"
				    "Darkness is not dark with thee;"
				    "Those thou keepest always see"
				    "        Light at evening time."
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
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne  d1 fis1  \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo \merge d1 d1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree b'1 a1   \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 76 2) }}  %%Amen midi       
       
}  


} %%% book bracket
