%%%% 411.png
%%%% Hymn 264 Mod. TE LUCIS ANTE TERMINUM. Before the ending of the day
%%%% Rev 1.

\version "2.10"

\header {
        dedication = \markup {  \center-align { "TIMES AND SEASONS.—EVENING"
	                                        \hspace #0.1 }}	
	
         title = \markup { "264 " \large \smallCaps "(Modern Tune)"}   
 
	meter = \markup { \small { \column { \line { \sans "TE LUCIS ANTE TERMINUM." \hspace #1 \roman "(L. M.)" } 
                                             \line { \italic "Moderately slow" \general-align #Y #DOWN \note #"2" #0.5 "= 69." } 
	                  } } }
 
  arranger = \markup { \small { \center-align { 
		       \line { \italic "Proper melody from" }
		       \line { \italic "Andernach Gesangbuch, 1608." } }} }
 
  
  tagline = ""
}


%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01		      
	      
%%% prints a breve notehead comprising a left side vertical bar then a semibreve.  This is used in conjunction with
%%% rightbreve to produce a partially merged pair of breves.
%%% If regular breve symbols are used and merged, the left bar of the breve on the right side (alto) would overlap and cut through 
%%% the notehead of the breve on the left side (soprano).
%%% This macro works by replacing the glyph of a printed out by a regular breve. E.g. \leftbreve g\breve to print a G breve with only the left hand bar.
%%% The \hspace parameters are adjusted until the breves merge properly

leftbreve =  { \once \override Voice.NoteHead #'stencil = #ly:text-interface::print 
               \once \override Voice.NoteHead #'text =  
	       \markup { \hspace #-1.4 \filled-box #'(0 . 0.2) #'(-0.5 . 0.5 ) #0 \hspace #-1.2 \musicglyph #"noteheads.s0" } 
}

%%% rightbreve prints a breve notehead comprising a semibreve then a vertical bar on the right side.  

rightbreve =  { \once \override Voice.NoteHead #'stencil = #ly:text-interface::print 
                \once \override Voice.NoteHead #'text =  
		\markup { \hspace #-3.0 \musicglyph #"noteheads.s0" \hspace #-1.2 \filled-box #'(0 . 0.2) #'(-0.5 . 0.5 ) #0  } 
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions


%%% SATB voices

global = {
  \time 4/2
  \key ees \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 1 bes'1 | c1 g1 | aes2 g2 f2 f2 | \leftbreve ees\breve \bar "||" g1 aes2 bes2 | c2. c4 bes2. aes4 | bes\breve \bar "||" \break
  g1 bes2 c2 | bes2 g2 aes2 aes2 | g\breve \bar "||" f1 g2 aes2 | bes2 g2 f2 f2 | ees1 \bar "||"
}
   
alto = \relative c' {  
  g'1 | aes1 ees1 | f2 ees2 ees2 d2 |  \rightbreve ees\breve \bar "||" ees1 ees2 f4 ( g4 ) | aes2. aes4 f2. ees4 | f\breve \bar "||" 
  ees1 ees2 c2 | d2 ees2 ees2 d4 ( c4 ) | b\breve \bar "||" bes!1 bes2 ees2 | f2 ees2 ees2 d2 | \merge ees1 \bar "||" 
}

tenor = \relative c {\clef bass 
  ees'1 | ees1 c1 | c2 bes2 c2 bes2 | g\breve \bar "||" bes1 c2 des2 | ees2. ees4 d!2. c4 | d\breve \bar "||" 
  bes1 bes2 aes2 | bes2 c2 c2 aes2 | d,\breve \bar "||" d1 ees2 ees2 | bes'2 bes2 c2 bes2 | g1 \bar "||"
}

bass = \relative c {\clef bass 
  ees1 | aes,1 c1 | f,2 g2 aes2 bes2 | ees\breve \bar "||" ees1 c2 bes2 | aes2. aes4 bes2. c4 | bes\breve \bar "||" 
  ees1 g2 aes2 | g2 c,2 f2 f,2 | g\breve \bar "||" bes1 ees2 c2 | d2 ees2 aes,2 bes2 | ees1 \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 69 2) }}      
  	
	
} %%% Score bracket


%%% Lyric titles and attributions

\markup { \hspace #6 \small {  \column { \line {\smallCaps  "Office Hymn." \hspace #2  \italic "Compline." \hspace #39 \italic "Before 8th cent.  Tr. J. M. Neale." }    
	                        	\line { \hspace #34 "Te lucis ante terminum." }
	
}}}

%%% Lyrics

%%% Main lyric block
%%% To fit on one page, lyrics are in 3 columns: column 1 (verses ), column 2 (a dividing line), column 3 (verses)

\markup { \hspace #6  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.6 \column { \lower #2.4 \fontsize #8 "B" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "EFORE the ending of the day,"
			                                 "  Creator of the world, we pray" } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "That with thy wonted favour thou"
					   "Wouldst be our Guard and Keeper now."
					   "      " %%% adds vertical spacing between verses
			  		}}
		      } 
		}  %% finish Page column 1
		
	\hspace #2 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -9 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #2 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
			\line {"2  "
			   \column {	     
				  "From all ill dreams defend our eyes,"
				  "From nightly fears and fantasies;"
				  "Tread under foot our ghostly foe,"
				  "That no pollution we may know."
				   "               " %%% add vertical spacing between verses
			}}	
	    } %%% end column 3
	} %%% end master-line
	     %%% centred last verse
			\line { \hspace #26 "3. "
			     \column {	     
				     "O Father, that we ask be done,"
				     "Through Jesus Christ, thine only Son;"
				     "Who, with the Holy Ghost and thee,"
				     "Doth live and reign eternally.        Amen."
			}}
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 69 2) }}  %%Amen midi       
       
}  

\markup {  \line { \hspace #24 \italic "See also:" \hspace #1 \small {\column { "  81  O Christ, who art the Light and Day."
	            					                        "104  Servant of God, remember."
		     						                "144  O Christ, our hope, our heart's desire."
								 }}}}

} %%% book bracket
