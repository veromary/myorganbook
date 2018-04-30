%%%% 428.png
%%%% Hymn 279. St. Leonard.  The radiant morn hath passed away. 
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—EVENING"
	\hspace #0.1 }}	
	
	title = "279"   
  
  poet = \markup { \small {  \line { \sans { "ST. LEONARD."} \hspace #1 \roman {"(8 8. 8 4.)"}} }}
  
  meter = \markup { \small { \italic {In moderate time} \general-align #Y #DOWN \note #"2" #0.5 = 76. }}
  
  arranger = \markup { \small { \smallCaps "H. S. Irons," "1834-1905." }}
  
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% Merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = { \once \override NoteColumn #'force-hshift = #-0.01 }

%%generates the breathmarks
breathmark = { 
	\override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup { \fontsize #4 "," }
	}

%% Used to pull an upstem note left. Used when a slurred note pair straddles a longer note below and when notecolumn force-hshift does not work 
topstraddle = { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.0 
              \once \override Stem #'X-offset = #0.3 }	      
	

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key ees \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 2 bes'2 | g2 f2 ees2 c'2 | aes2 g2 f2 \breathmark \bar "||" bes2 | c2 ees2 d2 c2 | bes2 a2 bes2 \breathmark \bar "||" \break
  bes2 | ees2 d2 c2 g2 | c2 bes2 aes2^\fermata \bar "||" g2 | f1 g1 | ees1. \bar "||" 
}
   
alto = \relative c' {  
  ees2 | ees2 d2 c2 ees2 | d2 ees2 d2 \bar "||" f2 | g2 f2 f2 ees2 | d2 ees2 d2 \bar "||" 
  d2 | ees2 f2 ees2 ees2 | ees2 e2 f2 \bar "||" ees!2 | ees1 d1 | \merge ees1. \bar "||" 
}

tenor = \relative c {\clef bass 
  g'2 | bes2 aes2 g2 aes2 | aes2 bes2 bes2 \bar "||" bes2 | bes2 a2 bes2 g2 | f2 c'2 bes2 \bar "||" 
  bes2 | bes2 b2 c2 c2 | c2 c2 c2 \bar "||" bes2 | c1 \topstraddle bes2 ( aes2 -) | g1. \bar "||" 
}

bass = \relative c {\clef bass 
  ees2 | ees2 bes2 c2 aes2 | f'2 ees2 bes2 \bar "||" d2 | ees2 f2 bes,2 ees2 | f2 f2 bes2 \bar "||" 
  aes2 | g2 g2 c,2 c2 | aes2 g2 f2_\fermata \bar "||" g2 | aes1 bes1 | ees1. \bar "||" 
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

%%% Lyric titles and attributions

\markup {  \small {  \hspace #80 \italic "G. Thring, 1823-1903." }} 

%%% Main lyric block
%%% To fit on one page, lyrics are in 3 columns: column 1 (verses ), column 2 (a dividing line), column 3 (verses); centred last verse

\markup { \hspace #6  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	                 \column { %%verse 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "T" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "HE radiant morn hath passed away,"
			                                 "  And spent too soon her golden store;" } }     
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "The shadows of departing day"
					   "                            Creep on once more."
					   "             " %%% adds vertical spacing between verse
			  		}} 
			         } %%% finish verse 1
           		\line { "2  "
			   \column {	     
				   "Our life is but an autumn sun,"
				   "Its glorious noon how quickly past;"
				   "Lead us, O Christ, our life-work done,"
				   "                            Safe home at last."
				   "             " %%% adds vertical spacing between verse
			}}
		}  %% finish Page column 1
		
	\hspace #2 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -22 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #2 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
			\line {"3  "
			   \column {	     
				   "O by thy soul-inspiring grace"
				   "Uplift our hearts to realms on high;"
				   "Help us to look to that bright place"
				   "                            Beyond the sky;—"
				   "             " %%% adds vertical spacing between verse
			}}
			\line {"4  "
			    \column {	     
				    "Where light, and life, and joy, and peace"
				    "In undivided empire reign,"
				    "And thronging Angels never cease"
				    "                            Their deathless strain;—"
				    "             " %%% adds vertical spacing between verse
			}}
	    } %%% end column 3
     } %%% end master-line
     %%% centred last verse
			\line { \hspace #24 "5. "
			     \column {	     
				     "Where Saints are clothed in spotless white,"
				     "And evening shadows never fall,"
				     "Where thou, eternal Light of light,"
				     "                            Art Lord of all."
			}}
   } %%% super column bracket
} %%% lyrics markup bracket



%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne  \cadenzaOn ees1 ees1   \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo c1 bes1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree aes'1 g1   \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  aes1 ees'1  \bar "||" }}
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

