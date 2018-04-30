%%%% 434.png
%%%% Hymn 285. MAGDALENA. Another year is dawning
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—NEW YEAR"
	\hspace #0.1 }}	
	
	title = "285"   

  meter = \markup { \small { \column { \line { \sans "MAGDALENA." \hspace #1 \roman "(7 6. 7 6.)" } 
                            \line { { \italic "In moderate time" \general-align #Y #DOWN \note #"4" #0.5 "= 144." } } }} }
 
  arranger = \markup { \small { \center-align { 
		 \line { \italic  "German Traditional Melody" }
				 \line { "(" \hspace #-1 \italic "16th cent.?" \hspace #-1 ")." } }} }
 
  
  tagline = ""
}


%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%% Macro for generating two augmentation dots for a notehead. 
%% When dotted notes from two vocal parts share a single notehead, 
%% Lilypond only inserts a single dot. In the image, two dots are used. 
%% This macro generates the two dots by replacing the normal dot glyph 
%% with a new glyph comprising a column of 2 dots one above the other.
 
augdots = { 
 \once \override Voice.Dots #'stencil = #ly:text-interface::print 
 \once \override Voice.Dots #'text = \markup {  \hspace #0 \raise #1 
                                                \line { \translate #(cons -0.2 0) 
                                                \override #'(baseline-skip . 1 )  
                                                   \column { 
                                                     \musicglyph #"dots.dot" 
                                                     \musicglyph #"dots.dot" } } }
}
	      
	      
%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions


%%% SATB voices

global = {
  \time 3/2
  \key ees \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 4 ees4 | bes'2 bes4 bes2 bes4 | c2. c2 ees4 | d2 c4 bes2 aes4 | g2. ~ g2 \bar "||" \break
  g4 | bes2 aes4 g2 f4 | ees2. c2 ees4 | f2 aes4 g2 f4 | ees2. ~ ees2 \bar "||" 
}
   
alto = \relative c' {  
  ees4 | ees2 d4 ees2 ees4 | ees2. ees2 aes4 | bes2 aes4 g2 f4 | ees2. ~ ees2 \bar "||" 
  ees4 | ees2 d4 ees2 d4 | c2. c2 bes4 | c2 f4 ees2 d4 | \augdots ees2. ~ ees2 \bar "||" 
}

tenor = \relative c {\clef bass 
  g'4 | g2 aes4 bes2 g4 | aes2. aes2 c4 | bes2 c4 d4. ( c8  d4 ) | ees2. ~ ees2 \bar "||" 
  bes4 | bes2 bes4 bes2 aes4 | g2. ees2 g4 | c2 c4 bes2 aes4 | g2. ~ g2 \bar "||" 
}

bass = \relative c {\clef bass 
  ees4 | ees2 f4 g2 ees4 | aes2. aes2 f4 | g2 aes4 bes2 bes,4 | ees2. ~ ees2 \bar "||" 
  ees4 | g2 f4 ees2 bes4 | c2. c2 g'4 | aes2 aes,4 bes2 bes4 | ees2. ~ ees2 \bar "||" 
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 144 4) }}      
  	
	
} %%% Score bracket

%%% Lyric attributions and titles

\markup { \small { \hspace #72 \italic "F. R. Havergal, 1836-79." }}

%%% Lyrics

%%% Main lyric block
%%% To fit on one page, lyrics are in 3 columns: column 1 (verses ), column 2 (a dividing line), column 3 (verses)

\markup { \hspace #16  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.6 \column { \lower #2.4 \fontsize #8 "A" }   %%Drop Cap goes here
				  \hspace #-1.6    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "NOTHER year is dawning,"
			                                 "    Dear Master, let it be," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "In working or in waiting,"
					   "    Another year with thee."
					   "      " %%% adds vertical spacing between verses
			  		}}
		      } 
		      	\line {  "2  "
			   \column {
				   "Another year of leaning"
				   "    Upon thy loving breast,"
				   "Of ever-deepening trustfulness,"
				   "    Of quiet, happy rest."
				   "      " %%% adds vertical spacing between verses
		       }}
		       	\line {  "3  "
			   \column {
				   "Another year of mercies,"
				   "    Of faithfulness and grace;"
				   "Another year of gladness"
				   "    In the shining of thy face."
				   "      " %%% adds vertical spacing between verses
		       }}
		}  %% finish Page column 1
		
	\hspace #2 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -36 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #2 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
			\line {"4  "
			   \column {	     
				  "Another year of progress,"
				  "    Another year of praise,"
				  "Another year of proving"
				  "    Thy presence all the days."
				   "               " %%% add vertical spacing between verses
			}}
			\line {"5  "
			   \column {	     
				   "Another year of service,"
				   "    Of witness for thy love;"
				   "Another year of training"
				   "    For holier work above."
				   "               " %%% add vertical spacing between verses
			}}
			\line {"6. "
			    \column {	     
				    "Another year is dawning,"
				    "    Dear Master, let it be,"
				    "On earth, or else in heaven,"
				    "    Another year for thee!"
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
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne  ees1 ees1  \bar "||" }}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 144 4) }}  %%Amen midi       
       
}  


} %%% book bracket
