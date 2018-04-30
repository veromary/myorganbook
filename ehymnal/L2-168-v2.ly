%%%% 269.png
%%%% Hymn 168. Manchester. The earth, O Lord, is one great field
%%%% Rev 2.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "THE CHRISTIAN YEAR - EMBER DAYS"
	\hspace #0.1 }}	
	
  title = "168"   
  
  poet = \markup { \small {  \line { \sans { "MANCHESTER."} \hspace #1 \roman {"(C. M.)"}} }}
  
  meter = \markup { \small { \italic {Slow} \general-align #Y #DOWN \note #"2" #0.5 = 80.} }
  
  arranger = \markup { \small \smallCaps "Robert Wainwright, 1748-82." }
  
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01

%%generates the breathmarks
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}	      

%%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 

straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.6
              \once \override Stem #'X-offset = #-2.6 }

%%% same as above, but pulls note leftwards a smaller amount

smallstraddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.5
              \once \override Stem #'X-offset = #-1.5 }
	      
%% Used to pull an upstem note left. Used when a slurred note pair straddles a longer note below and when notecolumn force-hshift does not work 
topstraddle = { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.5 
              \once \override Stem #'X-offset = #-0.2 }	      
	      
%%% music function to move a note various amounts of space. \movenote #0.4 moves is equivalent to force-hshift = #0.4

movenote = #(define-music-function (parser location vector) (number?)
     #{
	     \once \override NoteColumn #'force-hshift = #$vector
     #})

%%% music function to move a note various amounts of space. Usage is same as above.  This function uses x-offset instead of
%%% force-hshift since force-hshift does not work with both of two notes stacked atop one another. Use only with stemless notes
%%% as the stems and dots are not touched in this case.

noteheadmove = #(define-music-function (parser location vector) (number?)
     #{
	     \once \override NoteHead #'X-offset = #$vector
     #})

	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 3/2
  \key ees \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 2 ees2 | g1 f2 | ees1 ees'2 | c2( bes2) aes | g1 \breathmark \bar "||" 
      ees'2 | bes2.( aes4) g2 | c( d) ees | \topstraddle g,( f) ^\fermata \bar "||" \break
  f2 | \movenote #0.6 aes1 g2 | \movenote #0.6 c1 bes2 | bes( aes) g | g( f) \breathmark \bar "||" 
      d' | ees( aes,) g | aes( g) f | ees1 \bar "||"
} 
   
alto = \relative c' {  
  ees2 | ees1 d2 | c1 ees2 | ees1 d2 | ees1 \bar "||" 
      g2 | ees2( d2) ees2 | ees( f) g | \smallstraddle ees( d) \bar "||"
  f2 | ees( f) ees | ees( f) g | \movenote #0.6 d1 ees2 | ees( d) \bar "||" 
      f | ees( f) g | f( ees) d | \merge ees1 \bar "||"
}

tenor = \relative c {\clef bass 
  g'2 | bes1 bes4( aes) | g1 bes2 | aes( g) bes | bes1 \bar "||" 
      bes2 | \movenote #0.6 bes1 bes2 | \movenote #1.6 aes1 bes2 | bes1 \bar "||"
  d2 | c( bes) bes | c( d) ees | \movenote #0.6 bes1 bes2 | \movenote #0.6 bes1 \bar "||" 
      bes2 | bes2( c4 d) ees2 | c( bes) aes | g1 \bar "||"
}

bass = \relative c {\clef bass 
  ees2 | ees1 bes2 | c1 g2 | aes( bes) bes | ees1 \bar "||" 
      ees2 | g( f) ees2 | aes( f) ees | bes1 _\fermata \bar "||"
  bes2 | c( d) ees | \movenote #0.6 aes1 g2 | \noteheadmove #1.2 f1 ees2 | \noteheadmove #1.2  bes1 \bar "||" 
      \straddle bes'4( aes) | g2( f) ees2 | aes,( bes) bes | ees1 \bar "||"
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

\markup { \small { \hspace #74 \italic "J. M. Neale, 1818-66." }}

%%% Main lyric block
%%% To fit on one page, lyrics are in 3 columns: column 1 (verses ), column 2 (a dividing line), column 3 (verses)

\markup { \hspace #8  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HE earth, O Lord, is one great field"
			                                 "  Of all thy chosen seed;" } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "The crop prepared its fruit to yield;"
					   "    The labourers few indeed."
			  		}} 
			         } %%% finish verse 1
		        \hspace #1  % adds vertical spacing between verses
           		\line { "2  "
			   \column {	     
				   "We therefore come before thee now"
				   "    By fasting and by prayer,"
				   "Beseeching of thy love that thou"
				   "    Wouldst send more labourers there."
			}}
			\hspace #1  % adds vertical spacing between verses
           		\line { "3  "
			   \column {	     
				   "Not for our land alone we pray,"
				   "    Though that above the rest;"
				   "The realms and islands far away,"
				   "    O let them all be blest."
			}}
		}  %% finish Page column 1
		
	\hspace #2 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -36 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #2 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
			\line {"4  "
			   \column {	     
				   "Endue the bishops of thy flock"
				   "    With wisdom and with grace,"
				   "Against false doctrine, like a rock,"
				   "    To set the heart and face:"
			}}
			\hspace #1 % adds vertical spacing between verses
			\line {"5  "
			    \column {	     
				    "To all thy priests thy truth reveal,"
				    "    And make thy judgements clear;"
				    "Make thou thy deacons full of zeal"
				    "    And humble and sincere:"
			}}
			\hspace #1 % adds vertical spacing between verses
			\line { "6. "
			     \column {	     
				     "And give their flocks a lowly mind"
				     "    To hear and not in vain;"
				     "That each and all may mercy find"
				     "    When thou shalt come again."
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
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne ees1 ees1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo c1 bes1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree aes'1 g1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  aes1 ees'1 \bar "||" }}
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
