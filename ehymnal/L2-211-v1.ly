%%%% 330.png
%%%% Hymn 211  Old 81st  We praise thy name, all-holy Lord
%%%% Rev 1

\version "2.10"

\header {
  dedication = \markup {  \center-align { "SAINTS' DAYS: ST. DAVID"
	\hspace #0.1 }}	
	
	title = "211"   

  meter = \markup { \small { \column { \line { \sans "OLD 81st." \hspace #1 \roman "(D. C. M.)" } 
                            \line { { \italic "Slow and dignified" \general-align #Y #DOWN \note #"2" #0.5 "= 76." } } }} }
 
  arranger =  \markup { \small {\center-align {
                            \line { \italic "Original version appeared in" }
                            \line { \italic "Day's Psalter, 1562." }
                } } }
   
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% prints a breve notehead comprising a left side vertical bar then a semibreve.  This is used in conjunction with
%%% rightbreve to produce a partially merged pair of breves as found in the last measure (soprano and alto) of this piece. 
%%% If regular breve symbols are used and merged, the left bar of the breve on the right side (alto) would overlap and cut through 
%%% the notehead of the breve on the left side (soprano).
%%% This macro works by replacing the glyph of a printed out by a regular breve. E.g. \leftbreve g\breve to print a G breve with only the left hand bar.

leftbreve =  { \once \override Voice.NoteHead #'stencil = #ly:text-interface::print 
               \once \override Voice.NoteHead #'text =  
	       \markup { \hspace #-0.8 \filled-box #'(0 . 0.2) #'(-0.5 . 0.5 ) #0 \hspace #-1.3 \musicglyph #"noteheads.s0" } 
}

%%% rightbreve prints a breve notehead comprising a semibreve then a vertical bar on the right side.  

rightbreve =  { \once \override Voice.NoteHead #'stencil = #ly:text-interface::print 
                \once \override Voice.NoteHead #'text =  
		\markup { \hspace #-0.8 \musicglyph #"noteheads.s0" \hspace #-1.3 \filled-box #'(0 . 0.2) #'(-0.5 . 0.5 ) #0  } 
}

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.05		  

%%generates the breathmarks
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}	      
	      
%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.6
              \once \override Stem #'X-offset = #-2.6 }	      
	      
%%% Macro to specify a partial measure in the middle of a piece or
%%% In this case, the macro specifies that 2 1/2 notes in a 4/2 measure have past,

partmeasure =  \set Score.measurePosition = #(ly:make-moment 2 2)

%%generates the breathmarks
breathmark = {	
	      \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible 
	      \override Score.RehearsalMark #'Y-offset = #'4.0 
	      \override Score.RehearsalMark #'X-offset = #'-0.5
	      \mark \markup { \fontsize #4 ","}
}	      

%% no break bar. Needed to insert a bar line while forbidding a linebreak at that point
%% needed here because the music is tightly packed

nb = { \bar "|" \noBreak }


%% Used to pull an upstem note left. Used when a slurred note pair straddles a longer note below and when notecolumn force-hshift does not work 
topstraddle = { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-1.5 
              \once \override Stem #'X-offset = #-0.2 }	      
	      

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 3/2
  \key d \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 2 d2 \nb fis1 g2 \nb a1 a2 \nb b1 b2 \nb a1 a2 \nb  b1 cis2 \nb  d2 b1 \nb cis1^\fermata \bar "||" 
    a2 \nb d1 cis2 \nb b1 a2 \nb \break
  g1 fis2 \nb a1 fis2 \nb b1 a2 \nb a2 gis1 \nb a1^\fermata \bar "||" \noBreak 
    a2 \nb  d1 cis2 \nb b1 a2 \nb g1 fis2 \nb e1 fis2 \nb \break
  g1 fis2 \nb fis2 e1 \nb fis1^\fermata \nb \bar "||" 
    fis2 \nb b1 a2 \nb  g1 fis2 \nb  e1 d2 \nb  cis1 fis2 \nb e1 d2 \nb d2 cis1 \nb d1^\fermata \bar "||" } 
   
alto = \relative c' {
  d2 | d1 d2 | cis1 d2 | d1 d2 | d1 d2 | d1 fis2 | fis2 e1 | e1 \bar "||" 
    fis2 | fis1 fis2 | d1 fis2 | \break
  d1 d2 | cis1 d2 | g1 e2 | fis2 e1 | e1 \bar "||" 
    fis2 | fis1 fis2 | d1 d2 | e1 a,2 | a1 a2 | \break 
  b1 a2 | b2 b1 | cis1 \bar "||" 
    d2 | g1 e2 | e1 d2 | b1 b2 | \merge cis1 d2 | cis1 d2 | a2 a1 | a1 \bar "||" 
}

tenor = \relative c {\clef bass 
  fis2 | a1 g2 | e1 fis2 | g1 g2 | fis1 fis2 | fis1 a2 | a2 gis1 | a1 \bar "||" 
    a2 | b1 a2 | g1 a2 | 
  b1 a2 | a1 a2 | d1 cis2 | b2 b1 | cis1 \bar "||" 
    a2 | b1 a2 | g1 a2 | \topstraddle b2 ( cis2 -) d2 | cis1 d2 | 
 d1 d2 | b2 b1 | ais1 \bar "||" 
   a!2 | d1 c2 | c1 a2 | g1 fis2 | a1 a2 | a1 a2 | e2 e1 | fis1 \bar "||" 
}

bass = \relative c {\clef bass 
  d2 | d1 b2 | a1 d2 | g,1 b2 | d1 d2 | b1 fis'2 | d2 e1 | a,1_\fermata \bar "||" 
    d2 | b1 fis'2 | \merge g1 d2 | 
  b1 d2 | a1 d2 | g,1 a2 d2 e1 | a,1_\fermata \bar "||" 
    d2 | b1 fis'2 | \merge g1 fis2 | e1 d2 | a1 d2 | 
  b1 d2 | g2 g1 | fis1_\fermata \bar "||" 
    d2 | g,1 a2 | c1 d2 | e1 b2 | a1 d2 | a1 fis2 | a2 a1 | d1_\fermata \bar "||" 
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
  
} %%% score bracket

%%% Hymn notes markup

\markup { \hspace #8 \column { 
	       \line { \hspace #0 \smallCaps "Note" \hspace #-1.2 ".—" \italic "This hymn may also be sung to a" \smallCaps "C. M." \italic "tune."  \hspace #2 \smallCaps "St. James" "(" \hspace #-1 \italic "No." "210)." \italic "is suitable."   }
               \line { "                 " } %%% some blank space before start of lyrics
	       \line { "                 " } %%% some blank space before start of lyrics
}}   
	       
%%% Lyric attributions and titles

\markup { \small { \hspace #68 \italic "E. J. Newell." }}


%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %%stanza 1 is a column of 2 lines  
	                  \line { \hspace #2.2 \column { \lower #2.4 \fontsize #8 "W" }   %%Drop Cap goes here
				  \hspace #-1.0    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 "E praise thy name, all-holy Lord,"
			                               "    For him, the beacon-light"  } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "That shone beside our western sea"
					   "    Through mists of ancient night;"
					   "Who sent to Ireland's fainting Church"
					   "    New tidings of thy word:"
					   "For David, prince of Cambrian Saints,"
					   "    We praise thee, holy Lord."
			  		}}
		      } %%% end verse 1			
	  } %%% end supercolumn
} %%% end markup	  
       
       
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
%%% continuation of  lyrics

\markup { \hspace #30   %%add space as necc. to center the column  
		\column { 
			\hspace #1  % adds vertical spacing between verses  
           		\line { "2  "
			   \column {	     
				   "For all the saintly band whose prayers"
				   "    Still gird our land about,"
				   "Of whom, lest men disdain their praise,"
				   "    The voiceless stones cry out;"
				   "Our hills and vales on every hand"
				   "    Their names and deeds record:"
				   "For these, thy ancient hero host,"
				   "    We praise thee, holy Lord."
				   "                " %%% adds vertical spacing between verses
			}}
           		\line { "3. "
			   \column {	     
				   "Grant us but half their burning zeal,"
				   "    But half their iron faith,"
				   "But half their charity of heart,"
				   "    And fortitude to death;"
				   "That we with them and all thy Saints"
				   "    May in thy truth accord,"
				   "And ever in thy holy Church"	
				   "    May praise thee, holy Lord."
			}}
	  }
} %%% lyric markup bracket


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne d1 d1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo b1 a1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree g'1 fis1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  g1 d'1 \bar "||" }}
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
