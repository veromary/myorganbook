%%%% 450.png
%%%% Hymn 300. BANGOR. According to thy gracious word
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "SACRAMENTS AND OTHER RITES: HOLY COMMUNION"
	\hspace #0.1 }}	
	
	title = "300"   

  meter = \markup { \small { \column { \line { \sans "BANGOR." \hspace #1 \roman "(C. M.)" } 
                            \line { { \italic "Moderately slow" \general-align #Y #DOWN \note #"2" #0.5 "= 60." } } }} }
 
  arranger = \markup { \small { \center-align { 
		 \line { \smallCaps "William Tans'ur," }
				 \line { \italic "The Harmony of Zion," "1734." } }} }
 
  
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
              \once \override NoteHead #'X-offset = #-2.8
              \once \override Stem #'X-offset = #-2.8 }
	      
%% Same as above but move by a smaller amount 		 
smallstraddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.6
              \once \override Stem #'X-offset = #-1.6 }
	      
		      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions


%%% SATB voices

global = {
  \time 4/2
  \key ees \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 1 g'1 | ees2 d2 c2 g'2 | c2 bes4 ( aes4 ) g2 ^\fermata \bar "||" g2 | g2 bes2 g2 fis2 | g1 \breathmark \bar "||" \break
  g1 | c2 b2 c2 ees4 ( d4 ) | c2 bes4 ( aes4 ) g2 ^\fermata \bar "||" g2 | c2 g4 ( f4 ) ees2 d2 | c1 \bar "||" 
}
   
alto = \relative c' {  
  b1 | c2 b2 c2 ees2 | ees2 f2 ees2 \bar "||" f2 | ees2 d2 ees2 d4 ( c4 ) |  b1 \bar "||" 
  d1 | c2 f2 ees2 ees2 | ees2 d2 ees2 \bar "||" ees2 | ees2 c2 c2 b2 | \merge c1 \bar "||" 
}

tenor = \relative c {\clef bass 
  d1 | ees2 f2 g2 c2 | c2 c2 c2 \bar "||" d2 | c2 g2 c2 a2 | g1 \bar "||" 
  b1 | g2 f2 g2 bes2 | aes4 ( g4 ) f4 ( bes4 ) bes2 \bar "||" bes2 | c2 c2 c,4 ( ees4 ) g4 ( f4 ) | ees1 \bar "||"
}

bass = \relative c {\clef bass 
  g1 | c2 d2 ees2 \straddle c'4 ( bes4 ) | aes4 ( g4 ) f2 c2 _\fermata \bar "||" b2 | c2 bes!2 c2 d2 | g,1 \bar "||"
  \smallstraddle g'2 ( f2 ) | ees2 d2 c2 g2 | aes2 bes2 ees2 _\fermata \bar "||" ees4 ( d4 ) c4 ( bes4 ) aes2 g2 g2 | c1 \bar "||" 
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 60 2) }}      
  	
	
} %%% Score bracket

%%% Lyric attributions and titles

\markup { \small { \hspace #76 \italic "J. Montgomery, 1771-1854." }}

%%% Lyrics

%%% Main lyric block
%%% To fit on one page, lyrics are in 3 columns: column 1 (verses ), column 2 (a dividing line), column 3 (verses)

\markup { \hspace #8  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.6 \column { \lower #2.4 \fontsize #8 "A" }   %%Drop Cap goes here
				  \hspace #-1.6    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "CCORDING to thy gracious word,"
			                                 "    In meek humility,"} }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "This will I do, my dying Lord,"
					   "    I will remember thee."
					   "      " %%% adds vertical spacing between verses
			  		}}
		      } 
		      	\line {  "2  "
			   \column {
				   "Thy Body, broken for my sake,"
				   "    My Bread from heaven shall be;"
				   "Thy testamental Cup I take,"
				   "    And thus remember thee."
				   "      " %%% adds vertical spacing between verses
		       }}
		       	\line {  "3  "
			   \column {
				   "Gethsemane can I forget?"
				   "    Or there thy conflict see,"
				   "Thine agony and bloody sweat,"
				   "    And not remember thee?"
				   "      " %%% adds vertical spacing between verses
		       }}
		}  %% finish Page column 1
		
	\hspace #2 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -36 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #2 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
			\line {"4  "
			   \column {	     
				  "When to the Cross I turn mine eyes"
				  "    And rest on Calvary,"
				  "O Lamb of God, my Sacrifice,"
				  "    I must remember thee:"
				   "               " %%% add vertical spacing between verses
			}}
			\line {"5  "
			   \column {	     
				   "Remember thee, and all thy pains,"
				   "    And all thy love to me;"
				   "Yea, while a breath, a pulse remains,"
				   "    Will I remember thee."
				   "               " %%% add vertical spacing between verses
			}}
			\line {"6. "
			    \column {	     
				    "And when these failing lips grow dumb,"
				    "    And mind and memory flee,"
				    "When thou shalt in thy kingdom come,"
				    "    Jesu, remember me."
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
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne  f1 e1  \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo c1 c1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree aes'1 g1   \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  f,1 c'1  \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 60 2) }}  %%Amen midi       
       
}  


} %%% book bracket
