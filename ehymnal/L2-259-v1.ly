%%%% 405.png
%%%% Hymn 259. ANGEL'S SONG.  Forth in thy name, O Lord, I go
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—MORNING"
	\hspace #0.1 }}	
	
	title = "259"   
  
  meter = \markup { \small { \column { \line { \sans "ANGEL'S SONG (SONG 34)." \hspace #1 \roman " (L. M.)" } 
  \line { { \italic "In moderate time" \general-align #Y #DOWN \note #"4" #0.5 "= 110" "("\general-align #Y #DOWN \note #"2" #0.5 = 55")." }}}}}
 
  arranger = \markup { \small { \center-align { 
		 \line { \italic  "Original version of melody by" }
				 \line { \smallCaps "O. Gibbons, 1583-1625." } }} }
 
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% music function to move a note various amounts of space. \movenote #0.4 moves is equivalent to force-hshift = #0.4

movenote = #(define-music-function (parser location vector) (number?)
     #{
	     \once \override NoteColumn #'force-hshift = #$vector
     #})

     %%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 

straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.6
              \once \override Stem #'X-offset = #-2.6 }

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/4
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \override Score.MetronomeMark #'transparent = ##t	
  \tempo 4=110 f2 f4 f4 | g2 a2 | bes4 g4 c2^\fermata \bar "||" \time 3/4  \tempo 4=120 f,4 ^\markup { \hspace #-4 \italic "Slightly faster." }a4 bes4 | c2 g4 | c2 b4 | c2. \bar "||" \break
  a4 bes4 c4 | d2 c4 | \movenote #1.4 bes2 a4 | g2. \bar "||" c4 bes4 a4 | g2 f4 | a4 g2 | f2. \bar "||"
}
   
alto = \relative c' {  
  c2 c4 c4 | e2 f2 | f4 e4 f2 \bar "||" f4 f4 f4 | g2 g4 | d2 d4 | e2. \bar "||" 
  f4 f4 g8 a8 | bes2 a4 | a4 ( g4 -) f4 | e2. \bar "||" f4 f4 f4 | e2 d4 | f4 \straddle f4 ( e4 -) | f2. \bar "||" 
}

tenor = \relative c {\clef bass 
  a'2 a4 a4 | c2 c2 | bes4 bes4 a2 \bar "||" \time 3/4 a4 c4 d4 | e2 c4 | a4 ( g4 -) d'4 | c2. \bar "||" 
  c4 f4 ees4 | d2 e!4 | f4 ( c4 -) c4 | c2. \bar "||" c4 d4 c4 | c4 ( bes4 -) a4 | c4 c2 | a2. \bar "||"
}

bass = \relative c {\clef bass 
  f2 f4 f4 | c'2 a2 | g4 g4 f2_\fermata \bar "||" f4 f4 d4 | c2 e4 | f4 ( g4 -) g4 | c,2. \bar "||" 
  f4 d4 c4 | bes2 c4 | d4 ( e4 -) f4 | c2 ( bes4 -) \bar "||" a4 bes4 f'4 | c2 d4 | a4 c2 | f2. \bar "||" 
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
	%	\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %% close layout

\midi { }      
  	
	
} %%% Score bracket

%%% Lyric attributions and titles

%%% Lyric attributions and titles

\markup { \small { \hspace #4 \italic "Suitable also for Mid-day Services." \hspace #50 \italic "C. Wesley, 1707-88." }}

%%% Lyrics

%%% Main lyric block
%%% To fit on one page, lyrics are in 3 columns: column 1 (verses ), column 2 (a dividing line), column 3 (verses)

\markup { \hspace #6  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.4 \column { \lower #2.4 \fontsize #8 "F" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "ORTH in thy name, O Lord, I go,"
			                                 "    My daily labour to pursue;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Thee, only thee, resolved to know,"
					   "    In all I think, or speak, or do."
					   "      " %%% adds vertical spacing between verses
			  		}}
		      } 
		      	\line {  "2   "
			   \column {
				   "The task thy wisdom hath assigned"
				   "    O let me cheerfully fulfil;"
				   "In all my works thy presence find,"
				   "    And prove thine acceptable will."
				    "      " %%% adds vertical spacing between verses
		       }}
	   		\line {  "3   "
			   \column {
				   "Preserve me from my calling's snare,"
				   "    And hide my simple heart above,"
				   "Above the thorns of choking care,"
				   "    The gilded baits of worldly love."
				    "      " %%% adds vertical spacing between verses
		       }}
		}  %% finish Page column 1
		
	\hspace #2 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -36 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #2 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
			\line {"4  "
			   \column {	     
"Thee may I set at my right hand,"
"    Whose eyes my inmost substance see,"
"And labour on at thy command,"
"    And offer all my works to thee."
				   "               " %%% add vertical spacing between verses
			}}
			\line {"5  "
			    \column {	     
"Give me to bear thy easy yoke,"
"    And every moment watch and pray,"
"And still to things eternal look,"
"    And hasten to thy glorious day;"
				    "               " %%% add vertical spacing between verses
			}}
			\line { "6. "
			     \column {	     
"For thee delightfully employ"
"    Whate'er thy bounteous grace hath given,"
"And run my course with even joy,"
"    And closely walk with thee to heaven."
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
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne  f1 f1  \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo d1 c1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree bes'1 a1   \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  bes1 f'1  \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 110 4) }}  %%Amen midi       
       
}  


} %%% book bracket


%%%Transcriber's Notes
%%%
%%% Tempo is set to 4=110 as per the instruction in header. Where the instruction specifies "Slightly faster",
%%% the tempo is reset to 4=120.
