%%%% 935.png
%%%% Appendix 16. Alternative tune to hymn 277. The day thou gavest, Lord, is ended.
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "APPENDIX"
	\hspace #0.1 }}	
	
  title = \markup { \center-align { "162"   
	\large \smallCaps "Alternative Tune to Hymn 277" }}
		
  poet = \markup { \small {  \line { \sans { "ST. CLEMENT."} \hspace #1 \roman {"(9 8. 9 8.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"4" #0.5 = 112. } }
  
  arranger = \markup { \small \smallCaps "C. C. Scholefield, 1839-1905." }
  
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% generates the breathmarks
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}	      
	      
%%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.8
              \once \override Stem #'X-offset = #-2.8 }
	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 3/4
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \tag #'hymn { \partial 4 d4 | b'( c) b | d( b) a | g( a) e | g fis \breathmark \bar "||" e | d2 d4 | g( a) b | a2 g4 | fis2 \bar "||" \break
  d4 | b'( c) b | d( b) a | g( a) e | g fis \breathmark \bar "||" e | d( e) fis | g( b) a | e( g) fis | g2 \bar "||" }
  \tag #'amen { \new Voice = Amen { \cadenzaOn g1 g1 \bar "||" } }
} 
   
alto = \relative c' {  
  \tag #'hymn { d4 | d( e) d | fis2 fis4 | e2 e4 | c c \bar "||" c | \straddle c( b) d | e2 d4 | d( cis) cis | d2 \bar "||"
  d4 | d( e) d | fis2 fis4 | e2 e4 | c c \bar "||" a d2 c4 | b( d) e | e2 d4 | d2 \bar "||" }
  \tag #'amen { e1 d \bar "||" }
}

tenor = \relative c {\clef bass 
  \tag #'hymn { d4 | g2 g4 | a( d) c | b( c) a | a a \bar "||" g | a( b) a | b2 g4 | e2 a4 | a2 \bar "||"
  a4 | g2 g4 | a( d) c | b( c) a | a a \bar "||" fis | g2 a4 | g2 c4 | c2 c4 | b2 \bar "||" }
  \tag #'amen { c1 b1 \bar "||" }
}

bass = \relative c {\clef bass 
  \tag #'hymn { d4 | g,2 g'4 | d2 d4 | e( a,) c | d d \bar "||" e | fis( g) fis | e2 e4 | a,2 a4 | d2 \bar "||"
  fis4 | g2 g4 | d2 d4 | e( a,) c | d d \bar "||" c | b2 d4 | e( b) c | c( a) d | g,2 \bar "||" }
  \tag #'amen { c1 g \bar "||" }
}

inlineAmen = \lyricmode {
  \override LyricText #'font-size = #-1.	
  A -- men
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
	\new Lyrics \lyricsto Amen { \override LyricSpace #'minimum-distance = #1 \inlineAmen }
 			      
			      
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
       	
} %%% score bracket

%%% A separate Score block to generate the hymn midi without the Amen.	

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \removeWithTag #'amen \soprano }
	\context Voice = altos    { \voiceTwo \global \removeWithTag #'amen \alto }
	                      >>
			      
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \removeWithTag #'amen \tenor }
	\context Voice = basses { \voiceTwo \global \removeWithTag #'amen \bass }
			        >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 112 4) }}      
      	
} %%% score bracket

%%% A separate Score block to generate the Amen alone.	

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \voiceOne \global \keepWithTag #'amen \soprano }
	\context Voice = altos    { \voiceTwo \global \keepWithTag #'amen \alto }
	                      >>
			      
	\context Staff = lower <<
	\context Voice = tenors { \voiceOne \global \keepWithTag #'amen \tenor }
	\context Voice = basses { \voiceTwo \global \keepWithTag #'amen \bass }
			        >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 112 4) }}      
      	
} %%% score bracket


%%% Lyric attributions

\markup { \hspace #84 \small \italic "J. Ellerton, 1826-93." }


%%% Main lyric block
%%% To fit on one page, lyrics are in 3 columns: column 1 (verses ), column 2 (a dividing line), column 3 (verses)

\markup { \hspace #4  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HE day thou gavest, Lord, is ended,"
			                                 "  The darkness falls at thy behest;" } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "To thee our morning hymns ascended,"
					   "    Thy praise shall sanctify our rest."
			  		}} 
			         } %%% finish verse 1
		        \hspace #1  % adds vertical spacing between verses  
           		\line { "2  "
			   \column {	     
				   "We thank thee that thy Church unsleeping,"
				   "    While earth rolls onward into light,"
				   "Through all the world her watch is keeping,"
				   "    And rests not now by day or night."
			}}
		}  %% finish Page column 1
		
	\hspace #2 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -22 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #2 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
           		\line { "3  "
			   \column {	     
				   "As o'er each continent and island"
				   "    The dawn leads on another day,"
				   "The voice of prayer is never silent,"
				   "    Nor dies the strain of praise away."
			}}
			\hspace #1  % adds vertical spacing between verses
			\line {"4  "
			   \column {	     
				   "The sun that bids us rest is waking"
				   "    Our brethren 'neath the western sky,"
				   "And hour by hour fresh lips are making"
				   "    Thy wondrous doings heard on high."
     			}}
	    } %%% end column 3
     } %%% end master-line 
     %%% centred last verse 
     			\hspace #1  % adds vertical spacing between verses
     			\line { \hspace #28 "5. "
			   \column {	     
				   "So be it, Lord; thy throne shall never,"
				   "    Like earth's proud empires, pass away;"
				   "Thy kingdom stands, and grows for ever,"
				   "    Till all thy creatures own thy sway."
     			}}
   } %%% super column bracket
} %%% lyrics markup bracket


} %%% book bracket
