%%%% 436.png
%%%% Hymn 287. DA CHRISTUS GEBOREN WAR. Kindly spring again is here
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—SPRING"
	\hspace #0.1 }}	
	
	title = "287"   

	meter = \markup { \small { \column { \line { \sans "DA CHRISTUS GEBOREN" }
		                             \line { \hspace #3 \sans "WAR." \hspace #1 \roman "(7 7. 7 7.)" } 
                                             \line { \italic "In moderate time" \general-align #Y #DOWN \note #"2" #0.5 "= 80." } 
	                  } } }
 
  arranger = \markup { \small { \center-align { 
	               \line { "               " }
		       \line { \italic "Melody probably by" }
				 \line { \smallCaps "J. F. Doles," "1715-97." } }} }
 
  
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

%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-3.2
	      \once \override Stem #'X-offset = #-3.2 }
	      
%% Same as above but move by a smaller amount 		 
smallstraddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.6
              \once \override Stem #'X-offset = #-1.6 }
	      
		      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions


%%% SATB voices

global = {
  \time 4/2
  \key d \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  d4 ( e4 ) fis4 ( g4 ) a2 b2 | g2 a4 ( g4 ) fis1 \bar "||" d'2 cis2 b2 a4 ( b4 ) | cis2 b2 a1 \breathmark \bar "||" \break
  d2 a2 b2 c2 | b2 a2 g1 \bar "||" a2 e2 fis2 g2 | fis2 e2 d1 \bar "||"
}
   
alto = \relative c' {  
  d2 d2 d4 ( cis4 ) b2 | b2 cis2 d1 \bar "||" d2 e2 fis4 ( gis4 ) a2 | a2 gis2 \merge a1 \bar "||"
  a2 fis2 g2 e4 ( fis4 ) | g2 d2 \straddle g2 ( fis2 ) \bar "||" e2 \straddle d4 ( cis4 ) d2 d2 | d2 cis2 \merge d1 \bar "||"
}

tenor = \relative c {\clef bass 
  fis2 b2 a2 g2 | g2 e2 fis1 \bar "||" b2 a2 d2 cis4 ( d4 ) | e2. d4 cis1 \bar "||" 
  d2 d!2 d2 cis2 | d2 d2 b1 \bar "||" e,2  a2 a2 b2 | a2. g4 fis1 \bar "||"
}

bass = \relative c {\clef bass 
  d2 b2 fis'2 g2 | e2 a,2 d1 \bar "||" b2 cis2 d4 ( e4 ) fis2 | e2 e2 a1 \bar "||" 
  fis2 cis'2 b2 a2 | g2 fis2 \smallstraddle e2 ( d2 ) \bar "||" cis2 \smallstraddle b4 ( a4 ) d2 g,2 | a2 a2 d1 \bar "||" 
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 2) }}      
  	
	
} %%% Score bracket

%%% Lyric attributions and titles

\markup { \small { \hspace #76 \italic "J. Newton" "†," \italic "1725-1807." }}

%%% Lyrics

%%% Main lyric block
%%% To fit on one page, lyrics are in 3 columns: column 1 (verses ), column 2 (a dividing line), column 3 (verses)

\markup { \hspace #8  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.6 \column { \lower #2.4 \fontsize #8 "K" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "INDLY spring again is here,"
			                                 "  Trees and fields in bloom appear;" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "Hark! the birds with artless lays"
					   "Warble their Creator's praise."
					   "      " %%% adds vertical spacing between verses
			  		}}
		      } 
		      	\line {  "2  "
			   \column {
				   "Where in winter all was snow,"
				   "Now the flowers in clusters grow;"
				   "And the corn, in green array,"
				   "Promises a harvest-day."
				   "      " %%% adds vertical spacing between verses
		       }}
		}  %% finish Page column 1
		
	\hspace #2 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -22 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #2 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
			\line {"3  "
			   \column {	     
				  "Lord, afford a spring to me,"
				  "Let me feel like what I see;"
				  "Speak, and by thy gracious voice,"
				  "Make my drooping soul rejoice."
				   "               " %%% add vertical spacing between verses
			}}
			\line {"4. "
			    \column {	     
				    "On thy garden deign to smile."
				    "Raise the plants, enrich the soil;"
				    "Soon thy presence will restore"
				    "Life to what seemed dead before."
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 2) }}  %%Amen midi       
       
}  


} %%% book bracket
