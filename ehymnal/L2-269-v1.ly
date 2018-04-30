%%%% 417.png
%%%% Hymn 269. NUNC DIMITTIS.  O gladsome light, O grace.
%%%% Rev 1.

\version "2.10"

\header {
  dedication = \markup {  \center-align { "TIMES AND SEASONS.—EVENING"
	\hspace #0.1 }}	
	
	title = "269"   
  
	meter = \markup { \small { \column { \line { "               " }
	  \line { \sans "NUNC DIMITTIS." \hspace #1 \roman "(6 6 7. 6 6 7.)" } 
  \line { { \italic "Moderately slow, dignified" \general-align #Y #DOWN \note #"2" #0.5 "= 66."  }}}}}
 
  arranger = \markup { \small { \center-align { 
		 \line { \italic  "Composed or adapted by" }
		 \line { \smallCaps "L. Bourgeois," \italic "in 1549, for the Genevan" }
		 \line { \italic "Psalter.  Harmony chiefly from Goudimel." } }} }
 
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% Macro to specify partial measure in the middle of a piece.
%%% In this case, the macro specifies that 2 1/2 notes in a 4/2 measure have past,

partmeasure =  \set Score.measurePosition = #(ly:make-moment 2 2)

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01		      

%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-2.4
              \once \override Stem #'X-offset = #-2.4 }

%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 4/2
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  c'1 d2 c2 | bes1 a1 | g1^\fermata \bar "||" bes1 | a2 f2 g2 g2 | f1^\fermata \bar "||" \break 
  f1 | c'2 c2 d2 c2 | bes1 a1^\fermata \bar "||" \partmeasure c1 | a2 bes2 a2 g2 | f1^\fermata \bar "||" \break
  f1 | d2 e2 f2 d2 | c1^\fermata \bar "||" f1 | g2 a2 bes2 a2 | g1 f1^\fermata \bar "||"
}
   
alto = \relative c' { 
  a'1 bes2 a2 | \straddle a2 ( g1 ) fis2 | \merge g1 \bar "||" g1 | f2 f2 f2 e2 | \merge f1 \bar "||" 
  \merge f1 | f2 f2 f2 f2 | f1 f1 \bar "||" g1 | f2 f2 f2 e2 | d1 \bar "||" 
  d1 | d2 c2 c2 b2 | \merge c1 \bar "||" d1 | d2 f2 f2 f2 | \straddle f2 ( e2 ) \merge f1 \bar "||"
}

tenor = \relative c {\clef bass 
  f'1 f2 f2 | d1 d1 | bes1 \bar "||" d1 | d2 a2 c2 c2 | a1 \bar "||" 
  a1 | a2 a2 bes2 a2 | d1 c1 \bar "||" e1 | d2 d2 c2 c2 | a1 \bar "||" 
  bes1 | f2 a2 a2 g2 | e1 \bar "||" bes'1 | bes2 c2 d2 c2 | c1 a1 \bar "||" 
}

bass = \relative c {\clef bass 
  f1 bes,2 f'2 | g1 d1 | g,1_\fermata \bar "||" g1 | d'2 d2 c2 c2 | f,1_\fermata \bar "||" 
  f'1 | f2 f2 bes,2 f'2 | bes,1 f'1_\fermata \bar "||" c1 | d2 bes2 f'2 c2 | d1_\fermata \bar "||" 
  bes1 | bes2 a2 f2 g2 | c1_\fermata \bar "||" bes1 | g2 f2 bes2 f2 | c'1 f,1_\fermata \bar "||"
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2) }}      
  		
	
} %%% Score bracket


%%% Lyric titles and attributions

\markup { "                 "}

\markup {  \small { \column { \line {  \hspace #72 \italic "3rd cent. or earlier.  Tr. Y. H." } 
		\line { \hspace #42 "Φῶς ἱλαρόν."  "[Greek: Phôs hilaron.]"} 
	%	\line { "               " }
}}}


%%% Lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
	              \column { %% verse 1 is a column of 2 lines  
	                  \line { \hspace #2.3 \column { \lower #2.4 \fontsize #8 "O" }   %%Drop Cap goes here
				  \hspace #-1.2    %% adjust this if other letters are too far from Drop Cap
				  \column  { \raise #0.0 " GLADSOME light, O grace"
			                                 "    Of God the Father's face," } }          
	                  \line {  \hspace #2.5  %%adjust hspace until this line left edge is flush with Drop Cap
				   \lower  #1.56  %%adjust this until the line spacing looks right
				   \column {   
					   "The eternal splendour wearing;"
					   "    Celestial, holy, blest,"
					   "    Our Saviour Jesus Christ,"
					   "Joyful in thine appearing."
					   "      " %%% adds vertical spacing between verses
			  		}}
		      } 
	} %%% end super column
}



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
%%% Continuation of lyrics

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %% super column of everything
		  	\hspace #1  % adds vertical spacing between verses 
			\line {"2  " 
			   \column {	     
                                     "Now, ere day fadeth quite,"
				     "    We see the evening light,"
				     "Our wonted hymn outpouring;"
				     "    Father of might unknown,"
				     "    Thee, his incarnate Son,"
				     "And Holy Spirit adoring."
				   "               " %%% add vertical spacing between verses
			}}
           		\line { "3. "
			     \column {	     
				     "To thee of right belongs"
				     "     All praise of holy songs,"
				     "O Son of God, Lifegiver;"
				     "     Thee, therefore, O Most High,"
				     "     The world doth glorify,"
				     "And shall exalt for ever."
			}}

	  }
} %%% lyric markup bracket



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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 66 2) }}  %%Amen midi       
       
}  


} %%% book bracket

